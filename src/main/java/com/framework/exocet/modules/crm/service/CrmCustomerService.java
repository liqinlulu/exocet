/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.framework.exocet.modules.crm.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.framework.exocet.common.persistence.Page;
import com.framework.exocet.common.service.CrudService;
import com.framework.exocet.modules.crm.dao.CrmCustomerDao;
import com.framework.exocet.modules.crm.entity.CrmCustomer;

/**
 * 客户/供应商信息管理Service
 * @author 李芹
 * @version 2016-01-16
 */
@Service
@Transactional(readOnly = true)
public class CrmCustomerService extends CrudService<CrmCustomerDao, CrmCustomer> {

	public CrmCustomer get(String id) {
		return super.get(id);
	}
	
	public List<CrmCustomer> findList(CrmCustomer crmCustomer) {
		return super.findList(crmCustomer);
	}
	
	public Page<CrmCustomer> findPage(Page<CrmCustomer> page, CrmCustomer crmCustomer) {
		return super.findPage(page, crmCustomer);
	}
	
	@Transactional(readOnly = false)
	public void save(CrmCustomer crmCustomer) {
		super.save(crmCustomer);
	}
	
	@Transactional(readOnly = false)
	public void delete(CrmCustomer crmCustomer) {
		super.delete(crmCustomer);
	}
	
}