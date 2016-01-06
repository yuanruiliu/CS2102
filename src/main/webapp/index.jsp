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
    <link rel="stylesheet" href="<c:url value='/misc/stylesheets/jquery-ui.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value='/misc/stylesheets/ui.selectmanu.css'/>" type="text/css" />

    <script type="text/javascript" src="<c:url value='/misc/js/jquery-1.8.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/misc/js/jquery-ui-1.9.1.custom.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/misc/js/jquery.ui.selectmenu.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/misc/js/main.js'/>"></script> 
    <script type="text/javascript">
      function make_select_manu (select) {
        select.selectmenu({
          style:'dropdown',
          width: 135,
        });
      }
      $(function() {
        make_select_manu($('select#category'));
        make_select_manu($('select#area'));
      })
    </script>
</head>

<body>
<%@ include file="WEB-INF/jsp/header.jsp" %>
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
        <div class="whitewrapper">
          <div class="hd"></div>
          <div class="search" >
            <form class="foodSearch" method="post" action="service/search">
              <div class="dropdown-group" >
                <p class="q-main-search"><input class="textSearchAdv" autocomplete="off" placeholder="Search restaurants, hawker, bars &amp; pubs" id="keyword" name="keyword" value="" type="text"><i class="icons ico-search"></i></p>
              </div>
              <div class="select" style="float:left;">
                  <select name="category" id="category">
                    <option value="Category" selected="selected">Category</option>
                    <option value="Chinese" class="whoo">Chinese</option>
                    <option value="Western">Western</option>
                    <option value="Korean">Korean</option>
                    <option value="Japenese">Japenese</option>
                    <option value="Indian">Indian</option>  
                  </select>
              </div>
              <div class="select" style="float:right">
                  <select name="area" id="area">
                    <option value="Area" selected="selected">Area</option>
                    <option value="West Coast" class="whoo">West Coast</option>
                    <option value="HourberFront">HourberFront</option>
                    <option value="Holland Village">Holland Village</option>
                    <option value="Clementi">Clementi</option>
                  </select>
              </div>
              <div class="low-price" >
                <p class="q-main-search"><input class="textSearchAdv" autocomplete="off" placeholder="Minimal Price" id="lowPrice" name="lowPrice" value="" type="text"></p>
              </div>
              <div class="high-price" >
                <p class="q-main-search"><input class="textSearchAdv" autocomplete="off" placeholder="Maximal Price" id="highPrice" name="highPrice" value="" type="text"></p>
              </div>
              <input type="submit" value="Search">
            </form>
          </div>
        </div>
    </hgroup>
  </section>
</div>
</section>
<%@ include file="WEB-INF/jsp/footer.jsp" %>
</body>
</html>