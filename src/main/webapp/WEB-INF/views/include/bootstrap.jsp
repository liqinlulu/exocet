
 
<script src="${ctx}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/resources/js/plugins/layer2.1/layer.js"></script>
<script src="${ctx}/resources/js/plugins/layer2.1/extend/layer.ext.js"></script> 

<script src="${ctx}/resources/js/hplus.min.js?v=4.0.0"></script>
<script src="${ctx}/resources/js/contabs.js"></script> 
<script src="${ctx}/resources/js/plugins/pace/pace.min.js"></script>
<script src="${ctx}/resources/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctx}/resources/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${ctx}/resources/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script> 
<script src="${ctx}/resources/js/plugins/iCheck/icheck.min.js"></script> 
<script src="${ctx}/resources/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${ctx}/resources/js/plugins/validate/messages_zh.min.js"></script> 
<script src="${ctx}/resources/js/content.js?v=1.0.0"></script>

 <!--<script src="${ctx}/resources/js/plugins/chosen/chosen.jquery.js"></script>-->
<script src="${ctx}/resources/js/plugins/chosen1.4.2/chosen.jquery.js"></script>
<script src="${ctx}/resources/js/plugins/sweetalert/sweetalert.min.js"></script>

<script src="${ctx}/static/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js" type="text/javascript"></script>

<script src="${ctx}/resources/js/plugins/echarts/echarts-all.js"></script>
 
 
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
