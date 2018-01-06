package cn.believeus.admin.controller;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.model.Zqdata;
import cn.believeus.model.Zqmeta;
import cn.believeus.service.MySQLService;
import mydfs.storage.server.MydfsTrackerServer;
import org.apache.shiro.util.CollectionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class ZQdataController {

	@Resource
	private MySQLService service;

	@Resource
	private MydfsTrackerServer mydfsTrackerServer;

	@RequestMapping("admin/data/addView")
	public String addView(){
		return "/WEB-INF/back/zqdata/add.jsp";
	}

	@RequestMapping("admin/data/editView")
	public String editView(Integer id,Model model){
		Zqdata zqdata = (Zqdata) service.findObject(Zqdata.class,id);
		Zqmeta zqmeta = (Zqmeta) service.findObject(Zqmeta.class,zqdata.getZqmeta().getId());
		zqdata.setZqmeta(zqmeta);
		model.addAttribute("zqdata",zqdata);
		return "/WEB-INF/back/zqdata/edit.jsp";
	}

	@RequestMapping(value = "admin/data/list",method = RequestMethod.GET)
	public String listView(Pageable pageable, Model model) {
		Page result = service.findObjectPage(Zqdata.class,pageable);
		model.addAttribute("list",result);
		return "/WEB-INF/back/zqdata/list.jsp";
	}

	@RequestMapping(value = "admin/data/add",method = RequestMethod.POST)
	@ResponseBody
	public String save(Zqdata zqdata,Integer categoryId) {
		Zqmeta zqmeta = new Zqmeta(categoryId);
		zqdata.setZqmeta(zqmeta);
		service.saveOrUpdate(zqdata);
		return "ok";
	}

	@RequestMapping(value = "admin/data/del",method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer id) {
		service.delete(Zqdata.class,id);
		return "ok";
	}

	@RequestMapping( value = "admin/file/editor_upload", method = RequestMethod.POST )
	@ResponseBody
	public Map<String, String> editorUpload(HttpServletRequest request ) throws IOException {
		MultipartFile partFile = getMultipartFile( request );
		String suffix = partFile.getOriginalFilename().substring( partFile.getOriginalFilename().lastIndexOf( "." ) + 1 );
		String url = mydfsTrackerServer.upload( partFile.getInputStream(), suffix );
		Map<String, String> map = new HashMap<String, String>();
		map.put( "title", "" );
		map.put( "state", "SUCCESS" );
		map.put( "original", partFile.getOriginalFilename() );
		map.put( "url", url );
		map.put( "fileType", "." + suffix );
		return map;
	}

	private MultipartFile getMultipartFile( HttpServletRequest request ) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		if( CollectionUtils.isEmpty( fileMap ) ) {
			throw new IllegalStateException( "No upload file found!" );
		}
		return fileMap.entrySet().iterator().next().getValue();
	}


}
