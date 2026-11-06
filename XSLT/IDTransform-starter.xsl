<?xml version="1.0" encoding="UTF-8"?>
    <!--Tasks: Write XSLT template rules to do the following:
        
        
     1. Change the <poemTitle> elements to <title>.
     
     2. We don't need the <body> elements, so let's remove them but preserve their contents
     
     The next questions ask you to write Attribute Value templates to pull in a value, or calculate a value from the source XML.
    READ ABOUT/LOOK AT EXAMPLES OF ATTRIBUTE VALUE TEMPLATES HERE:
     http://dh.obdurodon.org/avt.xhtml
     
    3. Write a template that matches the <pb> elements: Write an AVT to change the name of the @pNum to @n on those elements.
     
    4. Change the <line> elements into self-closing <lb/> elements to sit at the beginning of each line. 
    Can you also put an @n attribute on each line to number the lines inside the poem? 
    (You can calculate this with XPath by counting the **preceding** line elements in the document and adding 1. 
    Hint: Take a look at the difference if you count(preceding::line) as opposed to count(preceding-sibling::line). How does the
    count change?)
    
    5. Each poem should have a distinct identifier, usually called an @xml:id attribute.
    Write an attribute value template to add an xml:id attribute to each poem that includes "p-" followed by its number in the sequence of poem elements. 
    (As before, you can calculate this with XPath by counting the preceding poem elements and adding 1.)
    
    -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!-- 1 -->
    <xsl:template match="poemTitle">
        <title>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <!-- 2 -->
    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- 3 -->
    <xsl:template match="pb">
        <pb n="{@pNum}"/>
    </xsl:template>
    
    <!-- 4 -->
    <xsl:template match="line">
        <lb n="{count(preceding::line) + 1}"/>
    </xsl:template>
    
    <!-- 5 -->
    <xsl:template match="poem">
        <poem xml:id="p-{count(preceding::poem) + 1}">
            <xsl:apply-templates select="@*|node()"/>
        </poem>
    </xsl:template>
</xsl:stylesheet>