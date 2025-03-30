<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<body>
<!-- footer -->
<footer class="custom-footer" style="height:15vh;">
  <br><br>
  <span style="font-family: 'SUITE-Regular', sans-serif; font-size:0.8vw;">
  	<!-- text속성은 기본값, code값이 우선순위 -->
    <spring:message code="footer.tag" text="Copyright © 2023 YE-BEEN. All Rights Reserved!" />
  </span>
</footer>
</body>
</html>