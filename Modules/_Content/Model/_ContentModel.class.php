<?php
Class _ContentModel extends BaseModel {
 	protected $_auto = array (
	    array('create_time','time',1,'function'), // 对create_time字段在更新的时候写入当前时间戳
	    array("update_time","time",3,"function"),
	);

	private $pageShow = "";
	private $pageShowSet = true;

	public function __get($name) {
		if($name == "pageShow"){
			$this->pageShowSet = false;
			return $this->pageShow;
		}
		return parent::__get($name);
    }

    protected function _facade($data){
    	if(isset($data["param"])){
    		$param = $data["param"];
    		$param = serialize($param);
    		$data["param"] = $param;
    	}
    	if(isset($data['content'])){
    		$data["content"] = htmlspecialchars($data['content']);
    	}
    	return parent::_facade($data);
    }



	public function getList($options = array()){
		if(isset($this->whereIn_term_id)){
			$data = $this->where(array("term_id"=>array("in",$this->whereIn_term_id)))->select();
		}else {
			$this->_setRelation_term_id($options);
			$data = is_null($this->relation_term_id) ? $this->select() : $this->where(array("term_id"=>$this->relation_term_id))->select();
		}

		if($this->pageShowSet){
			if(!empty($this->pageShow)){
				$data["pageShow"]["value"] = htmlspecialchars($this->pageShow);
			}
		}
		return $data;

	}
	public function getNext($options = "next"){
		$wid =  $options == "next" ? "lt" : "gt";
		$id = $this->id;
		$where['id'] = array($wid,$id );
		$where['term_id'] = $this->term_id;
		return $this->where($where)->order('id desc')->find();
	}
	public function getPage($options = array()){
		$pageTheme = isset($options["pageTheme"]) ? $options["pageTheme"] : "%nowPage%/%totalPage% 页 %upPage% %downPage% %first%  %prePage%  %linkPage%  %nextPage% %end% %totalRow% %header%";
		if(isset($this->whereIn_term_id)){
			$pagesize = isset($options["pagesize"]) ? $options["pagesize"] : 2;
			import('ORG.Util.Page');
			$count          = $this->where(array("term_id"=>array("in",$this->whereIn_term_id)))->count();
			$Page           = new Page($count,$pagesize);
			$Page->setConfig('theme',$pageTheme);
			$this->pageShow = $Page->show();
			return $this->limit($Page->firstRow.','.$Page->listRows)->where(array("term_id"=>array("in",$this->whereIn_term_id)));
		}else {
			$pagesize = isset($options["pagesize"]) ? $options["pagesize"] : 2;
			$this->_setRelation_term_id($options);
			if(!is_null($this->relation_term_id)){
				import('ORG.Util.Page');
				$term_id        = $this->relation_term_id;
				$count          = $this->where(array("term_id"=>$term_id))->count();
				$Page           = new Page($count,$pagesize);
				$Page->setConfig('theme',$pageTheme);

				$this->pageShow = $Page->show();
				return $this->limit($Page->firstRow.','.$Page->listRows);
			}
		}
	}

	private function _setRelation_term_id($options = array()){
		if(isset($options['term_id'])){
			return $this->relation_term_id = $options["term_id"];
		}elseif(isset($this->relation_term_id)){
			return $this->relation_term_id = $this->relation_term_id;
		}elseif(isset($_REQUEST['term_id'])) {
			return $this->relation_term_id = I("request.term_id","","int");
		}else {
			return $this->relation_term_id = null;
		}
	}
}
