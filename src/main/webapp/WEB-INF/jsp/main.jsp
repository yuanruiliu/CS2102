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
    <script type="text/javascript" src="<c:url value='/misc/js/main.js'/>"></script> 
</head>

<body>
<%@ include file="header.jsp" %>
<section class="our-projects" id = "our-projects">
<div class="container">
  <h1 class="section-title">
    Food Empire
    <span class="special">.</span>
  </h1>
  <section class="double-wide">
    <hgroup>
      <h1>Hot Restaurants</h1>
    </hgroup>
    <ul id="restaurant_list_1">
    </ul>
    <ul id="restaurant_list_2">
    </ul>
  </section>
  <section>
    <hgroup>
        <h1>Search</h1>
    </hgroup>
  </section>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>