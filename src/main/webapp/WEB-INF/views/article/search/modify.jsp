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
		<form role="form" id="writeForm" method="post" action="${path}/article/search/modify">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">게시글 작성</h3>
				</div>
				<div class="box-body">
						<input type="hidden" name="article_no" value="${article.article_no}">
						<input type="hidden" name="page" value="${searchCriteria.page}">
						<input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
						<input type="hidden" name="searchType" value="${searchCriteria.searchType}">
						<input type="hidden" name="keyword" value="${searchCriteria.keyword}">
					
					<div class="form-group">
						<label for="title">제목</label>
						<input class="form-control" id="title" name="title" placeholder="제목을 입력하세요" value="${article.title}">
					</div>
					
					<div class="form-group">
						<label for="content">내용</label>
						<textarea name="content" id="editor1" rows="10" cols="80">
							${article.content}
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
						<input class="form-control" id="writer" name="writer" value="${article.writer}" readonly>
					</div>
				</div>
				<div class="box-footer">
					<button type="button" class="btn btn-primary goListBtn"><i class="fa fa-list"></i>목록</button>
					<div class="pull-right">
						<button type="reset" class="btn btn-warning cancelBtn"><i class="fa fa-reply"></i>취소</button>
						<button type="submit" class="btn btn-success modifyBtn"><i class="fa fa-save"></i> 수정 저장</button>
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

</body>
</html>