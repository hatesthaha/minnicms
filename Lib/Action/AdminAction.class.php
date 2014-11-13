<?php

class AdminAction extends BaseAction {

	public function _initialize() {
		if(!isset($_SESSION['ADMIN_ID'])){
			if(IS_AJAX){
				$this->error("您还没有登录！",U("admin/Public/login"));
			}else{
				redirect(U("Admin/Public/login"));
				exit();
			}
		}
    }
}