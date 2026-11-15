<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    xmlns:cbml="http://www.cbml.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs cbml"
    version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>
    <xsl:variable name="comicColl" as="document-node()+"
        select="collection('cbml-spidey/?select=*.xml')"/>
    
    <xsl:variable name="characters" as="xs:string+" select="$comicColl//cbml:balloon/@who ! normalize-space() => distinct-values()"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Spiderman</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
               
                <link rel="stylesheet" type="text/css" href="comicStyle.css"/>
            </head>
            <body>
                
                <h1><xsl:apply-templates select="($comicColl//titleStmt/title)[1]"/></h1>
                <section id="toc">
                    <h2>Contents</h2>
                  
                    <table>
                        <tr>
                            <th>Characters</th><!--first column table heading-->
                            <th>Page Appearances</th><!--second column table heading-->
                         
                        </tr>
                     
                        <xsl:for-each select="$characters">
                            <tr>
                                <td><xsl:value-of select="current()"/></td>
                                
                                <td><xsl:text>pages: </xsl:text>
                                    <xsl:apply-templates select="$comicColl//div[@type='page']
                                        [descendant::cbml:balloon/@who=current()]" mode="toc"/>
                                </td>
                            </tr>
                        </xsl:for-each>
          
                    </table>
                </section>

                <section id="readingView">
                    
                    <xsl:apply-templates select="$comicColl//div[@type='page']"/>
                       
                </section>
            </body>
        </html>
    </xsl:template>
 
   <xsl:template match="div" mode="toc">
    <xsl:apply-templates select="current()/@n"/>
       <xsl:if test="not(position() = last())">
           <xsl:text>, </xsl:text>
       </xsl:if>
 
   </xsl:template>
    <xsl:template match="div">
        <section class="pageBlock">
           <xsl:apply-templates/>
        </section>
    </xsl:template>
    <xsl:template match="cbml:panel">
        <div class="panel">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
   <!--I got lost and didn't really know what you wanted based on the directions on newtfire, but I did figure out the reading part. -->

</xsl:stylesheet>
