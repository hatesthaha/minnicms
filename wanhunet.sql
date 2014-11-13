-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: 2014-10-28 03:43:15
-- 服务器版本： 5.5.38
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `wanhunet`
--

-- --------------------------------------------------------

--
-- 表的结构 `w_article`
--

CREATE TABLE `w_article` (
`id` int(11) unsigned NOT NULL,
  `term_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cover_img` varchar(255) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `com_ok` int(11) DEFAULT NULL,
  `top_ok` int(11) NOT NULL,
  `content` text,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_contents` text,
  `tpl_name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `tag` text,
  `create_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `param` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `w_article`
--

INSERT INTO `w_article` (`id`, `term_id`, `title`, `cover_img`, `hits`, `com_ok`, `top_ok`, `content`, `seo_title`, `seo_keywords`, `seo_contents`, `tpl_name`, `type`, `tag`, `create_time`, `update_time`, `listorder`, `status`, `param`) VALUES
(2, 8, '1123123123', '544b6555e497b.jpg', 0, NULL, 0, '1235675000', '1123123123', '1123123123', '1123123123', 'article_content', 1, '', '1413615269', '1414227304', 0, 1, NULL),
(3, 8, 'dddddddddddd', '', 0, NULL, 0, 'ccccccccc', 'dddddddddddd', 'dddddddddddd', 'dddddddddddd', 'article_content', 1, '', '1413615308', '1413615308', 0, 1, NULL),
(4, 8, '45645645', '', 0, NULL, 0, '45645645456456454564564545645645', '', '', '', 'article_content', 1, '', '1413615347', '1413615347', 0, 1, NULL),
(5, 9, 'cesssscessss', '', 0, NULL, 0, 'cesssscesssscessss', '', '', '', 'article_content', 1, '', '1413620443', '1413620443', 0, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `w_case`
--

CREATE TABLE `w_case` (
  `id` int(11) NOT NULL DEFAULT '0',
  `term_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `tpl_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `hits` int(11) NOT NULL,
  `com_ok` int(11) NOT NULL,
  `top_ok` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `thumb_img` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keywords` varchar(255) NOT NULL,
  `seo_contents` text NOT NULL,
  `tag` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0',
  `param` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `w_download`
--

CREATE TABLE `w_download` (
`id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `hits` int(11) NOT NULL,
  `com_ok` int(11) NOT NULL,
  `top_ok` int(11) NOT NULL,
  `content` text NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keywords` varchar(255) NOT NULL,
  `seo_contents` text NOT NULL,
  `tpl_name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0',
  `auther` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `param` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `w_engines`
--

CREATE TABLE `w_engines` (
`id` int(10) NOT NULL,
  `type` char(10) DEFAULT NULL,
  `name` char(10) DEFAULT NULL,
  `counts` int(10) DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `w_engines`
--

INSERT INTO `w_engines` (`id`, `type`, `name`, `counts`) VALUES
(1, 'baidu', '百度', 10),
(2, 'soso', '搜搜', 0),
(3, 'sogou', '搜狗', 0),
(4, 'so', '360搜索', 0),
(5, 'google', '谷歌', 0),
(6, 'bing', '必应', 0),
(7, 'yahoo', '雅虎', 0),
(8, 'youdao', '有道', 0),
(9, 'direct', '直接访问', 1);

-- --------------------------------------------------------

--
-- 表的结构 `w_feedback`
--

CREATE TABLE `w_feedback` (
`id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `tpl_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `qq` varchar(255) NOT NULL,
  `status` int(11) DEFAULT '1',
  `time` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `useinfo` text NOT NULL,
  `display` int(11) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `param` varchar(255) NOT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `w_group`
--

CREATE TABLE `w_group` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `w_group`
--

INSERT INTO `w_group` (`id`, `name`, `create_time`, `update_time`, `status`) VALUES
(1, '超级管理员', '1413250281', '1413252039', 1),
(2, '普通会员', '1413250386', '1413250386', 1);

-- --------------------------------------------------------

--
-- 表的结构 `w_job`
--

CREATE TABLE `w_job` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `com_ok` int(11) NOT NULL,
  `top_ok` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `money` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `useful` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `type` int(11) NOT NULL,
  `tpl_name` varchar(255) NOT NULL,
  `param` varchar(255) NOT NULL,
  `display` int(11) NOT NULL DEFAULT '1',
  `term_id` int(11) NOT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `w_link`
--

CREATE TABLE `w_link` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `listorder` int(11) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `w_link`
--

INSERT INTO `w_link` (`id`, `name`, `link`, `listorder`, `banner`, `status`, `create_time`, `update_time`) VALUES
(1, '装饰公司1', 'http://www.baidu.com', 0, '544084dcdf9e5.jpg', 1, '1413514462', '1413514890'),
(2, '装饰公司2', 'http://www.google.com', 0, '', 1, '1413514483', '1413514901');

-- --------------------------------------------------------

--
-- 表的结构 `w_message`
--

CREATE TABLE `w_message` (
`id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `tpl_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `qq` varchar(255) NOT NULL,
  `status` int(11) DEFAULT '1',
  `time` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `useinfo` text NOT NULL,
  `display` int(11) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `param` varchar(255) NOT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `w_online`
--

CREATE TABLE `w_online` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `qq` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `listorder` int(11) NOT NULL DEFAULT '0',
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `w_option`
--

CREATE TABLE `w_option` (
`option_id` bigint(20) unsigned NOT NULL,
  `option_name` varchar(64) NOT NULL,
  `option_value` longtext NOT NULL,
  `autoload` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `w_option`
--

INSERT INTO `w_option` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'site_options', '{"site_name":"\\u4e07\\u864e\\u7f51\\u7edc","logo":"54226f87dbec1.png","site_host":"www.wanhunet.com","site_seo_keywords":"\\u4e07\\u864e\\u7f51\\u7edc","site_seo_description":"\\u4e07\\u864e\\u7f51\\u7edc\\u662f\\u4e00\\u4e2a","site_copyright":"\\u4e07\\u864e\\u7f51\\u7edc\\u6280234","site_code":"010000","site_contact":"1111111111111","site_other":"<img src=\\"\\/wanhunet\\/assets\\/statics\\/editor\\/attached\\/image\\/20140925\\/20140925072207_67186.png\\" alt=\\"\\" \\/> \\r\\n<p align=\\"center\\">\\r\\n\\t\\u88c5\\u4fee\\u88c5\\u9970 \\u7248\\u6743\\u6240\\u6709 2008-2014 \\u4e07\\u864e\\u7f51\\u7edc\\r\\n<\\/p>\\r\\n<p align=\\"center\\">\\r\\n\\t\\u5730\\u5740\\uff1a\\u4e07\\u864e\\u7f51\\u7edc\\u516c\\u53f8 \\u70ed\\u7ebf\\uff1a400 668 740000 \\u7f51\\u5740\\uff1awww.wanhunet.com\\r\\n<\\/p>\\r\\n<p align=\\"center\\">\\r\\n\\tPowered by \\u4e07\\u864e\\u7f51\\u7edc &copy;2008-2013 <a href=\\"http:\\/\\/www.wanhunet.com\\">www.wanhunet.com<\\/a> \\r\\n<\\/p>"}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `w_otherinfo`
--

CREATE TABLE `w_otherinfo` (
`id` int(11) NOT NULL,
  `index_context` text NOT NULL,
  `index_contact` text NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `w_otherinfo`
--

INSERT INTO `w_otherinfo` (`id`, `index_context`, `index_contact`, `create_time`, `update_time`) VALUES
(1, '89080adfasd', '234234', '1411623239', '1411623239');

-- --------------------------------------------------------

--
-- 表的结构 `w_page`
--

CREATE TABLE `w_page` (
`id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `tpl_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keywords` varchar(255) NOT NULL,
  `seo_contents` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0',
  `param` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `w_page`
--

INSERT INTO `w_page` (`id`, `term_id`, `type`, `tpl_name`, `title`, `content`, `img`, `seo_title`, `seo_keywords`, `seo_contents`, `status`, `create_time`, `update_time`, `listorder`, `param`) VALUES
(5, 10, 3, 'page_content', '简介11111', '<span id="parent_name">简介11111</span><span id="parent_name">简介11111</span><span id="parent_name">简介11111</span><span id="parent_name">简介11111</span>', '', '简介11111', '简介11111', '简介11111简介11111简介11111', 1, '1413451623', '1413451623', 0, ''),
(6, 1, 3, 'page_content', '公司简介', '<img src="/wanhunet/assets/statics/editor/attached/image/20141018/20141018030114_13858.jpg" alt="" /><span id="parent_name"> \r\n<div class="right">\r\n <p>\r\n   <span>123</span> \r\n </p>\r\n</div>\r\n</span>', '', '公司简介', '公司简介', '公司简介', 1, '1413451696', '1413594076', 0, ''),
(7, 3, 3, 'page_content', '服务承诺', '服务承诺服务承诺服务承诺', '', '服务承诺', '服务承诺', '服务承诺', 1, '1413941733', '1413941733', 0, ''),
(8, 7, 3, 'page_content', '联系我们', '联系我们', '', '联系我们', '联系我们', '联系我们', 1, '1413941766', '1413941766', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `w_param`
--

CREATE TABLE `w_param` (
`param_id` int(11) NOT NULL,
  `param_name` varchar(255) DEFAULT NULL,
  `param_type` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `param_listorder` int(11) DEFAULT '0',
  `params_info` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `w_param`
--

INSERT INTO `w_param` (`param_id`, `param_name`, `param_type`, `term_id`, `param_listorder`, `params_info`, `create_time`, `update_time`) VALUES
(1, '项目名称', 1, 5, 0, NULL, '1413961119', '1413961119'),
(2, '11111', 3, 4, 0, NULL, '1414393646', '1414393681'),
(3, '444444', 4, 4, 0, NULL, '1414393705', '1414393705'),
(4, 'sadfdsadf', 5, 4, 0, NULL, '1414394365', '1414394365'),
(5, 'sadf', 2, 5, 0, NULL, '1414462293', '1414462293');

-- --------------------------------------------------------

--
-- 表的结构 `w_param_list`
--

CREATE TABLE `w_param_list` (
`pl_id` int(11) NOT NULL,
  `param_id` int(11) DEFAULT NULL,
  `pl_listorder` int(11) DEFAULT NULL,
  `pl_name` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

--
-- 转存表中的数据 `w_param_list`
--

INSERT INTO `w_param_list` (`pl_id`, `param_id`, `pl_listorder`, `pl_name`, `create_time`, `update_time`) VALUES
(41, 19, 0, 'ffff', '1413012615', '1413012615'),
(42, 19, 0, 'eeee', '1413012673', '1413012673'),
(43, 19, 0, 'ffff', '1413012817', '1413012817'),
(44, 17, 0, 'eeee', '1413012865', '1413012865'),
(45, 17, 0, 'fffff', '1413012891', '1413012891'),
(46, 16, 0, 'eeee', '1413012935', '1413012935'),
(47, 16, 0, 'ffff', '1413012991', '1413012991'),
(48, 16, 0, 'ggggg', '1413013033', '1413013033'),
(54, 17, 0, 'cccccc', '1413013216', '1413013216'),
(55, 17, 0, 'wwwww', '1413013228', '1413013228'),
(60, 17, 0, 'eeeeeeeeeee', '1413013695', '1413013695'),
(61, 17, 0, 'hhhhhhhhhh', '1413013785', '1413013785'),
(62, 14, 0, '啊啊', '1413169298', '1413169298'),
(63, 14, 0, '恩恩', '1413169312', '1413169312'),
(64, 14, 0, 'D大调', '1413169316', '1413169316'),
(65, 14, 0, 'CCC', '1413169330', '1413169330'),
(66, 14, 0, '一样', '1413169331', '1413169331'),
(67, 14, 0, 'uuuu', '1413169332', '1413169332'),
(68, 21, 0, 'cccc', '1413333141', '1413333141'),
(69, 21, 0, 'yyyyy', '1413333146', '1413333146'),
(86, 11, 0, 'eeeee', '1413355648', '1413355648'),
(87, 11, 0, 'jjjjjj', '1413355733', '1413355961'),
(88, 11, 0, 'fffff', '1413355995', '1413355995'),
(89, 11, 0, '111111', '1413356081', '1413356222'),
(90, 11, 0, 'yyy', '1413356162', '1413356162'),
(91, 11, 0, 'rrrr', '1413356167', '1413356167'),
(92, 11, 0, 'uuuu', '1413356183', '1413356183'),
(93, 11, 0, 'asdfasdf ', '1413356219', '1413356235'),
(94, 11, 0, 'qqwewwerwer', '1413356295', '1413356345'),
(95, 11, 0, 'yyyyy', '1413356324', '1413356324'),
(96, 11, 0, 'rwerwerw', '1413356328', '1413356328'),
(97, 11, 0, 'uuuuuu', '1413356338', '1413356338'),
(98, 29, 0, 'werwer', '1413357377', '1413357377'),
(99, 29, 0, 'sdfsdf', '1413357378', '1413357378'),
(100, 2, 0, 'asdf ', '1414393743', '1414393743'),
(101, 2, 0, 'asdfwerwe', '1414393748', '1414393748'),
(102, 3, 0, '123123', '1414394592', '1414394592'),
(103, 3, 0, 'asdfdsaf', '1414394593', '1414394593');

-- --------------------------------------------------------

--
-- 表的结构 `w_product`
--

CREATE TABLE `w_product` (
`id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `tpl_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `hits` int(11) NOT NULL,
  `com_ok` int(11) NOT NULL,
  `top_ok` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `thumb_img` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keywords` varchar(255) NOT NULL,
  `seo_contents` text NOT NULL,
  `tag` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0',
  `param` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `w_product`
--

INSERT INTO `w_product` (`id`, `term_id`, `type`, `tpl_name`, `title`, `hits`, `com_ok`, `top_ok`, `img`, `thumb_img`, `content`, `seo_title`, `seo_keywords`, `seo_contents`, `tag`, `status`, `create_time`, `update_time`, `listorder`, `param`) VALUES
(1, 12, 2, 'product_content', '测试案例1111', 0, 0, 0, '["5444bd533c9f8.jpg","5444bd5bddc0d.jpg"]', '', '测试案例1111测试案例1111测试案例1111测试案例1111测试案例1111', '', '', '测试案例1111测试案例1111测试案例1111', '', 1, '1413791078', '1414462304', 0, 'a:2:{s:7:"param_1";s:15:"这个项目123";s:7:"param_5";s:9:"sdf\r\n3453";}'),
(2, 13, 2, 'product_content', '测试案例2222222', 0, 0, 0, '["5444bd84c1521.jpg"]', '5444bd91db262.jpg', '测试案例2222222测试案例2222222测试案例2222222', '', '', '', '', 1, '1413791130', '1413961238', 0, 'a:1:{s:7:"param_1";s:15:"adfasdfasdfsdaf";}'),
(3, 12, 2, 'product_content', '猜测是2323223', 0, 0, 0, 'null', '', '猜测是2323223', '', '', '', '', 1, '1413962153', '1413962153', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `w_slider`
--

CREATE TABLE `w_slider` (
`id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `listorder` int(11) NOT NULL DEFAULT '0',
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `w_slider`
--

INSERT INTO `w_slider` (`id`, `sid`, `name`, `banner`, `link`, `content`, `status`, `listorder`, `create_time`, `update_time`) VALUES
(1, 2, '1', '54407f825143d.jpg', 'www.baidu.com', '12312312', 1, 0, '1413510743', '1413513092'),
(2, 2, '2', '5440767163f6e.jpg', 'www.google.com', 'baidu.com', 1, 0, '1413510782', '1413510782'),
(3, 2, '3', '54407696f1ff2.jpg', 'www.google.com', '123123234', 1, 0, '1413510824', '1413510824'),
(4, 3, 'ceccc', '', 'adsaf', 'asdfsadf', 1, 0, '1413600387', '1413600387');

-- --------------------------------------------------------

--
-- 表的结构 `w_slidercat`
--

CREATE TABLE `w_slidercat` (
`id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_idname` varchar(255) NOT NULL,
  `cat_remark` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `w_slidercat`
--

INSERT INTO `w_slidercat` (`id`, `cat_name`, `cat_idname`, `cat_remark`, `status`, `create_time`, `update_time`) VALUES
(2, 'top', 'top_slider', '头部轮播图', 1, '1411463617', '1411463617'),
(3, 'banner', 'banner_min', 'banner_min', 1, '1413600372', '1413600372');

-- --------------------------------------------------------

--
-- 表的结构 `w_system`
--

CREATE TABLE `w_system` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `listorder` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `w_system`
--

INSERT INTO `w_system` (`id`, `name`, `link`, `listorder`, `status`, `create_time`, `update_time`) VALUES
(2, '下载管理', '/wanhunet/index.php/_Content/Download/index.html', 5, 0, '1411974243', '1411974243'),
(3, '文章管理', '/wanhunet/index.php/_Content/Article/index.html', 1, 0, '1411974576', '1411974576');

-- --------------------------------------------------------

--
-- 表的结构 `w_term`
--

CREATE TABLE `w_term` (
`id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `tpl_name` varchar(255) DEFAULT NULL,
  `listorder` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `target` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `w_term`
--

INSERT INTO `w_term` (`id`, `parent_id`, `name`, `type`, `tpl_name`, `listorder`, `title`, `keywords`, `status`, `target`, `img`, `content`, `create_time`, `update_time`) VALUES
(1, 0, '公司简介', 3, 'page', 0, '公司简介', '公司简介', 1, '', '5440aec08b432.jpg', '装修装饰公司是集设计、施工于一体的深圳装饰设计公司。通过十余年发展，装修装饰公司已成为深圳装饰设计行业最知名的装修公司之一...', '1413450240', '1413525192'),
(2, 0, '企业文化', 3, 'page', 0, '企业文化', '企业文化', 1, '', '5440aed6457d9.jpg', '在历时八年的企业建设过程中，培育了公司人"团结、认真、求实、创新"的精神，凭借这种精神，形成了自身的企业文化...', '1413450262', '1413525230'),
(3, 0, '服务承诺', 3, 'page', 0, '服务承诺', '服务承诺', 1, '', '5440af1bbb345.jpg', '我们承诺 把握每一个项目，体会客户需要，保证设计品质，保证工程质量 专注每一处细节，以争创精品工程的态度去对待每一个工程项目...', '1413450285', '1413525279'),
(4, 0, '新闻资讯', 1, 'article', 0, '新闻资讯', '新闻资讯', 1, '', '5440af5e13bda.jpg', '现在很多人都在惆怅怎样选择装饰公司，家庭的装饰不能马虎，这是我们以后每天要住的地方，就需要格外注意...', '1413450304', '1413525343'),
(5, 0, '经典案例', 2, 'product', 0, '经典案例', '经典案例', 1, '', '5440af84b611b.jpg', '公司拥有一批具有国际视角、丰富的项目经验、从艺术设计、实用功能、环保材料等多方面提供完美的设计与施工。', '1413450324', '1413525393'),
(6, 0, '招贤纳士', 6, 'job', 0, '招贤纳士', '招贤纳士', 0, '', '5440afbc17f18.jpg', '我们将为您构建一个没有天花板的舞台，提供一个公平、公开的竞争环境，期待你脱颖而出。欢迎您加入我们的团队,共同辉煌..', '1413450353', '1414025871'),
(7, 0, '联系我们', 3, 'page', 0, '联系我们', '联系我们', 1, '', '', '', '1413450379', '1413938070'),
(8, 4, '公司新闻', 1, 'article', 0, '公司新闻', '公司新闻', 1, '', '', '', '1413450401', '1413450401'),
(9, 4, '业界资讯', 1, 'article', 0, '业界资讯', '业界资讯', 1, '', '', '', '1413450417', '1413450417'),
(10, 1, '简介11111', 3, 'page', 0, '简介11111', '简介11111', 1, '', '', '', '1413450789', '1413450789'),
(11, 1, '简介2222', 3, 'page', 0, '简介2222', '简介2222', 1, '', '', '', '1413450808', '1413450808'),
(12, 5, '案例1', 2, 'product', 0, '案例1', '案例1', 1, '', '', '案例1案例1案例1', '1413791005', '1413791005'),
(13, 5, '案例2', 2, 'product', 0, '案例2', '案例2', 1, '', '', '案例2案例2案例2案例2', '1413791024', '1413791024'),
(14, 0, '留言', 7, 'message', 0, '留言', '留言', 0, '', '', '留言', '1414025640', '1414025640');

-- --------------------------------------------------------

--
-- 表的结构 `w_type`
--

CREATE TABLE `w_type` (
`type_id` int(11) NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `type_tpl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `w_type`
--

INSERT INTO `w_type` (`type_id`, `type_name`, `type_tpl`) VALUES
(1, '文章模块', 'article'),
(2, '产品模块', 'product'),
(3, '单页模块', 'page'),
(4, '下载模块', 'download'),
(5, '图片模块', 'case'),
(6, '招聘模块', 'job'),
(7, '留言系统', 'message'),
(8, '反馈系统', 'feedback');

-- --------------------------------------------------------

--
-- 表的结构 `w_user`
--

CREATE TABLE `w_user` (
`id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `qq` varchar(255) NOT NULL,
  `role` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `sign_time` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `w_user`
--

INSERT INTO `w_user` (`id`, `group_id`, `group_name`, `username`, `password`, `email`, `phone`, `qq`, `role`, `status`, `sign_time`, `create_time`, `update_time`) VALUES
(1, 1, '超级管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '15830903200', '', '12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27', 1, '1410853425', '1410853425', '1411873594'),
(2, 2, '普通会员', 'wuwenhan', 'd41d8cd98f00b204e9800998ecf8427e', 'wuwenhan@live.cn', '15830903212', '329576084', '12,13,14,15,16,18,19,20,21,22,24,25,26,28,29,30', 1, '1410853425', '1411885332', '1413251964');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `w_article`
--
ALTER TABLE `w_article`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_case`
--
ALTER TABLE `w_case`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_download`
--
ALTER TABLE `w_download`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_engines`
--
ALTER TABLE `w_engines`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_feedback`
--
ALTER TABLE `w_feedback`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_group`
--
ALTER TABLE `w_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_job`
--
ALTER TABLE `w_job`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_link`
--
ALTER TABLE `w_link`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_message`
--
ALTER TABLE `w_message`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_online`
--
ALTER TABLE `w_online`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_option`
--
ALTER TABLE `w_option`
 ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `w_otherinfo`
--
ALTER TABLE `w_otherinfo`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_page`
--
ALTER TABLE `w_page`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_param`
--
ALTER TABLE `w_param`
 ADD PRIMARY KEY (`param_id`);

--
-- Indexes for table `w_param_list`
--
ALTER TABLE `w_param_list`
 ADD PRIMARY KEY (`pl_id`);

--
-- Indexes for table `w_product`
--
ALTER TABLE `w_product`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_slider`
--
ALTER TABLE `w_slider`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_slidercat`
--
ALTER TABLE `w_slidercat`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_system`
--
ALTER TABLE `w_system`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_term`
--
ALTER TABLE `w_term`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_type`
--
ALTER TABLE `w_type`
 ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `w_user`
--
ALTER TABLE `w_user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `w_article`
--
ALTER TABLE `w_article`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `w_download`
--
ALTER TABLE `w_download`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_engines`
--
ALTER TABLE `w_engines`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `w_feedback`
--
ALTER TABLE `w_feedback`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_group`
--
ALTER TABLE `w_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `w_job`
--
ALTER TABLE `w_job`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_link`
--
ALTER TABLE `w_link`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `w_message`
--
ALTER TABLE `w_message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_online`
--
ALTER TABLE `w_online`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_option`
--
ALTER TABLE `w_option`
MODIFY `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `w_otherinfo`
--
ALTER TABLE `w_otherinfo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `w_page`
--
ALTER TABLE `w_page`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `w_param`
--
ALTER TABLE `w_param`
MODIFY `param_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `w_param_list`
--
ALTER TABLE `w_param_list`
MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `w_product`
--
ALTER TABLE `w_product`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `w_slider`
--
ALTER TABLE `w_slider`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `w_slidercat`
--
ALTER TABLE `w_slidercat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `w_system`
--
ALTER TABLE `w_system`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `w_term`
--
ALTER TABLE `w_term`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `w_type`
--
ALTER TABLE `w_type`
MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `w_user`
--
ALTER TABLE `w_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
