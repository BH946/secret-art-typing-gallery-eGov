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
	<jsp:param value="갤러리" name="title" />
</jsp:include>
<title>"갤러리" -> 태그 중복이면 브라우저는 첫번째 발견 태그를 사용(ex:title태그)</title>
</head>
<script src="<c:url value='/js/gallery_status_alert.js'/>"></script>
<body data-status="${status}">
	<link rel="stylesheet" href='/css/gallery.css' />
	<style>
.page-link {
	font-size: 1.2vw;
	padding: 1vw;
}

@media all and (min-width: 1921px) and (max-width: 4096px) {
	body, #enterBtn {
		cursor: url('/cursor.svg') 10 60, auto;
	}
}

@media all and (max-width: 1920px) {
	body, #enterBtn {
		cursor: url('/cursor_1920.svg') 10 60, auto;
	}
}

.ui-autocomplete {
color: black;
background: white;
width: 120px;
}

</style>

	<!-- header -->
	<jsp:include page="fragments/header.jsp" />
	<div id="content_area">
		<!-- main 개발 시작 -->
		<!-- 최상단 그림 -->
		<div class="container-fluid p-0">
			<img class="img-fluid" src="<c:url value='/images/gallery/6.png'/>"
				style="width: 100%;" />
		</div>
		<!-- <div id="content_area" > -->
		<!-- 본문  -->
		<div class="custom-container-default">
			<!-- 최상단 제목(층수) -->
			<div class="d-flex flex-column"
				style="min-height: 0vh; padding-bottom: 5vh;">
				<div class="container" style="text-align: center;">
					<span style="font-weight: 500; color: white; font-size: 1.4vw;">B<c:out
							value='${paginationInfo.getCurrentPageNo()}' />F
					</span>
				</div>
				<div class=" d-flex justify-content-center" style="width: 100%;">
					<div class="d-flex justify-content-center " style="flex: 0.5;">
						<img class="img-fluid"
							src="<c:url value='/images/gallery/6-1.svg'/>"
							style="width: 100%;" /> <span class="px-3"
							style="font-size: 2vw; font-weight: 700; color: white; white-space: nowrap;">
							<spring:message code="page.gallery" text="전시실" />
						</span> <img class="img-fluid"
							src="<c:url value='/images/gallery/6-2.svg'/>"
							style="width: 100%;" />
					</div>
				</div>
			</div>

			<!-- 작품 나열 -->
			<div class="d-flex flex-column" style="padding-top: 3vh;">
				<!-- Search -->
				<div id="search">
					<ul
						style="display: flex; align-items: center; padding: 0; padding-bottom: 20px;">
						<li class="d-flex flex-column pe-4 ps-4" style="flex: 0.25;">
							<label for="searchCondition"
							style="font-weight: 500; color: white;"><spring:message
									code="search.choose" text="검색어 선택" /></label> <select
							id="searchCondition" name="searchCondition" class="use"
							style="margin-top: 0;">
								<option value="0" selected="${item.searchCondition} == 0">ID</option>
								<option value="1" selected="${item.searchCondition} == 1">Title</option>
						</select>
						</li>
						<li class="d-flex flex-column pe-4 ps-4" style="flex: 0.52;">
							<label for="searchKeyword"
							style="font-weight: 500; color: white;"><spring:message
									code="search.keyword" text="검색어 입력" /></label> 
							<input type="text"
							id="searchKeyword" name="searchKeyword"
							value="${item.searchKeyword}" class="txt" style="margin-top: 0;" />
						</li>
						<li class="d-flex flex-column ps-4" style="flex: 0.31;"><a
							class="btn btn-light" type="button" id="enterBtn"
							onclick="sampleSearch()"
							style="font-size: 1vw; width: 12vw; padding: 0.5em; margin-top: 10px;">
								<span class="fw-bold" id="enterBtn1"
								style="font-size: 1em; white-space: nowrap;"><spring:message
										code="button.search" text="검색" /></span>
						</a></li>
					</ul>

				</div>

				<!-- List -->
				<div id="table">
					<c:forEach items="${itemsResDto}" var="itemResDto"
						varStatus="status">
						<!-- <div class="gallery-item-many" -->
						<div
							class="<c:url value='${status.index==0 ? "gallery-item-first" : "gallery-item-many"}'/>"
							style="flex: 1; padding-top: 30px;">
							<div class="d-flex flex-column pe-4" style="flex: 0.15;">
								<span class=""
									style="font-weight: 500; color: white; font-size: 1.2vw;">No.<c:out
										value='${(paginationInfo.totalRecordCount+1)-((paginationInfo.currentPageNo-1)*paginationInfo.pageSize+status.count) }' /></span>
								<span class="pt-2"
									style="font-weight: 400; color: var(--text-2); font-size: 1vw; letter-spacing: -0.16px;">${itemResDto.date1.format(DateTimeFormatter.ofPattern('yy.MM.dd.HH:mm'))}</span>
							</div>
							<div class="d-flex flex-column pe-4" style="flex: 0.42;">
								<span class="text-truncate"
									style="font-weight: 500; color: white; font-size: 1.2vw; width: 25vw;">${itemResDto.title}</span>
								<span class="text-truncate pt-2"
									style="font-weight: 400; color: var(--text-2); font-size: 1vw; letter-spacing: -0.16px; width: 25vw;">${itemResDto.nickname }</span>
								<a class="btn btn-light mt-4" type="button" id="enterBtn"
									onclick="redirectSavedBgm()"
									style="font-size: 1vw; align-self: flex-start; width: 12vw; padding: 0.5em;"
									href="<c:url value='/gallery/itemDetail/${itemResDto.id}?pageIndex=${not empty param.pageIndex ? param.pageIndex : 1}'/>">
									<span class="fw-bold" id="enterBtn1"
									style="font-size: 1em; white-space: nowrap;"><c:out
											value='${(paginationInfo.totalRecordCount+1)-((paginationInfo.currentPageNo-1)*paginationInfo.pageSize+status.count) }' />전시실
										입장</span>
								</a>
							</div>
							<div class="d-flex flex-column" style="flex: 0.43;">
								<img class="img-fluid"
									src="<c:url value='/image/${itemResDto.imgSrc}'/>"
									style="height: 15vh; border-radius: 10vh 10vh 0 0;" />
							</div>
						</div>
					</c:forEach>
				</div>


			</div>
			<div class="pagination-container">
				<ui:pagination paginationInfo="${paginationInfo}" type="image"
					jsFunction="linkPageAjax" />
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="fragments/footer.jsp" />
	</div>
</body>


<!-- 페이징 + 검색(+자동완성) 필요한 js -->
<script type="text/javascript">
	// ajax사용 - 페이징 작업을 진행한다.
	function linkPageAjax(pageNo) {
		//location.href = "/gallery?pageIndex=" + pageNo;
		$.ajax({
			url : '/gallery',
			type : 'post',
			data : {
				pageIndex : pageNo
			}
		}).done(function(fragment) {
			$('#content_area').html(fragment);
		});
	}

	// ajax사용 - 자동완성 
	$(function() {
		// jquery autocomplete 코드를 생성한다.
		$("#searchKeyword")
				.autocomplete(
						{
							source : function(request, response) {
								$
										.ajax({
											url : '/suggestKeyword',
											type : 'post',
											contentType : "application/x-www-form-urlencoded; charset=UTF-8",
											data : {
												searchKeyword : request.term
											},
											dataType : 'json',
											success : function(returnData) {
												// @ResponseBody 사용 시: response(returnData);
												// ModelAndView 사용 시: response(returnData.nameList);
												response(returnData);
											}
										});
							},
							minLength : 1,
							select : function(event, ui) {
								$("#searchKeyword").val(this.value);
							}
						});
	});
	function notNullCheck(value) {
		return !(value === '' || value == null || (typeof value == 'object' && !Object
				.keys(value).length));
	}
	// ajax사용 - 검색 작업 -> HTTP URL이 페이징과 동일!
	function sampleSearch() {
		if (notNullCheck($('#searchKeyword').val())) {
			$.ajax(
					{
						url : '/gallery',
						type : 'post',
						data : {
							searchCondition : $(
									'#searchCondition option:selected').val(),
							searchKeyword : $('#searchKeyword').val()
						}
					}).done(function(fragment) {
				$('#content_area').replaceWith(fragment);
			});
		} else {
			const errorMessage = '<spring:message code="search.error" />';
			alert(errorMessage);
		}
	}
</script>



</html>