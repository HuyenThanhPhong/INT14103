<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="right_col" role="main">
  <div class="">
    <div class="clearfix"></div>
    
    <div class="row">
    	<div class="col-md-12 col-sm-12">
    		<div class="x_panel">
    			<div class="x_title">
    				<h2>Roles</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li>
							<a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li>
							<a href="<c:url value="/role/add"/>" class="font-weight-bold" style="color: #2A3F54;">
							<i class="fa fa-plus"></i></a>
						</li>
					</ul>
					<div class="clearfix"></div>
    			</div>
    			
    			<div class="x_content">
    				
    				<div class="container">
    					<form:form modelAttribute="searchForm" servletRelativeAction="/role/list/1" method="POST">
    						
    					</form:form>
    				</div>
    			</div>
    		</div>
    	
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12 col-sm-12">
    		<div class="d-flex justify-content-between align-items-center">
				<div>
					<%-- <a href="<c:url value="/role/add"/>" class="font-weight-bold btn btn-dark mb-2">
						<i class="fa fa-plus"></i> Add New Role
					</a> --%>
				</div>
				<div></div>
			</div>
			
			<div class="table-responsive">
				<table class="table table-striped jambo_table bulk_action">
					<thead>
						<tr class="headings">
							<th class="column-title">#</th>
							<th class="column-title">ID</th>
							<th class="column-title">Role</th>
							<th class="column-title">Description</th>
							<th class="column-title no-link last text-center">
								<span class="nobr">Action</span>
							</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${roles}" var="r" varStatus="loop">
							<c:choose>
								<c:when test="${loop.index % 2 == 0 }">
									<tr class="even pointer">
								</c:when>
								<c:otherwise>
									<tr class="odd pointer">
								</c:otherwise>
							</c:choose>
							<td class=" ">${pageInfo.getOffset()+loop.index+1}</td>
							<td class=" ">${r.id }</td>
							<td class=" ">${r.roleName }</td>
							<td class=" ">${r.description }</td>
							<td class="text-center">
								<a href="<c:url value="/role/view/${r.id }"/>"
									class="btn btn-round btn-secondary mr-2"> 
									<i class="fa fa-eye"></i>
								</a> 
								
								<a href="<c:url value="/role/edit/${r.id }"/>"
									class="btn btn-round btn-primary mr-2"> 
									<i class="fa fa-edit"></i>
								</a> 
								
								<c:choose>
									<c:when test="${r.roleName eq 'admin' }">
										
									</c:when>
									<c:otherwise>
										<a href="javascript:void(0);" onclick="confirmDelete(${r.id});"
											class="btn btn-round btn-danger"> 
											<i class="fa fa-trash"></i>
										</a>
									</c:otherwise>
								</c:choose>
							</td>
						</c:forEach>
					</tbody>
				</table>
				<jsp:include page="../layout/paging.jsp"></jsp:include>
			</div>
    	</div>
    </div>
  </div>
</div>

<script type="text/javascript">

	function confirmDelete(id) {
		if (confirm('Are you sure you want delete this role?')) {
			window.location.href = '<c:url value="/role/delete/"/>'+id;
		}
	};
	
	function gotoPage(page) {
		$('#searchForm').attr('action', '<c:url value="/role/list/"/>' + page);
		$('#searchForm').submit();
	};

	function processMessage() {
		var msgSuccess = '${msgSuccess}';
		var msgError = '${msgError}';
		if (msgSuccess) {
			new PNotify({
				title : 'Success',
				text : msgSuccess,
				type : 'success',
				styling : 'bootstrap3'
			});
		}
		if (msgError) {
			new PNotify({
				title : 'Error',
				text : msgError,
				type : 'error',
				styling : 'bootstrap3'
			});
		}
	};

	$(document).ready(function(){
			processMessage();	
	});

</script>