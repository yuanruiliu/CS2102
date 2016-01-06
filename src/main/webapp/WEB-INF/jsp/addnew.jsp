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
    <style type="text/css">
    	.button {
    	  display: inline-block;
		  background-color: #9eb8c3;
		  border: 0;
		  -moz-border-radius: 4px;
		  -o-border-radius: 4px;
		  -webkit-border-radius: 4px;
		  border-radius: 4px;
		  margin-bottom: 10px;
		  margin-left: 145px;
		  color: #fbfbfb;
		  font-size: 18px;
		  font-family: FuturaBT-Bold;
		  text-align: center;
		  vertical-align: middle;
		  letter-spacing: 0.1em;
		  padding: 6px 0;
		  text-transform: uppercase;
		  -moz-transition-property: all;
		  -moz-transition-duration: 0.3s;
		  -o-transition-property: all;
		  -o-transition-duration: 0.3s;
		  -webkit-transition-property: all;
		  -webkit-transition-duration: 0.3s;
		  transition-property: all;
		  transition-duration: 0.3s;
		  cursor: pointer;
		  width: 150px;
		}
		.button:hover, .button:focus {
		  background-color: #00c0ff;
		  cursor: pointer;
		  outline: none;
		}
		.fileinput-button {
 			position: relative;
			overflow: hidden;
			float: left;
			margin-right: 4px;
		}
		.button input {
		  position: absolute;
		  top: 0;
		  right: 0;
		  margin: 0;
		  opacity: 0;
		  filter: alpha(opacity=0);
		  transform: translate(-300px, 0) scale(4);
		  font-size: 23px;
		  direction: ltr;
		  cursor: pointer;
		}
		#preview {
			max-width: 400px;
			max-height: 350px;
		}
	</style>

    <script type="text/javascript" src="<c:url value='/misc/js/jquery-1.8.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/misc/js/jquery.ui.widget.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/misc/js/jquery.iframe-transport.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/misc/js/jquery.fileupload.js'/>"></script>
    <script type="text/javascript">
    	$(function() {
    		$('.upload').fileupload({
    			dataType: 'image',
    			url: 'tempimage',
    			change: function (e,data) {
    				if (data.files && data.files[0]) {
    					var reader = new FileReader();
    					reader.onload = function(elm) {
    						$('#preview')
    							.attr('src',elm.target.result);
    					}
    					reader.readAsDataURL(data.files[0]);
    				}
    			}
    		});
    	});
    </script>
</head>

<body>
<%@ include file="header.jsp" %>
<section class="contact-us" id="contact-us">
	<div class="container">
		<h1 class="section-title">New Restaurant<span class="special">.</span></h1>
		<div class="column">
			<form id="contact-form" class="contact-form" name="contact-form" method="post" novalidate="">
				<ul>
					<li class="required">
						<div class="label">
							<label for="name">Name</label>
						</div>
						<input type="text" name="name" id="name" required="required" value="">
					</li>
					<li class="required">
						<div class="label">
							<label for="address">Address</label>
						</div>
						<input type="text" name="address" required="required" id="address">
					</li>
					<li class="required">
						<div class="label">
							<label for="category">Category</label>
						</div>
						<input type="text" name="category" id="category" value="">
					</li>
					<li class="required">
						<div class="label">
							<label for="avgPrice">Average Price</label>
						</div>
						<input type="text" name="avgPrice" id="avgPrice" value="">
					</li>
					<li class="required">
						<div class="label">
							<label for="area">Area</label>
						</div>
						<input type="text" name="area" id="area" value="">
					</li>
				</ul>
				<input type="submit" id="contact-submit" name="contact-submit" value="Submit">					
				<div class="thank-you ">
					<div>
						<h2>Thanks for your proposal.</h2>
						<p>Give us a few days. We'll approve your restaurant.</p>
					</div>
				</div>
			</form>
		</div>
		<div class="column">
			<div class="us">
				<h2>Restaurant Photo</h2>
				<!-- <span class="btn fileinput-button btn-success"> -->
				<table width="100%">
				<tr><td><span class="button fileinput-button">
					<span>Add Image</span>
					<input class="upload" type="file" name="file" multiple="">
				</span></td></tr>
				<tr><td align="center"><img id="preview" src=""></td></tr>
				</table>
			</div>
		</div>
	</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>