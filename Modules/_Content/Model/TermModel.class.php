<?php
class TermModel extends BaseModel{

	public $depth = array();

	public $childNode = array();

	protected $_auto = array (
	    array('create_time','time',1,'function'),
	    array("update_time","time",3,"function"),
	);

	protected $_link = array(
		'Type' => array(
			'mapping_type' => BELONGS_TO,
			'class_name'   => 'Type',
			'foreign_key'  => 'type',
			'as_fields'    => 'type_name',
		),
	);
	public function __call($method, $args) {
	    if(strtolower(substr($method, 0, 3)) == 'get'){
	    	$model = substr($method, 3, strlen($method));
	    	array_unshift($args, $model);
	        return call_user_func_array(array(&$this, 'getRelationModel'), $args);
	    }else{
	        return parent::__call($method,$args);
	    }
	}

	public function read($options=array()){
		if(count($this->childNode) > 0) {
			$this->childNode = array();
		}
		return parent::read($options);
	}
	private function _read($options=array()){
		return parent::read($options);
	}
	public function getRelationModel($model){
		$dModel =  D('_Content/'.$model);
		if(count($this->childNode) > 0) {
			$dModel->whereIn_term_id = $this->childNode;
		}else {
			$dModel->whereIn_term_id = array($this->id);
		}
		return $dModel;
	}

	public function parent(){
		$parent_id = $this->parent_id;
		return $parent_id == 0 ? $this : D("Term")->_read($parent_id);
	}

	public function getList($options = array()){
		if(is_numeric($options)){
			$parent_id 	= $options;
			$options 	= array();
		}else{
			$options["parent_id"] = isset($options["parent_id"]) 	? $options["parent_id"] : null;
			$parent_id            = is_null($options["parent_id"]) 	? $this->parent_id 		: $options["parent_id"];
		}
		return $this->where(array("parent_id"=>$parent_id))->order('listorder desc')->select($options);
	}

	public function hasChild($options = array()){
		$parent_id = $this->id;
		$rs = $this->getList(array("parent_id"=>$parent_id));
		return empty($rs) ? false : $rs;
	}

	public function getChilds($depht = 1){
		$this->childNode[] = $this->id;
		$this->_getChilds($this->id);
		return $this;
	}

	private function _getChilds($id){
		$child = $this->_read($id)->field("id")->hasChild();
		if($child){
			foreach ($child as $key => $value) {
				$this->childNode[] = $value["id"];
				$this->_getChilds($value["id"]);
			}
		}
	}

	public function depth(){
		$this->depth   = array();
		$parent_id     = $this->parent_id;
		$this->depth[] = $parent_id;
		$parent_id     != 0 && $this->_depth($parent_id);
		return $this;
	}

	private function _depth($parent_id){
		$rs = D("Term")->_read($parent_id)->parent_id;
		$this->depth[] = $rs;
		if($rs != 0){
			$this->_depth($rs);
		}
	}

}
