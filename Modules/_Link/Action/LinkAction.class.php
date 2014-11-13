<?php
class LinkAction extends AdminAction {
    function _initialize() {
        parent::_initialize();
        $this->dLink = D('Link');
    }
    public function index(){
        $this->data = $this->dLink->select();
        $this->display();
    }
    public function listorder(){
        $ids = $_POST['listorders'];
        foreach ($ids as $key => $r) {
            $data['listorder'] = $r;
            $where['id']= array('eq',$key);
            $res = $this->dLink->where($where)->save($data);
        }

        if($res!==false){
            $this->success("排序成功！");
        }else{
            $this->error("排序失败！");
        }
    }
    public function add(){
        $this->display();
    }
    public function postAdd(){
        $this->dLink->create();
        $data = $this->dLink->add();
        if ($data) {
            $this->success("添加成功！",U('_Link/Link/index'));
        } else {
            $this->error("添加失败！",U('_Link/Link/add'));
        }
    }
    public function edit(){
        $id            = I('get.id',"0","int");
        $info          = $this->dLink->find($id);
        $this->assign("info",$info);
        $this->display();
    }
    public function postEdit(){
        if (IS_POST) {
            if ($this->dLink->create()) {
                if ($this->dLink->save()!==false) {
                    $this->success("保存成功！", U("_Link/Link/index"));
                } else {
                    $this->error("保存失败！");
                }
            } else {
                $this->error($this->dLink->getError());
            }
        }
    }
    function delete(){
        if(isset($_POST['ids'])){
            $ids = implode(",", $_POST['ids']);
            if ($this->dLink->where("id in ($ids)")->delete()!==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }else{
            $id = intval(I("get.id"));
            if ($this->dLink->delete($id)!==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }

    }

}
