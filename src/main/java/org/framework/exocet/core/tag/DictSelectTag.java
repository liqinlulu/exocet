package org.framework.exocet.core.tag;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.mapping.MappedStatement;

/**
 * @ClassName: SelectHander.java
 *
 * @Description: 自定义下拉框
 *
 * @author GERRARD
 *
 * @date 2015年1月27日下午3:43:04
 * 
 */
public class DictSelectTag extends TagSupport {
	private static final long serialVersionUID = -1714330894742881426L;
	/**
	 * 类型
	 */
	private String code;

	/**
	 * HTML class
	 */
	private String className;

	/**
	 * HTML id
	 */
	private String id;

	/**
	 * HTML name
	 */
	private String name;

	/**
	 * 是否必输 ：就是 是否带有请选择还是默认选中第一个
	 */
	private boolean required;

	/**
	 * 值 支持 EL表达式
	 */
	private String value;

	/**
	 * 是否将值反显为label形式
	 */
	private boolean isLabel;

	/**
	 * 不可编辑
	 */
	private boolean disabled;

	/**
	 * 不在列表处显示 except = "1,2,3,4,5"
	 */
	private String except;

	@Override
	public int doEndTag() throws JspException {
		StringBuffer htmlBuff = new StringBuffer();
		Map<String, Map<String, String>> codeMap = queryDic();

		// 反显value
		if (isLabel) {
			if (StringUtils.isBlank(value)) {
				htmlBuff.append("<span></span>");
			} else {
				Map<String, String> selectMap = codeMap.get(code);

				if (selectMap == null || selectMap.get(value) == null) {
					htmlBuff.append("<span></span>");
				} else {
					htmlBuff.append("<span>" + selectMap.get(value) + "<span>");
				}
			}
		} else {// 正常下拉
			htmlBuff.append("<select");
			if (StringUtils.isNotBlank(className)) {
				htmlBuff.append(" class='" + className + "'");
			}
			if (StringUtils.isNotBlank(id)) {
				htmlBuff.append(" id='" + id + "'");
			}
			if (StringUtils.isNotBlank(name)) {
				htmlBuff.append(" name='" + name + "'");
			}
			if (disabled) {
				htmlBuff.append(" disabled='" + disabled
						+ "'style='background-color:#F0F0F0'");
			}
			htmlBuff.append(">");
			if (!required) {
				htmlBuff.append("<option value=''>请选择</option>");
			}

			if (codeMap.containsKey(code)) {
				Map<String, String> selectMap = codeMap.get(code);
				Set<String> kset = selectMap.keySet();
				Iterator<String> ite = kset.iterator();
				List<String> excepts = new ArrayList<String>();
				if (StringUtils.isNotBlank(except)) {
					String[] args = except.split(",");
					excepts = new ArrayList<String>(args.length);
					excepts = Arrays.asList(args);
				}

				while (ite.hasNext()) {
					String key = ite.next();
					if (excepts.contains(key)) {
						continue;
					}

					if (key.equals(value)) {
						htmlBuff.append("<option value='" + key
								+ "' selected='selected' >"
								+ selectMap.get(key) + "</option>");
						continue;
					}

					htmlBuff.append("<option value='" + key + "'>"
							+ selectMap.get(key) + "</option>");
				}
			}
			htmlBuff.append("</select>");
		}

		try {
			JspWriter out = pageContext.getOut();
			out.println(htmlBuff.toString());
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return TagSupport.EVAL_PAGE;
	}

	public void setIsLabel(boolean isLabel) {
		this.isLabel = isLabel;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setRequired(boolean required) {
		this.required = required;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}

	public void setExcept(String except) {
		this.except = except;
	}

	/**
	 * 查询自定义数据字典
	 * 
	 * @作者：Alexander
	 */
	private Map<String, Map<String, String>> queryDic() {
		//MappedStatement mappedStatement = new MappedStatement();	
		//Connection con = mappedStatement.getConfiguration().getEnvironment().getDataSource().getConnection();
		/*String sql = "select " + dictField + " as field," + dictText
				+ " as text from " + dictTable;
	      
		systemService = ApplicationContextUtil.getContext().getBean(SystemService.class);
		List<Map<String, Object>> list = systemService.findForJdbc(sql);*/
		return null;
	}
}
