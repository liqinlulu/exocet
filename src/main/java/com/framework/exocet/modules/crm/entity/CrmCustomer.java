/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.framework.exocet.modules.crm.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.framework.exocet.common.persistence.DataEntity;

/**
 * 客户/供应商信息管理Entity
 * @author 李芹
 * @version 2016-01-16
 */
public class CrmCustomer extends DataEntity<CrmCustomer> {
	
	private static final long serialVersionUID = 1L;
	private String ccode;		// 客户编号
	private String cname;		// 客户名称
	private String cphone;		// 客户电话
	private String ctel;		// 客户手机
	private String cfax;		// 客户传真
	private String cmainlinkman;		// 主联系人
	private String linkphone;		// 联系手机
	private String address;		// 详细地址
	private String email;		// 电子邮箱
	private String ctype;		// 客户类型(正式、试用、潜在、供应商、合作伙伴、核心代理商、地区分销商)
	private String cstage;		// 客户阶段(售前跟踪、合同执行、售后服务)
	private String cstatus;		// 客户状态(活跃、停顿、流失)
	private String clevel;		// 客户级别(普通、重要)
	private String csource;		// 客户来源(网络广告/朋友介绍/展览会/媒体广告/其他/主动上门/上门推销)
	private String ccategory;		// 客户行业类别(IT行业/餐饮业/金融业/运输业/证券业/旅馆业)
	private String cprovince;		// 客户省份/地区
	private String ccity;		// 客户城市
	private String curl;		// 网址
	private Date adddate;		// 添加日期
	private String orgid;		// 组织
	private Date createDatetime;		// 创建日期时间
	private Date updateDatetime;		// 修改日期
	private String dtype;		// dtype
	
	public CrmCustomer() {
		super();
	}

	public CrmCustomer(String id){
		super(id);
	}
	
	public CrmCustomer(String id,String action){
		super(id,action);
	}

	@Length(min=1, max=30, message="客户编号长度必须介于 1 和 30 之间")
	public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	
	@Length(min=1, max=64, message="客户名称长度必须介于 1 和 64 之间")
	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}
	
	@Length(min=0, max=64, message="客户电话长度必须介于 0 和 64 之间")
	public String getCphone() {
		return cphone;
	}

	public void setCphone(String cphone) {
		this.cphone = cphone;
	}
	
	@Length(min=1, max=64, message="客户手机长度必须介于 1 和 64 之间")
	public String getCtel() {
		return ctel;
	}

	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	
	@Length(min=0, max=128, message="客户传真长度必须介于 0 和 128 之间")
	public String getCfax() {
		return cfax;
	}

	public void setCfax(String cfax) {
		this.cfax = cfax;
	}
	
	@Length(min=0, max=64, message="主联系人长度必须介于 0 和 64 之间")
	public String getCmainlinkman() {
		return cmainlinkman;
	}

	public void setCmainlinkman(String cmainlinkman) {
		this.cmainlinkman = cmainlinkman;
	}
	
	@Length(min=0, max=128, message="联系手机长度必须介于 0 和 128 之间")
	public String getLinkphone() {
		return linkphone;
	}

	public void setLinkphone(String linkphone) {
		this.linkphone = linkphone;
	}
	
	@Length(min=0, max=128, message="详细地址长度必须介于 0 和 128 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=64, message="电子邮箱长度必须介于 0 和 64 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Length(min=0, max=3, message="客户类型(正式、试用、潜在、供应商、合作伙伴、核心代理商、地区分销商)长度必须介于 0 和 3 之间")
	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	
	@Length(min=0, max=3, message="客户阶段(售前跟踪、合同执行、售后服务)长度必须介于 0 和 3 之间")
	public String getCstage() {
		return cstage;
	}

	public void setCstage(String cstage) {
		this.cstage = cstage;
	}
	
	@Length(min=0, max=3, message="客户状态(活跃、停顿、流失)长度必须介于 0 和 3 之间")
	public String getCstatus() {
		return cstatus;
	}

	public void setCstatus(String cstatus) {
		this.cstatus = cstatus;
	}
	
	@Length(min=0, max=3, message="客户级别(普通、重要)长度必须介于 0 和 3 之间")
	public String getClevel() {
		return clevel;
	}

	public void setClevel(String clevel) {
		this.clevel = clevel;
	}
	
	@Length(min=0, max=3, message="客户来源(网络广告/朋友介绍/展览会/媒体广告/其他/主动上门/上门推销)长度必须介于 0 和 3 之间")
	public String getCsource() {
		return csource;
	}

	public void setCsource(String csource) {
		this.csource = csource;
	}
	
	@Length(min=0, max=3, message="客户行业类别(IT行业/餐饮业/金融业/运输业/证券业/旅馆业)长度必须介于 0 和 3 之间")
	public String getCcategory() {
		return ccategory;
	}

	public void setCcategory(String ccategory) {
		this.ccategory = ccategory;
	}
	
	@Length(min=0, max=64, message="客户省份/地区长度必须介于 0 和 64 之间")
	public String getCprovince() {
		return cprovince;
	}

	public void setCprovince(String cprovince) {
		this.cprovince = cprovince;
	}
	
	@Length(min=0, max=128, message="客户城市长度必须介于 0 和 128 之间")
	public String getCcity() {
		return ccity;
	}

	public void setCcity(String ccity) {
		this.ccity = ccity;
	}
	
	@Length(min=0, max=64, message="网址长度必须介于 0 和 64 之间")
	public String getCurl() {
		return curl;
	}

	public void setCurl(String curl) {
		this.curl = curl;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAdddate() {
		return adddate;
	}

	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}
	
	@Length(min=0, max=32, message="组织长度必须介于 0 和 32 之间")
	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateDatetime() {
		return createDatetime;
	}

	public void setCreateDatetime(Date createDatetime) {
		this.createDatetime = createDatetime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateDatetime() {
		return updateDatetime;
	}

	public void setUpdateDatetime(Date updateDatetime) {
		this.updateDatetime = updateDatetime;
	}
	
	@Length(min=0, max=31, message="dtype长度必须介于 0 和 31 之间")
	public String getDtype() {
		return dtype;
	}

	public void setDtype(String dtype) {
		this.dtype = dtype;
	}
	
}