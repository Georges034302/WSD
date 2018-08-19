<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="bgColor"/>
    <xsl:template match="store">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/results.css"></link>                			
            </head>
            <body>
                <xsl:apply-templates />                
            </body>
        </html>
    </xsl:template>
    <xsl:template match="name">
        <h2 class="form_title">
            <xsl:apply-templates />
        </h2>
    </xsl:template>
    <xsl:template match="movies" >
        <table class="table_xsl" >
            <thead class="thead_xsl">
                <tr>
                    <th class="th_xsl">Genre</th>
                    <th class="th_xsl">Title</th>
                    <th class="th_xsl">CD Set</th>
                    <th class="th_xsl">Rating</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates />
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="movie">
        <tr>
            <td class="td_xsl" width="15%">
                <xsl:value-of select="genre"/>
            </td>
            <td class="td_xsl" width="30%">
                <xsl:value-of select="title"/>
            </td>
            <td class="td_xsl" width="10%" style="text-align:center;" >
                <xsl:value-of select="cdset" />
            </td>
            <td class="td_xsl" width="40%">
                <div style="width: 200px; height: 12px; background: #42f453;">
                    <div style="width: {20 * rating}px; height: 12px; background: #42aaf4;"/>
                </div>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
