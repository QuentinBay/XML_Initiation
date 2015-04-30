<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates select="//event[contains(./title,'Workaholics')]"/>
  </xsl:template>

  <xsl:template match="//event">
    <ul class="media-list">
      <li class="media">
        <a class="pull-left thumbnail-size" href="undefined">
        </a>
        <div class="media-body">
          <h4 class="media-heading"><xsl:value-of select="./title"/></h4>
          
          <div>le <xsl:value-of select="substring(./dtstart, 7,2)"/>-<xsl:value-of select="substring(./dtstart, 5,2)"/>-<xsl:value-of select="substring(./dtstart, 1,4)"/>
          de <xsl:value-of select="substring(./dtstart, 10,2)"/>h <xsl:value-of select="substring(./dtstart, 12,2)"/> à <xsl:value-of select="substring(./dtend, 10,2)"/>h<xsl:value-of select="substring(./dtend, 12,2)"/>
          </div>

          <div>
            <a href="{./url}">
              <xsl:value-of select="./summary"/>
            </a>
          </div>

          <div>
            <xsl:value-of select="./url"/>
          </div>

          <div>
            <xsl:value-of select="./description"/>
          </div>
          
        </div>
      </li>
    </ul>
  </xsl:template>

</xsl:stylesheet>