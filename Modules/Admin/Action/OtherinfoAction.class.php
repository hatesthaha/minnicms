<?php
class OtherinfoAction extends AdminAction {

    protected $dOtherinfo;

    function _initialize() {
        $this->dOtherinfo = D("Otherinfo");
    }

    public function index(){
        $info=$this->dOtherinfo->where(array('id'=>'1'))->find();
        $this->assign("info",$info);
        $this->display();
    }

    public function postAdd(){
        if (IS_POST) {
            if(isset($_POST['id'])){
                $where['id']=intval($_POST['id']);
                $data['index_contact'] = $_POST['index_contact'];
                $data['index_context'] = $_POST['index_context'];
                $r=$this->dOtherinfo->where($where)->save($data);
            }else{
                $this->dOtherinfo->create();
                $r=$this->dOtherinfo->add();
            }

            if ($r!==false) {
                $this->success("保存成功！");
            } else {
                $this->error("保存失败！");
            }

        }
    }


}
