<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
<!-- JSP include로 변경 -->
<jsp:include page="fragments/head.jsp">
	<jsp:param value="스튜디오" name="title" />
</jsp:include>
<title>"스튜디오" -> 태그 중복이면 브라우저는 첫번째 발견 태그를 사용(ex:title태그)</title>
</head>

<body>
    <!-- 커스텀 CSS -->
    <style>
    </style>
    
   	<!-- header -->
	<jsp:include page="fragments/header.jsp" />
	
	<hr style="color:white;"/>

    <!-- main 개발 -->
    <div class="custom-container-default">
      <!-- 상단 -->
      <div class="container" style="text-align: center;">
        <h4 style="color: white; font-weight: 700; font-size:1.3vw">작품이 완성되었습니다</h4>
        <span style="font-size: 1vw; color: var(--text-2); font-weight: 400;">완성된 작품은 안전하게 이미지화되어 타인이 내용을 파악할 수 없어요.</span>
        <%-- <div class="field-error">
		    <c:if test="${not empty bindingResult.fieldErrors['imgSrc']}">
		        이미지 오류: <c:out value="${bindingResult.fieldErrors['imgSrc'][0].defaultMessage}" />
		    </c:if>
		</div> --%>
		<div class="field-error">
		    <c:if test="${not empty bindingResult.fieldErrors}">
		    	비밀번호 오류
		        <%-- 비밀번호 오류: <c:out value="${bindingResult.fieldErrors}" /> --%>
		    </c:if>
		</div>
      </div>

      <!-- 중단 -->
		<jsp:include page="fragments/album.jsp" />

      <!-- 하단 -->
      <div class="d-flex" style="padding-right:1vw; padding-left:1vw;">
        <div style="flex:1;">
          <div class="row m-0" style="height: 100%;">
            <div class="col-4 ps-0">
              <form action="/gallery" method="get">
                <button class="btn btn-light" type="submit" onclick="redirectSavedBgm()"
                style="padding:1vw; width: 100%; height: 100%; border-radius: 0px;background-color: var(--main-1); font-size: 1vw;" >
                  <span class="fw-bold" style="color: white; font-size: 1.5vw;">
                  <spring:message code="button.prev" text="다른 전시실 둘러보기"/></span>
                </button>
              </form>
            </div>
            <div class="col-8 pe-0">
            <c:if test="${item.id == null}" >
              <button class="btn btn-light" type="button" data-bs-toggle="modal" data-bs-target="#productModal"
                      onclick="redirectSavedBgm()"
                      style="padding:1vw; width: 100%; height: 100%; border-radius: 0px;font-size: 1vw;">
                <span class="fw-bold" style="color: var(--main-1); font-size: 1.5vw;" >
                <spring:message code="button.product" text="갤러리에 전시하기"/></span>
              </button>
             </c:if>
             <c:if test="${item.id != null}" > 
              <button class="btn btn-light" type="button" data-bs-toggle="modal" data-bs-target="#updateModal"
                      onclick="redirectSavedBgm()"
                      style="padding:1vw; width: 100%; height: 100%; border-radius: 0px;font-size: 1vw;">
                <span class="fw-bold" style="color: var(--main-1); font-size: 1.5vw;">
                <spring:message code="button.update" text="수정하기"/></span>
              </button>
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
   	<!-- footer -->
	<jsp:include page="fragments/footer.jsp" />
	
    <!-- productModal or updateModal 로드 -> gallery-item에서 본 update_delete_modal.jsp 가 아님 -->
	<jsp:include page="fragments/product_modal.jsp"/>
	<jsp:include page="fragments/update_modal.jsp"/>
</body>
</html>