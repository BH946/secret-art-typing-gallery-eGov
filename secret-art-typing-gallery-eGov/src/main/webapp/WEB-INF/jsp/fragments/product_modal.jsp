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

</body>
    <div class="modal modal-lg" id="productModal" tabindex="-1" aria-hidden="ture"
    th:fragment="productModal">
      <div class="modal-dialog modal-dialog-centered" style="margin-left:50%;">
        <div class="modal-content p-2" style="transform: translate(-50%); width:100vw; background-color: var(--main-1); border-width: 1px; border-color: white; border-style: solid; border-radius: 0px;">
        
		<!-- studio/item 과 studio/item/{id} 에서 사용하므로, action=""로 현재 URL 지정 -->
          <form action=""
                method="post">
          <div class="modal-header pb-0" style="border-width: 0px;">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="width: 3vw; height: 3vw; font-size: 0px;">
              <img class="img-fluid" src="<c:url value='/images/cmmn/modal/close.svg'/>" style="width:70%;"/>
            </button>
          </div>

          <div class="modal-body" style="padding-left: 5vw; padding-right: 5vw;">
            <div class="container d-flex flex-column">
              <!-- 상단 -->
              <div class="container d-flex flex-column " style="padding:0px; padding-bottom:1vw;">
                
                <div class="container d-flex flex-row " style="padding:0px; padding-bottom:1vw;" >
                  <div class="container d-flex flex-column " style="padding:0px; padding-right:1vw;">
                    <label class="pb-2" style="font-size: 1.2vw; font-weight: 500;color: white;">
<spring:message code="label.item.location" text="작품ID" /></label>
                    <span style="font-size: 1.2vw; font-weight: 500;color: white;">미부여</span>

                  </div>
                  <div class="container d-flex flex-column " style="padding:0px; padding-left:1vw;">
                    <label for="nickName" class="pb-2" style="font-size: 1.2vw; font-weight: 500;color: white;">
<spring:message code="label.item.nickname" text="작가명" /></label>
                    <input type="text" class="" id="nickName" name="nickName" placeholder="미입력 시 '익명'으로 출품됩니다." style="color: var(--text-2); letter-spacing: -0.16px; font-weight: 400; font-size: 1vw; background-color: var(--main-2); stroke-width: 1px; stroke: var(--line); border-width: 0px; padding: 1vw; padding-top: 0.5vw; padding-bottom: 0.5vw;"
                    >
                  </div>
                </div>

                <div class="container d-flex flex-row p-0 pb-2" >
                  <div class="container d-flex flex-column " style="padding:0px; padding-right:1vw;">
                    <label class="pb-2" style="font-size: 1.2vw; font-weight: 500;color: white;" >
<spring:message code="label.item.title" text="작품명" /></label>
                    <input type="text" class="" id="title" name="title" placeholder="미입력 시 ‘무제'로 출품됩니다." style="color: var(--text-2); letter-spacing: -0.16px; font-weight: 400; font-size: 1vw; background-color: var(--main-2); stroke-width: 1px; stroke: var(--line); border-width: 0px; padding: 1vw; padding-top: 0.5vw; padding-bottom: 0.5vw;"
                    >
                  </div>
                  <div class="container d-flex flex-column " style="padding:0px; padding-left:1vw;">
                    <label class="pb-2" style="font-size: 1.2vw; font-weight: 500;color: white;">
<spring:message code="label.item.password" text="비밀번호" /></label>
                    <input type="password" class="no-spin" id="password" name="password" pattern="\d+" required onkeypress='return checkNumber(event)' placeholder="숫자로 입력해주세요." style="color: var(--text-2); letter-spacing: -0.16px; font-weight: 400; font-size: 1vw; background-color: var(--main-2); stroke-width: 1px; stroke: var(--line); border-width: 0px; padding: 1vw; padding-top: 0.5vw; padding-bottom: 0.5vw;">
                    <span class="pt-2" style="color: var(--text-2); font-weight: 400; font-size: 0.8vw;">*정보 수정&작품 파기 시 사용됩니다.</span>
                  </div>
                </div>

              </div>
              
              <!-- 하단 -->
              <div class="container d-flex flex-column p-0">
                <label class="pb-2" style="font-size: 1.2vw; font-weight: 500;color: white;">
<spring:message code="label.item.content" text="작품설명" /></label>
                <textarea type="text" class="no-scroll" id="content" name="content" placeholder="미입력 시 공란으로 출품됩니다." style="color: var(--text-2); letter-spacing: -0.16px; font-weight: 400; font-size: 1vw; background-color: var(--main-2); border-width: 0px; padding: 1vw; padding-top: 0.5vw; padding-bottom: 2vw;"
                ></textarea>
              </div>
            </div>
          </div>

          <div class="modal-body" style="padding-bottom:5vw; padding-top:1vw; padding-left: 5vw; padding-right: 5vw; border-width: 0px;">
            <div class="container">
            <button class="btn btn-light m-0" type="submit" onclick="redirectSavedBgm()"
            style="width: 100%; height: 100%; border-radius: 0px;font-size: 1vw; padding:1vw;">
              <span class="fw-bold" style="color: var(--main-1); font-size: 1.5em;" >
<spring:message code="button.product.add" text="작품 전시하기" /></span>
            </button>
            </div>
          </div>
        </form>
        </div>
      </div>
    </div>
</html>
