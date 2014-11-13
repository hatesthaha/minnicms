<?php
class wanhunet{

	private $object 		= array();
	private $data 			= array();		//model,xml,html,data
	private $xmlObject		= array();

	private $objectName 	= "model";
	private $documentID     = "";
	private $html 			= "";


	public function __construct(){
		$numargs = func_num_args();
		$args    = func_get_args();
		if (method_exists($this,$functionName = $args[0].'_construct')) {
            call_user_func_array(array($this, $functionName), $args);
        }
	}

	public function __get($name){
		if(in_array($name, array("model", "html", "xml"))){
			$this->objectName = $name;
			if(in_array($name, array("html","xml"))){
				call_user_func_array(array($this, $name . "_construct"), array());
			}
			return $this;
		}else{
			$dataArray = preg_split("/(?=[A-Z])/", $name);
			if($dataArray[0] == "data"){
				if(in_array(strtolower($dataArray[1]), array("model","data","xml"))){
					$this->WHGetData();
				}else {
					$this->data["html"] = $this->object["html"]->htmlOuter();
				}
				$dataName = strtolower($dataArray[1]);
				return $this->data[$dataName];
			}
		}

	}

	public function __call($method, $args){
		if (is_callable(array($this->data[$this->objectName], $method))) {
            $this->data[$this->objectName] = call_user_func_array(array($this->data[$this->objectName], $method), $args);
            return $this;
        }else {
        	return call_user_func_array(array($this, $method), $args);
        }
	}

	private function model_construct($functionName,$modelName){
		$this->object['model'] = D("_".ucfirst($modelName));
		$this->data['model']   = $this->object['model'];
	}

	private function xml_construct(){
		if(!isset($this->object["xml"])){

			$this->object["xml"]           = phpQuery::newDocumentXML(xml_encode($this->data["model"]));
			$this->data["xml"]             = $this->object["xml"];
			$this->documentID              = $this->data["xml"]->getDocumentID();

			$this->xmlObject["object"]     = phpQuery::newDocumentXML(xml_encode($this->data["model"]));
			$this->xmlObject["data"]       = $this->xmlObject["object"];
			$this->xmlObject["documentID"] = $this->xmlObject["object"]->getDocumentID();

			return $this;
		}
	}
	private function html_construct(){}

	public function WHHtml($tplName){
		$view       = Think::instance('View');
		$data       = $this->WHGetData();

		$view->assign("data",$data);

		$html       = $view->fetch("Public:".$tplName);
		$this->html = $html;
		if(!isset($this->object["html"])){
			$this->object["html"] = phpQuery::newDocumentHTML($html);
			$this->data["html"]   = $this->object["html"];
			$this->documentID     = $this->data["html"]->getDocumentID();
		}
		return $this;
	}

	public function pq($arg){
		$this->data[$this->objectName] = pq($arg, $this->documentID);
		$this->objectName == "xml" && $this->xmlObject["data"] = pq($arg, $this->xmlObject["documentID"]);
		return $this;
	}

	private function WHGetData(){
		if(isset($this->object["xml"])){
			$xml                = $this->object["xml"]->markupOuter();
			$xmlData            = xml_decode($xml);
			$this->data["data"] = $xmlData;
			return $xmlData;
		}else {
			$this->data["data"] = $this->data["model"];
			return $this->data["model"];
		}
	}

	public function __toString() {
		try {
			return $this->object["html"]->htmlOuter();
		} catch (Exception $e) {
			return $e;
		}
		// echo "string";
	}

	/****************************************/
	/*	数据操作
	/****************************************/

	public function setDateformat($arg){
		$xmlData = $this->_getOldXmlData();
		foreach ($this->data["xml"] as $key => $value) {
			$oldStr = $xmlData[$key];
			$str = date($arg,$oldStr);
			pq($value, $this->documentID)->html($str);
		}
		return $this;
	}


	public function setSubstr($start = 0, $length, $suffix = false){
		$xmlData = $this->_getOldXmlData();
		foreach ($this->data["xml"] as $key => $value) {
			$str = msubstr($xmlData[$key], $start, $length, $charset="utf-8", $suffix);
			pq($value, $this->documentID)->html($str);
		}
		return $this;
	}

	private function _getOldXmlData(){
		$xmlData = array();
		foreach ($this->xmlObject["data"] as $value) {
			$xmlData[] = pq($value,$this->xmlObject["documentID"])->html();
		}
		return $xmlData;
	}

}

