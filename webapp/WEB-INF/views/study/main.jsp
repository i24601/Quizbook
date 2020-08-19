<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>

<title>Main</title>
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath}/assets/css/include/hnf.css"
	rel="stylesheet" type="text/css">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/assets/css/study/main.css"
	rel="stylesheet" type="text/css">

</head>


<body>

	<div id="body">


		<div id="study_nav">nav 넣을자리</div>

		<!-- study_area, study_user, bottom line을 위한 wrap  -->
		<div id="study_wrap">

			<!-- 세트 제목, 카드, 버튼 -->
			<div class="study_area">

				<!-- 제목 -->
				<div id="study_title">제목 넣을자리</div>
				<!-- 제목 -->

				<!-- 카드 -->
				<div class="card_wrap">
					<!--id지우고 class="card" 뒤에 onclick="flip(event) -->
					<div class="card" id="card">
						<div class="front">front</div>
						<div class="back">back</div>
					</div>
				</div>
				<!-- 카드 -->

				<!-- 버튼-->
				<div>
					<div class="CardsList-navControl previousButton">
						<span><button disabled="" title="이전 카드" type="button">
								<span>◀</span>
							</button></span>
					</div>


					<div class="CardsList-navControl progressIndex">
						<span id="index">1/50</span>
					</div>

					<div class="CardsList-navControl nextButton">
						<span><button title="다음 카드" type="button">
								<span>▶</span>
							</button></span>
					</div>
				</div>
				<!-- 버튼 -->

			</div>
			<!-- study_area 끝  -->


			<div id="study_user">
				<div>크롱</div>

				<ul id="study_user_nav">
					<li><a href="#">&#xf00c 학습하기</a></li>
					<li><a href="#">&#xF24d 낱말 카드</a></li>
					<li><a href="#">&#xf044 테스트</a></li>
					<li><a href="#">&#xf11b 게임</a></li>
				</ul>
			</div>

		</div>
		<!-- study_area, study_user, bottom line을 위한 wrap 끝 -->


	</div>



	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>





</body>

<script type="text/javascript">
	var card_front = true;

	$(".card")
			.on(
					'click',
					function() {

						console.log($('.card').css('transform'));

						//1. 만약 애니메이션이 여러개 있어서 복잡하게 되면 메소드를 하나 만드는게 낫다 (split)
						//2. now가 deg를 나타내므로 now를 if 조건문에 사용할수도..
						//3. 세세하게 조절해야할 경우 아래처럼 matrix 비교
						//주의 따로 변수 선언해서 front back if 조건으로 주면 다 뒤집히지 않았을때 문제 time out같은걸

						if (($('.card').css('transform')) != 'matrix3d(1, 0, 0, 0, 0, -1, 1.22465e-16, 0, 0, -1.22465e-16, -1, 0, 0, 0, 0, 1)') {
							$('.card').animate({
								deg : 180
							}, {
								duration : 500,
								step : function(now) {
									console.log(now);
									$(".card").css({
										transform : 'rotateX(' + now + 'deg)'
									});
								}
							});
							card_front = false;
						}

						else {
							$('.card').animate({
								deg : 0
							}, {
								duration : 500,
								step : function(now) {
									console.log(now);

									$(".card").css({
										transform : 'rotateX(' + now + 'deg)'
									});
								}
							});
							card_front = true;

						}
					});

	$(".nextButton").on('click', function() {
		console.log("버튼클릭");
		console.log(card_front);
		
		if (card_front == true) {
			$(".card").css('transform', '').queue(function() {
				$(".card").addClass('previous');
			});
		}
		//back일때
		//elment에 transform요소를 중복해서 쓸수 없으므로(rotate, translate) card를 싸는 card_wrap을 만들어 각각 적용 card(rotate), card_wrap(translate)
		else {
			$(".card_wrap").addClass('previous').delay(900).queue(function(){
				$(".card_wrap").removeClass('previous').dequeue();
			});
		}

	});
</script>

<!-- id 안쓰고 class="card" 뒤에 onclick="flip(event) 쓸 경우 
<script type="text/javascript">
	function flip(event) {
		var element = event.currentTarget;
		if (element.className === "card") {
			if (element.style.transform == "rotateX(180deg)") {
				element.style.transform = "rotateX(0deg)";
			} else {
				element.style.transform = "rotateX(180deg)";
			}
		}
	};
</script> -->
</html>