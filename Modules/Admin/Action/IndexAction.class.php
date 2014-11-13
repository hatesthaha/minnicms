<?php
class IndexAction extends AdminAction {
	public function index(){
		$this->data=D('System')->select();
		$this->display();
	}
    public function app(){
        $this->display();
    }
    public function system(){
    	import("clientGetObj");
		$code = new clientGetObj;
		$ip = $code->getIP();//IP地址
		$os = $code->getOS();//操作系统
    	$this->assign('ip',$ip);
    	$this->assign('os',$os);
    	$this->display();
    }
    public function delRuntime(){
        import("Dir");
        $dirtool = new Dir();
        $pwd = getcwd();
        $dirfile = $pwd.'/Runtime';
        $res = $dirtool->delDir($dirfile);

        $this->success("缓存清除成功",U('Admin/Index/system'));

    }
}
