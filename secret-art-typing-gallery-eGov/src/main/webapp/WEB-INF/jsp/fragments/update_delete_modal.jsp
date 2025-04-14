<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html>
<script src="<c:url value='/js/modal_pw_regexp.js'/>"></script>
<body>
<!-- 실질적으로 비밀번호 입력만 있는 창(모달) -->
<div class="modal modal-lg" id="${param.operate}Modal" tabindex="-1" aria-hidden="ture">
<div class="modal-dialog modal-dialog-centered" style="margin-left:50%;  ">
  <div class="modal-content" style="transform: translate(-50%); width:100vw; background-color: var(--main-1); border-width: 1px; border-color: white; border-style: solid; border-radius: 0px; padding-left: 3vw; padding-right: 3vw; padding-top: 2vw; padding-bottom: 3vw">
    <form action="/gallery/${param.operate}/${findItemDto.id}" method="post">
      <div class="modal-header pb-0" style="border-width: 0px;">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="width: 3vw; height: 3vw; font-size: 0px;">
          <img class="img-fluid" src="<c:url value='/images/cmmn/modal/close.svg'/>"
             style="width:70%"/>
        </button>
      </div>
		<input type="hidden" id="pageIndex" name="pageIndex" value="${param.pageIndex}"/>
      <div class="modal-body" style="">
        <div class="container d-flex flex-column " style="padding:0px; padding-bottom:2vw;">
          <label for="password" class="pb-2" style="font-size: 2vw; font-weight: 500;color: white;">비밀번호 입력</label>
          <span class="" style="padding-bottom:1vw; width:30vw; color: var(--text-2); font-weight: 400; font-size: 1.2vw; letter-spacing: -0.16px;">작품을 등록할 때 입력하신 비밀번호를 다시 한 번 입력해주세요.</span>
          <input type="password" class="no-spin" id="password" name="password" pattern="\d+" required onkeypress='return checkNumber(event)' placeholder="비밀번호 입력" style=" color: var(--text-2); letter-spacing: -0.16px; font-weight: 400; font-size: 1vw; background-color: var(--main-2); stroke-width: 1px; stroke: var(--line); border-width: 0px; padding: 1vw; padding-top: 0.5vw; padding-bottom: 0.5vw;">
        </div>
      </div>

      <div class="modal-footer" style="border-width: 0px; padding-left: 16px; padding-right:16px;">
        <div class="container d-flex flex-row p-0 m-0" >
          <button class="btn btn-light" type="button" data-bs-dismiss="modal" aria-label="Close"
          style="padding:1vw; flex:1; background-color: var(--main-1); border-color: var(--line); border-radius: 1px; font-size: 1vw;">
            <span class="fw-bold" style="color: white; font-size: 1.5em;">
<spring:message code="button.cancel" text="취소" /></span>
          </button>
          <button class="btn btn-light" type="submit" onclick="redirectSavedBgm()"
          style="padding:1vw; flex:1; border-radius: 0px; font-size: 1vw;">
            <span class="fw-bold" style="color: var(--main-1); font-size: 1.5em;">
<spring:message code="button.ok" text="확인" /></span>
          </button>
        </div>
      </div>
    </form>
  </div>
</div>
</div>

</body>
</html>