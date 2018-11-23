
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
		
		// 댓글 목록 호출
		getReplies();
		
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
	});
</script>