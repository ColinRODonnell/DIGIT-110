<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Amadís de Gaula Character Appearances (Montalvo Version) - Chapter 6</title>
                <style>
                    body {
                    font-family: Georgia, serif;
                    max-width: 850px;
                    margin: 40px auto;
                    background-color: #f5f1e8;
                    color: #292929;
                    line-height: 1.7;
                    }
                    
                    h1 {
                    text-align: center;
                    }
                    
                    table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 25px;
                    }
                    
                    th, td {
                    padding: 12px;
                    border: 1px solid #ccc;
                    text-align: left;
                    }
                    
                    th {
                    background-color: #8b4513;
                    }
                </style>
            </head>
            
            <body>
                <h1>Amadís de Gaula Character Appearances <span style="color: #456b99;">(Montalvo Version)</span> - Chapter 6</h1>
                
                <p>
                    This table shows how many times each character
                    speaks in Chapter 6 in the Montalvo Version of 
                    Amadís de Gaula.
                </p>
                
                <table>
                    <tr>
                        <th>Character</th>
                        <th>Total Appearances</th>
                    </tr>
                    
                    <xsl:for-each-group
                        select="//tei:milestone/@resp"
                        group-by="substring-after(., '#')">
                        
                        <xsl:sort
                            select="count(current-group())"
                            order="descending"
                            data-type="number"/>
                        
                        <tr>
                            <td>
                                <xsl:value-of select="current-grouping-key()"/>
                            </td>
                            
                            <td>
                                <xsl:value-of select="count(current-group())"/>
                            </td>
                        </tr>
                        
                    </xsl:for-each-group>
                    
                </table>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
