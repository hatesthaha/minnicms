<?php
class SliderAction extends AdminAction {
    function _initialize() {
        parent::_initialize();
        $this->dSlider = D("Slider");
        $this->dSlidercat = D("Slidercat");
    }
    public function index(){
        $this->data = $this->dSlider ->select();
        $this->display();
    }
    public function listorder(){
        $ids = $_POST['listorders'];
        foreach ($ids as $key => $r) {
            $data['listorder'] = $r;
            $where['id']= array('eq',$key);
            $res = $this->dSlider->where($where)->save($data);
        }

        if($res!==false){
            $this->success("排序成功！");
        }else{
            $this->error("排序失败！");
        }
    }
    public function add(){
        $this->allcat = $this->dSlidercat -> select();
        if($this->allcat){
            $this->display();
        }else{
            $this->error("请先添加分类",U('_Slider/Slider/index'));
        }

    }
    public function postAdd(){
        $this->dSlider->create();
        $data = $this->dSlider->add();
        if ($data) {
            $this->success("添加成功！",U('_Slider/Slider/index'));
        } else {
            $this->error("添加失败！",U('_Slider/Slider/add'));
        }
    }
    public function edit(){
        $id            = I('get.id',"0","int");
        $info          = $this->dSlider->find($id);
        $this->allcat = $this->dSlidercat -> select();
        $this->assign("info",$info);
        $this->display();
    }
    public function postEdit(){
        if (IS_POST) {
            if ($this->dSlider->create()) {
                if ($this->dSlider->save()!==false) {
                    $this->success("保存成功！", U("_Slider/Slider/index"));
                } else {
                    $this->error("保存失败！");
                }
            } else {
                $this->error($this->dSlider->getError());
            }
        }
    }

    function delete(){
        if(isset($_POST['ids'])){
            $ids = implode(",", $_POST['ids']);
            $data['slide_status']=0;
            if ($this->dSlider->where("id in ($ids)")->delete()!==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }else{
            $id = intval(I("get.id"));
            if ($this->dSlider->delete($id)!==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }

    }
}
