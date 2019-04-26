<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/themes/icon.css" />
<link rel="stylesheet"
	href="JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/themes/gray/easyui.css" />
<script type="text/javascript"
	src="JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	//页面初次加载
	$(function() {
		$("#bcid").combobox({
			url : 'bc',
			method : "post",
			valueField : 'bcid',
			textField : 'bcname'
		})
		searchBooks();
	})
	function searchBooks() {
		var type = $("#bcid").combobox("getValue");
		if (type == "--请选择--") {
			type = "";
		}
		$("#bookTab").datagrid({
			url : "select",
			method : "post",
			pagination : true,
			singleSelect : true,
			toolbar : "#tb",
			queryParams : {
				bname : $("#bname1").val(),
				sale : $("#sale1").val(),
				esale : $("#sale2").val(),
				bcid : type
			}
		})
		$("#formBook").form("reset");
	}
	function formattercaozuo(value, row, index) {
		return "<a href='javascript:void(0)' onclick='edit(" + index
				+ ")'>修改</a> <a href='javascript:void(0)' onclick='chakan("
				+ index
				+ ")'>查看</a> <a href='javascript:void(0)' onclick='del("
				+ index + ")'>删除</a>";
	}
	function bc(value, row, index) {
		return row.bookcate.bcname;
	}
	function insertBook() {
		$("#bcid2").combobox({
			url : 'bc',
			method : "post",
			valueField : 'bcid',
			textField : 'bcname'
		})
		$("#addBook").dialog("open");
	}
	function saveAddBook() {
		var type = $("#bcid2").combobox("getValue");
		if (type == "--请选择--") {
			type = "";
		}
		var frm = $("#addfrm").form("validate");
		if (frm) {
			$.ajax({
				type : "post",
				url : "insert",
				data : {
					bname : $("#bname2").textbox("getValue"),
					sale : $("#sale2").numberbox("getValue"),
					tuijian : $("#tuijian2").textbox("getValue"),
					jianjie : $("#jianjie2").textbox("getValue"),
					author : $("#author2").textbox("getValue"),
					bcid : type,
				},
				success : function(res) {
					if (res > 0) {
						$("#bookTab").datagrid("reload");
						closeAddBook();
						$.messager.alert("提示", "添加成功");
					} else {
						$.messager.alert("提示", "添加失败");

					}

				}

			})
		} else {
			$.messager.alert("提示", "填写完整");
		}
	}
	function closeAddBook() {
		$("#addBook").dialog("close");
	}

	function del(index) {
		var data = $("#bookTab").datagrid("getData");
		var row = data.rows[index];
		$.messager.confirm("确定删除", "确定删除吗", function(r) {
			if (r) {
				$.ajax({
					type : "post",
					url : "delete",
					data : {
						bid : row.bid
					},
					success : function(res) {
						if (res > 0) {
							$.messager.alert("提示", "删除成功");
							$("#bookTab").datagrid("reload");
						} else {
							$.messager.alert("提示", "删除失败");
						}
					}
				})
			}
		})
	}

	function edit(index) {
		var data = $("#bookTab").datagrid("getData");
		var row = data.rows[index];
		$("#editfrm").form("load", row);
		$("#bcid3").combobox({
			url : 'bc',
			method : "post",
			valueField : 'bcid',
			textField : 'bcname'
		})
		$('#bcid3').combobox('select', row.bookcate.bcid);
		$("#editBook").dialog({
			buttons : [ {
				text : "保存",
				handler : function() {
					saveEditBook();
				}
			}, {
				text : "关闭",
				handler : function() {
					closeEditBook();
				}
			} ]
		})
		$("#editBook").dialog("open");
	}
	function chakan(index) {
		var data = $("#bookTab").datagrid("getData");
		var row = data.rows[index];
		$("#editfrm").form("load", row);
		$("#editBook").dialog({
			buttons : [ {
				text : "关闭",
				handler : function() {
					closeEditBook();
				}
			} ]
		})
		$("#editBook").dialog("open");
	}
	function saveEditBook() {
		var frm = $("#editfrm").form("validate");
		if (frm) {
			$.ajax({
				type : "post",
				url : "update",
				data : {
					bid : $("#bid3").val(),
					bname : $("#bname3").textbox("getValue"),
					sale : $("#sale3").numberbox("getValue"),
					tuijian : $("#tuijian3").textbox("getValue"),
					jianjie : $("#jianjie3").textbox("getValue"),
					author : $("#author3").textbox("getValue"),
					bcid : $("#bcid3").combobox("getValue"),
				},
				success : function(res) {
					if (res > 0) {
						$("#bookTab").datagrid("reload");
						closeEditBook();
						$.messager.alert("提示", "修改成功");
					} else {
						$.messager.alert("提示", "修改失败");
					}
				}
			})
		} else {
			$.messager.alert("提示", "填写完整");
		}
	}

	function closeEditBook() {
		$("#editBook").dialog("close");
	}
</script>
</head>
<body>

	<table id="bookTab" class="easyui-datagrid" title="用户信息">
		<thead>
			<tr>
				<th data-options="field:'bid',align:'center'">id</th>
				<th data-options="field:'bname',align:'center'">名字</th>
				<th data-options="field:'sale',align:'center'">sale</th>
				<th data-options="field:'jianjie',align:'center'">jianjie</th>
				<th data-options="field:'tuijian',align:'center'">tuijian</th>
				<th data-options="field:'author',align:'center'">author</th>
				<th data-options="field:'bc',align:'center',formatter:bc">分类</th>
				<th
					data-options="field:'caozuo',align:'center',formatter:formattercaozuo">用户操作</th>
			</tr>
		</thead>
	</table>


	<div id="tb" style="padding: 5px; height: auto">
		<form id="formBook">
			名字: <input class="easyui-textbox" id="bname1" style="width: 80px">
			工资: <input class="easyui-numberbox" id="sale1" style="width: 80px">
			~<input class="easyui-numberbox" id="sale2" style="width: 80px">
			分类: <select id="bcid" class="easyui-combobox" style="height: auto;">
				<option>--请选择--</option>
			</select> <a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-search" onclick="searchBooks()">搜索</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-add" onclick="insertBook()">添加</a>
		</form>
	</div>

	<!-- 添加页面  -->
	<div id="addBook" class="easyui-dialog" title="添加员工"
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'保存',
				handler:function(){
					saveAddBook();
					}
			},{
				text:'关闭',
				handler:function(){
					closeAddBook();
				}
			}]">
		<form id="addfrm">
			<table>
				<tr>
					<td><label for="name">书名:</label></td>
					<td><input class="easyui-textbox" type="text" name="name"
						id="bname2" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">价格:</label></td>
					<td><input class="easyui-numberbox" type="text" name="sale"
						id="sale2" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">author:</label></td>
					<td><input class="easyui-numberbox" type="text" name="sale"
						id="author2" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">jianjie:</label></td>
					<td><input class="easyui-numberbox" type="text" name="sale"
						id="jianjie2" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">tuijian:</label></td>
					<td><input class="easyui-numberbox" type="text" name="sale"
						id="tuijian2" data-options="required:true" /></td>
				</tr>

				<tr>
					<td><label for="name">分类:</label></td>
					<td><select id="bcid2" class="easyui-combobox"
						style="height: auto;">
							<option>--请选择--</option>
					</select></td>
				</tr>

			</table>
		</form>
	</div>


	<!-- 修改页面 -->
	<div id="editBook" class="easyui-dialog" title="修改用户"
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true
		">
		<form id="editfrm">
			<input type="hidden" name=bid id="bid3" />
			<table>
				<tr>
					<td><label for="name">书名:</label></td>
					<td><input class="easyui-textbox" type="text" name="bname"
						id="bname3" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">价格:</label></td>
					<td><input class="easyui-numberbox" type="text" name="sale"
						id="sale3" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">author:</label></td>
					<td><input class="easyui-numberbox" type="text" name="author"
						id="author3" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">jianjie:</label></td>
					<td><input class="easyui-numberbox" type="text" name="jianjie"
						id="jianjie3" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">tuijian:</label></td>
					<td><input class="easyui-numberbox" type="text" name="tuijian"
						id="tuijian3" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">部门:</label></td>
					<td><select id="bcid3" name="deptid" class="easyui-combobox"
						style="width: 100px">

					</select></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>