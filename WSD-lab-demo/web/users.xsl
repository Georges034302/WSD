<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:ns="http://www.uts.edu.au/31284/wsd-users"                           
>
    <xsl:output method="html"/> 
    <xsl:template match="ns:users">
        <html>
            <head>                
                <style>
                    .body {
                    background-image: url("feit.png");
                    background-color: #00ccff;
                    background-repeat: no-repeat;
                    background-size: 100%;
                    background-size:100% 100vh;
                    }
                    .table{
                    width:40%;
                    background-color:#A9CCE3  
                    }
                    .th, .tr, .td {
                    text-align:left;
                    padding: 8px;
                    font-family: "Times New Roman", Times, serif;
                    font-weight: bold;
                    font-size: 18px;
                    text-align:left;                    
                    color: #ffff00;
                    }
                    .th {
                    background-color: #4CAF50;
                    color: white;
                    font-weight:bold;
                    }                       				
                </style>				
            </head>
            <body class="body">
                <table class="table">
                    <thead>
                        <tr>
                            <th class="th" >Name</th>
                            <th class="th" >Email</th>
                            <th class="th" >Phone</th>                    
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates />
                    </tbody>
                </table>                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="ns:users/ns:user">
        <tr>
            <td class="td">
                <xsl:value-of select="ns:name"/>
            </td>
            <td class="td">
                <xsl:value-of select="ns:email" />
            </td>
            <td class="td">
                <xsl:value-of select="ns:phone" />
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>
