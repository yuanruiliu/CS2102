<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="wf-fftisawebpro1fftisawebpro2-n4-active wf-fftisawebpro1fftisawebpro2-i4-active wf-fftisawebpro1fftisawebpro2-n7-active wf-brandongrotesque1brandongrotesque2-n4-active wf-brandongrotesque1brandongrotesque2-n7-active wf-active">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<c:url value='/misc/stylesheets/reset.css'/>" type="text/css" />
		<link rel="stylesheet" href="<c:url value='/misc/stylesheets/style.css'/>" type="text/css" />
		<script type="text/javascript" src="<c:url value='/misc/js/jquery-1.8.1.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/misc/js/main.js'/>"></script>
		<title>Food Empire</title>
	</head>
<body>
<nav>
    <div id="header" class="center-unknown-width">
        <ul class="center-unknown-width">
            <li><a href="/tutorial">Home</a></li>
            <li><a href="/tutorial/service/manage">My Restaurants</a></li>
            <li><a href="/tutorial/service/main/about">About</a></li>
            <li><a href="/tutorial/service/account/login">Login</a></li>
        </ul>
    </div> 
</nav>
<div id="container">
</div>
<div class="wrapper container_16">
	<div id="services">
		<h1 class="aligncenter divider">Search</h1>
		<div class="whitewrapper">
			<div class="hd"></div>
			<form class="search">
				<table>
					<tr>
						<td>Category</td>
						<td>
							<select name="category">
								<option value="Chinese" selected="selected"/>Chinese</option>
								<option value="Western" />Western</option>
								<option value="Korean" />Korean</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Keyword:</td>
						<td>
							<input name="keyword" type="text" value="restaurant name" />
						</td>
					</tr>
					<tr>
						<td>Area:</td>
						<td>
							<select name="area">
								<option value="Kent Ridge" selected="selected"/>Kent Ridge</option>
								<option value="Harbourfront" />Harbourfront</option>
								<option value="Holland Village" />Holland Village</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>From:</td>
						<td><input name="lowprice" type="text" value="$"></td>
						<td>To:</td>
						<td><input name="highprice" type="text" value="$"></td>
					</tr>
					<tr>
						<td><input type="submit" value="Search" /></td>
					</tr>
				</table>	
			</form>
		</div>
	</div>
	<h1 id="searchHeader" class="aligncenter divider">Hot Restaurants</h1>
	<div id="searchResults">
	</div>
</div>
</body></html>