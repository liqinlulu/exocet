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
        <form:form id="commentForm" class="form-horizontal m-t" modelAttribute="crmCustomer" action="${ctx}/crm/crmCustomer/" method="post">			
			<div class="row">
				<div class="form-group">
					<label class="col-sm-1 control-label">客户类型：</label>
					<div class="col-sm-3">
						<form:select id="ctype" path="ctype" class="form-control m-b">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('CTYPE')}" htmlEscape="false" itemLabel="label" itemValue="value" />
						</form:select>
					</div>
				
					<label class="col-sm-1 control-label">客户名称：</label>
					<div class="col-sm-3">
						<input id="cname" type="text" class="input-sm form-control" name="cname" required="" aria-required="true">
					</div>
				
					<label class="col-sm-1 control-label">客户编号：</label>
					<div class="col-sm-3">
						<input id="ccode" type="text" class="input-sm form-control" name="ccode">
					</div>
				</div>
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
                        <th data-field="ccode" data-sortable="true">客户编号</th>
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
                pageSize: 10,// 设置默认分页为
                pageNumber:1,
                pageList: [10, 20, 50, 100, 200, 500],// 自定义分页列表
                toolbar: "#toolbar",
                search: true,// 开启搜索功能
                showColumns: true,// 开启自定义列显示功能
                showRefresh: true,// 开启刷新功能 
                smartDisplay: true, // 智能显示 pagination 和 cardview 等               
                //showToggle: true,
                clickToSelect: true,// 单击行即可以选中
                sortName: 'createDate', // 设置默认排序为 name
                sortOrder: 'desc', // 设置排序为反序 desc
                icons: {
                    refresh: "glyphicon-repeat",
                    //toggle: "glyphicon-list-alt",
                    columns: "glyphicon-list"
                },
                iconSize: "outline",
                //url : "${ctx}/resources/js/demo/bootstrap_table_test.json",
				url:"${ctx}/crm/crmCustomer/json",
                onPageChange: function (size, number) {
                    
                },
                formatNoMatches: function(){
                    return '无符合条件的记录';
                }
            });
        }
        initReport();

        function add(){
            layer.open({
                type: 2, 
                content: ['${ctx}/shopnew/hgoods/add', 'no'], //这里content是一个普通的String
               /* iframe: {
                     src: '${ctx}/shopnew/hgoods/add'
                 },*/
                btn: ['保存', '取消'], //可以无限个按钮
                closeBtn: 1,
                area: ['1100px', '330px']
            });
        }

		function edit(){

            layer.open({
                type: 2, 
                content: ['${ctx}/crm/crmCustomer/form?id=${crmCustomer.id}', 'no'], //这里content是一个普通的String
               /* iframe: {
                     src: '${ctx}/shopnew/hgoods/add'
                 },*/
                btn: ['保存', '取消'], //可以无限个按钮
                closeBtn: 1,
                area: ['1100px', '330px']
            });
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
    </script>
</body>
</html>