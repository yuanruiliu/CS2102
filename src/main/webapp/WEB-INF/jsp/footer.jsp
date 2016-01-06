<%@ page contentType="text/html;charset=UTF-8"  %>
<footer>
  <div class="container">
  	<p>
  		<sec:authorize access="hasRole('admin')">
			<a href="service/main/stats">stats</a>
        </sec:authorize>
        <a href="service/main/about">about</a>
    </p>
    <p>© Copyright Popol</p>
    <p>Acknowledgement: All copyright of design belongs to Full Stop Interactive, LLC.</p>
  </div>
</footer>