<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link
	href="${pageContext.request.contextPath }/assets/css/include/sidebar.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

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
				alt="folder"><span id="fold-txt">폴더</span></a></li>
	</ul>

	<ul class="contextmenu">
		<li class="contextmenu_add"><a href="#">추가</a></li>
	</ul>

	<ul class="contextmenu_folder">
		<li class="contextmenu_add"><a href="#">추가</a></li>
		<li class="contextmenu_edit"><a href="#">수정</a></li>
		<li class="contextmenu_delete"><a href="#">삭제</a></li>
	</ul>

	<div class="folder-Area">

		<c:forEach items="${fList}" var="vo">
			<div class="folder" data-group_no='${vo.group_no}'
				data-order_no='${vo.order_no}' data-depth='${vo.depth}'
				data-no='${vo.no}'>
				<c:if test="${vo.depth ne 0}">
					<c:forEach begin="1" end="${vo.depth}">&nbsp;&nbsp;</c:forEach>
				</c:if>
				<i class="material-icons">keyboard_arrow_right</i>${vo.name}
			</div>
		</c:forEach>

		<!-- 팝업 -->

		<!-- ! 팝업 -->

		<!-- 그룹번호는 상위폴더의 그룹번호, 상위폴더가 없을경우 폴더번호
				 depth는 상위폴더의 depth+1, 상위폴더가 없을경우 0
				 ino는 폴더번호 -->

	</div>

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



<div class="modal fade" id="addModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">폴더생성</h4>
			</div>

			<form>
				<div class="modal-body">
					<div class="form-group">
						<label class="form-text">폴더명 :</label> <input id="addModalContent"
							type="text" name="content" value="">
					</div>
					<button type="submit" class="btn" id="btn_newFolder">등록</button>

				</div>
			</form>


		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript">
	var crtFolder;

	$(document).ready(function() {

		//Show contextmenu:
		/* $(".folder-Area, .folder").contextmenu(function(e) { */
		$(".folder-Area").on("contextmenu", ".folder", function(e) {
			console.log($(this));

			crtFolder = $(this);

			event.preventDefault();
			//Get window size:
			$(".contextmenu_folder").hide();
			$(".contextmenu").hide();

			console.log($(this).attr("class"));
			//Get pointer position:
			var posX = e.offsetX;
			var posY = e.offsetY;
			//Get contextmenu size:
			//Prevent page overflow:

			console.log($(this).position().top);

			/* 마우스좌표 */
			posLeft = posX + "px";
			posTop = posY + $(this).position().top + "px";

			/* 마우스좌표 아니라 부모기준 element 좌표 */
			console.log($(this).position());

			console.log(posX);
			console.log(posY);

			//Display contextmenu:
			$(".contextmenu_folder").css({
				"left" : posLeft,
				"top" : posTop
			}).show();
			//Prevent browser default contextmenu.
			return false;
		});

		//Hide contextmenu:
		$(document).click(function() {
			$(".contextmenu_folder").hide();
			$(".contextmenu").hide();
		});

	});

	$(".folder-Area").on("contextmenu", function(e) {
		console.log($(this));
		event.preventDefault();
		//Get window size:

		$(".contextmenu_folder").hide();
		$(".contextmenu").hide();

		console.log($(this).attr("class"));
		//Get pointer position:
		var posX = e.offsetX;
		var posY = e.offsetY;
		//Get contextmenu size:
		//Prevent page overflow:

		posLeft = posX + "px";
		posTop = posY + $(this).position().top + "px";

		console.log(posX);
		console.log(posY);

		//Display contextmenu:
		$(".contextmenu").css({
			"left" : posLeft,
			"top" : posTop
		}).show();
		//Prevent browser default contextmenu.
		return false;
	});
</script>

<script type="text/javascript">
	$(".contextmenu_add").on("click", function(event) {

		$('#addModal').modal("show");

	});
</script>

<script type="text/javascript">
	$(".contextmenu_delete").on("click", function(event) {

		folderVo = {
			no : crtFolder.data("no"),
			group_no : crtFolder.data("group_no"),
			order_no : crtFolder.data("order_no"),
			depth : crtFolder.data("depth")
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath }/api/side/deleteFolder",
			type : "post",

			contentType : "application/json",
			data : JSON.stringify(folderVo),

			/* 데이터 받음  */
			dataType : "json",
			success : function(result) {
				console.log('서버 delete 성공')
				console.log(result);
				if(result==1){
					deleteFolder(folderVo);
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});

	});
</script>


<script type="text/javascript">
	$("#btn_newFolder")
			.on(
					"click",
					function(event) {
						event.preventDefault();

						$('#addModal').modal("hide");

						/* 루트폴더 */

						if (typeof crtFolder == 'undefined') {
							folderVo = {
								name : $("#addModalContent").val()
							}
						}

						else {
							folderVo = {
								no : crtFolder.data("no"),
								name : $("#addModalContent").val(),
								group_no : crtFolder.data("group_no"),
								order_no : crtFolder.data("order_no"),
								depth : crtFolder.data("depth")
							}
						}

						$("#addModalContent").val("");

						
						$.ajax({
							url : "${pageContext.request.contextPath }/api/side/folderAddFolder",
							type : "post",

							contentType : "application/json",
							data : JSON.stringify(folderVo),

							/* 데이터 받음  */
							dataType : "json",
							success : function(fVo) {
								console.log('json 수신')
								console.log(fVo);
								render(fVo);
							},
							error : function(XHR, status, error) {
								console.error(status + " : " + error);
							}
						});
					});
</script>

<script>
	function render(vo) {
		console.log("render");
		console.log(vo);

		var str = "<div class='folder' data-group_no='"+ vo.group_no +"' data-order_no='"+ vo.order_no +"' data-depth='"+ vo.depth +"' data-no='"+ vo.no +"'>";
		
		if(vo.depth!=0){
			for(var i=0;i<vo.depth;i++){
				str+='&nbsp&nbsp';				
			}
		}

		
		str+='<i class="material-icons">keyboard_arrow_right</i>';
		str+=vo.name;
		str+="</div>";
		console.log(str);
		if (vo.depth == 0) {
			console.log("render case1");
			$(".folder-Area").prepend(str);
		} 
		else {
			console.log("render case2");
			$("[data-group_no="+vo.group_no+"][data-order_no="+(vo.order_no-1)+"]").after(str);
		}
	};
</script>


<script>
	function deleteFolder(vo) {
		console.log("delete");
		console.log(vo);
		
		$("[data-no]").filter(function(){
			
			return $(this).attr("data-order_no") >= (vo.order_no) && $(this).attr("data-group_no") == (vo.group_no); 
		
		}).remove();
		
	};
</script>

