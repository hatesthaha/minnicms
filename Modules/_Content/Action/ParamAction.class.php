<?php
class ParamAction extends AdminAction {
    function _initialize() {
        parent::_initialize();
        $this->dParam = D("Param");
        $this->dTerm = D("Term");
        $this->dParamlist = D("paramList");
    }
    public function index(){
        $this->typeData = $this->dParam->type;
        $this->select_data = $this->dTerm->select();
        $this->data = $this->dParam->relation(true)->select();
        // var_dump($this->data);
        $this->display();
    }
    public function postAdd(){
        $aa = $this->dParam->create();
        $rs = $this->dParam->add();
        if($rs){
            $data["status"] = 1;
            $data["info"] = "添加成功";
            $data["rs"] = $rs;
        }else {
            $data["status"] = 0;
            $data["info"] = "添加失败";
        }
        $this->ajaxReturn($data);
    }
    public function postEdit(){
        $a = $this->dParam->create();
        $rs = $this->dParam->save();
        if ($rs) {
            $data["status"] = 1;
            $data["info"] = "添加成功";
        } else {
            $data["status"] = 0;
            $data["info"] = "添加失败";
        }
        $this->ajaxReturn($data);
    }
    public function postDelete(){
        $id = I('post.id',"0","int");
        $content = $this->dParam->relation(true)->where(array("param_id"=>$id))->delete() ? "删除成功" : "删除失败";
        $this->ajaxReturn($content);
    }
    public function postParanlistDelete(){
        $id   = I('post.id',"0","int");

        $content = $this->dParamlist->where(array("pl_id"=>$id))->delete() ? "删除成功" : "删除失败";
        $this->ajaxReturn($content);
    }
    public function postUpdateParam(){
        $a = $this->dParamlist->create();
        $rs = $this->dParamlist->save();
        if ($rs) {
            $data["status"] = 1;
            $data["rs"] = $rs;
            $data["info"] = "添加成功";
        } else {
            $data["status"] = 0;
            $data["info"] = "添加失败";
        }
        $this->ajaxReturn($data);
    }
    public function setParam(){
        $param_id = I("get.param_id","","int");
        $data = D("paramList")->where(array("param_id"=>$param_id))->select();
        $this->assign("list_data",$data);
        $this->display();
    }
    public function postSetParam(){
        $param_list = D("paramList");
        $data       = $param_list->create();
        $rs         = $param_list->add();
        $status     = $rs ? "1" : "0";
        $this->ajaxReturn(array("status"=>$status,"rs"=>$rs));
    }


    private function _getHtml(){


        echo $functionName;
        // return call_user_func($functionName, $data);
    }


    private function _getParamHtml($termId){

        function get_html_input($param_id, $data){
            $tpl = '<input name="param['.$param_id.']" class="'.$param_id.'"/>';
            return $tpl;
        }

        function get_html_textarea($param_id, $data){
            $tpl = '<textarea rows="3" cols="20" name="param['.$param_id.']" class="'.$param_id.'"></textarea>';
            return $tpl;
        }

        function get_html_select($param_id, $data){
            $str = "";
            foreach ($data as $k => $v) {
                $str .= '<option value="'.$v["pl_name"].'">'.$v["pl_name"].'</option>';
            }
            $tpl = '<select class="'.$param_id.'" name="param['.$param_id.']">' . $str . "</select>";
            return $tpl;
        }

        function get_html_radio($param_id, $data){
            $str = "";
            foreach ($data as $k => $v) {
                $str .= '<input class="'.$param_id.'"  type="radio" name="param['.$param_id.']" value="'.$v["pl_name"].'" /><span>'.$v["pl_name"].'</span>';
            }
            $tpl = $str;
            return $tpl;
        }

        function get_html_checkbox($param_id, $data){
            $str = "";
            foreach ($data as $k => $v) {
                $str .= '<input class="'.$param_id.'" type="checkbox" name="param['.$param_id.'][]" value="'.$v["pl_name"].'" /><span>'.$v["pl_name"].'</span>';
            }
            $tpl = $str;
            return $tpl;
        }

        function get_html($type, $param_id, $data){
            $functions = array(
                        '1'  =>  "input",
                        '2'  =>  "textarea",
                        '3'  =>  "select",
                        '4'  =>  "radio",
                        '5'  =>  "checkbox",
                    );
            $functionName = "get_html_" . $functions[$type];
            return call_user_func_array($functionName, array("param_".$param_id, $data));
        }



        $depth = $this->dTerm->read($termId)->depth()->depth;
        $depth[] = $termId;
        $rs = $this->dParam->relation("ParamList")->where(array("term_id"=>array("in",$depth)))->getList();
        $htmlRs = array();

        foreach ($rs as $key => $value) {
            $htmlRs[] = array(
                "param_lian"      => "param_".$value["param_id"],
                "param_name"      => $value["param_name"],
                "param_id"        => $value["param_id"],
                "param_type"      => $value["param_type"],
                "param_type_name" => $this->dParam->type[$value["param_type"]],
                "html"            => get_html($value["param_type"], $value["param_id"], $value["ParamList"]),
            );
        }
        return $htmlRs;
        // $this->show(" ");

    }
    public function getParams(){
        $term_id = I("post.term_id","","int");
        $data = $this->_getParamHtml($term_id);
        $this->ajaxReturn(array("data"=>$data));

    }

}
