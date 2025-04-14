<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.time.format.DateTimeFormatter"%>"UTF-8"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 이 비번 정규식 js도 사실 필요없어지긴 했지만, 이 jsp에서만 Jakarta common valid 적용한거라 남겨두겠음 -->
<script src="<c:url value='/js/modal_pw_regexp.js'/>"></script>
<!-- Jakarta common valid 적용해보기 -->
<!--for including generated Javascript Code(in validation-rules.xml)-->
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<!--for including generated Javascript Code(validateEmployee(), formName:커맨드 클래스 이름)-->
<validator:javascript formName="updateItemDto" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
function test(form){
	if(!validateUpdateItemDto(form)){
		return;
	}else{
		form.submit();
		console.log("valid 통과!")
	}
}
</script>
<body>

<div class="modal modal-lg" id="updateModal" tabindex="-1" aria-hidden="ture">
      <div class="modal-dialog modal-dialog-centered" style="margin-left:50%;">
        <div class="modal-content p-2" style="transform: translate(-50%); width:100vw; background-color: var(--main-1); border-width: 1px; border-color: white; border-style: solid; border-radius: 0px;">
		
		<!-- studio/item 과 studio/item/{id} 에서 사용하므로, action=""로 현재 URL 지정 -->
          <form:form action=""
                method="post" modelAttribute="updateItemDto">
            <div class="modal-header pb-0" style="border-width: 0px;">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="width: 3vw; height: 3vw; font-size: 0px;">
                <img class="img-fluid" src="<c:url value='/images/cmmn/modal/close.svg'/>"
                     style="width:70%"/>
              </button>
            </div>

            <div class="modal-body" style="padding-left: 5vw; padding-right: 5vw;">
              <div class="container d-flex flex-column">
                <!-- 상단 -->
                <div class="container d-flex flex-column" style="padding:0px; padding-bottom:1vw;" >

                  <div class="container d-flex flex-row " style="padding:0px; padding-bottom:1vw;">
                    <div class="container d-flex flex-column" style="padding:0px; padding-right:1vw;">
                      <label class="pb-2" style="font-size: 1.2vw; font-weight: 500;color: white;">
                      <spring:message code="label.item.location" text="작품ID" /></label>
                      <span style="font-size: 1.2vw; font-weight: 500;color: white;">
                      ${item.id}전시실</span>
                      <input id="id" name="id" value="${item.id}" hidden="true"/>

                    </div>
                    <div class="container d-flex flex-column" style="padding:0px; padding-left:1vw;">
                      <label for="nickName" class="pb-2" style="font-size: 1.2vw; font-weight: 500;color: white;" >
<spring:message code="label.item.nickname" text="작가명" /></label>
                      <input type="text" class="" id="nickname" name="nickname" value="${item.nickname}" placeholder="미입력 시 '익명'으로 출품됩니다." style="color: var(--text-2); letter-spacing: -0.16px; font-weight: 400; font-size: 1vw; background-color: var(--main-2); stroke-width: 1px; stroke: var(--line); border-width: 0px; padding: 1vw; padding-top: 0.5vw; padding-bottom: 0.5vw;"
                      >
                    </div>
                  </div>

                  <div class="container d-flex flex-row " style="padding:0px; ">
                    <div class="container d-flex flex-column " style="padding:0px; padding-right:1vw;">
                      <label class="pb-2" style="font-size: 1.2vw; font-weight: 500;color: white;">
<spring:message code="label.item.title" text="작품명" /></label>
                      <input type="text" class="" id="title" name="title" value="${item.title}" placeholder="미입력 시 ‘무제'로 출품됩니다." style="color: var(--text-2); letter-spacing: -0.16px; font-weight: 400; font-size: 1vw; background-color: var(--main-2); stroke-width: 1px; stroke: var(--line); border-width: 0px; padding: 1vw; padding-top: 0.5vw; padding-bottom: 0.5vw;"
                      >
                    </div>
                    <div class="container d-flex flex-column" style="padding:0px; padding-left:1vw;">
                      <label class="pb-2" style="font-size: 1.2vw; font-weight: 500;color: white;">
<spring:message code="label.item.password" text="비밀번호" /></label>
                      <%-- <input type="password" class="no-spin" id="password" name="password" value="${item.password}" pattern="\d+" required onkeypress='return checkNumber(event)' placeholder="숫자로 입력해주세요." style="color: var(--text-2); letter-spacing: -0.16px; font-weight: 400; font-size: 1vw; background-color: var(--main-2); stroke-width: 1px; stroke: var(--line); border-width: 0px; padding: 1vw; padding-top: 0.5vw; padding-bottom: 0.5vw;"> --%>
                      <input type="password" class="no-spin" id="password" name="password" value="${item.password}" pattern="\d+" placeholder="숫자로 입력해주세요." style="color: var(--text-2); letter-spacing: -0.16px; font-weight: 400; font-size: 1vw; background-color: var(--main-2); stroke-width: 1px; stroke: var(--line); border-width: 0px; padding: 1vw; padding-top: 0.5vw; padding-bottom: 0.5vw;">
                      <form:errors id="password" name="password" path="password" />
                      <span class="pt-2" style="color: var(--text-2); font-weight: 400; font-size: 0.8vw;">*정보 수정&작품 파기 시 사용됩니다.</span>
                    </div>
                  </div>

                </div>

                <!-- 하단 -->
                <div class="container d-flex flex-column p-0">
                  <label class="pb-2" style="font-size: 1.2vw; font-weight: 500;color: white;">
<spring:message code="label.item.content" text="작품설명" /></label>
                  <textarea type="text" class="no-scroll" id="content" name="content" placeholder="미입력 시 공란으로 출품됩니다." style="color: var(--text-2); letter-spacing: -0.16px; font-weight: 400; font-size: 1vw; background-color: var(--main-2); border-width: 0px; padding: 1vw; padding-top: 0.5vw; padding-bottom: 2vw;"
                  >${item.content}</textarea>
                </div>
              </div>
            </div>

            <div class="modal-body " style="padding-top:1vw; padding-bottom:5vw; padding-left: 5vw; padding-right: 5vw; border-width: 0px;">
              <div class="container">
                <button class="btn btn-light m-0" type="button" onclick="redirectSavedBgm(), test(this.form)"
                        style="width: 100%; height: 100%; border-radius: 0px;font-size: 1vw; padding:1vw;">
                  <span class="fw-bold" style="color: var(--main-1); font-size: 1.5em;">
<spring:message code="button.update.add" text="작품 수정하기" /></span>
                </button>
              </div>
            </div>
          </form:form>
        </div>
      </div>
    </div>
</body>


</html>