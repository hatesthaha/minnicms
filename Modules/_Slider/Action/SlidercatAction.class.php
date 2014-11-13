<?php
class SlidercatAction extends AdminAction {
    function _initialize() {
        parent::_initialize();
        $this->dSlidercat = D("Slidercat");

    }
    public function index(){
        $this->data = $this->dSlidercat -> select();
        $this->display();

    }
    public function add(){
        $this->display();
    }
    public function postAdd(){
        $this->dSlidercat->create();
        $data = $this->dSlidercat->add();
        if ($data) {
            $this->success("添加成功！",U('_Slider/Slidercat/index'));
        } else {
            $this->error("添加失败！",U('_Slier/Slidercat/add'));
        }
    }
    public function edit(){
        $id            = I('get.id',"0","int");
        $info          = $this->dSlidercat->find($id);
        $this->assign("info",$info);
        $this->display();
    }
    public function postEdit(){
        if (IS_POST) {
            if ($this->dSlidercat->create()) {
                if ($this->dSlidercat->save()!==false) {
                    $this->success("保存成功！", U("_Slider/Slidercat/index"));
                } else {
                    $this->error("保存失败！");
                }
            } else {
                $this->error($this->dSlidercat->getError());
            }
        }
    }
    function delete(){
        if(isset($_POST['ids'])){
            $ids = implode(",", $_POST['ids']);
            if ($this->dSlidercat->where("id in ($ids)")->delete()!==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }else{
            $id = intval(I("get.id"));
            if ($this->dSlidercat->delete($id)!==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }

    }

}
