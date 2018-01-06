package cn.believeus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ZQdataController {

	@RequestMapping("admin/zqdata/addView")
	public String addView(){
		return "/WEB-INF/back/zqdata/add.jsp";
	}
}
