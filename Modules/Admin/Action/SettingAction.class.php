<?php
class SettingAction extends AdminAction {

    protected $dOption;

    function _initialize() {
        $this->dOption = D("Option");
    }

    public function index(){
        $option=$this->dOption->where("option_name='site_options'")->find();
        $this->assign((array)json_decode($option['option_value']));
        $this->assign("option_id",$option['option_id']);
    	$this->display();
    }

    public function postAdd(){
        if (IS_POST) {
            $data['option_name']="site_options";
            $data['option_value']=json_encode($_POST['options']);
            if(isset($_POST['option_id'])){
                $where['option_id']=intval($_POST['option_id']);
                $r=$this->dOption->where($where)->save($data);
            }else{
                $r=$this->dOption->add($data);
            }

            if ($r!==false) {
                $this->success("保存成功！");
            } else {
                $this->error("保存失败！");
            }

        }
    }

}
