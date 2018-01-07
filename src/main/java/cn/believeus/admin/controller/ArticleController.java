package cn.believeus.admin.controller;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.model.Zqdata;
import cn.believeus.model.Zqmeta;
import cn.believeus.service.MySQLService;
import cn.believeus.util.TreeModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.swing.tree.TreeNode;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by minguigong on 2018/1/6.
 */
@Controller
public class ArticleController {

    @Resource
    private MySQLService service;

    @RequestMapping(value = {"index","/"})
    public String index(Model model ){
        Pageable pageable = new Pageable();
        model.addAttribute("tree",getTree());
        String hql = "from Zqdata where zqmeta = 7";
        Page<Zqdata> companyNew = (Page<Zqdata>) service.findObjectList(hql,pageable);
        hql = "from Zqdata where zqmeta = 8";
        Page<Zqdata> report = (Page<Zqdata>) service.findObjectList(hql,pageable);
        model.addAttribute("companyNew",companyNew);
        model.addAttribute("report",report);
        return "/WEB-INF/front/index.jsp";
    }

    @RequestMapping("article/{type}")
    public String article(@PathVariable("type") Integer type, Model model , Pageable pageable){
        Zqmeta zqmeta = (Zqmeta) service.findObject(Zqmeta.class,type);
        List zqmetas = service.findObjectList(Zqmeta.class,"parentId",type);
        Zqmeta parent = null;
        if(zqmetas != null && zqmetas.size() > 0){
            //点的是父类
            parent = zqmeta;
            zqmeta = (Zqmeta)zqmetas.get(0);
        }else {
            //点的是子类
            zqmetas = service.findObjectList(Zqmeta.class,"parentId",zqmeta.getParentId());
            parent = (Zqmeta) service.findObject(Zqmeta.class,zqmeta.getParentId());
        }
        List<Zqmeta> tree = getTree();
        model.addAttribute("zqmetas",zqmetas);
        model.addAttribute("zqmeta",zqmeta);
        model.addAttribute("parent",parent);
        model.addAttribute("tree",tree);
        return "/WEB-INF/front/article.jsp";
    }

    private List<Zqmeta> getTree(){
        List<Zqmeta> objectList = (List<Zqmeta>) service.findObjectList(Zqmeta.class,"parentId",1);
        for (Zqmeta zqmeta : objectList) {
            List<Zqmeta> children = (List<Zqmeta>) service.findObjectList(Zqmeta.class,"parentId",zqmeta.getId());
            if(CollectionUtils.isEmpty(children)){
                zqmeta.setChildren(null);
            }else {
                zqmeta.setChildren(children);
            }

        }
        return objectList;
    }

    @RequestMapping("article_list/{type}")
    public String list(@PathVariable("type") String type,Pageable pageable,Model model){
        String hql = "from Zqdata where zqmeta = " + type;
        Page<Zqdata> zqdatas = (Page<Zqdata>) service.findObjectList(hql,pageable);
        model.addAttribute("zqdatas",zqdatas);
        model.addAttribute("type",type);
        return "/WEB-INF/front/article_list.jsp";
    }

    @RequestMapping("detail/{id}")
    public String detail(@PathVariable("id") Integer id,Model model){
        Zqdata zqdata = (Zqdata) service.findObject(Zqdata.class,id);
        model.addAttribute("zqdata",zqdata);
        return "/WEB-INF/front/detail.jsp";
    }


}
