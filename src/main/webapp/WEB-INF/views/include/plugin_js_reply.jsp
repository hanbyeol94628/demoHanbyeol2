
<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
     

<script>
	$(document).ready(function(){
		
		// 211번째 게시글
		var article_no = 200;

		// 목록 페이지 번호 변수 선언, 1로 초기화(첫번째 페이지)
		var replyPageNum = 1;
		
		
		// 목록 페이지 번호 클릭 이벤트 
		$(".pagination").on("click", "li a", function (event){
			event.preventDefault();
			replyPageNum = $(this).attr("href"); // 번호 추출
			
			getRepliesPaging(replyPageNum);		
		});
		
		
		// 댓글 목록 호출
		getRepliesPaging(replyPageNum);

		
		// 댓글 값 세팅
		$("#replies").on("click", ".replyLi button", function(){
			var reply = $(this).parent();
			
			var reply_no = reply.attr("data-reply_no");
			var replyText = reply.find(".replyText").text();
			var replyWriter = reply.find(".replyWriter").text();
			
			$("#reply_no").val(reply_no);
			$("#replyText").val(replyText);
			$("#replyWriter").val(replyWriter);
			
		});
		
		
		
		// 댓글 목록 출력 함수
		function getReplies(){
			$.getJSON("/replies/all/" + article_no, function (data){
				console.log(data);
				var str = "";
				$(data).each(function(){
					str += "<li data-reply_no='" + this.reply_no + "' class='replyLi'>"
						+ "<p class='replyText'>" + this.replyText + "</p>"
						+ "<p class='replyWriter'>" + this.replyWriter + "</p>"
						+ "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
						+ "</li>"
						+ "<hr />";
				});
				$("#replies").html(str);
			});
		}
		
		// 댓글 목록 페이징 함수
		function getRepliesPaging(page){
			$.getJSON("/replies/" + article_no + "/" + page, function(data){
				console.log(data);
				
				var str="";
				
				$(data.replies).each(function(){
					str += "<li data-reply_no='" + this.reply_no + "' class='replyLi'>"
						+  "<p class='replyText'>" + this.replyText + "</p>"
						+  "<p class='replyWriter'>" + this.replyWriter + "</p>"
						+  "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
						+  "</li>"
						+  "<hr/>";
				
				});
				
				$("#replies").html(str);
				
				// 페이지 번호 출력 호출
				printPageNumbers(data.pageMaker);
				
			});
		}
		
		
		// 댓글 목록 페이지 번호 출력 함수
		function printPageNumbers(pageMaker) {
			
			var str="";

			
			// 이전 버튼 활성화
			if(pageMaker.prev){
				str += "<li><a href='"+(pageMaker.startPage-1)+"'>이전</a></li>";
			}
			
			// 페이지 번호
			for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
				var strClass = pageMaker.criteria.page == i ? "class='active'" : '';
				str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
			}
			
			// 다음 버튼 활성화
			if (pageMaker.next){
				str += "<li><a href='"+(pageMaker.endPage +1)+"'>다음</a></li>";
			}
			
			$(".pagination-sm").html(str);
		}
		
		
	
		
		
		
		// 댓글 저장 버튼 클릭 이벤트 발생 시 
		$("#replyAddBtn").on("click", function(){
			// 화면으로부터 입력 받은 변수값을 처리
			var replyText = $("#newReplyText");
			var replyWriter = $("#newReplyWriter");
			
			var replyTextVal = replyText.val();
			var replyWriterVal = replyWriter.val();
			
			// AJAX 통신 : POST
			$.ajax({
				type : "post",
				url : "/replies",
				headers : {
					"Content-type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : JSON.stringify({
					article_no : article_no,
					replyText : replyTextVal,
					replyWriter : replyWriterVal
				}),
				success : function (result) {
					// 성공적인 댓글 등록 처리 알림
					if (result == "regSuccess"){
						alert("댓글 등록 완료!");
					}
					getRepliesPaging(); // 댓글 목록 출력 함수 호출
					replyText.val(""); // 댓글 내용 초기화
					replyWriter.val(""); // 댓글 작성자 초기화
				}
			});
		});
		
		
		
		
		// 댓글 수정
		$(".modalModBtn").on("click", function(){
			// 댓글 선택자
			var reply = $(this).parent().parent();
			// 댓글 번호
			var reply_no = reply.find("#reply_no").val();
			// 수정한 댓글 내용
			var replyText = reply.find("#replyText").val();
			
			// AJAX 통신 : PUT
			$.ajax({
				type : "put",
				url : "/replies/" + reply_no,
				headers : {
					"Content-type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify(
						{replyText : replyText}
				),
				dataType : "text",
				success : function(result){
					console.log("result : " + result);
					if( result == "modSuccess" ){
						alert("댓글 수정 완료!");
						$("#modifyModal").modal("hide");
						getRepliesPaging(replyPageNum);
					}
				}
				
			});
		});
		
		
		
		
		
		
		

		
		// 댓글 삭제
		$(".modalDelBtn").on("click", function(){
			// 댓글 번호
			var reply_no = $(this).parent().parent().find("#reply_no").val();
			
			// AJAX 통신 : DELETE
			$.ajax({
				type : "delete",
				url : "/replies/" + reply_no,
				headers : {
					"Content-type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : "text",
				success : function (result){
					console.log("result : " + result);
					if(result == "delSuccess"){
						alert("댓글 삭제 완료!");
						$("#modifyModal").modal("hide"); // Modal 닫기
						getRepliesPaging(replyPageNum); // 댓글 목록 갱신
					}
				}
			});
		});
		
		
		
		
		
		
		
		
		
	});
</script>