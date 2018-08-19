<%@page contentType="text/html" import="java.util.*" import="uts.wsd.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="demo.css"> 
        <title>Welcome Page</title>
    </head>

    <div><span> <jsp:include page="date.jsp" flush="true"/></span></div>
    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String password = request.getParameter("password");
        String favcol = request.getParameter("favcol");
        String tos = request.getParameter("tos");
        int key = (new Random()).nextInt(999999);
        String ID = "" + key;
        String color;

        if (tos != null) {
            color = favcol;
        } else {
            color = "#AED6F1";
        }
    %>
    <body style="background-color: <%=color%>">

        <% if(tos != null) { %>
        <h1>Hello, <%=name%></h1> 
        <p>Your email: <%=email%></p>
        <p>Your DOB: <%=dob%></p>
        <p>Your password is: <%=password%></p>        
        <p>Your Favorite color is: <%=favcol%></p>
        <p>Your ID is: <%=ID%></p>
        <%
            Student student = new Student(name,email,password,dob,favcol,ID);
            session.setAttribute("student",student);
        %>
        <button class="button" type="button" onclick="location.href = 'main.jsp'" > Main Page </button>
        <%}else{%>
        <p class="outline">NOTE: You must agree to TOS</p>
        <button class="button" type="button" onclick="location.href = 'main.jsp'" > Main Page </button>
        <%}%>        
        <button class="button" type="button" onclick="location.href = 'index.jsp'" > Home Page </button>
    </body>
</html>
