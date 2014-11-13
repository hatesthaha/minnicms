<?php
class BaseModel extends RelationModel{

	public function read($options=array()) {
	     $this->find($options);
	     return $this;
	}

	public function __get($name) {
	 	$fieldName = ucfirst($name);
		if(method_exists($this, "_get${fieldName}Field")){
			return call_user_func_array(array($this, "_get${fieldName}Field"), array());
		}else {
			return parent::__get($name);
		}
    }
    public function find($options=array()) {
        $data = parent :: find($options);
        isset($data["param"]) && $data["newparam"] = unserialize($data["param"]);
        return $this->data=$data;
     }

    public function listorders($ids){
        $pk = $this->getPk(); //获取主键名称
        foreach ($ids as $key => $r) {
            $data['listorder'] = $r;
            $this->where(array($pk => $key))->save($data);
        }
        return true;
    }





}
