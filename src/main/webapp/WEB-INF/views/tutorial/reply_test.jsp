<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%@ include file="../include/head.jsp" %>

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
   			<div class="box box-primay">
				<div class="box-header with-border">
					<h3 class="box-title">댓글 작성</h3>
				</div>
				<div class="box-body">
					<div class="form-group">
						<label for="newReplyText">댓글 내용</label>
						<input class="form-control" id="newReplyText" name="replyText" placeholder="댓글 내용을 입력하세요">
					</div>
					
					<div class="form-group">
						<label for="newReplyText">댓글 작성자</label>
						<input class="form-control" id="newReplyWriter" name="replyWriter" placeholder="댓글 작성자를 입력하세요">
					</div>
					
					
					<div>
						<button type="button" id="replyAddBtn" class="btn btn-primary pull-right"><i class="fa fa-pencil"></i>댓글 저장</button>
					</div>
					
				</div>
				
				<div class="box-footer">
					<ul id="replies">
					</ul>	
				</div>
				
				
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination pagination-sm no-margin">
						
						</ul>
					</div>
				</div>
				
				
   			</div>
		</div>
		
		<div class="modal fade" id="modifyModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">댓글 수정창</h4>
					</div>
					
					<div class="modal-body">
						<div class="form-group">
							<label for="reply_no">댓글 번호</label>
							<input class="form-control" id="reply_no" name="reply_no" readonly>
						</div>
						<div class="form-group">
							<label for="replyText">댓글 내용</label>
							<input class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력하세요">
						</div>
						<div class="form-group">
							<label for="replyWriter">댓글 작성자</label>
							<input class="form-control" id="replyWriter" name="replyWriter" readonly>
						</div>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-success modalModBtn">수정</button>
						<button type="button" class="btn btn-danger modalDelBtn">삭제</button>
					</div>
					
				</div>
			</div>
		</div>
	</section>
	<!-- /.content-wrapper -->



	<!-- Main Footer -->
	<%@ include file="../include/main_footer.jsp" %>

	
	<form id="listPageForm">
		<input type="hidden" name="page" value="${pageMaker.criteria.page}">
		<input type="hidden" name="perPageNum" value="${pageMaker.criteria.perPageNum}">
	</form>


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
<%@ include file="../include/plugin_js_reply.jsp" %>

</body>
</html>