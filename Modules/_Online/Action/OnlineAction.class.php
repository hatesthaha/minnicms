<?php
class OnlineAction extends AdminAction {
    function _initialize() {
        parent::_initialize();
        $this->dOnline = D('Online');
    }
    public function index(){
        $this->data = $this->dOnline->select();
        $this->display();
    }
    public function listorder(){
        $ids = $_POST['listorders'];
        foreach ($ids as $key => $r) {
            $data['listorder'] = $r;
            $where['id']= array('eq',$key);
            $res = $this->dOnline->where($where)->save($data);
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
        $this->dOnline->create();
        $data = $this->dOnline->add();
        if ($data) {
            $this->success("添加成功！",U('_Online/Online/index'));
        } else {
            $this->error("添加失败！",U('_Online/Online/add'));
        }
    }
    public function edit(){
        $id            = I('get.id',"0","int");
        $info          = $this->dOnline->find($id);
        $this->assign("info",$info);
        $this->display();
    }
    public function postEdit(){
        if (IS_POST) {
            if ($this->dOnline->create()) {
                if ($this->dOnline->save()!==false) {
                    $this->success("保存成功！", U("_Online/Online/index"));
                } else {
                    $this->error("保存失败！");
                }
            } else {
                $this->error($this->dOnline->getError());
            }
        }
    }
    function delete(){
        if(isset($_POST['ids'])){
            $ids = implode(",", $_POST['ids']);
            if ($this->dOnline->where("id in ($ids)")->delete()!==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }else{
            $id = intval(I("get.id"));
            if ($this->dOnline->delete($id)!==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }

    }

}
