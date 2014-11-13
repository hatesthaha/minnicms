<?php
class TermAction extends AdminAction {

    function _initialize() {
        parent::_initialize();
        $this->dTerms = D("Term");
        $this->dTypes = D("Type");
    }
    public function index(){
        $this->data = $this->dTerms->relation(true)->getList(array("parent_id"=>"0"));
    	$this->display();
    }

    public function add(){
        $parent_id         = I('get.parent_id',"0","int");
        $this->parent_info = $parent_id == 0 ? (object) array("name"=>"一级分类") : $this->dTerms->read($parent_id);
        $this->parent_id   = $parent_id;
        $this->allType     = $this->dTypes->select();
    	$this->display();
    }
    public function listorder(){
        $status = $this->dTerms->listorders($_POST['listorders']);
        if($status!==false){
            $this->success("排序成功！");
        }else{
            $this->error("排序失败！");
        }
    }
    public function postAdd(){
    	$this->dTerms->create();
        $data = $this->dTerms->add();
        if ($data) {
            $this->success("添加成功！",U('_Content/Term/index'));
        } else {
            $this->error("添加失败！",U('_Content/Term/add'));
        }
    }
    public function edit(){
        $id             = I('get.id',"0","int");
        $this->allType  = $this->dTypes->select();
        $info           = $this->dTerms->find($id);
        $depthArray     = D("Term")->read($id)->depth()->depth;
        foreach (array_reverse($depthArray) as $value) {
                $_POST["parent_id"] = $value;
                $_POST["term_select"] = 1;
                $content = $this->getChild(true);
                $select_content .= $content;
        }
        $this->assign("select_content",$select_content);
        $this->assign("parents",json_encode(array_reverse($depthArray)));
        $this->assign("info",$info);
        $this->display();
    }
    public function postEdit(){
        $a = $this->dTerms->create();
        $rs = $this->dTerms->save();
        if ($rs) {
            $this->success("保存成功！",U('_Content/Term/index'));
        } else {
            $this->error("保存失败！",U('_Content/Term/add'));
        }
    }
    public function postDelete(){
        $id   = I('post.id',"0","int");
        $data = $this->dTerms->read($id)->hasChild();
        if($data){
            $content = "此栏目含有子栏目不能删除";
        }else {
            $content = $this->dTerms->where(array("id"=>$id))->delete() ? "删除成功" : "删除失败";
        }
        $this->ajaxReturn($content);
    }
    public function getChild($fetch = false, $parent_id = null, $tpl = null, $options = null){
        $dTerms      = D("Term");
        $parent_id   = is_null($parent_id) ? I('post.parent_id',"0","int") : $parent_id;

        $dTermsR     = $dTerms->relation(true);
        $dTermsR     = is_null($options) ? $dTermsR : $dTermsR->where($options);
        if($_SESSION['ADMIN_ID']==1){
            $this->data  = $dTermsR->getList(array("parent_id"=>$parent_id));
        }else{
            $where['id'] = array('in',$_SESSION['ADMIN_ROLE']);
            $this->data  = $dTermsR->where($where)->getList(array("parent_id"=>$parent_id));
        }


        $this->depth = $parent_id == 0 ?  array() : $dTerms->read($parent_id)->depth()->depth;

        if(is_null($tpl)){
            $tpl = I("post.term_select",'',"int") == 1 ? "Term:getTermSelect" : "";
        }else {
            $tpl = "Term:getTermSelect";
        }

        $this->assign("parent_id",$parent_id);

        $content = $this->fetch($tpl);

        if($fetch){
            return empty($this->data) ? "" : $content;
        }else {
            $this->ajaxReturn($content);
        }
    }
    public function getParentInfo(){
        $id   = I('post.id',"0","int");
        $data = $this->dTerms->relation(true)->find($id);
        $this->ajaxReturn($data);

    }
}
