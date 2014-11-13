<?php
function WH(){
	import("phpQuery");
	import("wanhunet");
	$numargs = func_num_args();
	$args    = func_get_args();
	$setData = explode(".", $args[0]);
	if($setData[0] == "model"){
		return WH_model($setData[1]);
	}
}

function WH_model($model){
	$wanhunet = new wanhunet("model", $model);
	return $wanhunet;
}

function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true) {
    if(function_exists("mb_substr")){
        $slice = mb_substr($str, $start, $length, $charset);
    	$str_length = mb_strlen($str, $charset);
    }elseif(function_exists('iconv_substr')) {
        $slice = iconv_substr($str,$start,$length,$charset);
    }else{
        $re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
        $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
        $re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
        $re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
        preg_match_all($re[$charset], $str, $match);
        $slice = join("",array_slice($match[0], $start, $length));
    }
    if($suffix){
    	if($str_length > $length ){
    		$slice .= "...";
    	}
    }
    return $slice;
}
function xml_decode($xml, $root='think', $item='item'){
	import("xml2array");
	$data = XML2Array::createArray($xml);
	if(isset($data[$root]["pageShow"])){
		$data[$root][$item]["pageShow"] =  $data[$root]["pageShow"]["value"];
	}
    if(!isset($data[$root][$item][0])){
        $data[$root][$item][0] = $data[$root][$item];
    }
    if(is_null($data[$root][$item][0])){
        return $data[$root];
    }else {
        return $data[$root][$item];
    }
}


function a_link($tpl_name, $args){
	$url = U("${tpl_name}",$args);
	return $url;

}
/*
function WH_model($setData, $args){
	$functionstr =  $args[1];
	$wanhunet    =  new wanhunet($setData[1]);
	$functions   =  array();
	if(!strstr($functionstr,").")){
		$functions[] = $functionstr;
	}else {
		$functions = explode(").", $functionstr);
	}

	foreach ($functions as $key => $value) {
		$functionNameLength = strpos($value,"(");
		$functionName       = substr($value, 0, $functionNameLength);
		$functionArgsStr    = substr($value, $functionNameLength);
		$functionArgsStr    = count($functions)- 1 == $key ?  $functionArgsStr : $functionArgsStr.')';
		$functionArgsStr	= substr($functionArgsStr, 0, 6) == "(array" ? $functionArgsStr : "array" . $functionArgsStr;
		eval('$functionArgs='.$functionArgsStr.";");
		call_user_func_array(array($wanhunet, $functionName), $functionArgs);
	}
	return $wanhunet;
}
*/
