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
        <div class="ibox-content">
		<form:form id="queryForm" class="form-inline" modelAttribute="crmCustomer" action="${ctx}/crm/crmCustomer/" method="post">			
			<div class="row">
				<div class="form-group col-sm-4">
					<label  class="control-label">客户编号:</label>
					<input id="ccode" type="text"  class="form-control input-sm" name="ccode">
				</div>
				<div class="form-group col-sm-4">
					<label  class="control-label">客户名称:</label>
					<input id="cname" name="cname" type="text" class="form-control input-sm">
				</div>
				<div class="control-group col-sm-4">
					<label class="control-label">客户电话:</label>
					<form:input id="cphone" name="cphone"  path="cphone" htmlEscape="false" maxlength="64" class="form-control input-sm"/>
				</div>
                <!-- <div class="form-group col-sm-4">
                                <label class="control-label">客户类型：</label>                  
                                <form:select id="ctype" name="ctype" path="ctype" class="chosen-select" style="width:68%;height:30px" data-placeholder="请选择...">
                                    <form:option value="--请选择--" label=""/>
                                    <form:options items="${fns:getDictList('CTYPE')}" htmlEscape="false" itemLabel="label" itemValue="value" />
                                </form:select>                  
                            </div>     -->			
			</div>			
		</form:form>   
		<shiro:hasPermission name="crm:crmCustomer:edit">
			<div class="btn-group hidden-xs" id="toolbar" role="group">
				<button type="button" class="btn btn-outline btn-default" onclick="add()">
					<i class="glyphicon glyphicon-plus" aria-hidden="true" ></i>
				</button>
				<button type="button" class="btn btn-outline btn-default" onclick="edit()">
					<i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
				</button>
				<button type="button" class="btn btn-outline btn-default">
					<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
				</button>
			</div>
		</shiro:hasPermission>
		<table id="goodList" data-mobile-responsive="true">
			<thead>
				<tr>                        
					<th data-field="ccode" data-sortable="true" data-search=”true”>客户编号</th>
					<th data-field="cname" data-sortable="true">客户名称</th>
					<th data-field="cphone">客户电话</th>
					<th data-field="ctel">客户手机</th>
					<th data-field="ctype">客户类型</th>
					<th data-field="cstage">客户阶段</th>
					<th data-field="cstatus">客户状态</th>
					<th data-field="clevel" data-sortable="true">客户级别</th>
					<th data-field="ccategory" data-sortable="true">行业类别</th>
					<th data-field="adddate" data-sortable="true">添加日期</th>						
				</tr>
			</thead>
		</table>                  
	</div>
</div>

<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<sys:message content="${message}"/>	
<script type="text/javascript">
        function initReport() {  
            $('#goodList').bootstrapTable({
                method: 'get',
				height: getHeight(),// 设置高度，会启用固定表头的特性
                cache: false,// 不缓存
                sidePagination:'server',//设置为服务器端分页
                //minimumCountColumns: 10,// 设置最少显示列个数               
                striped: true,// 隔行加亮
                pagination: true,// 开启分页功能                
                pageNumber:1,
				pageSize: 10,// 设置默认分页为
                pageList: [10, 20, 50, 100, 200, 500],// 自定义分页列表
                toolbar: "#toolbar",
                search: true,// 开启搜索功能
                showColumns: true,// 开启自定义列显示功能
                showRefresh: true,// 开启刷新功能 
                smartDisplay: true, // 智能显示 pagination 和 cardview 等 
				showToggle:true,					//是否显示详细视图和列表视图的切换按钮
				//cardView: false,					//是否显示详细视图
				//detailView: false,				   //是否显示父子表
               // clickToSelect: true,// 单击行即可以选中
                sortName: 'createDate', // 设置默认排序为 name
                sortOrder: 'desc', // 设置排序为反序 desc
				//queryParams: oTableInit.queryParams,//传递参数（*）
                icons: {
                    refresh: "glyphicon-repeat",
                    toggle: "glyphicon-list-alt",
                    columns: "glyphicon-list"
                },
                iconSize: "outline",
                //url : "${ctx}/resources/js/demo/bootstrap_table_test.json",
				url:"${ctx}/crm/crmCustomer/json",
                onPageChange: function (size, number) {
                    
                },
                formatNoMatches: function(data){
                    return '无符合条件的记录';
                }/*,
				responseHandler:function(data){
					var s='';
				}*/
            });
        }

		//得到查询的参数
  /*oTableInit.queryParams = function (params) {
    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
      limit: params.limit,   //页面大小
      offset: params.offset,  //页码
      departmentname: $("#txt_search_departmentname").val(),
      statu: $("#txt_search_statu").val()
    };
    return temp;
  };
*/
        
		$(function(){
			initReport();
			//$('.chosen-select').chosen();
		})

        function add(){
			/*window.location = '${ctx}/crm/crmCustomer/add';*/
            layer.open({
                type: 2, 
                shadeClose: false,
                //shade: 1,//是否显示遮罩
                title:'新增客户信息',                
                maxmin: true, //开启最大化最小化按钮
                content: ['${ctx}/crm/crmCustomer/add', 'yes'], //这里content是一个普通的String                
                closeBtn: 1,
    			scrollbar: false,//浏览器滚动条已锁
                moveOut :true,
                area: ['900px','278px'],//'900px'
                zIndex: layer.zIndex, //重点1
                success: function(layero, index){
			        layer.setTop(layero); //重点2                   
                    //var body = layer.getChildFrame('body', index);
                    //var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                    //iframeWin.$('.chosen-select'); 
                                     
			    }
            });           
        }

		function edit(){
            location.href="${base}/admin/crm/customer/add";            
        }

		function del(){

            layer.open({
                type: 2, 
                content: ['${ctx}/crm/crmCustomer/delete?id=${crmCustomer.id}', 'no'], //这里content是一个普通的String
               /* iframe: {
                     src: '${ctx}/shopnew/hgoods/add'
                 },*/
                btn: ['保存', '取消'], //可以无限个按钮
                closeBtn: 1,
                area: ['1100px', '330px']
            });
        }

		function getHeight() {
			return $(window).height()-25;
		}
        function addc(){
            alert("sdfasdf");
        }
    </script>
</body>
</html>