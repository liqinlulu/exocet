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
<div class="wrapper wrapper-content "> 
    <div class="ibox-content">
		<form:form id="editForm" name="editForm" class="form-inline" modelAttribute="crmCustomer" action="${ctx}/crm/crmCustomer/${crmCustomer.action}" method="post">
		    <form:hidden id="action" name="action" path="action"/>
			<div class="row">
				<div class="form-group col-sm-4">
					<label  class="control-label">客户编号：</label>
					<form:input id="ccode" name="ccode"  path="ccode" class="form-control input-sm" style="width:68%;height:30px"/>
				</div>
				<div class="form-group col-sm-4">
					<label class="control-label">客户名称：</label>
					<form:input id="cname" name="cname" path="cname" class="form-control input-sm required" style="width:68%;height:30px"/>
				</div>
				<div class="control-group col-sm-4 ">
					<label class="control-label">客户电话：</label>
					<form:input id="cphone" name="cphone" path="cphone" htmlEscape="false" maxlength="64" class="form-control input-sm" style="width:68%;height:30px"/>
				</div>				
			</div>

			<div class="row">
				<div class="form-group col-sm-4">
					<label class="control-label">客户手机：</label>					
					<form:input id="ctel" name="ctel" path="ctel" htmlEscape="false" maxlength="64" class="form-control input-sm required" style="width:68%;height:30px"/>
					<span class="help-inline"><font color="red">*</font> </span>					
				</div>
				<div class="form-group col-sm-4">
					<label class="control-label">客户传真：</label>
					<form:input id="cfax" name="cfax" path="cfax" htmlEscape="false" maxlength="128" class="form-control input-sm" style="width:68%;height:30px"/>					
				</div>				
				<div class="form-group col-sm-4">
					<label class="control-label">主联系人：</label>
					<form:input id="cmainlinkman" name="cmainlinkman" path="cmainlinkman" htmlEscape="false" maxlength="64" class="form-control input-sm" style="width:68%;height:30px"/>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-sm-4">
					<label class="control-label">联系手机：</label>					
					<form:input id="linkphone" name="linkphone" path="linkphone" htmlEscape="false" maxlength="64" class="form-control input-sm" aria-required="true" style="width:68%;height:30px"/>
					<span class="help-inline"><font color="red">*</font> </span>					
				</div>
				<div class="form-group col-sm-4">
					<label class="control-label">详细地址：</label>
					<form:input id="address" name="address" path="address" htmlEscape="false" maxlength="128" class="form-control input-sm required" style="width:68%;height:30px"/>					
				</div>				
				<div class="form-group col-sm-4">
					<label class="control-label">电子邮箱：</label>
					<form:input id="email" name="email" path="email" htmlEscape="false" maxlength="128" class="form-control input-sm" style="width:68%;height:30px"/>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-sm-4">
					<label class="control-label">客户类型：</label>
					<form:select id="ctype" name="ctype" path="ctype" style="width:68%;height:30px" class="form-control">
			            <form:option value=""/>
			            <form:options items="${fns:getDictList('CTYPE')}" htmlEscape="false" itemLabel="label" itemValue="value" />
			         </form:select>

				</div>
				<div class="form-group col-sm-4">
					<label class="control-label">客户阶段：</label>
					<form:select id="cstage" name="cstage" path="cstage" class="form-control" style="width:68%;height:30px" data-placeholder="请选择...">
						<form:option value=""/>
						<form:options items="${fns:getDictList('cstage')}" htmlEscape="false" itemLabel="label" itemValue="value" />
					</form:select>	
				</div>				
				<div class="form-group col-sm-4">
					<label class="control-label">客户状态：</label>
					<form:select id="cstatus" name="cstatus" path="cstatus" class="form-control" style="width:68%;height:30px" data-placeholder="请选择...">
						<form:option value="--请选择--" label=""/>
						<form:options items="${fns:getDictList('cstatus')}" htmlEscape="false" itemLabel="label" itemValue="value" />
					</form:select>
				</div>
			</div>
			<div class = "row">
				<div class="form-group col-sm-12">
					<div class="text-center">
						<button id="add" name="add" type="button" class="btn btn-outline btn-primary"  onclick="addc()"><i class="fa fa-check"></i>&nbsp;保存</button>
						<button id="cancle" name="cancle" class="btn btn-outline btn-danger" type="submit"><i class="fa fa-times"></i>&nbsp;取消</button>
					</div>
				</div>
			</div>			
		</form:form> 
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
		//setChose();
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