<?php
class SlidercatModel extends BaseModel{

	protected $_auto = array (
	    array('create_time','time',1,'function'),
	    array("update_time","time",3,"function"),
	);
    public function read($options=array()) {
        if(is_numeric($options)){
            $this->find($options);
        }else{
            $this->where(array('cat_name' => $options ))->find();
        }
        return $this;
    }
    function getSlider($options = array()){
        return D("slider")->where(array('sid'=>$this->id));
    }
}
