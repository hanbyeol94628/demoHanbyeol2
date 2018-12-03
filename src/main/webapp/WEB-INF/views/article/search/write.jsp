<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="../include/head.jsp" %>

<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini layout-boxed">
<div class="wrapper">


	<!-- Main Header -->
	<%@ include file="../include/main_header.jsp" %>


	<!-- Left side column. contains the logo and sidebar -->
	<%@ include file="../include/left_column.jsp" %>

  <!-- Content Wrapper. Contains page content -->
	
	
	<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Page Header
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>
    <section class="content container-fluid">
    
    <div class="col-lg-12">
		<form role="form" id="writeForm" method="post" action="${path}/article/search/write">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">게시글 작성</h3>
				</div>
				<div class="box-body">
					<div class="form-group">
						<label for="title">제목</label>
						<input class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
					</div>
					
					<div class="form-group">
						<label for="content">내용</label>
						<textarea name="content" id="editor1" rows="10" cols="80">
							This is my textarea to be replaced with CKEditor.
						</textarea>
						<script>
							var editorConfig = {
									filebrwoserUploadUrl : "/resources/ckeditor/uploadImg",
							};
							
							CKEDITOR.on('dialogDefinition', function(ev){
								var dialogName = ev.data.name;
								var dialogDefinition = ev.data.definition;
								
								switch(dialogName){
									case 'image' : // Image Properties dialog
									// dialogDefinition.removeContents('info');
									dialogDefinition.removeContents('Link');
									dialogDefinition.removeContents('advanced');
									break;
								}
							});
							
							CKEDITOR.replace('editor1', editorConfig);
						
						</script>
					</div>
					
					<div class="form-group">
						<label for="writer">작성자</label>
						<input class="form-control" id="writer" name="writer">
					</div>
					
					<%-- 첨부파일 --%>
					<div class="form-group">
						<div class="fileDrop">
							<br />
							<br />
							<br />
							<br />
							<p class="text-center"><i class="fa fa-paperclip"></i> 첨부파일을 드래그 해주세요.</p>						
						</div>
					</div>
					<div class="box-footer">
						<ul class="mailbox-attachments clearfix uploadedFileList"></ul>
					</div>			
				</div>
				<div class="box-footer">
					<button type="button" class="btn btn-primary"><i class="fa fa-list"></i>목록</button>
					<div class="pull-right">
						<button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i>초기화</button>
						<button type="submit" class="btn btn-success"><i class="fa fa-save"></i>저장</button>
					</div>
				</div>			
			</div>		
		</form>    
    </div>
    
	</div>
	<!-- /.content-wrapper -->



	<!-- Main Footer -->
	<%@ include file="../include/main_footer.jsp" %>



	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
	  <!-- Create the tabs -->
	 <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
	   <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
	   <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
	 </ul>
	 <!-- Tab panes -->
	 <div class="tab-content">
	   <!-- Home tab content -->
	   <div class="tab-pane active" id="control-sidebar-home-tab">
	     <h3 class="control-sidebar-heading">Recent Activity</h3>
	     <ul class="control-sidebar-menu">
	       <li>
	         <a href="javascript:;">
	           <i class="menu-icon fa fa-birthday-cake bg-red"></i>
	
	           <div class="menu-info">
	             <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
	
	             <p>Will be 23 on April 24th</p>
	           </div>
	         </a>
	       </li>
	     </ul>
	     <!-- /.control-sidebar-menu -->
	
	     <h3 class="control-sidebar-heading">Tasks Progress</h3>
	     <ul class="control-sidebar-menu">
	       <li>
	         <a href="javascript:;">
	           <h4 class="control-sidebar-subheading">
	             Custom Template Design
	             <span class="pull-right-container">
	                 <span class="label label-danger pull-right">70%</span>
	               </span>
	           </h4>
	
	           <div class="progress progress-xxs">
	             <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
	           </div>
	         </a>
	       </li>
	     </ul>
	     <!-- /.control-sidebar-menu -->
	
	   </div>
	   <!-- /.tab-pane -->
	   <!-- Stats tab content -->
	   <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
	   <!-- /.tab-pane -->
	   <!-- Settings tab content -->
	   <div class="tab-pane" id="control-sidebar-settings-tab">
	     <form method="post">
	       <h3 class="control-sidebar-heading">General Settings</h3>
	
	       <div class="form-group">
	         <label class="control-sidebar-subheading">
	           Report panel usage
	           <input type="checkbox" class="pull-right" checked>
	         </label>
	
	         <p>
	           Some information about this general settings option
	         </p>
	       </div>
	       <!-- /.form-group -->
	     </form>
	   </div>
	   <!-- /.tab-pane -->
	  </div>
	</aside>
	<!-- /.control-sidebar -->
  	<div class="control-sidebar-bg"></div>
  	
  	
</div>

<!-- ./wrapper -->
<%@ include file="../include/plugin_js_search.jsp" %>

<%-- 파일 입출력 관련 --%>
<script>


	// write.jsp 첨부파일 이벤트 처리 js 코드
	$("#writeForm").submit(function (event){
		event.preventDefault();
		var that = $(this);
		fileSubmit(that);
	});
	
	// 파일 삭제 버튼 클릭 이벤트
	$(document).on("click", ".delBtn", function (event){
		event.preventDefault();
		var that = $(this);
		deleteFileWrtPage(that);
	});
	
	//  handlebars 파일 템플릿 컴파일
	var fileTemplate = Handlebars.compile($("#fileTemplate").html());
	
	// 첨부파일 drag & drop 영역 선택자
	var fileDropDiv = $(".fileDrop");
	
	// 전체 페이지 첨부파일 drag & drop 기본 이벤트 방지
	$(".content-wrapper").on("dragenter dragover drop", function (event){
		event.preventDefault();
	});
	
	// 첨부파일 영역 drag & drop 방지
	fileDropDiv.on("drop", function(event){
		event.preventDefault();
		// drop 이벤트 발생시 전달된 파일 데이터
		var files = event.originalEvent.dataTransfer.files;
		// 단일 파일 데이터만을 처리하기 때문에 첫번재 파일만 저장
		var file = files[0];
		// formData 객체 생성, 파일 데이터 저장
		var formData = new FormData();
		formData.append("file", file);
		// 파일 업로드 AJAX 통신 메서드 호출
		uploadFile(formData);
	});
	
	
	// 파일 업로드 AJAX 통신
	function uploadFile(formData){
		$.ajax({
			url: "/article/file/upload",
			data: formData,
			dataType: "text",
			// processData : 데이터를 일반적인 쿼리 스트링으로 변환처리 할 지 말지
			// 기본값은 트루 
			processData: false,
			// contentType : 기본값은 true, multipart/fomr-data 방식으로 전송하기 위해 false
			contentType: false,
			type: "POST",
			success: function(data){
				printFiles(data); // 첨부파일 출력 메소드 호출
				$(".noAttach").remove();
			}
		});
	}
	
	
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
	
	
	// 게시글 입력/수정 submit 처리시 첨부파일 정보도 함께 처리
	function fileSubmit(that){
		var str="";
		$(".uploadedFileList .delBtn").each(function (index){
			str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("href") + "'>"
		});
		
		that.append(str);
		that.get(0).submit();
	}
	
	
	// 파일 삭제 (입력 페이지) : 첨부파일만 삭제처리
	function deleteFileWrtPage(that){
		var url = "/article/file/delete";
		deleteFile(url, that);
	}
	
	
	// 파일 삭제 AJAX 통신
	function deleteFile(url, that){
		$.ajax({
			url: url,
			type: "post",
			data: {fileName: that.attr("href")},
			dataType: "text",
			success: function (result){
				if(result === "DELETED"){
					alert("삭제되었습니다.");
					that.parents("li").remove();
				}
			}
		});
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
</body>
</html>