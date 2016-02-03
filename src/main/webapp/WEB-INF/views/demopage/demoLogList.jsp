<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>后台主题UI框架</title>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
<%@ include file="/WEB-INF/views/include/css.jsp"%>  
</head>
<body class="gray-bg">
   <div class="wrapper wrapper-content animated fadeInRight">        
        <div class="ibox-content">
            <div class="btn-group hidden-xs" id="toolbar" role="group">
                <button type="button" class="btn btn-outline btn-default" onclick="add()">
                    <i class="glyphicon glyphicon-plus" aria-hidden="true" ></i>
                </button>
                <button type="button" class="btn btn-outline btn-default" onclick="add()">
                    <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
                </button>
                <button type="button" class="btn btn-outline btn-default">
                    <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                </button>
            </div>
            <table id="goodList" data-mobile-responsive="true">
                <thead>
                    <tr>
                        <th data-field="state" data-checkbox="true"></th>
                        <th data-field="title" data-sortable="true">操作菜单</th>
                        <th data-field="createBy.name" data-sortable="true">操作用户</th>
                        <th data-field="createBy.company.name">所在公司</th>
                        <th data-field="createBy.office.name">所在部门</th>
                        <th data-field="requestUri">URI</th>
                        <th data-field="method">提交方式</th>
                        <th data-field="remoteAddr">操作者IP</th>
                        <th data-field="createDate" data-sortable="true">操作时间</th> 
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
					height: getHeight(),
                cache: false,// 不缓存
				//height: getHeight(),
                sidePagination:'server',//设置为服务器端分页
                //minimumCountColumns: 10,// 设置最少显示列个数
                //height: 100%,//$(window).height()-46,// 设置高度，会启用固定表头的特性
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
				url:"${ctx}/demo/demolog/json",
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
		function getHeight() {
			return $(window).height()-25;
		}
    </script>
</body>

</html>