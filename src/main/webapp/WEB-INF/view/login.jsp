<%--
  Created by IntelliJ IDEA.
  User: luerer
  Date: 28/06/2017
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%--
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
--%>

    <title>用户登录</title>


</head>

<body>
<h2 align="center">用户登录</h2>
<hr/>
<form action="/login.do" method="post" name="userinfo">
    <table align="center">
        <tr>
            <td>用户名：</td>
        </tr>
        <tr>
            <td><input type="text" name="username" placeholder="username"
                <c:if test="${user.username!=null}">value="${user.username}" </c:if> /> </td>
        </tr>
        <tr>
            <td>密码：</td>
        </tr>
        <tr>
            <td><input type="password" name="password" placeholder="password"> </td>
        </tr>
        <%--<tr>
            <td colspan="2"> <input type="checkbox"><span>十天内记住登录状态</span> </td>
        </tr>--%>
        <tr>
            <td align="center"><input type="submit" name = "login" value="登录"></td>
        </tr>
    </table>
</form>

</body>

</html>