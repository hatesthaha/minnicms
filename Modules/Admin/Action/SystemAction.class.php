<?php
class SystemAction extends AdminAction {

    protected $dSystem;

    function _initialize() {
        $this->dSystem = D("System");
    }

    public function index(){
        $this->data=$this->dSystem->select();
    	$this->display();
    }

    public function add(){
        $this->display();
    }
    public function postAdd(){
        $post = explode(',', $_POST['system']);
        $_POST['name'] = $post[0];
        $_POST['link'] = $post[1];
        $this->dSystem->create();
        $data = $this->dSystem->add();
        if ($data) {
            $this->success("添加成功！",U('Admin/System/index'));
        } else {
            $this->error("添加失败！",U('Admin/System/add'));
        }
    }
    public function edit(){
        $id            = I('get.id',"0","int");
        $info          = $this->dSystem->find($id);
        $this->assign("info",$info);
        $this->display();
    }
    public function postEdit(){
        if (IS_POST) {
            if ($this->dSystem->create()) {
                if ($this->dSystem->save()!==false) {
                    $this->success("保存成功！", U("Admin/System/index"));
                } else {
                    $this->error("保存失败！");
                }
            } else {
                $this->error($this->dSystem->getError());
            }
        }
    }
    public function listorder(){
        $ids = $_POST['listorders'];
        foreach ($ids as $key => $r) {
            $data['listorder'] = $r;
            $where['id']= array('eq',$key);
            $res = $this->dSystem->where($where)->save($data);
        }

        if($res!==false){
            $this->success("排序成功！");
        }else{
            $this->error("排序失败！");
        }
    }
    public function delete(){
        if(isset($_POST['ids'])){
            $ids = implode(",", $_POST['ids']);
            if ($this->dSystem->where("type_id in ($ids)")->delete()!==false) {
                $this->success("隐藏成功！");
            } else {
                $this->error("隐藏失败！");
            }
        }else{
            $id = intval(I("get.id"));
            if ($this->dSystem->delete($id)!==false) {
                $this->success("隐藏成功！");
            } else {
                $this->error("隐藏失败！");
            }
        }

    }

}
