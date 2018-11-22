
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
	var result = "${msg}";
	if (result == "regSuccess"){
		alert("게시글 등록이 완료되었습니다.");
	} else if (result == "modSuccess"){
		alert("게시글 수정이 완료되었습니다.");
	} else if (result == "delSuccess"){
		alert("게시글 삭제가 완료되었습니다.");
	}
</script>

<script>
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$("#writeBtn").on("click", function(){
			self.location="/article/paging/write";
		});
		
		
		$(".modBtn").on("click", function(){
			formObj.attr("action", "/article/paging/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$(".delBtn").on("click", function(){
			formObj.attr("action", "/article/paging/remove");
			formObj.submit();
		});
		
		$(".listBtn").on("click", function(){
			formObj.attr("method", "get");
			formObj.attr("action", "/article/paging/list");
			formObj.submit();
		});
		
		
		$(".modifyBtn").on("click", function(){
			formObj.submit();
		});
		
		$(".cancelBtn").on("click", function(){
			history.go(-1);
		});
		
		$(".goListBtn").on("click", function(){
			self.location="/article/paging/list?page=${criteria.page}&perPageNum=${criteria.perPageNum}";
		});
		
		$(".pagination li a").on("click", function (event){
			event.preventDefault();
			
			var targetPage = $(this).attr("href");
			var listPageForm = $("#listPageForm");
			
			listPageForm.find("[name='page']").val(targetPage);
			listPageForm.attr("action", "/article/paging/list").attr("method", "get");
			listPageForm.submit();
		})
		
		
		
	});
</script>