<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>瀏覽公布事項</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
.div {
	width: 98%;
	margin: 20px;
}
</style>
</head>
<body>
	<div class="div">
		<h1>公布事項</h1>
		<input type="button" value="新增" class="btn btn-primary"
			onclick="location.href='<c:url value='/billboard/add'/>'">
		<table class="table">
			<thead>
				<tr>
					<th>標題</th>
					<th>發佈日期</th>
					<th>截止日期</th>
					<th>修改</th>
					<th>刪除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${board}" var="board">
					<tr>
						<td>${board.title}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.publishDate}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.deadline}" /></td>
						<td><form action="<c:url value="/billboard/edit" />"
								method="get">
								<input type="hidden" name="id" value="${board.id}" /><input
									type="submit" class="btn btn-warning" value="編輯">
							</form></td>
						<td><form action="<c:url value="/billboard/delete" />"
								method="post">
								<input type="hidden" name="id" value="${board.id}" /> <input
									type="hidden" name="_method" value="delete" /> <input
									type="submit" class="btn btn-danger" value="刪除">
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>