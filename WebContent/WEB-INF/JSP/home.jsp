<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="view/css/page_style.css">
		<link rel="stylesheet" type="text/css" href="view/css/button_style.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script type="text/javascript" src="../../jQuery/jquery-3.4.1.min.js"></script>
		<title>Cinguetter - Home</title>
	</head>
	<body>
		<c:set var="pageType" scope="request" value="HOME"/> <%-- Questa variabile ci serve per capire in che opagina siamo per evidenziare nel menu la pagina corrispondente  --%>
		<c:set var="logged" scope="request" value="${true}"/> <%-- Se siamo nella pagina di Home, siamo già loggati quindi per forza true --%>
		<jsp:include page="nav_bar.jsp"></jsp:include>
		<div class="row col-lg-12 col-md-12 col-sm-12">
			
			<div class="col-lg-3 col-md-3 col-sm-3">
			</div>
			
			<div class="col-lg-6 col-md-6 col-sm-6 ">
				
		
		<%-- Aggiungere la funzionalità responsive con bootstrap: vedi login --%>
		
		
		<div id="form" class="shadow-lg border border-light p-5 rounded">
			<form action="home.html" method="post" style="display:inline">
				<h3 id="label_add_text" for="cinguett_text">Add Cinguett:</h3>
				<textarea name="cinguett_text" rows="4" cols="50" class="form-control mb-4" maxlength="150" style="resize:none"></textarea>   <%-- Regola CSS: resize: none; --%>
				<button type="submit" class="rounded btn-sample sign">Post</button>
			</form>
		</div>
		
			<c:forEach var="cinguett" items="${cinguettList}">  <%-- --%>
			
		
		<div class="shadow cinguett border  p-5 rounded">
			<div id="user_info" class="p-2">
			    <img id="cinguett_user_image" src="${userMap.get(cinguett.userId).urlImageProfile}" height="50px" class="rounded-circle bg-white align-bottom p-1 border border-dark"> 
				<label id="label_user_name" class="cinguett_text"> ${userMap.get(cinguett.userId).name} ${userMap.get(cinguett.userId).surname} </label>
			</div>
			<div class="border border-light p-1 rounded cinguett-text cinguett-back">
				<p> ${cinguett.text} </p>
			</div>
				<c:if test="${not empty commentsMap.get(cinguett.id)}">
				<p class="pt-3 ml-4 ">Comments:</p>
				<div id="comments" class="comment border border-light p-1 rounded">
						<c:forEach var="comment" items="${commentsMap.get(cinguett.id)}">
							<div class="p-2">
								<img id="comment_user_image" src="${userMap.get(comment.userId).urlImageProfile}" height="40px" class="rounded-circle bg-white align-bottom p-1 border border-dark m-1"> 
								<label id="label_comment_user_name"> ${userMap.get(comment.userId).name} ${userMap.get(comment.userId).surname} </label>
								
								<div id="comment_text" class="border border-light p-1 rounded comment-back">
									<p> ${comment.text}</p>
								</div>
							</div>
						</c:forEach>
				</div>
				</c:if>
	        <form action="home.html" method="post">
	        	<label id="label_add_comment" for="comment_text">Add comment:</label>
	        	<input type="hidden" name="cinguettId" value="${cinguett.id}"/>
				<textarea name="comment_text" rows="2" cols="30" class="form-control mb-4" maxlength="150" style="resize:none"></textarea>
				<button type="submit" class="rounded btn-sample sign comment-button">Send</button>	
			</form>
		</div>
		</c:forEach>
		
			</div>
			
			<div class="col-lg-3 col-md-3 col-sm-3">
			</div>
		</div>
		
		
	</body>
</html>