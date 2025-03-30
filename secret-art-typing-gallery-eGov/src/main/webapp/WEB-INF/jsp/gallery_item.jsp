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
	<jsp:param value="작품상세" name="title" />
</jsp:include>
<title>"작품상세" -> 태그 중복이면 브라우저는 첫번째 발견 태그를 사용(ex:title태그)</title>
</head>
<script src="<c:url value='/js/gallery_status_alert.js'/>"></script>
<body data-status="${status}">
	<!-- 커스텀 CSS -->
	<style>
</style>
	<!-- header -->
	<jsp:include page="fragments/header.jsp" />
	<hr style="color: white;" />

	<!-- main 개발 -->
	<div class="custom-container-default">

		<!-- 작품제목 -->
		<div class=" d-flex"
			style="text-align: start; padding-bottom: 16px; padding-left: 1vw; padding-right: 1vw;">
			<div class="" style="flex: 0.8">
				<h4 style="font-size: 1.5vw; color: white; font-weight: 700;">${findItemDto.title}</h4>
			</div>
			<div class="d-flex" style="flex: 0.2; justify-content: end;">
				<button class="btn btn-light" type="button"
					onclick="redirectSavedBgm()" data-bs-toggle="modal"
					data-bs-target="#updateModal"
					style="flex: 1; border-radius: 0px; font-size: 1vw; border-width: 1px; background-color: var(--main-1);">
					<span class=""
						style="color: white; font-size: 1em; font-weight: 500; letter-spacing: -0.16px;">수정</span>
				</button>
				<button class="btn btn-light ms-2" type="button"
					onclick="redirectSavedBgm()" data-bs-toggle="modal"
					data-bs-target="#deleteModal"
					style="flex: 1; border-radius: 0px; font-size: 1vw; border-width: 1px; background-color: var(--main-1);">
					<span class=""
						style="color: #FD6363; font-size: 1em; font-weight: 500; letter-spacing: -0.16px;">삭제</span>
				</button>
			</div>
		</div>

		<!-- 작품그림 -->
		<jsp:include page="fragments/album.jsp" />

		<!-- 작품상세 -->
		<div class=" d-flex flex-column pt-0"
			style="padding-bottom: 4vw; padding-left: 1vw; padding-right: 1vw;">
			<div class="d-flex" style="padding-top: 1vw; padding-bottom: 2vw;">
				<img class="img-fluid "
					src="<c:url value='/images/gallery/stroke.svg'/>"
					style="align-self: flex-start; padding-right: 1.5vw; height: 3vw;" />
				<div class="d-flex flex-column" style="flex: 1;">
					<span class="pb-2"
						style="font-weight: 700; color: var(--text-2); font-size: 1vw;">
						<spring:message code="label.item.location" text="ID" />
					</span> <span
						style="letter-spacing: -0.22px; font-weight: 400; color: white; font-size: 1.2vw;">${findItemDto.id}</span>
				</div>
				<img class="img-fluid "
					src="<c:url value='/images/gallery/stroke.svg'/>"
					style="align-self: flex-start; padding-right: 1.5vw; height: 3vw; margin-left: 0.5vw;" />
				<div class="d-flex flex-column " style="flex: 2;">
					<span class="pb-2"
						style="font-weight: 700; color: var(--text-2); font-size: 1vw;">
						<spring:message code="label.item.product.date" text="제작일자" />
					</span> <span
						style="letter-spacing: -0.22px; font-weight: 400; color: white; font-size: 1.2vw;">
						${findItemDto.date1.format(DateTimeFormatter.ofPattern('yy년 MM월 dd일 HH시 mm분'))}
						</span>
				</div>
			</div>
			<div class="d-flex " style="padding-top: 1vw;">
				<img class="img-fluid "
					src="<c:url value='/images/gallery/stroke.svg'/>"
					style="align-self: flex-start; padding-right: 1.5vw; height: 3vw;" />
				<div class="d-flex flex-column" style="flex: 1;">
					<span class="pb-2"
						style="font-weight: 700; color: var(--text-2); font-size: 1vw;">
						<spring:message code="label.item.nickName" text="작가명" />
					</span> <span
						style="letter-spacing: -0.22px; font-weight: 400; color: white; font-size: 1.2vw;">${findItemDto.nickname}</span>
				</div>
				<img class="img-fluid "
					src="<c:url value='/images/gallery/stroke.svg'/>"
					style="align-self: flex-start; padding-right: 1.5vw; height: 3vw; margin-left: 0.5vw;" />
				<div class="d-flex flex-column" style="flex: 2;">
					<span class="pb-2"
						style="font-weight: 700; color: var(--text-2); font-size: 1vw;">
						<spring:message code="label.item.content" text="작품설명" />
					</span> <span
						style="letter-spacing: -0.22px; font-weight: 400; color: white; font-size: 1.2vw;">${findItemDto.content}</span>
				</div>
			</div>
		</div>

		<!-- 게시물 이동 -->
		<div class=" d-flex flex-column"
			style="min-height: 10vw; padding-top: 4vw; padding-bottom: 4vw; padding-left: 1vw; padding-right: 1vw;">

			<c:forEach items="${itemsResDto}" var="itemResDto"
						varStatus="status">
				<a class="btn d-flex " type="button"
					style="width: 100%; height: 100%; border-radius: 0px; border-width: 0px; background-color: #242424; font-size: 1vw; padding-left: 1.3vw; padding-right: 1.3vw; padding-top: 1.3vw; padding-bottom: 1.3vw; margin-top: 1.3vw;"
					href="<c:url value='/gallery/itemDetail/${itemResDto.id}'/>"
					onclick="redirectSavedBgm();"> <img class="img-fluid"
					src="<c:url value='/images/gallery/arrow-${(status.index==0)? "up" : "down"}.svg'/>"
					style="height: 2em; flex: 0.01; align-self: center;" />
					<div class="m-0 d-flex flex-column"
						style="flex: 1; text-align: start; align-self: center; padding-left: 24px; padding-right: 24px;">
						<span class="text-truncate"
							style="flex: 1; font-weight: 400; color: var(--text-2); font-size: 1vw; letter-spacing: -0.16px; width: 45vw;">
							${(status.index==0)? "이전 전시실 입장" : "이후 전시실 입장"}</span> 
							<span class="text-truncate"
							style="flex: 1; font-weight: 500; color: white; font-size: 1.2vw; width: 45vw;">
							${itemResDto.title}</span>
					</div> <span class=""
					style="flex: 0.1; font-weight: 400; color: var(--text-2); font-size: 1vw; letter-spacing: -0.16px; align-self: center;">
${itemResDto.date1.format(DateTimeFormatter.ofPattern('yy.MM.dd.HH:mm'))}</span>
				</a>
			</c:forEach>

		</div>

		<!-- 탈출버튼 -->
		<div class=" d-flex" style="padding-left: 1vw; padding-right: 1vw;">
			<div class="" style="flex: 0.75"></div>
			<a class="btn btn-light m-0" type="button"
				onclick="redirectSavedBgm()"
				style="border-radius: 0px; height: 100%; flex: 0.25; padding: 1vw;"
				href="/gallery"> <span class="fw-bold"
				style="color: var(--main-1); font-size: 1.3vw;"> <spring:message
						code="button.exit" text="전시실 나가기" /></span>
			</a>
		</div>

	</div>

	<!-- footer -->
	<jsp:include page="fragments/footer.jsp" />

	<!-- updateNDeleteModal - update -->
	<jsp:include page="fragments/update_delete_modal.jsp">
		<jsp:param value="update" name="operate" />
	</jsp:include>

	<!-- updateNDeleteModal - delete -->
	<jsp:include page="fragments/update_delete_modal.jsp">
		<jsp:param value="delete" name="operate" />
	</jsp:include>

</body>
</html>