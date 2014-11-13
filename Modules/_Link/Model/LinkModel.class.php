<?php
class LinkModel extends BaseModel{

	protected $_auto = array (
	    array('create_time','time',1,'function'),
	    array("update_time","time",3,"function"),
	);
    public function getList($option = array()){
        return $this->where(array("status"=>1))->select($option);
    }
}
