<%@page import="uts.wsd.*"%>
<!DOCTYPE html>
<html>
    <head>        
        <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.css">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.bundle.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" ></script>
        <script src="jsanimation.js"></script>
        <link rel="stylesheet" type="text/css" href="css/demo.css">
        <script type="text/javascript" src="js/script.js"></script>  
        <script type="text/javascript" src="js/animation.js"></script> 
        <link rel="stylesheet" type="text/css" href="css/style.css">  
    </head>
    <title>Home</title>
    <body onload="startTime()">           
        <div class="bs-docs-header" id="content" tabindex="-1">
            <span class="time" id="time" ></span>
            <div class="container">
                <h1>WSD Lab Demo</h1>                        
                <p class="p">A WSD Framework for Java Web Applications</p>                
            </div>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>

                        </button>
                        <a class="navbar-brand" href="#Register-Div" data-toggle="tab" id="Register-Tab">Register</a>
                        <a class="navbar-brand" href="#Login-Div" data-toggle="tab" id="Login-Tab">Login</a>                         
                        <a class="navbar-brand" href="#Search-Div" data-toggle="tab" id="View-Tab">View</a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right"> 
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Author<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="https://www.linkedin.com/in/georges-bou-ghantous/" target="_Blank" style="color:#cdbfe3;">Linked In</a></li>
                                    <li><a href="mailto:Georges.BouGhantous-1@uts.edu.au" style="color:#cdbfe3; ">Contact</a></li>
                                    <li><a href="https://www.uts.edu.au/" target="_Blank" style="color:#cdbfe3; ">Institution</a></li>
                                </ul>
                            </li> 
                        </ul>
                        <form class="navbar-form navbar-right" name="searchForm" action="results.jsp" method="post" target="Display-frame"> 
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Genre" name="genre">
                            </div>
                            <input type="submit" value="Search" class="button"/>
                        </form>                                                   
                    </div> 
                </div>
            </nav>           
        </div> 
        <div class="container" style="width:102%; height: 75%;">
            <div class="row">                                  
                <div class="tab-content">
                    <iframe id="Display-frame" name="Display-frame" src="" frameborder="0"  allowFullScreen></iframe> 
                </div>                
            </div>            
        </div>        
        <div class="footer">            
            <h2 id="buttons-options" class="title">Control Panel</h2>
            <div class="bs-glyphicons" style="padding-bottom:10px;">          
                <a class="btn btn-success glyphicon glyphicon-refresh" href="#" id="Default-Tab"></a>             
                <a class="btn btn-primary glyphicon glyphicon-save" href="https://github.com/Georges034302/lab_demo" target="_blank"></a>               
                <a class="btn btn-info glyphicon glyphicon-cloud" href="https://www.google.com/drive/" target="_blank"></a>            
                <a class="btn btn-warning glyphicon glyphicon-pencil" href="http://collabedit.com/" target="_blank"></a>           
                <a class="btn btn-danger glyphicon glyphicon-send" href="mailto: "></a>
            </div>
        </div>  
        <script src="webjars/jquery/2.1.4/jquery.js"></script>
        <script src="webjars/bootstrap/3.3.5/js/bootstrap.js"></script>
    </body>
</html>