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
			<div id="study_main_left">왼쪽</div>

			<div id="study_main_center">


				<div class="card_wrap">
					<div class="card" onclick="flip(event)">
						<div class="front">front</div>
						<div class="back">back</div>
					</div>
				</div>


			</div>

			<div id="study_main_right">오른쪽</div>
		</div>
	</div>



	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>





</body>

<script type="text/javascript">
	function flip(event) {
		var element = event.currentTarget;
		if (element.className === "card") {
			if (element.style.transform == "rotateY(180deg)") {
				element.style.transform = "rotateY(0deg)";
			} else {
				element.style.transform = "rotateY(180deg)";
			}
		}
	};
</script>
</html>