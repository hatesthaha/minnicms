<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../assets/css/wanhu.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/newstyle.css" />
    <script type="text/javascript" src="../assets/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../assets/statics/uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript" src="../assets/statics/uploadify/jquery.uploadify.js"></script>
    <link rel="stylesheet" type="text/css" href="../assets/statics/uploadify/uploadify.css" />
    <script type="text/javascript" src="../assets/js/main.js"></script>
    <script type="text/javascript" src="../assets/js/content.js"></script>
</head>

<!-- <body> -->

    <div class="wanhutop">
    <div class="position">简体中文 &gt; 常用功能 &gt; <a href="">系统信息</a></div>
    </div>
    <div class="clear"></div>
<div class="sysadmin">
    <div class="sysadmin_box_6">
        <div class="sysadmin_box_cont">
            <h3>商业授权</h3>

            <table style="height: 217px;" class="stat_table showauth_n" cellpadding="0" cellspacing="1">
                <tbody><tr class="mouse">
                    <td class="t">授权域名</td>
                    <td id="authcode_domain"></td>
                </tr>
                <tr class="mouse">
                    <td class="t">网站名称</td>
                    <td id="authcode_webname"></td>
                </tr>
                <tr class="mouse">
                    <td class="t">授权类型</td>
                    <td id="authcode_webtype"></td>
                </tr>
                <tr class="mouse">
                    <td class="t">授权日期</td>
                    <td id="authcode_buytime"></td>
                </tr>
                <tr class="mouse">
                    <td class="t">到期日期</td>
                    <td id="authcode_lifetime"></td>
                </tr>
                <tr class="mouse">
                    <td colspan="2" style="text-align:center;"><a href="javascript:;" style="color:#999; text-decoration:none;">商业授权版</a></td>
                </tr>
            </tbody></table>


        <div style="" class="boxcont showauth none">

        </div>
        </div>
    </div>

    <div class="sysadmin_box_8">
        <div class="sysadmin_box_cont">
        <h3>服务器信息</h3>
            <table style="height: 217px;" class="stat_table" cellpadding="0" cellspacing="1">
                <tbody><tr class="mouse">
                    <td class="t">程序名称</td>
                    <td colspan="2">网站管理系统</td>
                </tr>
                <tr class="mouse">
                    <td class="t">系统版本</td>
                    <td colspan="2">1.1.2<font style="color:#390; padding-left:15px;">已是最新版本</font></td>
                </tr>
                <tr class="mouse">
                    <td class="t">操作系统</td>
                    <td colspan="2"><?php echo ($os); ?></td>
                </tr>
                <tr class="mouse">
                    <td class="t">客户端IP</td>
                    <td><?php echo ($ip); ?></td>
                </tr>
                <tr class="mouse">
                    <td class="t">版权所有</td>
                    <td colspan="2">伍文瀚</td>
                </tr>
                <tr class="mouse">
                    <td class="t">制作人员</td>
                    <td colspan="2">
                        伍文瀚
                    </td>
                </tr>
            </tbody></table>
        </div>
    </div>
    <div class="clear"></div>

    <div class="sysadmin_box_7">
        <div class="sysadmin_box_cont">
            <h3>享有服务</h3>
            <table class="stat_table" cellpadding="0" cellspacing="1">
                <tbody><tr class="mouse">
                    <td class="t">服务方式</td>
                    <td class="t">电话支持</td>
                    <td class="t">QQ支持</td>
                    <td class="t">论坛支持</td>
                </tr>
                <tr>
                    <td class="t">服务信息</td>
                    <td id="authcode_server_3"></td>
                    <td id="authcode_server_2"></td>
                    <td id="authcode_server_1"></td>
                </tr>
                <tr>
                    <td class="t">服务期限</td>
                    <td id="authcode_server_time_3"></td>
                    <td id="authcode_server_time_2"></td>
                    <td id="authcode_server_time_1"></td>
                </tr>
            </tbody></table>
        </div>
    </div>

    <div class="clear"></div>

    <div class="sysadmin_box_7">
        <div class="sysadmin_box_cont">
            <h3>服务与支持</h3>
            <div class="bangzhu">
                <ul>
                <li class="d"><a href="http://www.wanhunet.com" target="_blank">使用手册</a></li>
                <li class="to"><a href="http://www.wanhunet.com" target="_blank">商业授权</a></li>
                <li class="d"><a href="http://www.wanhunet.com" target="_blank">交流论坛</a></li>
                <li class="to"><a href="http://www.wanhunet.com" target="_blank">收费模板</a></li>
                <li class="d"><a href="http://www.wanhunet.com" target="_blank">官方网站</a></li>
                <li class="to"><a href="http://www.wanhunet.com" target="_blank">专用主机</a></li>
                <li class="d"><a href="mailto:wuwenhan@live.cn">wuwenhan@live.cn</a></li>
                <li class="to"><a href="http://www.wanhunet.com" target="_blank">定制开发</a></li>
                </ul>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <div class="clear"></div>
</div>

<!-- </body> -->



</html>