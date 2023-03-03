<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE HTML>
<html>
<head>
<title>일시후원목록</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<mytag:icon />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Jua&display=swap"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Ion Icon Fonts-->
<link rel="stylesheet" href="css/ionicons.min.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/supportRequest.css">
</head>
<body>
	<div id="page">
		<!-- Page Header-->
		<mytag:pageHeader />
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread">
							<span><a href="main.do">HOME</a></span> / <span>후원목록</span>
						</p>
					</div>
				</div>
			</div>
		</div>

		<h1 id="menuTitle">일시후원목록</h1>

		<div class="twin container">
			<div class="container1 sp">
				<div class="container2 sp">
					<div class="twins-wrap reg sp">
						<div class="container-sp">
							<div class="removeBorderTop">
								<div class="sp container">
									<form method="post"
										action="adminTEMCategory.sp?category=TEMSearch"
										name="supporter_id">
										<div class=idsearch-container>
											<input type="text" class="searchKeyword sp"
												placeholder="아이디를 입력하세요" name="search_id"> <input
												type="submit" value="검색"
												class="btn btn-primary inputSubmit searchButton">
										</div>
									</form>
								</div>
							</div>
							<table class="board table" style="text-align: center;">
								<tbody>
									<tr class="boardHead">
										<td>번호</td>
										<td>아이디</td>
										<td>금액
											<h6 class="line-up-container">
												<a href="adminTEMCategory.sp?category=TEMAmountUp"
													class=line-up>▲</a> <a
													href="adminTEMCategory.sp?category=TEMAmountDown"
													class=line-up>▼</a>
											</h6>
										</td>
										<td>날짜</td>
									</tr>
								</tbody>
								<c:choose>
									<c:when test="${AdminsupportTEMList.size() == 0}">
										<tbody class="boardTbottom">
											<tr>
												<td colspan="4"><h2>후원 내역이 없습니다!</h2></td>
											</tr>
										</tbody>
									</c:when>
									<c:otherwise>
										<tbody class="boardTbottom">
											<c:forEach var="spList" items="${AdminsupportTEMList}">
												<tr>
													<td>${spList.temporary_number}</td>
													<td>${spList.supporter_id}</td>
													<td>${spList.temporary_amount}</td>
													<td>${spList.temporary_date}</td>
												</tr>
												<tr>
												</tr>
											</c:forEach>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>

							<div style="margin-bottom: 3em;">
								<div class="col-md-12 text-center">
									<div class="block-27">
										<ul>
											<c:choose>
												<c:when test="${prev == null }">
													<c:if test="${nowPage > 1 }">
														<li><a
															href="adminSupportTEMList.sp?page=${nowPage-1}"><i
																class="ion-ios-arrow-back"></i></a></li>
													</c:if>
													<c:forEach var="i" begin="${startPage }" end="${endPage }">
														<c:choose>
															<c:when test="${i == nowPage }">
																<li class="active"><span>${i }</span></li>
															</c:when>
															<c:otherwise>
																<li><a href="adminSupportTEMList.sp?page=${i}">${i }</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<c:if test="${nowPage < totalPage }">
														<li><a
															href="adminSupportTEMList.sp?page=${nowPage+1}"><i
																class="ion-ios-arrow-forward"></i></a></li>
													</c:if>
												</c:when>

												<c:otherwise>
													<c:if test="${nowPage > 1 }">
														<li><a
															href="adminSupportTEMList.sp?category=${prev}&page=${nowPage-1}"><i
																class="ion-ios-arrow-back"></i></a></li>
													</c:if>
													<c:forEach var="i" begin="${startPage }" end="${endPage }">
														<c:choose>
															<c:when test="${i == nowPage }">
																<li class="active"><span>${i }</span></li>
															</c:when>
															<c:otherwise>
																<li><a
																	href="adminTEMCategory.sp?category=${prev}&page=${i}">${i }</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<c:if test="${nowPage < totalPage }">
														<li><a
															href="adminTEMCategory.sp?category=${prev}&page=${nowPage+1}"><i
																class="ion-ios-arrow-forward"></i></a></li>
													</c:if>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Page Footer-->
		<mytag:pageFooter />

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
	</div>

	<script src="js/loginCheck.js"></script>
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- popper -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap 4.1 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- jQuery easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>

