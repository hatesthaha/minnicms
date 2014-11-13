<?php
$db = include 'Conf/db.php';
$alias = include 'Conf/alias.php';
$configs = array(
	'APP_GROUP_LIST'    => 'Home,Admin,_Content,_Slider,_Online,_Link,_User,_Count',
	'DEFAULT_GROUP'     => 'Home',
	'APP_GROUP_MODE'    => 1,
	'SHOW_PAGE_TRACE'   => true,
	'TMPL_DETECT_THEME' => false,       // 自动侦测模板主题
	'SHOW_RUN_TIME'     => false,
	'URL_CASE_INSENSITIVE'  => false,   // 默认false 表示URL区分大小写 true则表示不区分大小写
    'URL_MODEL'             => 2,       // URL访问模式,可选参数0、1、2、3,代表以下四种模式：
     // 0 (普通模式); 1 (PATHINFO 模式); 2 (REWRITE  模式); 3 (兼容模式)  默认为PATHINFO 模式，提供最好的用户体验和SEO支持
    //'URL_CASE_INSENSITIVE' =>true,
	'UPLOAD_PATH'		=> 'Public/Uploads/',
	'ASSETS_PATH'		=> __ROOT__.'/assets'
);
$tmpl_parse_string= array(
	'TMPL_PARSE_STRING' => array(
		'../assets'     	=> $configs["ASSETS_PATH"],
		'../upload'			=> __ROOT__ .'/'. $configs["UPLOAD_PATH"],
		"../index"          =>__ROOT__."/Tpl/Index/",
	)
);

return  array_merge($configs,$db,$alias,$tmpl_parse_string);
?>
