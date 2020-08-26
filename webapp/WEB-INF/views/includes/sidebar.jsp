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


	<div class="folder-Area">
	
		<div class="folder">
				<i class="material-icons">keyboard_arrow_right</i>테스트
		</div>	
		<div class="folder">
				<i class="material-icons">keyboard_arrow_right</i>테스트
		</div>
		<div class="folder">
				<i class="material-icons">keyboard_arrow_right</i>테스트
		</div>	
		<div class="folder">
				<i class="material-icons">keyboard_arrow_right</i>테스트
		</div>
	
		<div class="test">
			<ul class="contextmenu">
				<li><a href="#">추가</a></li>
			</ul>
	
			<ul class="contextmenu_folder">
				<li><a href="#">수정</a></li>
				<li><a href="#">삭제</a></li>
				<li><a href="#">추가</a></li>
			</ul>
		</div>
		
		<!-- 그룹번호는 상위폴더의 그룹번호, 상위폴더가 없을경우 폴더번호
				 depth는 상위폴더의 depth+1, 상위폴더가 없을경우 0
				 ino는 폴더번호 -->

		<c:forEach items="${fList}" var="vo">
			
			<div>
				<c:if test="${vo.depth ne 0}">
					<c:forEach begin="1" end="${vo.depth}">&nbsp;</c:forEach>
				</c:if>

				<div class="folder">
					<i class="material-icons">keyboard_arrow_right</i>${vo.name}
				</div>
			</div>
		</c:forEach>

		
		
		

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
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">이미지등록</h4>
			</div>
			
			<form method="post" action="${pageContext.request.contextPath}/gallery/upload" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="form-group">
						<label class="form-text">글작성</label>
						<input id="addModalContent" type="text" name="content" value="" >
					</div>
					<div class="form-group">
						<label class="form-text">이미지선택</label>
						<input id="file" type="file" name="file" value="" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn" id="btnUpload">등록</button>
				</div>
			</form>
			
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
	
	
<!-- 
<script>
	$(".nav-mid li").click(function() {
		console.log("슬라이드 실행");
		var $this = $(this);
		if ($this.hasClass("fold")) {
			$this.children().slideUp();
		} else {
			$this.slideDown();
		}
	});
</script> -->


<script type="text/javascript">
	$(document).ready(function() {
		
		//Show contextmenu:
		/* $(".folder-Area, .folder").contextmenu(function(e) { */
		$(".folder-Area").on("contextmenu", ".folder", function(e) {
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
			posTop = posY + "px";
			
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
		posTop = posY + "px";
		
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
	$(".contextmenu li").on("click", function(event) {
		
		$('#addModal').modal("show");
		
		console.log($(this).parent());
		event.preventDefault();

		$.ajax({
			url : "${pageContext.request.contextPath }/api/side/folderNew",
			type : "post",
			
			/* json형태로 보내지 않을것 */
			/* contentType : "application/json", */

			/* data : {userId : "${authUser.id}"}, */
			data : {user_id : "1"},
			
			/* 데이터 받음  */
			dataType : "json",
			success : function(fVo) {
				addFolder(fVo, "down");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
</script>

<!-- 
<script type="text/javascript">
	
	/* 사이드바 폴더 클릭 */
	$(document).on('click', '.folder', function(){
		console.log("폴더클릭");
		
		var $this = $(this);
		/* 폴더번호, 그룹번호, depth번호 가져옴 */
		console.log("폴더번호:" + $this.data("folderno"));
		console.log("그룹번호:" + $this.data("groupno"));
		console.log("depth번호:" + $this.data("depth"));
		var folderno = $this.data("folderno");
		var groupno = $this.data("groupno");
		var depth = $this.data("depth") + 1;
		
		/* 아이콘모양변경 */
		var text = $("[data-ino=" + folderno + "]").text();
		
		var folderStatus = $("[data-groupno=" + groupno + "][data-depth=" + depth + "]");
		var display = $("[data-groupno=" + groupno + "][data-depth=" + depth + "]").css('display');
		
		/* 디스플레이가 none일때 보이고 block일때 안보이게 */
		if(display == 'none') {
			folderStatus.slideDown();
		} else if(display == 'block') {
			for(var i=depth;;i++) {
				$("[data-groupno=" + groupno + "][data-depth=" + i + "]").slideUp();
				if($("[data-groupno=" + groupno + "][data-depth=" + i + "]").attr('class') == null) {
					break;
				}
			}
			
		}
		
		if(text == 'keyboard_arrow_right') {
			$("[data-ino=" + folderno + "]").text('keyboard_arrow_down');
		} else {
			$("[data-ino=" + folderno + "]").text('keyboard_arrow_right');
		}

		
	});
	
</script>
 -->