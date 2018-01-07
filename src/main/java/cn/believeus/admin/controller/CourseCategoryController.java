package cn.believeus.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import cn.believeus.model.Zqmeta;
import com.alibaba.fastjson.JSON;
import mydfs.storage.server.MydfsTrackerServer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import cn.believeus.service.MySQLService;
import cn.believeus.util.TreeModel;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Controller
public class CourseCategoryController {
	@Resource
	private MySQLService service;

	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@RequestMapping(value="/admin/meta/category")
	public String listView(){
		return "/WEB-INF/back/meta/categoryList.jsp";
	}

	@RequestMapping(value="/admin/meta/loadTree",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String loadTree(){
        List<Zqmeta> objectList = (List<Zqmeta>) service.findObjectList(Zqmeta.class);
        List<TreeModel> list = new ArrayList<TreeModel>();
        for (Zqmeta zqmeta : objectList) {
        	if (zqmeta.getName().equals("全部")) {
        		list.add(new TreeModel(zqmeta.getId(),zqmeta.getParentId(),zqmeta.getName(),true));
			}else {
				list.add(new TreeModel(zqmeta.getId(),zqmeta.getParentId(),zqmeta.getName(),false));
			}
		}
        String jsonString = JSON.toJSONString(list);
        System.out.println(jsonString);
		return jsonString;
	}
	
	@ModelAttribute
	public void model(@RequestParam(required=false) Integer id, Map<String, Zqmeta> map, HttpServletRequest req){
		String uri = req.getRequestURI();
		if(uri.contains("/admin/meta/edit_category")){
			Zqmeta category = (Zqmeta)service.findObject(Zqmeta.class, id);
			map.put("category", category);
		}
	}
	
	@RequestMapping(value="/admin/meta/up_category",method= RequestMethod.POST)
	@ResponseBody
	public String up_category(Zqmeta zqmeta,MultipartFile image){
		try {
			if (image.getOriginalFilename().indexOf(".") != -1 ){
				String suffix = image.getOriginalFilename().split("\\.")[1];
				String imgurl = mydfsTrackerServer.upload(image.getInputStream(), suffix);
				zqmeta.setImageUrl(imgurl);
			}
				service.saveOrUpdate(zqmeta);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
	}
	
	@RequestMapping(value="admin/meta/del_category",method=RequestMethod.POST)
	@ResponseBody
	public String del_category(Integer id){
		try {
			List<Integer> ids = new ArrayList<Integer>();
			for (Object object : service.findObjectList(Zqmeta.class, "parentId", id)) {
				Zqmeta category=(Zqmeta)object;
				ids.add(category.getId());
			}
			ids.add(id);
			service.delete(Zqmeta.class, ids);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
	}
	
	@RequestMapping(value="admin/meta/add_category",method=RequestMethod.POST)
	@ResponseBody
	public String add_category(Zqmeta zqmeta, MultipartFile image){
		try {
			if (image.getOriginalFilename().contains(".")) {
				String suffix = image.getOriginalFilename().split("\\.")[1];
				String imgurl = mydfsTrackerServer.upload(image.getInputStream(), suffix);
				zqmeta.setImageUrl(imgurl);
			}
			service.saveOrUpdate(zqmeta);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "-1";
	}

	@RequestMapping(value="admin/meta/add_category",method=RequestMethod.GET)
	public String get_add_category(Integer parent, Model model){
		model.addAttribute("parent",parent);
		return "/WEB-INF/back/meta/add.jsp";
	}

	@RequestMapping(value="admin/meta/edit_category",method=RequestMethod.GET)
	public String get_edit_category(Integer id, Model model){
		return "/WEB-INF/back/meta/edit.jsp";
	}

}
