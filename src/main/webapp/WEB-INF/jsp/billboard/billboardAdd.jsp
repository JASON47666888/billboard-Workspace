<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增公布事項</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://cdn.ckeditor.com/ckeditor5/37.1.0/classic/ckeditor.js"></script>

<style>
.container {
	width: 1000px;
	margin: 20px 0px;
}
</style>

<script>
	window.onload = function() {
		ClassicEditor
	    .create( document.querySelector('#editor') )
	    .then( editor => {
	        editor.model.document.on('change', () => {
	            let content = editor.getData();
	            content = content.replace(/<[^>]+>/g, ''); // 刪除所有 HTML 標籤
	            let hiddenInput = document.querySelector('input[name="content"]');
	            hiddenInput.value = content;
	        });
	    })
	    .catch( error => {
	        console.error( error );
	    });
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="col-md-6 mb-3">
					<h1>新增</h1>
				</div>
				<form:form method="POST" action="${contextRoot}/billboard/creat"
					modelAttribute="billboard">
					<div class="col-md-6 mb-3  form-group">
						<form:label path="title">
							<h4>標題:</h4>
						</form:label>
						<form:input path="title" class="form-control" required="true" />
					</div>
					<div class="col-md-6 mb-3 form-group">
						<form:label path="publishDate">
							<h4>發布日期:</h4>
						</form:label>
						<form:input path="publishDate" class="form-control" type="date"
							required="true" />
					</div>
					<div class="col-md-6 mb-3 form-group">
						<form:label path="deadline">
							<h4>截止日期:</h4>
						</form:label>
						<form:input path="deadline" class="form-control" type="date"
							required="true" />
					</div>
					<div class="col-md-6 mb-3">
						<form:label path="publisher">
							<h4>公布者: Administrator</h4>
						</form:label>
						<form:input path="publisher" value="Administrator" type="hidden"
							required="true" />
					</div>

					<form:label path="content">
						<h4>公佈內容:</h4>
					</form:label>
					<form:input path="content" type="hidden"></form:input>
					<div class="container">
						<textarea id="editor"></textarea>
					</div>
					<input class="btn btn-danger submit" type="submit" value="新增" />
					<a class="btn btn-primary" href="${contextRoot}/billboard/all">取消</a>

				</form:form>
			</div>
		</div>
	</div>
</body>
</html>