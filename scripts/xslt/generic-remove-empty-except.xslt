<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         generic-remove-empty-except.xslt
    # Purpose:	supply list of possible empty nodes to remove
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2016-01-22
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:include href="inc-copy-anything.xslt"/>
<xsl:param name="except_list" select="'ms'"/>
<xsl:param name="removeempty_list" select="'ra re rf rg rm rs va'"/>
<xsl:variable name="except" select="tokenize($except_list,' ')"/>
<xsl:variable name="removeempty" select="tokenize($removeempty_list,' ')"/>
      <xsl:template match="*[local-name() = $removeempty]">
            <xsl:choose>
                  <xsl:when test="*[local-name() = $except]">
                        <xsl:copy>
                              <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                  </xsl:when>
                  <xsl:when test="*">
                        <xsl:copy>
                              <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                  </xsl:when>
                  <xsl:when test="normalize-space(text()) ne ''">
                        <xsl:copy>
                              <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                  </xsl:when>
                  <xsl:otherwise/>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
