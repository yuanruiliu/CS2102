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
    <script type="text/javascript" src="<c:url value='/misc/js/jquery.pajinate.min.js'/>"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
          category('all');          
          paginate();
        });
        function paginate () {
          $('#paging_container').pajinate({
              num_page_links_to_display : 5,
              items_per_page:10
            });
        };
        function category(category) {
          type = '${page_title}';
          if (type == "Category List") {
            $.getJSON('/tutorial/service/search/'+category, function(data) {
              addRestaurantListToPage(data);
              paginate();
            })
          } else {
            var json = eval('${results}');
            var data = filter(json,category);
            addRestaurantListToPage(data);
            paginate();
          };
        };
        function filter (data,category) {
          if (category == "all") {
            return data;
          };
          var result = new Array();
          for (var i=0;i<data.length;i++) {
            if (data[i].category.toUpperCase() == category.toUpperCase()) {
              result.push(data[i]);
            }
          }
          return result;  
        }
        function addRestaurantListToPage(data) {
          $('#restaurant_list').html("");
          $.each(data, function(index, obj) {
              var li = $('<li />');
              var a = $('<a />').appendTo(li);

              var img,h2,p;
              img = $('<img />');
              h2 = $('<h2 />');
              p = $('<p />');
              $.each(obj, function(key, val) {
                  switch (key) {
                      case "id":
                          a.attr("href","/tutorial/service/store/"+val);
                          img.attr("src","/tutorial/misc/image/restaurant/"+val+".jpeg");
                          img.attr("height",60);
                          break;
                      case "name":
                          h2.text(val);
                          break;
                      case "address":
                          p.html("Address: "+val);
                          break;
                      case "category":
                          p.html(p.html()+"<br/>Category: "+val);
                          break;
                      default:
                          break;
                  }
              });

              img.appendTo(a);
              h2.appendTo(a);
              p.appendTo(a);
              li.appendTo($('#restaurant_list'));
          });
        };
    </script>
</head>

<body>
<%@ include file="header.jsp" %>
<section class="our-projects" id = "our-projects">
<div class="container">
  <h1 class="section-title">
    ${page_title}
    <span class="special">.</span>
  </h1>
  <section>
    <div class="whitewrapper">
      <div class="hd"></div>
      <ul>
        <li><a onclick="category('all')"><h2>all</h2></a></li>
        <li><a onclick="category('chinese')"><h2>chinese</h2></a></li>
        <li><a onclick="category('western')"><h2>western</h2></a></li>
        <li><a onclick="category('indian')"><h2>indian</h2></a></li>
        <li><a onclick="category('japenese')"><h2>japenese</h2></a></li>
      </ul>
    </div>
  </section>
  <section class="double-wide">
    <hgroup>
      <h1 class="category"></h1>
    </hgroup>
    <div id="paging_container">
      <ul class="content" id="restaurant_list">
      </ul>
      <div class="page_navigation"></div>
    </div>
  </section>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>