<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>${ctitle}客户/供应商信息管理</title>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<%@ include file="/WEB-INF/views/include/css.jsp"%>  
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>${not empty crmCustomer.id?'修改':'新增'}客户信息</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <!-- <ul class="dropdown-menu dropdown-user">
                            <li><a href="form_basic.html#">选项1</a>
                            </li>
                            <li><a href="form_basic.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a> -->
                    </div>
                </div>
<sys:message content="${message}"/>
                <div class="ibox-content">
                    <form:form id="editForm" name="editForm" class="form-horizontal" modelAttribute="crmCustomer" action="${ctx}/crm/crmCustomer/save" method="post">
						<form:hidden id="id" name="id"  path="id"></form:hidden>
						<form:hidden id="actio" name="action"  path="action"></form:hidden>
						<div class='row' style="margin-bottom: -10px">
							<div class="form-group col-sm-6">
								<label class="col-sm-3 control-label">客户编号：</label>
								<div class="col-sm-9">
									<form:input id="ccode" name="ccode"  path="ccode" class="form-control"/>
								</div>
							</div>
						   
							<div class="form-group col-sm-6">
								<label class="col-sm-3 control-label">客户名称：</label>
								<div class="col-sm-9">
									<form:input id="cname" name="cname" path="cname" class="form-control required"/>
								</div>
							</div>
						</div>
                       
						<div class="hr-line-dashed"></div>
						<div class='row' style="margin-bottom: -10px">
							<div class="form-group col-sm-6">
								<label class="col-sm-3 control-label">客户手机：</label>
								<div class="col-sm-9">
									<form:input id="ctel" name="ctel" path="ctel" htmlEscape="false" maxlength="64" class="form-control required"/>
								</div>
							</div>                            
							<div class="form-group col-sm-6">
								<label class="col-sm-3 control-label">E-mail：</label>
								<div class="col-sm-9">
									<form:input type="email" id="email" name="email" path="email" class="form-control"/>
								</div>
							</div>
						</div>
                        
                        <div class="hr-line-dashed"></div>
						<div class='row' style="margin-bottom: -10px">
							<div class="form-group col-sm-6">
								<label class="col-sm-3 control-label">主联系人：</label>
								<div class="col-sm-9">
									<form:input id="cmainlinkman" name="cmainlinkman"  path="cmainlinkman" htmlEscape="false" maxlength="64" class="form-control" type="text"/>
								</div>
							</div>                            
							<div class="form-group col-sm-6">
								<label class="col-sm-3 control-label">联系手机：</label>
								<div class="col-sm-9">
									<form:input id="cphone" name="cphone"  path="cphone" htmlEscape="false" maxlength="64" class="form-control" type="text"/>
								</div>
							</div>
						</div>

						<div class="hr-line-dashed"></div>
						<div class='row' style="margin-bottom: -10px">
							<div class="form-group col-sm-6">
								<label class="col-sm-3 control-label">客户类型：</label>
								<div class="col-sm-9">
									<form:select id="ctype" name="ctype" path="ctype" class="chosen-select form-control" data-placeholder="请选择...">
									<form:option value="--请选择--" label=""/>
									<form:options items="${fns:getDictList('CTYPE')}" htmlEscape="false" itemLabel="label" itemValue="value" />
								</form:select>
								</div>
							</div>                            
							<div class="form-group col-sm-6">
								<label class="col-sm-3 control-label">客户阶段：</label>
								<div class="col-sm-9">
									<form:select id="cstage" name="cstage" path="cstage" class="chosen-select form-control" data-placeholder="请选择...">
									<form:option value="--请选择--" label=""/>
									<form:options items="${fns:getDictList('cstage')}" htmlEscape="false" itemLabel="label" itemValue="value" />
								</form:select>
								</div>
							</div>
						</div>

						<div class="hr-line-dashed"></div>
						<div class='row' style="margin-bottom: -10px">
							<div class="form-group col-sm-6">
								<label class="col-sm-3 control-label">客户状态：</label>
								<div class="col-sm-9">
									<form:select id="cstatus" name="cstatus" path="cstatus" class="chosen-select form-control" data-placeholder="请选择...">
									<form:option value="--请选择--" label=""/>
									<form:options items="${fns:getDictList('cstage')}" htmlEscape="false" itemLabel="label" itemValue="value" />
								</form:select>
								</div>
							</div>                            
							<div class="form-group col-sm-6">
								<label class="col-sm-3 control-label">客户传真：</label>
								<div class="col-sm-9">
									<form:input id="cfax" name="cfax"  path="cfax" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class='row' style="margin-bottom:-10px;">
							<div class="form-group col-sm-6">
								<label class="col-sm-3 control-label">详细地址：</label>
								<div class="col-sm-9">
									<input id="address" name="address"  path="address" htmlEscape="false" maxlength="64" class="form-control" type="text"/>
								</div>
							</div>
						</div>
						<div class = "row">
						<div class="form-group col-sm-12">
							<div class="text-center">
								<shiro:hasPermission name="sys:dict:edit">
								<button id="add" name="add" type="button" class="btn btn-outline btn-primary"  onclick="addc()"><i class="fa fa-check"></i>&nbsp;保存</button>
								</shiro:hasPermission>
								<button id="cancle" name="cancle" class="btn btn-outline btn-danger" type="submit"><i class="fa fa-times"></i>&nbsp;取消</button>
							</div>
						</div>
			</div>	
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<script type="text/javascript">
	$.validator.setDefaults({
	    highlight: function(e,r) {
	        $(e).closest(".form-group").removeClass("has-success").addClass("has-error");
	        //e.appendTo(r.is(":radio") || r.is(":checkbox") ? r.parent().parent().parent() : r.parent());       
	       // layer.tips(e, r.parent(),{time: 5000});
	    },
	    success: function(e) {
	        e.closest(".form-group").removeClass("has-error").addClass("has-success");
	    },
	    errorElement: "span",
	    errorPlacement: function(e, r) {
	        e.appendTo(r.is(":radio") || r.is(":checkbox") ? r.parent().parent().parent() : r.parent());
	        /*layer.tips(e[0].innerHTML, r.parent(),{
	        	tips: [2, '#3595CC'],
	        	time: 5000});*/
	    },
	    errorClass: "help-block m-b-none",
	    validClass: "help-block m-b-none"
	});

	$(function(){
		$("#editForm").validate();
    	//var e = "<i class='fa fa-times-circle'></i> ";
		setChose();
		/*$("#editForm").validate({
			submitHandler: function(form){
				loading('正在提交，请稍等...');
				form.submit();
			},
			errorContainer: "#messageBox",
			errorPlacement: function(error, element) {
				$("#messageBox").text("输入有误，请先更正。");
				if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
					error.appendTo(element.parent().parent());
				} else {
					error.insertAfter(element);
				}
			}
		});*/
		
	})

	function setChose(){
		$('.chosen-select').chosen();
	}
	function addc(){	
		//var r = $("#editForm").valid(); 
		var flag = $("#editForm").validate();
    	if(flag){
    		$("#editForm").submit();
    	}

		/*$("#editForm").validate({
			submitHandler: function(form){
				loading('正在提交，请稍等...');
				form.submit();
			},
			errorContainer: "#messageBox",
			errorPlacement: function(error, element) {
				$("#messageBox").text("输入有误，请先更正。");
				if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
					error.appendTo(element.parent().parent());
				} else {
					error.insertAfter(element);
				}
				return false;
			}
		});*/
		//return r;
	}

</script>
</body>

</html>