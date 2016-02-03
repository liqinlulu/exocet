/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.framework.exocet.modules.cms.dao;

import org.framework.exocet.core.persistence.annotation.MyBatisDao;

import com.framework.exocet.common.persistence.CrudDao;
import com.framework.exocet.modules.cms.entity.Comment;

/**
 * 评论DAO接口
 * @author ThinkGem
 * @version 2013-8-23
 */
@MyBatisDao
public interface CommentDao extends CrudDao<Comment> {

}
