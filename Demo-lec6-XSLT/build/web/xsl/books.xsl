<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>      
            <head>
                <link rel="stylesheet" href="css/demo.css" type="text/css"></link>
            </head>     
            <body>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="books" >
        <table class="results_table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Number</th>
                    <th>Rating</th>
                    <th>Rating</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates />
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="book">
        <tr>
            <td>
                <xsl:value-of select="title"/>
            </td>
            <td>
                <xsl:value-of select="genre"/>
            </td>
            <td>
                <xsl:value-of select="number" />
            </td>
            <td>
                <div style="width: 200px; height: 12px; background: #42f453;">
                    <div style="width: {20 * rating}px; height: 12px; background: #42aaf4;"/>
                </div>
            </td>
            <td>
                <xsl:value-of select="status" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
