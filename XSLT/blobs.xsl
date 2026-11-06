<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 30, 2026</xd:p>
            <xd:p><xd:b>Author:</xd:b>Colin O'Donnell</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
        <xsl:template match="/">
            <html>
                <body>
                    
                    <h1>Big Ball of Text</h1>
                    
                    <xsl:for-each select="xml/blob">
                        <h2><xsl:value-of select="heading"/></h2>
                        
                        <xsl:for-each select="ab">
                            <p>
                                <xsl:value-of select="."/>
                            </p>
                        </xsl:for-each>
                    </xsl:for-each>
                    
                </body>
            </html>
        </xsl:template>
        
    
</xsl:stylesheet>