<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:f="myfunctions" exclude-result-prefixes="xhtml f">
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:include href="inc-list2xml-xattrib.xslt"/>
      <xsl:param name="filespath"/>
      <xsl:param name="files" select="'*.xhtml'"/>
      <xsl:param name="groupnodelist"/>
      <xsl:param name="bookorderfile"/>
      <xsl:param name="dataelement"/>

      <xsl:variable name="bookorderuri" select="f:file2uri($bookorderfile)"/>
      <xsl:variable name="bookorderlist" select="unparsed-text($bookorderuri)"/>
      <xsl:variable name="pathuri" select="f:file2uri($filespath)"/>
      <xsl:variable name="collection" select="collection(concat($pathuri,'?select=',$files))"/>
      <xsl:variable name="groupnodes" select="tokenize($groupnodelist,'\s+')"/>
      <xsl:variable name="fileseq">
            <xsl:call-template name="list2xmlxattrib">
                  <xsl:with-param name="text" select="$bookorderlist"/>
                  <xsl:with-param name="attribnamelist" select="'book seq chinesebk'"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:output method="xml" encoding="utf-8" indent="yes"/>
      <xsl:template match="/">
            <data>
                 
                        <xsl:copy-of select="$collection"/>
                 
            </data>
      </xsl:template>
      <xsl:function name="f:sequence">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="$string = $fileseq/element/@chinesebk">
                        <xsl:variable name="seq" select="$fileseq/element[@book = $string]/@seq"/>
                        <xsl:value-of select="$seq"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>1000</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
</xsl:stylesheet>
