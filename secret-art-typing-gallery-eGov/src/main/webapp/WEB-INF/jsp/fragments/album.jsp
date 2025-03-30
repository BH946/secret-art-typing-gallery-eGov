<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
@font-face {
	font-family: 'arttyping-Regular';
	src: url('/css/arttyping-Regular.woff') format('woff');
}

#output {
	font-family: 'arttyping-Regular', sans-serif;
	font-size: 20em; /*최소:5em, 최대:38em*/
	color: black;
	overflow: hidden;
	/* 텍스트 줄바꿈 방지 */
	white-space: nowrap;
}
</style>
<body>
	<!-- 사이트에 앨범(작품) 틀 -->
	<!-- 비율 2.4:1 정도로 너비높이 고정(vw기준) -->
	<div class="d-flex"
		style="padding-right: 1vw; padding-left: 1vw; max-width: 100%; width: 100%; height: 35vw; padding-top: 2vw; padding-bottom: 2vw;">


		<div class=" d-flex"
			style="padding: 0.5vw; max-width: 100%; flex: 1; background-color: var(--main-2); border-width: 1px; border-color: white; border-style: solid; font-size: 1vw;">
			<div class="d-flex" id="output"
				style="max-width: 100%; padding: 0px; flex: 1; background-color: white; justify-content: center; align-items: center;">
				<!-- gallery_item.jsp 에서 -->
				<c:if test="${findItemDto.imgSrc != null}">
					<img
					class="img-fluid" id="outputImg"
					style="max-width: 100%; width: 100%; height: 100%;" 
					src="<c:url value='/image/${findItemDto.imgSrc}'/>"/>
				</c:if>
				<!-- studio.jsp 에서 -->
				<c:if test="${item.imgSrc != null}">
					<img
					class="img-fluid" id="outputImg"
					style="max-width: 100%; width: 100%; height: 100%;" 
					src="<c:url value='/image/${item.imgSrc}'/>"/>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>