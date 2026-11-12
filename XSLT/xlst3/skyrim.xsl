<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="xhtml" html-version="5"
        omit-xml-declaration="yes"
        include-content-type="no"
        indent="yes"/>

    <!-- This build the HTML - CRO -->
    <xsl:template match="/skyrim">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>
                    <xsl:value-of select="cover/title"/>
                </title>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <main class="reading-view">
                    <h1><xsl:value-of select="cover/title"/></h1>
                    <xsl:apply-templates select="body"/>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="body">
        <section class="story">
            <xsl:apply-templates/>
        </section>
    </xsl:template>

    <xsl:template match="paragraph">
        <p><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="QuestEvent">
        <span class="quest-event"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="QuestItem">
        <span class="quest-item"><xsl:apply-templates/></span>
    </xsl:template>

    <!-- If @ref contains several IDs, use the first ID for alignment lookup - CRO -->
    <xsl:template match="character">
        <xsl:variable name="first-ref" select="tokenize(normalize-space(@ref), '\s+')[1]"/>
        <xsl:variable name="alignment"
            select="/skyrim/cast/character[@id = $first-ref]/@alignment"/>
        <span class="character{if ($alignment) then concat(' alignment-', $alignment) else ''}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- faction thingy -->
    <xsl:template match="faction">
        <xsl:variable name="alignment"
            select="/skyrim/cast/faction[@id = current()/@ref]/@alignment"/>
        <span class="faction{if ($alignment) then concat(' alignment-', $alignment) else ''}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="epithet">
        <span class="epithet"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="location">
        <span class="location"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="*">
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
