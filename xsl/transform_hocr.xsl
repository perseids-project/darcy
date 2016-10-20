<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xhtml="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs xhtml"
    version="2.0">
    <xsl:output method="html" version="5.0" indent="yes" media-type="text/html" encoding="UTF-8"></xsl:output>
    
    <!-- I took the strip-space command out because it wasn't doing what we wanted it to it was stripping
         from the input and the output, which is why the words were being squashed
    -->
    
    <xsl:template match="/">
        <!-- Create the basic wrapping structure for the html, so that we have a completely valid HTML document -->
        <html>
            <head>
                <!-- if we were going to use these files as-is, rather than copying the body into Omeka,
                     then we might want to set the title based upon the original contents of the document.  I'm not
                     going to worry about that for now.
                 -->
            </head>
            <body>
                <xsl:apply-templates select="//xhtml:div"></xsl:apply-templates>        
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="xhtml:div">
        <!-- we'll create a new div, not in the xhtml namespace, to hold the contents -->
        <div>
            <!-- if we don't say select="." here, it automatically applies to all of the child elements -->
            <xsl:apply-templates/>
        </div>
        
    </xsl:template>
    
    <xsl:template match="xhtml:span">
        <xsl:value-of select="."/><xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="xhtml:br">
        <!-- we aren't going to preserve the xhtml namespace, so we will create a new element, rather than copying the old one -->
        <br/>
    </xsl:template>
    
    <!-- This is a catch-all, using the "*" wildcard, which says, match any elements that don't already have explicit
         templates. For this we will just ignore them, as we only want the text in the spans and the line breaks.
         An empty template just says, match and throw away
    -->
    <xsl:template match="*">
    </xsl:template>
    
</xsl:stylesheet>