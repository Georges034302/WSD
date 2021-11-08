<%@page contentType="text/html" pageEncoding="UTF-8" import="uts.controller.*" import="uts.wsd.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Action</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="userApp" class="uts.controller.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <%Users users = userApp.getUsers(); %>
        <%Validator validator = new Validator();%>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User user = users.login(email, password);

            if (validator.checkEmpty(email, password)) {
                session.setAttribute("emptyErr", "All fields are mendatory");
                response.sendRedirect("login.jsp");
            } else if (!validator.validateEmail(email)) {
                session.setAttribute("emailErr", "Incorrect email format");
                response.sendRedirect("login.jsp");
            } else if (!validator.validatePassword(password)) {
                session.setAttribute("passErr", "Incorrect password format");
                response.sendRedirect("login.jsp");
            } else if (user != null) {
                session.setAttribute("user", user);
                response.sendRedirect("main.jsp");
            } else {
                session.setAttribute("existErr", "User does not exist!");
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>
