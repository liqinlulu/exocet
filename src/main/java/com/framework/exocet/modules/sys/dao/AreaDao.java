/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.framework.exocet.modules.sys.dao;

import org.framework.exocet.core.persistence.annotation.MyBatisDao;

import com.framework.exocet.common.persistence.TreeDao;
import com.framework.exocet.modules.sys.entity.Area;

/**
 * 区域DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface AreaDao extends TreeDao<Area> {
	
}
