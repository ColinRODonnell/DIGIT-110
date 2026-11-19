<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Amadis Chapter 6 (Montalvo Version)</title>
                <!--CSS STUFF - CRO -->
                <style>
                    body {
                    font-family: Georgia, serif;
                    max-width: 850px;
                    margin: 40px auto;
                    line-height: 1.7;
                    background-color: #f5f1e8;
                    color: #292929;
                    }
                    
                    h1 {
                    text-align: center;
                    }
                    
                    .clause {
                    padding: 12px;
                    margin-bottom: 10px;
                    border-bottom: 1px solid #ccc;
                    }
                    
                    .dialogue {
                    background-color: #e5edf7;
                    border-left: 4px solid #456b99;
                    }
                    
                    .person {
                    font-weight: bold;
                    color: #8b4513;
                    }
                </style>
            </head>
            
            <body>
                <h1>Amadís de Gaula <span style="color: #456b99;">(Montalvo Version)</span> — Chapter 6</h1>
                
                <main>
                    <xsl:for-each select="//tei:cl">
                        
                        <section>
                            <xsl:attribute name="class">
                                <xsl:text>clause</xsl:text>
                                
                                <xsl:if test=".//tei:milestone[@unit='said'][@ana='start']">
                                    <xsl:text> dialogue</xsl:text>
                                </xsl:if>
                            </xsl:attribute>
                            
                            <h3>
                                <xsl:value-of select="@xml:id"/>
                            </h3>
                            
                            <p>
                                <xsl:apply-templates/>
                            </p>
                        </section>
                        
                    </xsl:for-each>
                </main>
            </body>
        </html>
    </xsl:template>
    <!-- Styles the Character guys -->
    <xsl:template match="tei:persName">
        <span class="person">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>
