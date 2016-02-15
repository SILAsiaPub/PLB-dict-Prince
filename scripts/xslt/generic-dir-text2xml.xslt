<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:param name="dirfile"/>
      <xsl:include href="inc-file2uri.xslt"/>
<xsl:include href="inc-datetime.xslt"/>
      <xsl:variable name="text" select="f:file2text($dirfile)"/>
      <xsl:variable name="dir" select="tokenize($text,'\r?\n Directory of ')"/>
      <xsl:template match="/">
            <data>
                  <xsl:for-each select="$dir[position() gt 1]">
                        <xsl:variable name="line" select="tokenize(.,'\r?\n')"/>
                        <xsl:element name="directory">
                              <xsl:attribute name="path">
                                    <xsl:value-of select="$line[1]"/>
                              </xsl:attribute>
                              <xsl:for-each select="$line[position() gt 1]">
                                    <xsl:choose>
                                          <xsl:when test=". = ''"/>
                                          <xsl:when test="matches(.,' File\(s\) ')"/>
                                          <xsl:when test="matches(.,'Thumbs.db')"/>
                                          <xsl:when test="matches(.,'&lt;DIR&gt;')"/>
                                          <xsl:otherwise>
                                                <xsl:variable name="break" select="tokenize(.,'\s\s+')"/>
                                                <xsl:variable name="bytes" select="substring-before($break[3],' ')"/>
                                                <xsl:variable name="file" select="substring-after($break[3],' ')"/>
                                                <xsl:element name="file">
                                                      <xsl:attribute name="name">
                                                            <xsl:value-of select="$file"/>
                                                      </xsl:attribute>
                                                      <xsl:attribute name="modified">
                                                            <xsl:value-of select="f:xdatetime($break[1],$break[2],'DMY')"/>
                                                      </xsl:attribute>
                                                      <!--<xsl:attribute name="time">
                                                            <xsl:value-of select="$break[2]"/>
                                                      </xsl:attribute> -->
                                                      <xsl:attribute name="bytes">
                                                            <xsl:value-of select="translate($bytes,',','')"/>
                                                      </xsl:attribute>
                                                      <xsl:attribute name="ext">
                                                            <xsl:value-of select="tokenize($file,'\.')[last()]"/>
                                                      </xsl:attribute>
                                                </xsl:element>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:for-each>
                        </xsl:element>
                  </xsl:for-each>
            </data>
      </xsl:template>
</xsl:stylesheet>
