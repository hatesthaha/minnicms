<?php
class ParamModel extends BaseModel{
	protected $_auto = array (
		array('create_time','time',1,'function'),
		array("update_time","time",3,"function"),
	);
	
	protected $_link = array(
		'Term' => array(
			'mapping_type' => BELONGS_TO,
			'class_name'   => 'Term',
			'foreign_key'  => 'term_id',
			'as_fields'    => 'name',
		),
		'ParamList'=> array(  
			'mapping_type'=>HAS_MANY,
			'class_name'=>'ParamList',
			'foreign_key'=>'param_id',
			'mapping_order'=>'pl_listorder desc',
		),
	);

	public $type = array(
			"1"  =>	"简单输入框",
			"2"  =>	"长文本输入框",
			"3"  =>	"下拉框",
			"4"  =>	"单选框",
			"5"  =>	"多选"
		);


	public function getList($options = array()){
		return $this->order('param_listorder desc')->select($options);
	}

	public function _getTypeField(){

	}
	public function _getTypesDataField(){
		return "";
	}

}