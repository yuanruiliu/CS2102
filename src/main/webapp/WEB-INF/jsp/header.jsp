<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav>
  <div class="container">
    <div id="header" class="center-unknown-width">
        <ul class="center-unknown-width">
            <li><a href="/tutorial">Home</a></li>
            <li><a href="/tutorial/service/main/category">Category</a></li>
            <sec:authorize access="hasRole('member')">
                <li><a href="/tutorial/service/manage/">My Restaurants</a></li>
            </sec:authorize>
            <sec:authorize access="hasRole('admin')">
                <li><a href="/tutorial/service/manage/">Manage</a></li>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <li><a href="/tutorial/service/account/login">Login</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li><a href="/tutorial/j_spring_security_logout">Logout</a></li>
            </sec:authorize>
        </ul>
    </div>  
  </div>
</nav>