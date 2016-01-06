<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html class="home-page wf-minionpro1minionpro2-n4-active wf-minionpro1minionpro2-i4-active wf-active"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
    <title>Food Empire</title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link rel="stylesheet" href="<c:url value='/misc/stylesheets/reset.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value='/misc/stylesheets/font.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value='/misc/stylesheets/style.css'/>" type="text/css" />

    <script type="text/javascript" src="<c:url value='/misc/js/jquery-1.8.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/misc/js/jquery.jeditable.js'/>"></script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		$('.edit').editable("/tutorial/service/manage/modify", {
    			indicator : 'Saving...',
    			tooltip   : 'Click to edit...'
    		});
    	});
    	function approve (restId) {
    	  var confirm = window.confirm("Confirm this restaurant proposal?");	
          if (confirm) {$.ajax({
            	url:"/tutorial/service/manage/approve/"+restId,
            	success: function(message) {
              	if (message == true) {
               	 $('button.restId'+restId).remove();
              	} else {
            	    alert("approve failed!");
        	      }
    	        }
 	         });
      	  }
      	};	
      function remove (restId) {
	      var confirm = window.confirm("Are you sure to delete this restaurant?");
	      if (confirm == true) {
	        $.ajax({
	          url:"/tutorial/service/manage/delete/"+restId,
	          success: function(message) {
	            if (message == true) {
	              $('li#'+restId).remove();
	            } else {
	              alert("delete failed!");
	            }
	          }
	        });
	      }
      };
    </script>
</head>

<body>
<%@ include file="header.jsp" %>
<section class="working-with-us" id="working-with-us">
	<div class="container">
		<h1 class="section-title">Manage My Restaurants<span class="special">.</span></h1>
		<a href="/tutorial/service/manage/new"><button class="bigbutton">Add New</button></a>
		<ul>
			<c:forEach var="rest" items="${restList}" varStatus="status">
	            <li id="${rest.id}">
	            	<div class="arrow"></div>
	            	<div class="fact">
	            		<h2 class="edit" id="name ${rest.id}">${rest.name}</h2>
	            		<p>
	            			<table width="300">
	            				<tr>
	            					<td width="130">Address:</td>
	            					<td class="edit" id="address ${rest.id}">${rest.address}</td>
	            					<td><button id="small" onclick="remove(${rest.id})">delete</button></td>
	            				</tr>
	            				<tr>
	            					<td>Category:</td>
	            					<td class="edit" id="category ${rest.id}">${rest.category}</td>
	            					<td>
	            						<c:if test="${rest.isApproved == 0}" >
	            							<sec:authorize access="hasRole('admin')">
	              								<button id="small" class="restId${rest.id}" onclick="approve(${rest.id})">approve</button>
	            							</sec:authorize>
	          							</c:if>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>Average Price:</td>
	            					<td class="edit" id="avgPrice ${rest.id}">${rest.avgPrice}</td>
	            				</tr>
	            				<tr>
	            					<td>Area:</td>
	            					<td class="edit" id="area ${rest.id}">${rest.area}</td>
	            				</tr>
	            			</table>
	            		</p>
	            	</div>
	            </li>
   			</c:forEach> 
		</ul>
	</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>