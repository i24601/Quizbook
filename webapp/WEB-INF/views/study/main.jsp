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
		<div id="study_main">

			<div id="study_nav">nav</div>

			<div id="study_wrap">


				<!--id지우고 class="card" 뒤에 onclick="flip(event) -->

				<div class="card_wrap">

					<div id="study_title">삼국시대 - 고구려</div>

					<div class="card" id="card">
						<div class="front">front</div>
						<div class="back">back</div>
					</div>

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

		</div>
	</div>



	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>





</body>

<script type="text/javascript">
	$(".card").on('click', function() {

		var element = document.getElementById('card');
		
		
		if (element.className === "card") {
			//뒤집힌 상태라면
			if (element.style.transform == "rotateX(180deg)") {
				//으로 회전시키고
				element.style.transform = "rotateX(0deg)";
				//뒤집힌게 아니면 뒤집어라
			} else {
				element.style.transform = "rotateX(180deg)";
			}
		} 

	});
	
	$(".nextButton").on('click', function() {
		var element = document.getElementById('card');
		if (element.style.transform == "rotateX(180deg)") {
			element.style.transform = "rotateX(0deg)";
		}
		console.log("버튼클릭")
		$(".front").text("front_next");
		$(".back").text("back_next");
		$("#index").text("2/50");
		
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