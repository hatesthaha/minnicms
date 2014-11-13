<?php
class PublicAction extends BaseAction {
    function _initialize() {
        $this->dusers = D("user");
    }
	public function login(){
		$this->display();
	}
	public function postLogin(){
		$name 	= I("post.username");
		$pwd 	= I("post.password");
		if($_SESSION['verify'] != md5($_POST['verify'])) {
		   $this->error('验证码错误！');
		}else{
			$user = M("user");
			$pwd = md5($pwd);
			$data = $user->where(array("username"=>$name))->find();
			if($pwd == $data["password"]){
				session("ADMIN_ID",$data["id"]);
                session("ADMIN_ROLE",$data['role']);
                session("ADMIN_NAME",$data["username"]);
				$this->success("登录成功",U("Admin/Index/index"));
			}else{
				$this->error("密码或用户名错误");
			}
		}
	}
    /* 退出登录 */
    public function logout(){
    	if($_SESSION['ADMIN_ID']){
			session('[destroy]');
        	$this->success('退出成功！', U("Admin/Public/login"));
    	}else {
            $this->redirect(U("Admin/Public/login"));
        }
    }

	public function sign(){
		$user                = M("user");
		$data["id"] 		 = 1;
		$data["username"]    = "admin";
		$data["password"]    = md5("admin");
		$data["sign_time"]   = time();
		$data["create_time"] = time();
		$data["update_time"] = time();
		$id = $user->save($data);
		echo $id;
		// $this->show();
	}
	public function edit(){
		$id = $_SESSION['ADMIN_ID'];
		$where['id'] = $id;
		$user = D('user')->where($where)->find();
		$this->assign('user',$user);
		$this->display();
	}
	public function postEdit(){
		$_POST["password"]    = md5($_POST['password']);
		$_POST["update_time"] = time();
        $a = $this->dusers->create();
        $rs = $this->dusers->save();
        if ($rs) {
            $this->success("保存成功！",U('Admin/Index/index'));
        } else {
            $this->error("保存失败！");
        }
	}
}
