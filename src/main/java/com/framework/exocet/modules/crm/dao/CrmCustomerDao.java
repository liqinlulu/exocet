/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.framework.exocet.modules.crm.dao;

import org.framework.exocet.core.persistence.annotation.MyBatisDao;

import com.framework.exocet.common.persistence.CrudDao;
import com.framework.exocet.modules.crm.entity.CrmCustomer;

/**
 * 客户/供应商信息管理DAO接口
 * @author 李芹
 * @version 2016-01-16
 */
@MyBatisDao
public interface CrmCustomerDao extends CrudDao<CrmCustomer> {
	
}