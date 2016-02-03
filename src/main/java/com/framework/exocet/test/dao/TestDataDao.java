/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.framework.exocet.test.dao;

import org.framework.exocet.core.persistence.annotation.MyBatisDao;

import com.framework.exocet.common.persistence.CrudDao;
import com.framework.exocet.test.entity.TestData;

/**
 * 单表生成DAO接口
 * @author ThinkGem
 * @version 2015-04-06
 */
@MyBatisDao
public interface TestDataDao extends CrudDao<TestData> {
	
}