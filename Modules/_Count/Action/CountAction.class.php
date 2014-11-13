<?php
class CountAction extends AdminAction {
    function _initialize() {

    }
    public function index(){
        /*引入GoogChart类*/
        import("GoogChart");
        $chart = new GoogChart();
        $engine=M("engines")->field('type,name,counts')->select();
        //设置$data数组数据;

        foreach($engine as $k=>$value){ 
            $data[]='通过'.$value[name]."来访有<span style='color:red'>".$value[counts]."</span>次访问"; 
            $name.= '"'.$value['name'].'"'.",";
            $sum.= $value['counts'].',';
        }
        $name = substr($name, 0, -1);
        $sum = substr($sum, 0, -1);
        $this->assign('data',$data);
        $this->assign('name',$name);
        $this->assign('sum',$sum);
        $this->display();
    }

    public function sitemap(){
        $this->display();
    }
    public function postSite(){
        $list = M('Term')->field('id,name,create_time')->order('id desc')->select();
        $sitemap = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\r\n";
        foreach($list as $k=>$v){
            $sitemap .= "<url>\r\n"."<loc>".U('_Content/Term/index',array('id'=>$v['id']))."</loc>\r\n"."<priority>".$v['name']."</priority>\r\n<lastmod>".date('Y-m-d',$v['create_time'])."</lastmod>\r\n<changefreq>weekly</changefreq>\r\n</url>\r\n";
        }
        $sitemap .= '</urlset>';
        $file = fopen("sitemap.xml","w");
        fwrite($file,$sitemap);
        fclose($file);
        $this->success('地图生成成功');        
    }

}
