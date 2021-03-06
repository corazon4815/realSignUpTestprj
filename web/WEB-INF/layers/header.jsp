<%@ taglib prefix="javascript" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>헤더</title>
    <%--  <script type="text/javascript" src="/libs/jquery/3.5.1/jquery.js"></script>
      <script type="text/javascript" src="/libs/bootstrap/4.3.1/js/bootstrap.js"></script>--%>

</head>
<body>

<div class="headerContainer">
    <div class="headerLogout">
        <a class="logout" href="/view/logout">LOGOUT</a>
    </div>
    <div class="header" style="height: 100px;">
        <h2 class="headerText">MEMBERS</h2>
        <h4 class="headerId">${memberInfo.memberName}님 반갑습니다.</h4>
    </div>
    <div class="row">
        <div class="span12">
            <div class="head">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="span6"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
