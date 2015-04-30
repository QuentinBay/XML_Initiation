<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" indent="yes"/>
  <xsl:template match="/">
	<xsl:apply-templates select="//event[contains(title,'Workaholics')]"\>
  </xsl:template>
  
  <xsl:template match="event">
      <ul>
        <li>
 titre : 
            <xsl:value-of select="//title"/>
        </li>
        <li>
dtstart : 
            <xsl:value-of select="//dtstart"/>
        </li>

        <li>
dtend : 
            <xsl:value-of select="//dtend"/>
        </li>
		
        <li>
summary : 
            <xsl:value-of select="//summary"/>
        </li>
		
        <li>
url : 
            <xsl:value-of select="//url"/>
        </li>	
		
        <li>
description : 
            <xsl:value-of select="//description"/>
        </li>		
	</ul>
  </xsl:template>

</xsl:stylesheet>