<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" omit-xml-declaration="yes"/>
      <xsl:param name="sourcetexturi"/>
      <xsl:param name="group" select="'item'"/>
      <xsl:param name="sepvar2" select="'&#34;,&#34;'"/>
      <xsl:param name="sepvar1" select="'&#13;'"/>
      <xsl:variable name="csv" select="unparsed-text($sourcetexturi)"/>
      <xsl:variable name="labels" select="substring-before($csv,'&#10;')"/>
      <xsl:variable name="data0" select="substring-after($csv,'&#10;')"/>
      <xsl:variable name="data1" select="replace($data0,',,',',&#34; &#34;,')"/>
      <xsl:variable name="data2" select="replace($data1,',,',',&#34; &#34;,')"/>
      <xsl:variable name="data3" select="replace($data2,',$',',&#34; ')"/>
      <xsl:variable name="data4" select="replace($data3,'^&#34;','')"/>
      <xsl:variable name="data" select="replace($data4,'&#13;&#10;','&#13;')"/>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:template match="/">
            <database>
                  <labels>
                        <xsl:analyze-string select="$labels" regex=",">
                              <xsl:matching-substring/>
                              <xsl:non-matching-substring>
                                    <xsl:element name="c{(position()+1) div 2}">
                                          <xsl:value-of select="."/>
                                    </xsl:element>
                              </xsl:non-matching-substring>
                        </xsl:analyze-string>
                  </labels>
                  <xsl:analyze-string select="$data" regex="{$sepvar1}">
                        <xsl:matching-substring/>
                        <xsl:non-matching-substring>
                              <xsl:element name="{$group}">
                                    <xsl:analyze-string select="." regex="&#34;,&#34;">
                                          <xsl:matching-substring/>
                                          <xsl:non-matching-substring>
                                                <xsl:element name="c{(position()+1) div 2}">
                                                      <xsl:value-of select="."/>
                                                </xsl:element>
                                          </xsl:non-matching-substring>
                                    </xsl:analyze-string>
                              </xsl:element>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </database>
      </xsl:template>
</xsl:stylesheet>
