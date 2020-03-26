<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>SSM整合</title>

<link href="<c:url value='/static/bootstrap-3.3.7-dist/css/bootstrap.min.css'/>" rel="stylesheet">

<script type="text/javascript" src="<c:url value='/static/js/jquery-2.1.0.js'/>"></script>

<script type="text/javascript" src="<c:url value='/static/bootstrap-3.3.7-dist/js/bootstrap.min.js'/>"></script>
</head>

<body>


	<!-- UpdateModal -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<p id="emp_UpdatePname" class="form-control-static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="emp_UpdateEmail"
									name="email" placeholder="emp_email"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" value="m" checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" value="f"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门名称</label>
							<div class="col-sm-4">
								<select id="upateForm_deptMessage" class="form-control"
									name="did" id="emp_Updatedid"></select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="updateFormDataBtn" type="button"
						class="btn btn-primary">更新</button>
				</div>
			</div>
		</div>
	</div>

	<!-- AddModal -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="emp_pname"
									name="pname" placeholder="emp_pname"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="emp_email"
									name="email" placeholder="emp_email"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="emp_gender1" value="m" checked="checked">
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="emp_gender2" value="f"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门名称</label>
							<div class="col-sm-4">
								<select id="addForm_deptMessage" class="form-control" name="did"
									id="emp_did"></select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="saveFormDataBtn" type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CURD</h1>
			</div>
		</div>

		<!-- 两个按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button id="addEmpBtn" class="btn btn-success">添加</button>
				<button id="deleteEmpBtn" class="btn btn-danger">删除</button>
			</div>
		</div>

		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table id="empTable"
					class="table table-striped table-hover table-bordered">
					<thead>
						<tr>
							<th><input type="checkbox" id="selectAll"></th>
							<th>#</th>
							<th>name</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="empList"></tbody>
				</table>
			</div>
		</div>

		<!-- 分页信息 -->
		<div class="row">
			<div id="pageMessage" class="col-md-6"></div>

			<div id="pageFenye" class="col-md-6"></div>
		</div>
	</div>

	<script type="text/javascript">
	
		var nowPageNum = 1;
	
		$(function() {
	
			loadPage(nowPageNum);
		});
	
		//为添加绑定事件
		$("#addEmpBtn").click(function() {
			//打开模态框
			$("#empAddModal").modal();
	
			loadDept($("#addForm_deptMessage"));
		});
	
		//校验用户名是否重复
		function isRepeated() {
			$.ajax({
				url : "<c:url value='/emp'/>",
				type : "GET",
				data : "pname=" + $("#emp_pname").val(),
				success : function(result) {
	
					if (result.extendData.isRepeated == "true") {
	
						$("#emp_pname").parent().addClass("has-error");
						$("#emp_pname").next("span").text("用户名重复!");
					}
				}
			});
		}
	
		function checkSaveFormDataBtn() {
			$("#saveFormDataBtn").removeAttr("disabled");
	
			var isNameError = $("#emp_pname").parent().hasClass("has-error");
	
			var isEmailError = $("#emp_email").parent().hasClass("has-error");
	
			if (isNameError || isEmailError) {
	
				$("#saveFormDataBtn").attr("disabled", "disabled");
			}
		}
	
		$("#emp_pname").change(function() {
	
			$("#emp_pname").parent().removeClass("has-error");
			$("#emp_pname").next("span").text("");
	
			var pname = $("#emp_pname").val();
			var nameRegex
			= /(^[a-zA-Z0-9_-]{4,10}$)|(^[\u2E80-\u9FFF]{2,4}$)/;
	
			if (!nameRegex.test(pname)) {
	
				$("#emp_pname").parent().addClass("has-error");
				$("#emp_pname").next("span").text("姓名不规范");
			} else {
				isRepeated();
			}
			checkSaveFormDataBtn();
		});
	
		$("#emp_email").change(function() {
	
			$("#emp_email").parent().removeClass("has-error");
			$("#emp_email").next("span").text("");
	
			var email = $("#emp_email").val();
			var emailRegex = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	
			if (!emailRegex.test(email)) {
	
				$("#emp_email").parent().addClass("has-error");
				$("#emp_email").next("span").text("邮箱不规范");
			}
	
			checkSaveFormDataBtn();
		});
	
		//saveFormDataBtn
		$("#saveFormDataBtn").click(function() {
	
			if ($("#emp_pname").val() != "" && $("#emp_email").val() != "") {
	
				var obj = $("#empAddModal form").serialize();
				$.ajax({
					url : "<c:url value='/emp'/>",
					type : "POST",
					data : obj,
					success : function(result) {
	
						var extendData = result.extendData;
						//判断
						if (result.code == 200) {
	
							if (extendData.errors.pname != null) {
	
								$("#emp_pname").parent().addClass("has-error");
								$("#emp_pname").next("span").text(extendData.errors.pname);
							}
	
							if (extendData.errors.email != null) {
	
								$("#emp_email").parent().addClass("has-error");
								$("#emp_email").next("span").text(extendData.errors.email);
							}
	
						} else {
							//关闭模态框
							$("#empAddModal").modal('hide')
							//显示最后一页
							loadPage(99999);
						}
					}
				});
			} else {
	
				alert("姓名或者邮箱不能为空");
			}
		});
	
		function loadDept(select) {
			select.empty();
			$.ajax({
				url : "<c:url value='/depts'/>",
				type : "GET",
				success : function(result) {
					//解析部门信息
					var deptList = result.extendData.deptList;
					$.each(deptList, function(index, item) {
						$("<option></option>").attr("value", item.did).append(item.dname).appendTo(select);
					});
				}
			});
		}
	
		function loadPage(pageNum) {
			$.ajax({
				url : "<c:url value='/emps'/>",
				data : "pageNum=" + pageNum,
				type : "GET",
				success : function(result) {
	
					nowPageNum = result.extendData.pageInfo.pageNum;
	
					//console.log(result);
					//解析并且显示员工数据
					ctrateEmp(result);
					ctratePageMessage(result);
					createPage(result);
				}
			});
		}
	
		function createPage(result) {
			$("#pageFenye").empty();
	
			var pageInfo = result.extendData.pageInfo;
	
			var ul = $("<ul></ul>").addClass("pagination");
	
			var firstLiA = $("<a></a>").attr("href", "#").append($("<span></span>").append("首页"));
			var firstLi = $("<li></li>").append(firstLiA);
	
			var preLiA = $("<a></a>").attr("href", "#").append($("<span></span>").append("&laquo;"));
			var preLi = $("<li></li>").append(preLiA);
	
			if (pageInfo.pageNum == 1) {
				firstLi.addClass("disabled");
				preLi.addClass("disabled");
			} else {
	
				firstLi.click(function() {
					loadPage(1);
				});
	
				preLi.click(function() {
					loadPage(pageInfo.pageNum - 1);
				});
			}
	
			ul.append(firstLi).append(preLi);
	
			$.each(pageInfo.navigatepageNums, function(index, item) {
	
				var liA = $("<a></a>").attr("href", "#").append($("<span></span>").append(item));
				var li = $("<li></li>").append(liA);
	
				li.click(function() {
					loadPage(item);
				});
	
				if (pageInfo.pageNum == item) {
					li.addClass("active");
				}
	
				ul.append(li);
			});
	
			var nextLiA = $("<a></a>").attr("href", "#").append($("<span></span>").append("&raquo;"));
			var nextLi = $("<li></li>").append(nextLiA);
	
			var lastLiA = $("<a></a>").attr("href", "#").append($("<span></span>").append("尾页"));
			var lastLi = $("<li></li>").append(lastLiA);
	
			if (pageInfo.pageNum == pageInfo.pages) {
				nextLi.addClass("disabled");
				lastLi.addClass("disabled");
			} else {
	
				nextLi.click(function() {
					loadPage(pageInfo.pageNum + 1);
				});
	
				lastLi.click(function() {
					loadPage(pageInfo.pages);
				});
			}
	
			ul.append(nextLi).append(lastLi);
	
			$("<nav></nav>").append(ul).appendTo($("#pageFenye"));
	
		}
	
		function ctratePageMessage(result) {
			$("#pageMessage").empty();
	
			var pageInfo = result.extendData.pageInfo;
	
			var message = "当前第" + pageInfo.pageNum + "页,总共" + pageInfo.pages + "页,总共" + pageInfo.total + "条记录.";
	
			$("#pageMessage").append(message);
	
		}
	
		function ctrateEmp(result) {
			$("#empList").empty();
	
			var emps = result.extendData.pageInfo.list;
	
			$.each(emps, function(index, item) {
	
				var checkEle = $("<input type='checkbox'>").addClass("selectEmp").attr("empId", item.id);
				var checkTh = $("<th></th>");
				checkTh.append(checkEle);
				var idTh = $("<th></th>").append(item.id);
				var pnameTh = $("<th></th>").append(item.pname);
				var genderTh = $("<th></th>").append(item.gender == 'm' ? "男" : "女");
				var emailTh = $("<th></th>").append(item.email);
				var dnameTh = $("<th></th>").append(item.department.dname);
	
				/*	
					创建两个按钮
					<th>
						<button class="btn btn-success btn-sm">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑
						</button>
						<button class="btn btn-danger btn-sm">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							删除
						</button>
					</th>
				*/
	
				var btn1 = $("<button></button>").addClass("btn btn-success btn-sm editBtn");
				var btn1span = $("<span></span>").addClass("glyphicon glyphicon-pencil");
				var btnEdit = btn1.append(btn1span).append("编辑");
	
				var btn2 = $("<button></button>").addClass("btn btn-danger btn-sm deleteBtn");
				var btn2span = $("<span></span>").addClass("glyphicon glyphicon-remove");
				var btnDelete = btn2.append(btn2span).append("删除");
	
				btnEdit.attr("edit_empid", item.id);
				btnDelete.attr("delete_empid", item.id);
	
				var btnTh = $("<th></th>").append(btnEdit).append(" ").append(btnDelete);
	
				$("<tr></tr>")
					.append(checkTh)
					.append(idTh)
					.append(pnameTh)
					.append(genderTh)
					.append(emailTh)
					.append(dnameTh)
					.append(btnTh)
					.appendTo("#empTable");
			});
		}
	
		//	为按钮绑定事件  因为是创建按钮之后绑定事件
		$(document).on("click", ".editBtn", function() {
			//	加载开发部门
			loadDept($("#upateForm_deptMessage"));
			//	回显员工数据
			var empId = $(this).attr("edit_empid");
			loadEmpData(empId);
	
			//	将empid传递给更新按钮
			$("#updateFormDataBtn").attr("edit_empid", empId);
			$("#empUpdateModal").modal();
		});
	
		function loadEmpData(id) {
			$.ajax({
				url : "<c:url value='/emp'/>" + "/" + id,
				type : "GET",
				success : function(result) {
					var emp = result.extendData.emp;
					$("#emp_UpdatePname").text(emp.pname);
					$("#emp_UpdateEmail").val(emp.email);
					$("#empUpdateModal input[type='radio']").val([ emp.gender ]);
					$("#empUpdateModal select").val([ emp.did ]);
				}
			});
		}
	
	
		$("#updateFormDataBtn").click(function() {
	
			//校验邮箱
	
			var empid = $(this).attr("edit_empid");
	
			//console.log(empid);
			//封装表单数据
			var emp = $("#empUpdateModal form").serialize();
	
			console.log(emp);
	
			//发送ajax请求
			//如果是put请求 tomcat不会封装数据
			$.ajax({
				//+"/"+empId.val()
				url : "<c:url value='/emp'/>" + "/" + empid,
				type : "POST",
				data : emp + "&_method=PUT",
				success : function(result) {
	
					//console.log(result);
					//关闭模态框
					$("#empUpdateModal").modal('hide')
					//返回当前页面
					loadPage(nowPageNum);
				}
			});
		});
	
		//为删除按钮添加事件
		$(document).on("click", ".deleteBtn", function() {
	
			var empName = $(this).parents("tr").find("th:eq(2)").text();
	
			var empId = $(this).attr("delete_empid");
	
			if (confirm("确认删除[" + empName + "]?")) {
	
				$.ajax({
					url : "<c:url value='/emp'/>" + "/" + empId,
					type : "DELETE",
					success : function(result) {
	
						//回显当前页面
						loadPage(nowPageNum);
					}
				});
			}
		});
	
	
		//为全选框绑定事件
		$("#selectAll").click(function() {
			var isChecked = $(this).prop("checked");
	
			$(".selectEmp").prop("checked", isChecked);
		});
	
		//为每一个单选框绑定事件
		$(document).on("click", ".selectEmp", function() {
	
			//被选中的单选框
			var checkedLength = $(".selectEmp:checked").length;
	
			//所有的单选框
			var length = $(".selectEmp").length;
	
			if (length == checkedLength) {
				$("#selectAll").prop("checked", "checked");
			} else {
				$("#selectAll").prop("checked", "");
			}
		});
	
		//批量删除
		$("#deleteEmpBtn").click(function() {
	
			var checkedList = $(".selectEmp:checked");
	
			var empNames = "";
	
			var empIdArray = new Array();
	
			$.each(checkedList, function(index, item) {
	
				var empName = $(this).parents("tr").find("th:eq(2)").text();
	
				empNames = empNames + empName + " ";
	
				empIdArray[index] = $(this).parents("tr").find("th:eq(1)").text();
			});
	
			if (confirm("确认删除["+empNames+"]?")) {
	
				$.ajax({
					url : "<c:url value='emps'/>" + "/" + empIdArray,
					type : "DELETE",
	
					success : function(result) {
						
						//返回当前页
						alert("删除成功");
						loadPage(nowPageNum);
					}
				});
			}
		});
	</script>
</body>
</html>