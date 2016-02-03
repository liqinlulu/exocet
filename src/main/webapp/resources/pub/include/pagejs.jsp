<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<script src="../../js/bootstrap.min.js?v=3.3.5"></script>
<script src="../../js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../js/plugins/layer/layer.min.js"></script>
<script src="../../js/hplus.min.js?v=4.0.0"></script>
<script src="../../js/contabs.min.js"></script>
<script src="../../js/plugins/pace/pace.min.js"></script>
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
