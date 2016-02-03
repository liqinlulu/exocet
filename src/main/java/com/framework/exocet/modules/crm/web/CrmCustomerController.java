/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.framework.exocet.modules.crm.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.framework.exocet.core.config.Global;
import org.framework.exocet.core.web.BaseController;
import org.framework.exocet.utils.string.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.exocet.common.persistence.Page;
import com.framework.exocet.modules.crm.entity.CrmCustomer;
import com.framework.exocet.modules.crm.service.CrmCustomerService;

/**
 * 客户/供应商信息管理Controller
 * @author 李芹
 * @version 2016-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}/crm/crmCustomer")
public class CrmCustomerController extends BaseController {

	@Autowired
	private CrmCustomerService crmCustomerService;
	
	@ModelAttribute
	public CrmCustomer get(@RequestParam(required=false) String id) {
		CrmCustomer entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = crmCustomerService.get(id);
		}
		if (entity == null){
			entity = new CrmCustomer();
		}
		return entity;
	}
		
	@RequiresPermissions("crm:crmCustomer:view")
	@RequestMapping(value = {"list", ""},method = RequestMethod.GET)
	public String list(CrmCustomer crmCustomer, HttpServletRequest request, HttpServletResponse response, Model model) {		
		return "modules/crm/crmCustomerList";
	}
	/**
	 * 获取日志json bootstrap-table分页
	 */
	@RequestMapping(value = "json", method = RequestMethod.GET)
	@ResponseBody
	public Map logList(CrmCustomer crmCustomer,HttpServletRequest request, HttpServletResponse response, Model model) {
		// Fetch the page number from client
		response.setContentType("application/json; charset=UTF-8");
		Page<CrmCustomer> pg = new Page<CrmCustomer>(request, response);
        Page<CrmCustomer> page = crmCustomerService.findPage(pg, crmCustomer);		
		Map res = new HashMap();			
		res = getPagiNation(page);
		return res;
	}
	
	@RequiresPermissions("crm:crmCustomer:view")
	@RequestMapping(value = "form")
	public String form(CrmCustomer crmCustomer, Model model) {
		model.addAttribute("crmCustomer", crmCustomer);
		return "modules/crm/crmCustomerForm";
	}

	/**
	 * 客户/供应商信息 
	 * @param model
	 */
	@RequiresPermissions("crm:crmCustomer:edit")
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String createForm(Model model) {
		CrmCustomer c = new CrmCustomer("","add");
		model.addAttribute("crmCustomer", c);
		return "modules/crm/crmCustomerForm";
	}
	
	@RequiresPermissions("crm:crmCustomer:edit")
	@RequestMapping(value = "edit")//@Valid 
	public String edit(CrmCustomer crmCustomer, Model model, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/sys/dict/?repage";
		}
		if (!beanValidator(model, crmCustomer)){
			return form(crmCustomer, model);
		}
		//dictService.save(dict);
		addMessage(redirectAttributes, "保存客户信息成功");
		return "redirect:" + adminPath + "/crm/crmCustomer/?repage";
	}
	
	@RequiresPermissions("crm:crmCustomer:edit")
	@RequestMapping(value = "save")
	public String save(CrmCustomer crmCustomer, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, crmCustomer)){
			return form(crmCustomer, model);
		}
		crmCustomerService.save(crmCustomer);
		addMessage(redirectAttributes, "保存客户/供应商信息成功");
		return "redirect:"+Global.getAdminPath()+"/crm/crmCustomer/?repage";
	}
	
	@RequiresPermissions("crm:crmCustomer:edit")
	@RequestMapping(value = "delete")
	public String delete(CrmCustomer crmCustomer, RedirectAttributes redirectAttributes) {
		crmCustomerService.delete(crmCustomer);
		addMessage(redirectAttributes, "删除客户/供应商信息成功");
		return "redirect:"+Global.getAdminPath()+"/crm/crmCustomer/?repage";
	}

	
//---------------------------------------------------------------------------------------------------------------//	
	/**
	 * 客户/供应商信息 弹出窗口
	 * @param model
	 */
	@RequiresPermissions("crm:crmCustomer:edit")
	@RequestMapping(value = "addt", method = RequestMethod.GET)
	public String createFormt(Model model) {
		CrmCustomer c = new CrmCustomer("","addt");
		model.addAttribute("crmCustomer", c);
		return "modules/crm/crmCustomerFormt";
	}
	
	@RequiresPermissions("crm:crmCustomer:edit")
	@RequestMapping(value = "savet")
	public String savet(CrmCustomer crmCustomer, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, crmCustomer)){
			return formt(crmCustomer, model);
		}
		crmCustomerService.save(crmCustomer);
		addMessage(redirectAttributes, "保存客户/供应商信息成功");
		return "redirect:"+Global.getAdminPath()+"/crm/crmCustomer/?repage";
	}
	
	@RequiresPermissions("crm:crmCustomer:view")
	@RequestMapping(value = "formt")
	public String formt(CrmCustomer crmCustomer, Model model) {
		model.addAttribute("crmCustomer", crmCustomer);
		return "modules/crm/crmCustomerFormt";
	}
}