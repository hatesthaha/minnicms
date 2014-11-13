<?php
class ModuleAction extends AdminAction {

    protected $dModule;

    function _initialize() {
        $this->dModule = D("Type");
    }

    public function index(){
        $this->data=$this->dModule->select();
    	$this->display();
    }

    public function add(){
        $this->display();
    }
    public function postAdd(){
        $this->dModule->create();
        $data = $this->dModule->add();
        if ($data) {
            $this->success("添加成功！",U('Admin/Module/index'));
        } else {
            $this->error("添加失败！",U('Admin/Module/add'));
        }
    }
    public function edit(){
        $id            = I('get.id',"0","int");
        $info          = $this->dModule->find($id);
        $this->assign("info",$info);
        $this->display();
    }
    public function postEdit(){
        if (IS_POST) {
            if ($this->dModule->create()) {
                if ($this->dModule->save()!==false) {
                    $this->success("保存成功！", U("Admin/Module/index"));
                } else {
                    $this->error("保存失败！");
                }
            } else {
                $this->error($this->dModule->getError());
            }
        }
    }
    function delete(){
        if(isset($_POST['ids'])){
            $ids = implode(",", $_POST['ids']);
            if ($this->dModule->where("type_id in ($ids)")->delete()!==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }else{
            $id = intval(I("get.id"));
            if ($this->dModule->delete($id)!==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }

    }

}
