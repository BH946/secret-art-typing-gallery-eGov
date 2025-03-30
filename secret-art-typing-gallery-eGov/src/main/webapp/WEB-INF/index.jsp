<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- JSP include로 변경 -->
<jsp:include page="jsp/fragments/head.jsp">
	<jsp:param value="홈" name="title" />
</jsp:include>
<title>"홈" -> 태그 중복이면 브라우저는 첫번째 발견 태그를 사용(ex:title태그)</title>
</head>
<body>
	<style>
      body{
        margin-top: 0px;
        overflow: hidden;
      }
      .firstLayout{
        opacity: 50%;
        filter: blur(5px);
      }
      .threeLayout{
        display: none;
      }
      .mail:hover{
        opacity: 90%;
      }
      .mail {
        animation-name: aniMail;
        animation-duration:3s;
        animation-duration: leaner;
        animation-iteration-count:10000;
        animation-direction:alternate;
        animation-fill-mode: forwards;
      }
      /* 키프레임 이름 = 애니메이션 이름 */
      @-webkit-keyframes aniMail {
        0% {
          left:30%;
        }
        100% {
          left:70%;
        }
      }
    
      .speakerA{
        position: absolute; width: 3vw; top:90%; left:95%; transform: translate(-50%, -50%);
        border-radius: 50%; border-width: 1px; border-style: solid; border-color: white;
        padding: 0.5vw;
      }

      @media all and (min-width: 1921px) and (max-width: 4096px) {
          .firstLayout {
              cursor: url('/images/cmmn/cursor.svg') 10 60, auto;
          }
          #enterBtn {
              cursor: url('/images/cmmn/cursor.svg') 10 60, auto;
          }
      }
      @media all and (max-width: 1920px) {
          .firstLayout, #enterBtn {
              cursor: url('/images/cmmn/cursor_1920.svg') 10 60, auto;
          }
      }
</style>



	<!-- main 개발 -->
	<div class="custom-container-default"
		style="height: 100vh; margin-top: 0vh; margin-bottom: 0vh; padding-bottom: 0px; padding-top: 0px;">
		<!-- 첫번째 레이아웃 -->
		<div class="firstLayout d-flex flex-column"
			style="height: 100%; width: 100%; opacity: 50%;">
			<!-- 상단 -->
			<div style="flex: 0.2;"></div>
			<div class="" style="margin-top: auto; flex: 0.5;">
				<img id=outputImg class="img-fluid"
					src="<c:url value='/images/index/black1.png'/>"
					style="width: 100%;" />
			</div>
			<!-- 하단 -->
			<div class=" d-flex"
				style="flex: 0.3; padding-left: 10vw; padding-right: 10vw;">
				<div class="d-flex" style="flex: 1;">
					<img class="img-fluid"
						src="<c:url value='/images/index/stroke2.svg'/>" title="logo"
						alt="logo" style="flex: 1;" />
				</div>
				<div class="" style="flex: 1; padding: 40px;">
					<a class="btn btn-light " type="button" id="enterBtn"
						onclick="redirectSavedBgm()"
						style="font-size: 1vw; align-self: center; width: 100%; padding: 1vw;"
						href="lobby"> <span class="fw-bold" id=""
						style="font-size: 1em; white-space: nowrap;" th:text="입장하기">입장하기</span>
					</a>
				</div>
				<div class="d-flex" style="flex: 1;">
					<img class="img-fluid"
						src="<c:url value='/images/index/stroke3.svg'/>" title="logo"
						alt="logo" style="flex: 1;" />
				</div>
			</div>
		</div>


		<!-- 두번째 레이아웃 -->
		<div class="secondLayout" style="">
			<!-- SECRET-ART -->
			<div class="txt1"
				style="position: absolute; width: 40vw; top: 25%; left: 50%; transform: translate(-50%, -50%);">
				<img class="img-fluid"
					src="<c:url value='/images/index/SECRET-ART.png'/>"
					style="width: 100%;" />
			</div>
			<!-- TYPING-GALLERY -->
			<div class="txt2"
				style="position: absolute; width: 60vw; top: 75%; left: 50%; transform: translate(-50%, -50%);">
				<img class="img-fluid"
					src="<c:url value='/images/index/TYPING-GALLERY.png'/>"
					style="width: 100%;" />
			</div>
			<!-- 봉투 -->
			<a id="mail" class="mail" onclick="mailClick();" href="#"
				style="position: absolute; width: 40vw; top: 50%; left: 50%; transform: translate(-50%, -50%);">
				<img class=" img-fluid"
				src="<c:url value='/images/index/mail_new.png'/>"
				style="width: 100%;" />
			</a>
			<!-- 말풍선 -->
			<div class="txt3"
				style="position: absolute; width: 3vw; top: 81%; left: 50%; transform: translate(-50%, -50%);">
				<img class="img-fluid"
					src="<c:url value='/images/index/polygon.svg'/>"
					style="width: 100%;" />
			</div>
			<div class="txt4"
				style="border-radius: 10vw; text-align: center; padding: 1vw; position: absolute; width: 20vw; top: 85%; left: 50%; transform: translate(-50%, -50%); background-color: white;">
				<span class="" style="font-size: 1.3vw; font-weight: 700;">봉투를
					클릭하여 열어보세요.</span>
			</div>

		</div>


		<!-- 세번째 레이아웃 -->
		<div class="threeLayout" style="">
			<!-- 봉투 -->
			<div
				style="position: absolute; width: 40vw; top: 50%; left: 50%; transform: translate(-50%, -50%);">
				<img class="img-fluid"
					src="<c:url value='/images/index/frontMail.png'/>"
					style="width: 100%;" />
			</div>
			<!-- 열쇠 -->
			<div
				style="position: absolute; width: 30vw; top: 50%; left: 75%; transform: translate(-50%, -50%);">
				<img class="img-fluid"
					src="<c:url value='/images/index/frontKey.png'/>"
					style="width: 100%;" />
			</div>
			<!-- 버튼 -->
			<a class=" btn btn-light" type="button" id="enterBtn"
				style="font-size: 1vw; align-self: flex-start; width: 15vw; padding: 1vw; position: absolute; top: 88%; left: 50%; transform: translate(-50%, -50%);"
				href="#" onclick="enterClick()"> <span class="fw-bold"
				id="enterBtn1" style="font-size: 1em; white-space: nowrap;">방문하기</span>
			</a>

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

</body>

<script>
	$(document).ready(function() {
		$('#enterBtn').hover(function() {
			$('#outputImg').attr('src', '/images/index/black2.png');
		}, function() {
			$('#outputImg').attr('src', '/images/index/black1.png');
		});
	});

	function mailClick() {
		$('.txt1').css('opacity', '50%');
		$('.txt2').css('opacity', '50%');
		$('.txt3').css('display', 'none');
		$('.txt4').css('display', 'none');
		$('.mail').css('display', 'none');

		$('.threeLayout').css('display', 'block'); // 나타내기
	}

	function enterClick() {
		$('.firstLayout').css('opacity', '100%');
		$('.firstLayout').css('filter', 'blur(0px)');
		$('.threeLayout').css('display', 'none');
		$('.secondLayout').css('display', 'none');

		//$('.firstLayout').css('cursor', 'url(./cursor.svg) 10 60, auto');
		//$('#enterBtn').css('cursor', 'url(./cursor.svg) 10 60, pointer');
	}
</script>

</html>