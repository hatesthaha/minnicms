<?php
class UserAction extends AdminAction {
    function _initialize() {
        parent::_initialize();
        $this->dUsers = D("User");
        $this->dTerms = D('Term');
        $this->dGroups = D("Group");
    }
    public function index(){
        $data = $this->dUsers -> select();
        $this->assign('data',$data);
        $this->display();
    }
    public function add(){
        $group = $this->dGroups -> select();
        $data = $this->dTerms -> select();
        $this->assign('group',$group);
        $this->assign('data',$data);
        $this->display();
    }
    public function postAdd(){
        $_POST['role'] = implode(',',$_POST['role']);
        $_POST['sign_time'] = time();
        $_POST['password'] = md5($_POST['password']);
        $group           = $this->dGroups->find($_POST['group_id']);
        $_POST['group_name'] = $group['name'];
        $this->dUsers->create();
        $data = $this->dUsers->add();
        if ($data) {
            $this->success("添加成功！",U('_User/User/index'));
        } else {
            $this->error("添加失败！",U('_User/User/add'));
        }
    }
    public function edit(){
        $id             = I('get.id',"0","int");
        $info           = $this->dUsers->find($id);
        $group = $this->dGroups -> select();
        $arr = explode(',',$info['role']);
        $data = $this->dTerms -> select();
        $this->assign('group',$group);
        $this->assign('data',$data);
        $this->assign('arr',$arr);
        $this->assign('info',$info);
        $this->display();
    }
    public function postEdit(){
        $_POST['role'] = implode(',',$_POST['role']);
        $_POST['password'] = md5($_POST['password']);
        $group           = $this->dGroups->find($_POST['group_id']);
        $_POST['group_name'] = $group['name'];
        $a = $this->dUsers->create();
        $rs = $this->dUsers->save();
        if ($rs) {
            $this->success("保存成功！",U('_User/User/index'));
        } else {
            $this->error("保存失败！",U('_User/User/add'));
        }
    }
    public function delete(){
        $id   = I('get.id',"0","int");
        $content = $this->dUsers->where(array("id"=>$id))->delete();
        if ($content) {
            $this->success("删除成功",U('_User/User/index'));
        } else {
            $this->error("删除失败！",U('_User/User/index'));
        }
    }

}
