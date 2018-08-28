<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title>Profile Page</title>
    </head>
    <body>
        <%
            Student student = (Student) session.getAttribute("student");
        %>
        <table class="account_table">
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>DOB</td>
                    <td>Email</td>
                    <td>Password</td>
                    <td>Favorite Color</td>
                </tr>
            </thead>
            <tbody >
                <tr>
                    <td>${student.ID}</td>
                    <td>${student.name}</td>
                    <td>${student.dob}</td>
                    <td>${student.email}</td>
                    <td>${student.password}</td>
                    <td>${student.favcol}</td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
