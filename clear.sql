-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: 2014-11-13 02:21:29
-- 服务器版本： 5.5.38
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `clear`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `w_case`
--

CREATE TABLE `w_case` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `content` text NOT NULL,
  `img` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keywords` varchar(255) NOT NULL,
  `seo_contents` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `create_time` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0',
  `param` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_case`
--
ALTER TABLE `w_case`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_page`
--
ALTER TABLE `w_page`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_param`
--
ALTER TABLE `w_param`
MODIFY `param_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_param_list`
--
ALTER TABLE `w_param_list`
MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_product`
--
ALTER TABLE `w_product`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_slider`
--
ALTER TABLE `w_slider`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_slidercat`
--
ALTER TABLE `w_slidercat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `w_system`
--
ALTER TABLE `w_system`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `w_term`
--
ALTER TABLE `w_term`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
