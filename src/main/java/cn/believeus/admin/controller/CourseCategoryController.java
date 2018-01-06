package cn.believeus.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.service.MySQLService;


@Controller
public class CourseCategoryController {
	@Resource
	private MySQLService service;
	
	@RequestMapping(value="/admin/course/category")
	public String listView(){
		return "/WEB-INF/back/course/categoryList.jsp";
	}

	
}
