

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

		var article_no = "${article.article_no}";
		getFiles(article_no);
		
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$("#writeBtn").on("click", function(){
			self.location="/article/search/write";
		});
		
		
		$(".modBtn").on("click", function(){
			formObj.attr("action", "/article/search/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$(".delBtn").on("click", function(){
			
			// 댓글이 달린 게시글 삭제 처리 방지
			var replyCnt = $(".replyDiv").length;
			if(replyCnt > 0){
				alert("댓글이 달린 게시물은 삭제할 수 없습니다.");
				return;
			}
			
			// 첨부 파일명들을 배열에 저장
			var arr = [];
			$(".uploadedFileList li").each(function (){
				arr.push($(this).attr("data-src"));
			});
			
			// 첨부파일 삭제 요청
			if (arr.length > 0){
				$.post("/article/file/deleteAll", {files: arr}, function(){
					
				});
			}
			
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
		
		
		
		var article_no = "${article.article_no}"; // 현재 게시판 번호
		var replyPageNum = 1; // 댓글 페이지 번호 초기화
		
		// 댓글 내용 : 줄바꿈 / 공백처리
		Handlebars.registerHelper("escape", function(replyText){
			var text = Handlebars.Utils.escapeExpression(replyText);
			text = text.replace(/(\r\n|\n|\r)/gm, "<br/>");
			text = text.replace(/( )/gm, "&nbsp;");
			return new Handlebars.SafeString(text);
		});
		
		// 댓글 등록 일자 : 날짜/시간 2자리로 맞추기
		Handlebars.registerHelper("prettifyDate", function (timeValue){
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth()+1;
			var date = dateObj.getDate();
			var hours = dateObj.getHours();
			var minutes = dateObj.getMinutes();
			// 2자리 숫자로 변환
			month < 10 ? month = '0' + month : month;
			date < 10 ? date = '0' + date : date;
			hours < 10 ? hours = '0' + hours : hours;
			minutes < 10 ? minutes = '0' + minutes : minutes;
			return year + "-" + month + "-" + date + " " + hours + ":" + minutes;
		});
		
		// 댓글 목록 함수 호출
		getReplies("/replies/" + article_no + "/" + replyPageNum);
		
		// 댓글 목록 함수
		function getReplies(repliesUri){
			$.getJSON(repliesUri, function (data){
				printReplyCount(data.pageMaker.totalCount);
				printReplies(data.replies, $(".repliesDiv"), $("#replyTemplate"));
				printReplyPaging(data.pageMaker, $(".pagination"));
			});
		}
		
		// 댓글 갯수 출력 함수
		function printReplyCount(totalCount){
			
			var replyCount = $(".replyCount");
			var collapsedBox = $(".collapsed-box");
			
			// 댓글이 없으면
			if(totalCount === 0){
				replyCount.html("댓글이 없습니다. 의견을 남겨주세요");
				collapsedBox.find(".btn-box-tool").remove();
				return;
			}
			
			// 댓글이 존재하면
			replyCount.html(" 댓글목록 (" + totalCount +")");
			collapsedBox.find(".box-tools").html(
					"<button type='button' class='btn btn-box-tool' data-widget='collapse'>"
					+ "<i class='fa fa-plus'></i>"
					+ "</button>"
			);
		}
		
		// 댓글 목록 출력 함수
		function printReplies(replyArr, targetArea, templateObj){
			var replyTemplate = Handlebars.compile(templateObj.html());
			var html = replyTemplate(replyArr);
			$(".replyDiv").remove();
			targetArea.html(html);
		}
		
		// 댓글 페이징 출력 함수
		function printReplyPaging(pageMaker, targetArea){
			var str= "";
			if(pageMaker.prev){
				str += "<li><a href='" + (pageMaker.startPage - 1) + "'>이전</a></li>";
			}
			for (var i = pageMaker.startPage, len = pageMaker.endPage; i<=len; i++){
				var strClass = pageMaker.criteria.page == i ? "class=active" : "";
				str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
			}
			if(pageMaker.next){
				str += "<li><a href='" + (pageMaker.endPage + 1) + "'>다음</a></li>";
			}
			targetArea.html(str);
		}
		
		// 댓글 페이지 번호 클릭 이벤트 
		$(".pagination").on("click", "li a", function(event){
			event.preventDefault();
			replyPageNum = $(this).attr("href");
			getReplies("/replies/"+article_no + "/" + replyPageNum);
		});
		
		
	
	// 댓글 저장 버튼 클릭 이벤트
	$(".replyAddBtn").on("click", function(){
		// 입력 form 선택자
		var replyWriterObj = $("#newReplyWriter");
		var replyTextObj = $("#newReplyText");
		var replyWriter = replyWriterObj.val();
		var replyText = replyTextObj.val();
		
		// 댓글 입력 처리
		$.ajax({
			type : "post",
			url : "/replies/", 
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				article_no : article_no,
				replyWriter : replyWriter,
				replyText : replyText
			}),
			success: function(result){
				console.log("result : " + result);
				if(result === "regSuccess") {
					alert("댓글이 등록되었습니다.");
					replyPageNum = 1; // 페이지 1로 초기화
					getReplies("/replies/"+article_no + "/" + replyPageNum); // 댓글 목록 호출
					replyTextObj.val("");
					replyWriterObj.val("");
				}
			}
		});
	});
		
	// 댓글 수정을 위해 modal 창에 선택한 댓글의 값 세팅
	$(".repliesDiv").on("click", ".replyDiv", function(event){
		var reply = $(this);
		$(".reply_no").val(reply.attr("data-reply_no"));
		$("#replyText").val(reply.find(".oldReplyText").text());
	});
	
	// modal 창의 댓글 수정버튼 클릭 이벤트
	$(".modalModBtn").on("click", function(){
		var replyNo = $(".reply_no").val();
		var replyText = $("#replyText").val();
		$.ajax({
			type : "put",
			url : "/replies/" + reply_no,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			dataType : "text",
			data: JSON.stringify({
				replyText : replyText
			}),
			success: function (result){
				console.log("result : " + result);
				if(result === "modSuccess"){
					alert("댓글이 수정되었습니다.");
					getReplies("/replies/" +artilce_no + "/" + replyPageNum);
					$("modModal").modal("hide");
				}
			}
		})
	});

	// modal 창 댓글 삭제 버튼 클릭 이벤트
	$(".modalDelBtn").on("click", function(){
		var reply_no = $(".reply_no").val();
		$.ajax({
			type : "delete",
			url : "/replies/" + reply_no,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : "text",
			success: function (result){
				console.log("result : " + result);
				if( result === "delSuccess"){
					alert("댓글이 삭제되었습니다.");
					getReplies("/replies/" + article_no + "/" + replyPageNum);
					$("#delModal").modal("hide");
				} 
			}
		})
	});
	
	

		
	
	
	
	
	
	
	
	
	});
</script>

  
<script id="replyTemplate" type="text/x-handlebars-template">
	{{#each.}}
	<div class="post replyDiv" data-reply_no={{reply_no}}>
		<div class="user-block">
			<img class="img-circle img-bordered-sm" src="/dist/img/user-1-128x128.jpg" alt="user image">
			<span class="username">
				<a href="#">{{replyWriter}}</a>
				<a href="#" class="pull-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
					<i class="fa fa-times">삭제</i>				
				</a>
				<a href="#" class="pull-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal">
					<i class="fa fa-edit">수정</i>
				</a>
			</span>
			<span class="description">{{prettifyDate regDate}}</span>
		</div>
		<div class="oldReplyText">{{escape replyText}}</div>
		<br />	
	</div>
	{{/each}}
</script>


<script id="fileTemplate" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgSrc}}" alt="Attachment">
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}
			</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delBtn">
				<i class="fa fa-fw fa-remove"></i>
			</a>
		</div>
	</li>
</script>
 <%-- 파일 입출력 관련 --%>
<script>
	
	// 파일 목록 : 게시글 조회, 수정 페이지
	function getFiles(article_no){
		$.getJSON("/article/file/list/" + article_no, function (list){
			if(list.length === 0){
				$(".uploadedFileList").html("<span class='noAttach'>첨부파일이 없습니다.</span>")
			}
			$(list).each(function (){
				printFiles(this);
			})
		});
	}

	// write.jsp 첨부파일 이벤트 처리 js 코드
	$("#writeForm").submit(function (event){
		event.preventDefault();
		var that = $(this);
		fileSubmit(that);
	});
	
	//  handlebars 파일 템플릿 컴파일
	var fileTemplate = Handlebars.compile($("#fileTemplate").html());
	
	
	// 첨부파일 출력
	function printFiles(data){
		// 파일 정보 처리
		var fileInfo = getFileInfo(data);
		// Handlebars 파일 템플릿에 파일 정보를 바인딩하고 HTML 생성
		var html = fileTemplate(fileInfo);
		// Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
		$(".uploadedFileList").append(html);
		// 이미지 파일인 경우 파일 템플릿에 lightbox 속성 추가
		if (fileInfo.fullName.substr(12,2) === "s_"){
			// 마지막에 추가된 첨부파일 템플릿 선택자
			var that = $(".uploadedFileList li").last();
			// lightbox 속성 추가
			that.find(".mailbox-attachment-name").attr("data-lightbox", "uploadImages");
			// 파일 아이콘에서 이미지 아이콘으로 변경
			that.find(".fa-paperclip").attr("class", "fa fa-camera");
		}
	}
	
	
	// 파일 정보 처리
	function getFileInfo(fullName){
		
		var originalFileName;	// 화면에 출력할 파일명
		var imgSrc;				// 썸네일 or 파일 아이콘 이미지 파일 출력 요청 URL
		var originalFileUrl;	// 원본파일 요청 URL
		var uuidFileName; 		// 날짜 경로 제외한 나머지 파일명 (UUID_파일명.확장자)
		
		// 이미지 파일일 때
		if(checkImageType(fullName)){
			imgSrc = "/article/file/display?fileName=" + fullName; // 썸네일 링크
			uuidFileName = fullName.substr(14);
			var originalImg = fullName.substr(0, 12) + fullName.substr(14);
			// 원본 이미지 요청 링크
			originalFileUrl = "/article/file/display?fileName=" + originalImg;
		} else {
			imgSrc = "/dist/img/file-icon.png";
			uuidFileName = fullName.substr(12);
			// 파일 다운로드 요청 링크
			originalFileUrl = "/article/file/display?fileName=" + fullName;
		}
		
		originalFileName = uuidFileName.substr(uuidFileName.indexOf("_") + 1);
		
		return {originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName};
	}
	
	
	// 이미지 파일 유무 확인
	function checkImageType(fullName){
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		return fullName.match(pattern);
	}
	
	
	

</script>
 

