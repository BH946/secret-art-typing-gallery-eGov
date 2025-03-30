<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- fragment 대신 파라미터를 받는 방식으로 변경 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap5: CSS + JS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- 커스텀(기본) CSS -->
<link rel="stylesheet" href="/css/basic.css"/>

<!-- jquery 임포트 + 자동완성 기능위해 jqueryui 임포트 -->
<script src="<c:url value='/js/cmmn/jquery.js'/>"></script>
<script src="<c:url value='/js/cmmn/jqueryui.js'/>"></script>

<!-- bgm.js 임포트(전역 사용) -->
<script src="<c:url value='/js/cmmn/bgm.js'/>"></script>

<!-- title 파라미터 사용 -->
<title>${param.title}</title>

</head>
<body>
</body>
</html>