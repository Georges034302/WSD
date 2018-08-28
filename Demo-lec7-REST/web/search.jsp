<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
        <link rel="stylesheet" href="css/demo.css">
    </head>
    <body>
        <form class="div_search" action="main.jsp" method="post" target="_self" >
            <table>                
                <tr>
                    <td>Genre:</td><td><input type="text" name="genre"></td>    
                    <td><input class="button" type="submit" value="Search"></td>
                </tr>
            </table>
        </form>       
    </body>
</html>
