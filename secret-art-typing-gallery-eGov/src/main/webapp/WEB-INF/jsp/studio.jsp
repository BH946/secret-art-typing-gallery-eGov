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
<!-- 이미지 생성위해 canvas -->
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<body>
	<!-- 커스텀 CSS -->
	<style>
/* 슬라이더 트랙 색상 수정 */
.form-range::-webkit-slider-runnable-track {
	background-color: var(--text-2);
	font-size: 0.2vw;
	height: 0.2vw;
}
/* 슬라이더 핸들(썸네일) 색상 수정 */
.form-range::-webkit-slider-thumb {
	background-color: white;
	margin-top: calc(( 1.6em)*(-1));
	width: 5em;
	height: 5em;
}

.form-range {
	flex: 1;
}
/* 스크롤을 숨기는 스타일 */
.no-scroll::-webkit-scrollbar {
	width: 0px;
}

@media all and (min-width: 1921px) and (max-width: 4096px) {
	#imgDim {
		width: 1920px;
	}
}

@media all and (max-width: 1920px) {
	#imgDim {
		width: 1200px;
	}
}
</style>

	<!-- header -->
	<jsp:include page="fragments/header.jsp" />

	<hr style="color: white;" />

	<!-- main 개발 -->
	<div class="custom-container-default" style="">

		<!-- 작품그림 - 상단 -->
		<div class="d-flex" style="">
			<jsp:include page="fragments/album.jsp" />
			<!-- 그림 옆 "?" 폰트 설명 버튼 -->
	        <div class="" style="position:absolute; left:85%; align-self: center; justify-content: end; width: 5vw;">
	          <a href="#" onclick="dimOn();">
	          <img class="img-fluid" src="<c:url value='/images/studio/circle.svg'/>"
	               style="width: 70%;"/>
	          </a>
	        </div>
		</div>

		<!-- 작품제작 - 하단 -->
		<div class="d-flex" style="">
			<div style="flex: 1; padding: 1vw;">
				<div class="row m-0">
					<!-- 왼쪽 -->
					<div class="col-6 d-flex flex-column ps-0"
						style="padding-right: 3vw;">
						<div class="d-flex flex-column" style="flex: 1;">
							<span
								style="flex: 1; color: white; font-weight: 400; letter-spacing: -0.16px; font-size: 1vw;">작품
								제작하기</span>
							<textarea class="no-scroll pb-5" id="textInput"
								style="flex: 1; border-color: var(--line); border-style: solid; padding: 1vw; background-color: var(--main-2); color: var(--text-2); letter-spacing: -0.16px; font-size: 1vw;"
								placeholder="이곳에 털어놓고 싶은 비밀을 적어보세요."></textarea>
						</div>
						<div class="mt-3" style="flex: 1;">
							<ul class="p-0 ps-4"
								style="font-size: 1vw; letter-spacing: -0.16px; color: var(--text-2);">
								<li>익명으로도 말할 수 없었던 비밀을 이곳에서 편하게 털어보세요.</li>
								<li>작성한 비밀을 오른쪽 패널로 꾸며 나만의 작품을 완성해보세요.</li>
								<li>한글 입력만 가능합니다.</li>
								<li style="color: white;">‘다음’ 버튼을 누르는 즉시 완성된 작품은 이미지화되므로
									타인이 내용을 파악할 수 없으니 안심하세요!</li>
							</ul>
						</div>
					</div>

					<!-- 오른쪽 -->
					<div class="col-6 d-flex flex-column pe-0"
						style="padding-left: 3vw;">
						<!-- 첫번째 컨테이너 -->
						<div class="d-flex" style="flex: 0.8;">
							<div class="d-flex flex-column pb-4 pe-4" style="flex: 1;">
								<span
									style="flex: 1; color: white; font-weight: 400; letter-spacing: -0.16px; font-size: 1vw;">크기</span>
								<input type="range" class="form-range" id="fontSizeRange"
									min="5" max="38" step="1" />
							</div>
							<div class="d-flex flex-column pb-4 pe-4" style="flex: 1;">
								<span
									style="flex: 1; color: white; font-weight: 400; letter-spacing: -0.16px; font-size: 1vw;">자간</span>
								<input type="range" class="form-range" id="letterSpacingRange"
									min="-120" max="120" value="" step="" />
							</div>
							<div class="d-flex flex-column pb-4 pe-0" style="flex: 1;">
								<span
									style="flex: 1; color: white; font-weight: 400; letter-spacing: -0.16px; font-size: 1vw;">행간</span>
								<input type="range" class="form-range" id="lineHeightRange"
									min="0" max="3" value="1.5" step="0.1" />
							</div>
						</div>
						<!-- 두번째 컨테이너 -->
						<div class="d-flex" style="flex: 1.5;">
							<div class="d-flex flex-column pb-1 pe-4" style="flex: 1;">
								<span
									style="flex: 0.5; color: white; font-weight: 400; letter-spacing: -0.16px; font-size: 1vw;">작품
									색상</span> <input type="color" id="itemColor" class="mt-1"
									value="#000000"
									style="flex: 2; border-style: solid; border-color: white; border-width: 1px; width: 100%;" />
							</div>
							<div class="d-flex flex-column pb-1 pe-0" style="flex: 1;">
								<span
									style="flex: 0.5; color: white; font-weight: 400; letter-spacing: -0.16px; font-size: 1vw;">배경
									색상</span> <input type="color" id="bgColor" class="mt-1"
									value="#FFFFFF"
									style="flex: 2; border-style: solid; border-color: white; border-width: 1px; width: 100%;" />
							</div>
						</div>
						<!-- 세번째 컨테이너 -->
						<div class="d-flex" style="flex: 0.5;">
							<span
								style="flex: 1; color: var(--text-2); font-weight: 400; letter-spacing: -0.16px; font-size: 1vw;">*클릭하여
								작품을 꾸밀 수 있어요</span>
						</div>
						<!-- 네번째 컨테이너 -->
						<div class="d-flex" style="flex: 1;">
							<form class="container p-0 pt-1 pb-1 pe-0" name="myForm"
								id="myForm" action="/studio" method="post">
								<button id="nextBtn" class="btn btn-light" type="button"
									onclick="redirectSavedBgm()"
									style="width: 100%; height: 100%; position: relative; border-radius: 0px;">
									<span class="fw-bold"
										style="color: var(--main-1); font-size: 1.2vw;">
										<spring:message code="button.next" text="다음"/></span> 
										<img class="img-fluid pe-3"
										src="<c:url value='/images/studio/arrow.svg'/>"
										style="top: 50; right: 0; position: absolute; height: 50%;" />
								</button>
								<input type="hidden" name="imgSrc" id="imgSrc">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="fragments/footer.jsp" />

	<!-- fontExImg -->
	<div id="fontExImg" onclick="dimOff();"
		style="z-index: 99; position: absolute; top: 0; left: 0; width: 100%; height: 100%; display: none;">
		<div id="imgDim"
			style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
			<img class="img-fluid" src="<c:url value='/images/studio/font_ex_1920.jpg'/>" style="" />
		</div>
	</div>


</body>

<!-- 폰트 설명 버튼 창("? 내부") -->
<script>
    function dimOn() {
      $('#fontExImg').css('display', 'block');
      $('.navbar').css('opacity', '50%');
      $('.custom-container-default').css('opacity', '50%');
    }
    function dimOff() {
      $('#fontExImg').css('display', 'none');
            $('.navbar').css('opacity', '100%');
      $('.custom-container-default').css('opacity', '100%');
    }
    </script>

<!-- 이미지 canvas 사용 함수 -->
<script>
      // 크기, 자간, 행간 스크롤바(Range) 연동 + Textare&output 연동 + 색상변경 연동 + 이미지 저장
      const fontSizeRange = document.getElementById('fontSizeRange');
      const letterSpacingRange = document.getElementById('letterSpacingRange');
      const lineHeightRange  = document.getElementById('lineHeightRange');
      const textToResize = document.getElementById('output');

      // input 이벤트 발생시 font 변경
      fontSizeRange.addEventListener('input', function() {
        const fontSize = fontSizeRange.value + 'em';
        textToResize.style.fontSize = fontSize;
      });
      letterSpacingRange.addEventListener('input', function() {
        const letterSpacing = letterSpacingRange.value + 'px';
        textToResize.style.letterSpacing = letterSpacing;
      });
      lineHeightRange.addEventListener('input', function() {
        const lineHeight = lineHeightRange.value;
        textToResize.style.lineHeight = lineHeight;
      });

      // Textare&output 연동
      const textInput = document.getElementById('textInput');
      textInput.addEventListener('input', function() {
        const inputValue = textInput.value;
        const formattedValue = inputValue.replace(/\n/g, "<br>");
        textToResize.innerHTML = formattedValue;
      });

      // 색상변경 연동
      const bgColor = document.getElementById('bgColor');
      const itemColor = document.getElementById('itemColor');
      bgColor.addEventListener('input', () => {
        const selectedColor = bgColor.value;
        textToResize.style.backgroundColor = selectedColor;
      });
      itemColor.addEventListener('input', () => {
        const selectedColor = itemColor.value;
        textToResize.style.color = selectedColor;
      });

      // 이미지 저장
      $("#nextBtn").on("click", function() {
        const targetWidth = 1164;
        const targetHeight = 492;

        // Clone and add the content from the original div
        const clonedDiv = textToResize.cloneNode(true);
        clonedDiv.style.width = targetWidth + "px";
        clonedDiv.style.height = targetHeight + "px";
        clonedDiv.style.overflow = "hidden"; 
        document.body.appendChild(clonedDiv);

        html2canvas(clonedDiv).then(function(canvas) {
          // Remove the virtual div from the body
          document.body.removeChild(clonedDiv);

          var img = canvas.toDataURL("image/jpeg");
          document.getElementById("imgSrc").value=img;
          document.getElementById("myForm").submit();
        });
      });
    </script>
</html>