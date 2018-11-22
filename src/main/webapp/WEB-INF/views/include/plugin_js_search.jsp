
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
			formObj.attr("action", "/article/search/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$(".delBtn").on("click", function(){
			formObj.attr("action", "/article/search/remove");
			formObj.submit();
		});
		
		$(".listBtn").on("click", function(){
			formObj.attr("action", "/article/search/list");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		
		$(".modifyBtn").on("click", function(){
			formObj.submit();
		});
		
		$(".cancelBtn").on("click", function(){
			history.go(-1);
		});
		
		$(".goListBtn").on("click", function(){
			self.location="/article/search/list?page=${searchCriteria.page}"
					+ "&perPageNum=${searchCriteria.perPageNum}"
					+ "&searchType=${searchCriteria.searchType}"
					+ "&keyword=${searchCriteria.keyword}";
		});
		
		
		$("#searchBtn").on("click", function (event){
			self.location =
				"/article/search/list${pageMaker.makeQuery(1)}"
				+ "&searchType=" + $("select option:selected").val()
				+ "&keyword=" + encodeURIComponent($("#keywordInput").val());
		});
		
	});
</script>