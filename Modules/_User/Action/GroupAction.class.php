<?php
class GroupAction extends AdminAction {
    function _initialize() {
        parent::_initialize();
        $this->dUsers = D("User");
        $this->dGroups = D("Group");
        $this->dTerms = D('Term');
    }
    public function index(){
        $data = $this->dGroups -> select();
        $this->assign('data',$data);
        $this->display();
    }
    public function add(){
        $this->assign('data',$data);
        $this->display();
    }
    public function postAdd(){
        $this->dGroups->create();
        $data = $this->dGroups->add();
        if ($data) {
            $this->success("添加成功！",U('_User/Group/index'));
        } else {
            $this->error("添加失败！",U('_User/Group/add'));
        }
    }
    public function edit(){
        $id             = I('get.id',"0","int");
        $info           = $this->dGroups->find($id);
        $this->assign('info',$info);
        $this->display();
    }
    public function show(){
        $id             = I('get.id',"0","int");
        $where['group_id'] = array('eq',$id);
        $data = $this->dUsers -> where($where) -> select();
        $this->assign('data',$data);
        $this->display();
    }
    public function postEdit(){
        $a = $this->dGroups->create();
        $rs = $this->dGroups->save();
        if ($rs) {
            $this->success("保存成功！",U('_User/Group/index'));
        } else {
            $this->error("保存失败！",U('_User/Group/add'));
        }
    }
    public function delete(){
        $id   = I('get.id',"0","int");
        $content = $this->dGroups->where(array("id"=>$id))->delete();
        if ($content) {
            $this->success("删除成功",U('_User/Group/index'));
        } else {
            $this->error("删除失败！",U('_User/Group/index'));
        }
    }

}
