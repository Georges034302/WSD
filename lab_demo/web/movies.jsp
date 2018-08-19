<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<html >
    <head>
        <title>Movie Shop</title>
        <script src="animation.js"></script>
        <link rel="stylesheet" type="text/css" href="css/results.css">
    </head>

    <body style="background:none transparent;">

        <c:import url="file:///D:\NetBeans\NetBeans 8.1\Projects\lab_demo\web\WEB-INF\movies.xml"  var="inputDoc" />

        <c:import url="file:///D:\NetBeans\NetBeans 8.1\Projects\lab_demo\web\movies.xsl"   var="stylesheet" />

        <x:transform xml  = "${inputDoc}" xslt = "${stylesheet}">        
            <x:param name="bgColor"  value="lightgreen" />
        </x:transform>
    </body>
</html>