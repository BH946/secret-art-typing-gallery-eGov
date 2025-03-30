<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- JSP include로 변경 -->
<jsp:include page="fragments/head.jsp">
	<jsp:param value="로비" name="title" />
</jsp:include>
<title>"로비" -> 태그 중복이면 브라우저는 첫번째 발견 태그를 사용(ex:title태그)</title>
</head>
<body>
  <style>
        body{
          margin-top: 0px;
        }
        .parent{
          position: relative;
        }
        .absolute{
          position: absolute;
        }

        .speakerA{
          position: absolute; width: 3vw; top:90%; left:95%; transform: translate(-50%, -50%);
          border-radius: 50%; border-width: 1px; border-style: solid; border-color: white;
          padding: 0.5vw;
          position: fixed;
        }

        @media all and (min-width: 1921px) and (max-width: 4096px) {
            body {
                cursor: url('/images/cmmn/cursor.svg') 10 60, auto;
            }
            #enterBtn {
                cursor: url('/images/cmmn/cursor.svg') 10 60, auto;
            }
        }
        @media all and (max-width: 1920px) {
            body, #enterBtn {
                cursor: url('/images/cmmn/cursor_1920.svg') 10 60, auto;
            }
        }
  </style>

  <!-- 상단 -->
  <div class="parent" style="height: 100%; width:100%; padding-bottom:3vw;">
    <!-- 자리차지용 -->
    <img class="img-fluid" src="<c:url value='/images/lobby/lobby-header.png'/>"
         style="width: 100%; visibility: hidden;"/>
    <!-- 실제내용 -->
    <img class="img-fluid child absolute" src="<c:url value='/images/lobby/lobby-header.png'/>"
         style="width: 100%; top:0%; left:0%;"/>
    <a class="child absolute" style="top:30%; left:20%; width:4%; height:15%; cursor:url('/images/cmmn/cursor.svg') 10 60, pointer;" onclick="redirectSavedBgm()"
    href="gallery">

    </a>
    <a class="child absolute" style="top:20%; left:85%; width:8%; height:50%; cursor:url('/images/cmmn/cursor.svg') 10 60, pointer;" onclick="redirectSavedBgm()"
       href="#">

    </a>
  </div>
  <!-- 제목(층수) -->
  <div class="d-flex flex-column" style="min-height: 0vh; padding-bottom: 0px; text-align: center;">
    <div class="container" style="text-align: center;">
          <span style="font-weight: 500; color: white; font-size: 1.4vw;" >1F</span>
    </div>
    <div class=" d-flex justify-content-center" style="width: 100%;">
      <div class="d-flex justify-content-center " style="flex:0.5;">
        <img class="img-fluid" src="<c:url value='/images/lobby/6-1.svg'/>"
             style="width: 100%;"/>
        <span class="px-3" th:text="로비" style="font-size: 2vw; font-weight: 700; color: white; white-space: nowrap;"></span>
        <img class="img-fluid" src="<c:url value='/images/lobby/6-2.svg'/>"
             style="width: 100%;"/>
      </div>
    </div>
  </div>


  <!-- 그림 나열 -->
  <div class="parent" style="text-align:center;">
    <!-- 자리차지용 -->
    <div style="visibility: hidden;">
      <span style="padding:1.5vw; padding-bottom:0px; font-size: 3.5vw; font-weight: 500; color: white;">갤러리 방문을 환영합니다!</span><br>
      <span style="font-size: 3.5vw; font-weight: 700; color: white;">스크롤하여 안내문을 읽어주세요</span>
    </div>
    <!-- 실제내용 -->
    <div class="child absolute" style="top:4%; left:50%; transform: translate(-50%); z-index:-1;">
      <span style="padding:1.5vw; padding-bottom:0px; font-size: 3.5vw; font-weight: 500; color: white;">갤러리 방문을 환영합니다!</span><br>
      <span style="font-size: 3.5vw; font-weight: 700; color: white;">스크롤하여 안내문을 읽어주세요</span>
    </div>
    <img class="img-fluid" src="<c:url value='/images/lobby/lobby-group.png'/>"
         style="width: 100%; padding-left:3%;"/>
  </div>
  <div class="parent" style="text-align:center;">
    <!-- 자리차지용 -->
    <img class="img-fluid" src="<c:url value='/images/lobby/lobby-invite.png'/>"
         style="width: 70%; visibility: hidden;"/>
    <!-- 실제내용 -->
    <img class="img-fluid child absolute" src="<c:url value='/images/lobby/lobby-invite.png'/>"
         style="width: 70%; top:-10%; left:50%; transform: translate(-50%); z-index:-1;"/>
  </div>

  <!-- 버튼 -->
  <div class="custom-container-default" style="margin-top: 0px; margin-bottom: 5vw; padding-bottom: 0px; padding-top: 0px;">
    <div class="d-flex flex-column" style="justify-items: center; text-align: center; ">
      <a class="btn btn-light" type="button" id="enterBtn" onclick="redirectSavedBgm()"
         style="font-size: 1vw; 
          align-self: center;  width: 30vw; padding:1vw;"
         href="studio">
        <span class="fw-bold" id="enterBtn1" style="font-size: 1.3vw; white-space: nowrap;">작품제작실로 이동</span>
      </a>
      <div style="padding:1.5vw;">
        <a href="/" onclick="redirectSavedBgm()"
           style="font-size:1.2vw ;text-decoration: none; color: var(--text-2); ">
          <span >처음으로</span>
        </a>
      </div>
    </div>
  </div>


	<!-- speaker -->
	<a class="speakerA" onclick="speakerClick()" style="cursor: pointer;">
		<img class="speakerImg img-fluid"
		src="<c:url value='/images/cmmn/speakerNo.svg'/>"
		style="width: 100%;" /> <audio id="bgm" autoplay loop>
			<!--        <source th:src="@{|/glossy-168156.mp3|}" type="audio/mpeg">-->
			<source src="<c:url value='/audio/mix_bgm.mp3'/>" type="audio/mpeg">
			브라우저가 오디오 요소를 지원하지 않습니다.
		</audio>
	</a>


  <!-- footer -->
	<jsp:include page="fragments/footer.jsp" />
</body>
</html>