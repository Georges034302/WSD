<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:ns="http://www.uts.edu.au/31284/wsd-students" 
                version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>students.xsl</title>
                <style>
                    .results_table{       
                    border-collapse: collapse;       
                    width: auto;
                    font-family: "Times New Roman", Times, serif;
                    font-weight: bold;
                    font-size: 16px;                             
                    border: 1px solid black;  
                    padding: 8px; 
                    }
                    .results_table thead th{    
                    background-color: #E67E22;                    
                    text-align: center;
                    font-weight: bold; 
                    padding: 8px;
                    }
                    .results_table td{           
                    padding: 8px;
                    background-color: #08878c;
                    color: white;
                    text-align: center;
                    }
                </style>                
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="ns:students">
        <table class="results_table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Name</th>
                    <th>Password</th>
                    <th>DOB</th>
                    <th>Favorite Color</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="ns:student">
        <tr>
            <td>
                <xsl:value-of select="ns:ID"/>
            </td>
            <td>
                <xsl:value-of select="ns:email" />
            </td>
            <td >
                <xsl:value-of select="ns:name" />
            </td>
            <td>
                <xsl:value-of select="ns:password" />
            </td>
            <td>
                <xsl:value-of select="ns:dob" />
            </td>
            <td>
                <xsl:value-of select="ns:favoriteColor" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
