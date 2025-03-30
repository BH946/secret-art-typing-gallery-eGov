<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
  <!-- nav 커스텀 script -->
  <script src="<c:url value='/js/header_nav_custom.js'/>"></script>
  <body>
    <!-- header -->
    <nav class="navbar navbar-expand-md navbar-dark p-0 fixed-top" id="navTop" 
    style="height: 15vh; background-color: var(--main-1); opacity:1">
      <div class="container-fluid" style="height:100%;
      padding-left:3vw; padding-right:3vw; padding-top:0px; padding-bottom: 0px;">
        <div class="nav-left" style="flex:1;">
          <a class="navbar-brand" href="/" onclick="redirectSavedBgm()"
          style="height: 100%;">
            <img class="img-fluid" src="<c:url value='/images/cmmn/secret.svg'/>"
              style="width: 100%;"/>
          </a>
        </div>
        <div class="collapse navbar-collapse" id="navbarNav"
             style="height:100%; flex:6;">
          <ul class="navbar-nav justify-content-center" style="flex:1; height:100%;">
            <li class="nav-item d-flex p-0" id="nav-item-first">
              <a class="nav-link flex-column d-flex" id="custom-nav-item1" style="flex:1; justify-content: center;" aria-current="page" href="/lobby" onclick="change_nav(event); redirectSavedBgm()">
                <spring:message code="page.lobby" text="로비" />
                <span class="nav-item-inner">1F</span>
              </a>
            </li>
            <li class="nav-item d-flex p-0">
              <a class="nav-link flex-column d-flex" id="custom-nav-item2" style="flex:1; justify-content: center;" aria-current="page" href="/gallery" onclick="change_nav(event); redirectSavedBgm()">
                <spring:message code="page.gallery" text="전시실" />
<%--                 <span class="nav-item-inner">B1 ~ B<fmt:formatNumber value="${paginationInfo.getTotalRecordCount() / paginationInfo.getRecordCountPerPage()}" pattern="#" />F</span> --%>
                <span class="nav-item-inner">B1 ~ B<fmt:formatNumber value="${paginationInfo.getTotalPageCount()}" pattern="#" />F</span>
              </a>
            </li>
            <li class="nav-item d-flex p-0">
              <a class="nav-link flex-column d-flex" id="custom-nav-item3" style="flex:1; justify-content: center;" aria-current="page" href="/studio" onclick="change_nav(event); redirectSavedBgm()">
                <spring:message code="page.studio" text="작품 제작실" />
                <span class="nav-item-inner">??F</span>
              </a>
            </li>
          </ul>
        </div>
        <div class="nav-right d-flex" style="flex:1; justify-content: end;">
          <a class="nav-link"  onclick="speakerClick()" style="width:30%; cursor:pointer;">
            <img class="speakerImg img-fluid" src="<c:url value='/images/cmmn/speaker.svg'/>"
                 style="width: 100%;"/>
            <audio id="bgm" loop>
              <source src="<c:url value='/audio/mix_bgm.mp3'/>" type="audio/mpeg">
              브라우저가 오디오 요소를 지원하지 않습니다.
            </audio>
          </a>
        </div>
      </div>
      
		<!-- bgm.js 는 head에서 import -->
    </nav>

</body>
</html>