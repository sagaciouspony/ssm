<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>SSM整合</title>
		
		<link href="<c:url value='/static/bootstrap-3.3.7-dist/css/bootstrap.min.css'/>" rel="stylesheet">
		
		<script type="text/javascript" src="<c:url value='/static/js/jquery-2.1.0.js'/>"></script>
		
		<script type="text/javascript" src="<c:url value='/static/bootstrap-3.3.7-dist/js/bootstrap.min.js'/>"></script>
	</head>
	<body>
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
				<button class="btn btn-success">添加</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-hover table-bordered">
					<tr>
						<th>id</th>
						<th>name</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<th>${emp.id }</th>
							<th>${emp.pname }</th>
							<th>${emp.gender=="m"?"男":"女" }</th>
							<th>${emp.email }</th>
							<th>${emp.department.dname }</th>
							<th>
								<button class="btn btn-success btn-sm">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
								</button>
								<button class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								删除</button>
							</th>
						</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
		
		<!-- 分页信息 -->
		<div class="row">
			<div class="col-md-6">
				当前第${pageInfo.pageNum }页 总共${pageInfo.pages }页 总共${pageInfo.total }条记录
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<c:choose>
				  		<c:when test="${pageInfo.pageNum==1 }">
				  			<li class="disabled"><a>首页</a></li>
				  		</c:when>
				  		<c:otherwise><li><a href="<c:url value='/emps?pageNum=1'/>">首页</a></li></c:otherwise>
				  	</c:choose>
				  	
				  	<c:choose>
				  		<c:when test="${pageInfo.pageNum==1 }">
				  			<li class="disabled"><a aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span></a> </li>
				  		</c:when>
				  		<c:otherwise>
				  			<li><a href="<c:url value='/emps?pageNum=${pageInfo.pageNum-1 }'/>" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span></a> </li>
				    	</c:otherwise>
				  	</c:choose>
				  
				    <c:forEach items="${pageInfo.navigatepageNums }" var="number">
				    	<c:choose>
				    		<c:when test="${number==pageInfo.pageNum }">
				    			<li class="active"><a href="<c:url value='/emps?pageNum=${number }'/>">${number }</a></li>
				    		</c:when>
				    		<c:otherwise>
				    			<li><a href="<c:url value='/emps?pageNum=${number }'/>">${number }</a></li>
				    		</c:otherwise>
				    	</c:choose>
				    </c:forEach>
				   
				   <c:choose>
				  		<c:when test="${pageInfo.pageNum==pageInfo.pages }">
				  			<li class="disabled"><a href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span></a></li>
				  		</c:when>
				  		<c:otherwise>
					  		<li><a href="<c:url value='/emps?pageNum=${pageInfo.pageNum+1 }'/>" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span></a></li>
				        </c:otherwise>
				  	</c:choose>
				    
				    <c:choose>
				  		<c:when test="${pageInfo.pageNum==pageInfo.pages }">
				  			<li class="disabled"><a>尾页</a></li>
				  		</c:when>
				  		<c:otherwise> <li><a href="<c:url value='/emps?pageNum=${pageInfo.pages }'/>">尾页</a></li></c:otherwise>
				  	</c:choose>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
	</body>
</html>