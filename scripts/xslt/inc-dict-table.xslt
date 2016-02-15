<!--
    #############################################################
    # Name:         	inc-dict-table.xslt
    # Purpose:		process table data
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2012- -
    # Copyright:    	(c) 2012 SIL International
    # Licence:      	<LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:silp="silp.org.ph/ns" exclude-result-prefixes="xs silp">
      <!-- Changed cell handling to include c1 c2 cell names. -->
      <xsl:template match="tb">
            <xsl:element name="table">
                  <xsl:attribute name="class">
                        <xsl:value-of select="concat('tb_',translate(tabletitle,$transfrom,$transto))"/>
                  </xsl:attribute>
                  <!-- <xsl:if test="lxGroup//tb[1]"> </xsl:if> -->
                  <xsl:attribute name="id">
                        <xsl:text>table-</xsl:text>
                        <xsl:value-of select="count(preceding-sibling::tb)+1"/>
                  </xsl:attribute>
                  <caption class="tabletitle">
                        <xsl:apply-templates select="tabletitle"/>
                        <xsl:apply-templates select="tablesubtitle"/>
                  </caption>
                  <tbody>
                        <xsl:apply-templates select="*[not(matches(name(),'title'))]"/>
                  </tbody>
            </xsl:element>
      </xsl:template>
      <xsl:template match="c1|c2|c3|c4|c5|c6|c7|c8|c9|c10|td">
            <xsl:element name="td">
                  <xsl:attribute name="class">
                        <xsl:choose>
                              <xsl:when test="name() = 'td'">
                                    <xsl:value-of select="concat('c',count(preceding-sibling::*) +1)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="name()"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="headrow">
            <xsl:element name="tr">
                  <xsl:attribute name="class">
                        <xsl:choose>
                              <xsl:when test="name() = 'th'">
                                    <xsl:value-of select="concat('c',count(preceding-sibling::*) +1)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="name()"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="trow|row">
            <xsl:element name="tr">
                  <xsl:attribute name="class">
                        <xsl:value-of select="concat('r',count(preceding-sibling::*) +1)"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="tabletitle|tablesubtitle">
            <div class="name()">
                  <xsl:apply-templates/>
            </div>
      </xsl:template>
</xsl:stylesheet>
