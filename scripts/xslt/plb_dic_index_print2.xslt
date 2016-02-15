<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="html" version="5" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:include href="project.xslt"/>
      <xsl:variable name="lxdata"/>
      <xsl:template match="/">
            <html>
                  <head>
                        <meta name="generator" content="ToolBox PLB dictionary transformation"/>
                        <title>
                              <xsl:value-of select="$voltitle"/>
                        </title>
                        <link rel="stylesheet" href="../css/index.css" type="text/css"/>
                        <!--<style type="text/css">
                              <xsl:text disable-output-escaping="yes"></xsl:text>
                              <xsl:call-template name="css"/>
                              <xsl:text disable-output-escaping="yes"></xsl:text>
                        </style> -->
                  </head>
                  <body>
                        <xsl:for-each select="//ie">
                              <xsl:sort select="lower-case(.)"/>
                              <xsl:call-template name="ie"/>
                        </xsl:for-each>
                  </body>
            </html>
      </xsl:template>
      <xsl:template name="ie">
            <div class="index">
                  <span class="ie">
                        <xsl:value-of select="."/>
                  </span>
                  <xsl:text>&#x2003;</xsl:text>
                  <span class="lx">
                        <xsl:choose>
                              <xsl:when test="matches(preceding-sibling::lx,' \d')">
                                    <xsl:value-of select="replace(preceding-sibling::lx,'(.+) \d','$1')"/>
                                    <xsl:element name="sub">
                                          <xsl:value-of select="replace(preceding-sibling::lx,'.+ (\d)','$1')"/>
                                    </xsl:element>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="preceding-sibling::lx"/>
                              </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text> </xsl:text>
                  </span>
            </div>
      </xsl:template>
      <!--<xsl:template name="css">
.index {margin: 0 0 0 0}
.lx {font-weight:bold; }
@page {
    margin: 2cm 2cm 2cm 2cm;
    @top-left {
        content: '';
    }
    @top-center {
        content: counter(page);
        margin-top: 1em
    }
    @top-right {
        content: '';
    }
}

body {
    column-count: 3;   -moz-column-count: 3;
    column-gap: 1.5em; -moz-column-gap: 1.5em;
    column-fill: balance;
    text-align: left;
}
sub {font-size: 80%}
      </xsl:template> -->
</xsl:stylesheet>
