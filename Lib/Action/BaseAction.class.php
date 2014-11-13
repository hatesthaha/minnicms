<?php

class BaseAction extends Action {

    public function _initialize() {
        //访客来源判断
        $refer = $_SERVER["HTTP_REFERER"];//获取上一页面地址
        if($refer){
        $refer_string = parse_url($refer, PHP_URL_HOST);//
        $arr=array("baidu","soso","sogou","so","google","bing","yahoo","youdao");//常用搜索引擎,注意"soso","sogou","so"的顺序
        foreach($arr as $re){
          if(substr_count($refer_string,$re)>=1){
            $map['type'] = $re;
            break;
          }
        }
          M("engines")->where($map)->setInc('counts',1);
        }else{
           $map['type'] = 'direct';
          M("engines")->where($map)->setInc('counts',1);
        }
    }

	public function verify(){
	    import('ORG.Util.Image');
        ob_end_clean();
	    Image::buildImageVerify();
	}
	public function uploadify()
    {
        if (!empty($_FILES)) {
            import('ORG.Net.UploadFile');
    		$upload = new UploadFile();// 实例化上传类
    		$upload->maxSize  = 3145728 ;// 设置附件上传大小
    		$upload->allowExts  = array('jpg', 'gif', 'png', 'jpeg','zip','rar');// 设置附件上传类型
    		$upload->savePath =  C("UPLOAD_PATH");// 设置附件上传目录
    		if(!$upload->upload()) {// 上传错误提示错误信息
    			$this->error($upload->getErrorMsg());
    		}else{// 上传成功 获取上传文件信息
    			$info =  $upload->getUploadFileInfo();
                echo $info[0]['savename'];
    		}
        }else {
        	echo "上传失败";
        }
    }
}
