<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/css/include/sidebar.css"
	rel="stylesheet" type="text/css">

<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 사이드바 -->
<nav class="col-sidenav">
	<ul class="nav-top">
		<li><a href=""> <img class="img-block"
				src="${pageContext.request.contextPath}/assets/images/05.사이드바/open-menu.png"
				alt="menu"><span id="home-txt">홈</span>
		</a></li>
		<li><a href=""> <img class="img-block"
				src="${pageContext.request.contextPath}/assets/images/05.사이드바/recently.png"
				alt="recently"> <span id="rec-txt">최근에 학습</span>
		</a></li>
		<li><a href=""> <img class="img-block"
				src="${pageContext.request.contextPath}/assets/images/05.사이드바/heart.png"
				alt="heart-Like"><span id="fol-txt">팔로우</span>
		</a></li>
	</ul>
	<div class="a">
		<hr>
	</div>
	<ul class="nav-mid">
		<li><a href=""> <img class="img-block"
				src="${pageContext.request.contextPath}/assets/images/05.사이드바/puzzle.png"
				alt="set"><span id="set-txt">세트</span>
		</a></li>
		<li><a> <img class="fold-block"
				src="${pageContext.request.contextPath}/assets/images/05.사이드바/folder2.png"
				alt="folder"><span id="fold-txt">폴더</span>
		</a>
			<ul>
				<li class="on-fold"><a href="#"> <i class="material-icons"
						style="font-size: 20px"> keyboard_arrow_down</i> <span id="f1-txt">한국사</span>
				</a>
					<ul class="in-fold">
						<li class="new-fold"><a href="#"> <i
								class="material-icons" style="font-size: 20px">
									keyboard_arrow_down</i> 삼국시대
						</a></li>
						<li class="new-fold"><a href="#"> <i
								class="material-icons" style="font-size: 20px">
									keyboard_arrow_down</i> 고려시대
						</a></li>
						<li class="new-fold"><a href="#"> <i
								class="material-icons" style="font-size: 20px">
									keyboard_arrow_right</i> 조선시대
						</a></li>
					</ul></li>
			</ul></li>
	</ul>
	<div class="a">
		<hr>
	</div>
	<ul class="nav-bot">
		<li><a href=""> <img class="img-block"
				src="${pageContext.request.contextPath}/assets/images/05.사이드바/my.png"
				alt="mypage"><span id="mypage-txt">정보수정</span>
		</a></li>
		<li><a href=""> <img class="img-block"
				src="${pageContext.request.contextPath}/assets/images/05.사이드바/settings.png"
				alt="navy-setting"><span id="setting-txt">설정</span>
		</a></li>
	</ul>
</nav>
<!-- 사이드바 끝 -->

<script>
	
	$(".nav-mid > li > ul").click(function() {
		var submenu = $(".new-fold");
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
		return false;
	});


	$(".nav-mid > li > ul li").click(function() {
		var submenu = $(".in-fold");
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
		return false;
	});
	
</script>

