<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <br>
    <a href="${pageContext.request.contextPath }/employee/index">进入员工列表</a>
	<hr>

	<!-- Standard button -->
	<button type="button" class="btn btn-default">（默认样式）Default</button>

	<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
	<button type="button" class="btn btn-primary">（首选项）Primary</button>

	<!-- Indicates a successful or positive action -->
	<button type="button" class="btn btn-success">（成功）Success</button>

	<!-- Contextual button for informational alert messages -->
	<button type="button" class="btn btn-info">（一般信息）Info</button>

	<!-- Indicates caution should be taken with this action -->
	<button type="button" class="btn btn-warning">（警告）Warning</button>

	<!-- Indicates a dangerous or potentially negative action -->
	<button type="button" class="btn btn-danger">（危险）Danger</button>

    <br>

</body>
</html>