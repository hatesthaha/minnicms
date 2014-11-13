<?php
class EmptyAction extends BaseAction{

    public $moduleName;
    public $actionName;

    function _initialize() {
        $site_options = $this->get_site_options();
        foreach ($site_options as $key => $value) {
            $this->$key = $value;
        }
        $this->action  = $this;
        import('Model._ContentModel', APP_PATH . 'Modules/_Content');
    }

    public function _empty($name){
        if($this->ismobile()){
            $tplname = "Phone";
        }else {
            $tplname = MODULE_NAME;
        }
        $this->moduleName = MODULE_NAME;
        $this->actionName = $name;
        $content = $this->fetch($tplname.":".$name);
        // $content = $this->setHtml($content);
        $this->show($content);

    }
    private function setHtml($html){
        import("simpleDom");
        $html = str_get_html($html);
        foreach ($html->find("script") as $k => $v) {
            if(!strstr($v->src,__ROOT__) and !empty($v->src))
                $v->src = __ROOT__ . "/Tpl/Index/" . $v->src;
        }
        foreach ($html->find("link") as $k => $v) {
            if(!strstr($v->href,__ROOT__))
                $v->href = __ROOT__ . "/Tpl/Index/" . $v->href;
        }
        foreach ($html->find("img") as $k => $v) {
            if(!strstr($v->src,__ROOT__))
                $v->src = __ROOT__ . "/Tpl/Index/" . $v->src;
        }
        return $html;

    }


    public function __seachAll($seachStr, $pagesize = 1, $theme = "%nowPage%/%totalPage% 页 %upPage% %downPage% %first%  %prePage%  %linkPage%  %nextPage% %end% %totalRow% %header%"){

        $m = M();

        $tables = array("article","case","download","page","product");
        $tablesName_1 = C("DB_PREFIX") . $tables[0];
        $model =$m->field($tablesName_1.'.title')->table($tablesName_1)->where("${tablesName_1}.title like '%${seachStr}%'");
        foreach ($tables as $key => $value) {
            if ($key != 0) {
                $tablesName = C("DB_PREFIX") . $value;
                $model = $model->union("SELECT ${tablesName}.title FROM ${tablesName} where ${tablesName}.title like '%${seachStr}%'",true);
            }
        }

        $sql = $model->select(false);
        $sql = substr($sql,0,strlen($sql)-1);
        $sql = substr($sql,1,strlen($sql));

        import('ORG.Util.Page');
        $count = count($m->query($sql));
        $Page  = new Page($count,$pagesize);
        $Page->setConfig('theme',$theme);
        $pageShow = $Page->show();

        $sql = $sql . "limit " . $Page->firstRow . ',' . $Page->listRows;

        $data = $m->query($sql);

        $data["pageShow"] = $pageShow;

        return $data;




    }

    /**
     * 自动定位模板文件
     * @access protected
     * @param string $template 模板文件规则
     * @return string
     */
    public function parseTemplate($template='') {
        $app_name   =   APP_NAME == basename(dirname($_SERVER['SCRIPT_FILENAME'])) && ''==__APP__?'':APP_NAME.'/';
        $depr       =   C('TMPL_FILE_DEPR');
        $template   =   str_replace(':', $depr, $template);
        // 获取当前主题名称
        $theme      =   $this->getTemplateTheme();
        define('THEME_PATH',   dirname(dirname(BASE_LIB_PATH)).'/'.basename(TMPL_PATH).'/'.$theme);
        // 分析模板文件规则
        if('' == $template) {
            // 如果模板文件名为空 按照默认规则定位
            $template = MODULE_NAME . $depr . ACTION_NAME;
        }elseif(false === strpos($template, '/')){
            $template = MODULE_NAME . $depr . $template;
        }
        return THEME_PATH.$template.C('TMPL_TEMPLATE_SUFFIX');
    }
    public function display($templateFile = '', $charset = '', $contentType = '', $content = '', $prefix = '') {
        parent::display($this->parseTemplate($templateFile), $charset, $contentType);
    }
    protected function fetch($templateFile='',$content='',$prefix='') {
        // echo $this->parseTemplate($templateFile);
        return parent::fetch($this->parseTemplate($templateFile),$content,$prefix);
    }
    /**
     * 获取当前的模板主题
     * @access private
     * @return string
     */
    private function getTemplateTheme() {
        if($this->theme) { // 指定模板主题
            $theme = $this->theme;
        }else{
            /* 获取模板主题名称 */
            $theme =  C('DEFAULT_THEME');
            if(C('TMPL_DETECT_THEME')) {// 自动侦测模板主题
                $t = C('VAR_TEMPLATE');
                if (isset($_GET[$t])){
                    $theme = $_GET[$t];
                }elseif(cookie('think_template')){
                    $theme = cookie('think_template');
                }
                if(!in_array($theme,explode(',',C('THEME_LIST')))){
                    $theme =  C('DEFAULT_THEME');
                }
                cookie('think_template',$theme,864000);
            }
        }

        define('THEME_NAME',   $theme);                  // 当前模板主题名称
        return $theme?$theme . '/':'';
    }
    /**
    * site_name
    * logo
    * site_host
    * site_seo_keywords
    * site_seo_description
    * site_copyright
    * site_code
    * site_contact
    * site_other
    * id
    * index_context
    * index_contact
    * create_time
    * update_time
    */
    public function get_site_options(){
        $site_options = F("site_options");
        if(empty($site_options)){
            $options_obj = M("Option");
            $otherinfo_obj = M("Otherinfo");
            $option = $options_obj->where("option_name='site_options'")->find();
            $otherinfo = $otherinfo_obj->where(array('id'=>'1'))->find();
            if($option){
                $site_options = (array)json_decode($option['option_value']);
                $site_options = array_merge($site_options,$otherinfo);
            }else{
                $site_options = array();
                $site_options = array_merge($site_options,$otherinfo);
            }
            F("site_options", $site_options);
        }
        return $site_options;
    }

    //切换移动端
    public function ismobile() {
        // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
        if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))
            return true;

        //此条摘自TPM智能切换模板引擎，适合TPM开发
        if(isset ($_SERVER['HTTP_CLIENT']) &&'PhoneClient'==$_SERVER['HTTP_CLIENT'])
            return true;
        //如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
        if (isset ($_SERVER['HTTP_VIA']))
            //找不到为flase,否则为true
            return stristr($_SERVER['HTTP_VIA'], 'wap') ? true : false;
        //判断手机发送的客户端标志,兼容性有待提高
        if (isset ($_SERVER['HTTP_USER_AGENT'])) {
            $clientkeywords = array(
                'nokia','sony','ericsson','mot','samsung','htc','sgh','lg','sharp','sie-','philips','panasonic','alcatel','lenovo','iphone','ipod','blackberry','meizu','android','netfront','symbian','ucweb','windowsce','palm','operamini','operamobi','openwave','nexusone','cldc','midp','wap','mobile'
            );
            //从HTTP_USER_AGENT中查找手机浏览器的关键字
            if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
                return true;
            }
        }
        //判断是否为ipad
        $ua = @$_SERVER['HTTP_USER_AGENT'];
        if (preg_match('/ipad/i', $ua)) {

            return true;

        }
        //协议法，因为有可能不准确，放到最后判断
        if (isset ($_SERVER['HTTP_ACCEPT'])) {
            // 如果只支持wml并且不支持html那一定是移动设备
            // 如果支持wml和html但是wml在html之前则是移动设备
            if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
                return true;
            }
        }
        return false;
    }

}
