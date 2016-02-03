<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<%@ taglib prefix="shiro" uri="/WEB-INF/tlds/shiros.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fnc" uri="/WEB-INF/tlds/fnc.tld" %> 

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--login/login-->
<%
String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
request.setAttribute("error", error);
%>
<html>
<head>    
    <title>${fns:getConfig('productName')} 登录</title>
    <link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resources/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/resources/css/animate.min.css" rel="stylesheet">
    <link href="${ctx}/resources/css/style.min.css" rel="stylesheet">
    <link href="${ctx}/resources/css/login.min.css" rel="stylesheet">
 	<script src="${ctx}/resources/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/resources/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx}/resources/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx}/resources/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx}/resources/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx}/resources/js/demo/form-validate-demo.min.js"></script>
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>[ XXX ]</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong>XXX 后台主题UI框架</strong></h4>
                    <ul class="m-b">
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五</li>
                    </ul>
                    <strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" class="form-horizontal m-t"  id="lform">
                    <h4 class="no-margins">登录：</h4>
                    <p class="m-t-md">登录到XXX后台主题UI框架</p>
                   <div class="form-group">
                        <div class="col-sm-8">
                            <input id="username" name="username" value="admin" 
                            class="form-control uname error" type="text" aria-required="true" 
                            aria-invalid="true" placeholder="用户名"  style="width:233px" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8">
                            <input id="password" name="password" value="123456" class="form-control pword m-b " type="password" placeholder="密码" style="width:233px"/>
                        </div>
                    </div>
                    <c:if test="${isValidateCodeLogin}">
                        <div class="form-group" style="position: relative;top: -15px;">
                        <div class="col-sm-8" >
	                         <div style="width:330px;">
	                         	<div style="width:330px">
	                                 <input type="text" id="validateCode" name="validateCode" class="form-control" aria-required="true" 
	                                 style="height:33px;width:120px;background: #fff no-repeat 95% center;color: #333;"/>
	                                <img alt="验证码" src="${ctx}/static/images/kaptcha.jpg" title="点击更换" id="img_captcha" onClick="refreshCaptcha();" style="height:33px;width:95px;float:right;margin-right:98px;position: relative;top: -32px;"/>
	                             </div>
	                         </div>                           
                        </div>
                    </div> 
                    </c:if>        
                    <a href="">忘记密码了？</a>
                    <%--<div id="loginError" class="fa fa-times-circle">${message}</div>--%>
                    <div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}">
                        <button data-dismiss="alert" class="close">×</button>
                        <label id="loginError" class="fa has-error ">${message}</label>
                    </div>                    
                    <button class="btn btn-primary btn-block">登录</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2015 All Rights Reserved. H+
            </div>
        </div>
        <!-- <c:choose>
            <c:when test="${error eq 'com.tianyu.jty.system.utils.CaptchaException'}">
                <script>
                    $("#loginerror").html("验证码错误，请重试");
                </script>
            </c:when> 
            <c:when test="${error eq 'org.apache.shiro.authc.UnknownAccountException'}">
                <script>
                    $("#loginerror").html("帐号或密码错误，请重试");
                </script>
            </c:when>
            <c:when test="${error eq 'org.apache.shiro.authc.IncorrectCredentialsException'}">
                <script>
                    $("#loginerror").html("用户名不存在，请重试");
                </script>
            </c:when>
        </c:choose>-->
    </div>
    
    
<script type="text/javascript">
function refreshCaptcha(){  
	 document.getElementById("img_captcha").src="${ctx}/static/images/kaptcha.jpg?t=" + Math.random();  
} 
$(function(){
var captcha;
var e = "<i class='fa fa-times-circle'></i> ";
$.validator.setDefaults({
    highlight: function(e) {
        $(e).closest(".form-group").removeClass("has-success").addClass("has-error")
    },
    success: function(e) {
        e.closest(".form-group").removeClass("has-error").addClass("has-success")
    },
    errorElement: "span",
    errorPlacement: function(e, r) {
        e.appendTo(r.is(":radio") || r.is(":checkbox") ? r.parent().parent().parent() : r.parent())
    },
    errorClass: "help-block m-b-none",
    validClass: "help-block m-b-none"
});
$("#lform").validate({
        rules: {           
            username: {
                required: true,
                minlength: 2
            },
            password: {
                required: true,
                minlength: 5
            },
			/*captcha:{
				 required: true
			},*/
            confirm_password: {
                required: !0,
                minlength: 5,
                equalTo: "#password"
            }            
        },
        messages: {            
            username: {
                required: e + "请输入您的用户名",
                minlength: e + "用户名必须两个字符以上"
            },
            password: {
                required: e + "请输入您的密码",
                minlength: e + "密码必须5个字符以上"
            }/*,
			captcha: {
                required: e + "请输入验证码"
            }*/
        },submitHandler:function(form){
            form.action="${ctx}/login";               
            form.submit();
        }  
    }); 
    $("#lform").validate(); 
});
function login(){
	$.ajax({
		type : "POST",
		url : '${ctx}/login',
		data :$('#lform').serialize(),
		dataType : 'json',
		cache : false,
		success : function(data) {	
			alert("success");		
		},
		error:function(XMLHttpRequest, textStatus, errorThrown) {
			alert("error");
		}
	});
}
</script>
</body>

</html>