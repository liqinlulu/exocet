<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
<![endif]-->

<link rel="shortcut icon" href="../../img/favicon.ico">
<link href="../../css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="../../css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="../../css/animate.min.css" rel="stylesheet">
<link href="../../css/style.min.css?v=4.0.0" rel="stylesheet">
<script>
//全局的AJAX访问，处理AJAX清求时SESSION超时
$.ajaxSetup({
    contentType:"application/x-www-form-urlencoded;charset=utf-8",
    complete:function(XMLHttpRequest,textStatus){
          //通过XMLHttpRequest取得响应头，sessionstatus           
          var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus"); 
          if(sessionstatus=="timeout"){
               //跳转的登录页面
               window.location.replace('${ctx}/a/login');
       		}	
    }
});
</script>
