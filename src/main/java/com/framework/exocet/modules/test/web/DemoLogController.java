/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.framework.exocet.modules.test.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.framework.exocet.core.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.framework.exocet.common.persistence.Page;
import com.framework.exocet.modules.sys.entity.Log;
import com.framework.exocet.modules.test.service.DemoLogService;

/**
 * 日志Controller
 * @author ThinkGem
 * @version 2013-6-2
 */
@Controller
@RequestMapping(value = "${adminPath}/demo/demolog")
public class DemoLogController extends BaseController {

	@Autowired
	private DemoLogService logService;
	
	/**
	 * 默认页面
	 */
	@RequiresPermissions("demo:demolog:view")
	@RequestMapping(method = RequestMethod.GET)
	public String list() {
		return "demopage/demoLogList";
	}
	
	/*@RequiresPermissions("sys:demolog:view")
	@RequestMapping(value = {"list", ""})
	public String list(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Log> pg = new Page<Log>(request, response);
        Page<Log> page = logService.findPage(pg, log); 
        model.addAttribute("page", page);
		return "demopage/demoLogList";
	}*/
	
	/**
	 * 获取日志json bootstrap-table分页
	 */
	@RequestMapping(value = "json", method = RequestMethod.GET)
	@ResponseBody
	public Map logList(Log log,HttpServletRequest request, HttpServletResponse response, Model model) {
		// Fetch the page number from client
		response.setContentType("application/json; charset=UTF-8");
		Page<Log> pg = new Page<Log>(request, response);
		pg.setPageType("B");
        Page<Log> page = logService.findPage(pg, log);		
		Map res = new HashMap();			
		res = getPagiNation(page);
		return res;
	}
}
