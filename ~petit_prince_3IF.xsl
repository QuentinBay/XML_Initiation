<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="/">
              <html>
                    <head>
                          <title>
                                 <xsl:value-of select="//titre"/>
                                 <xsl:text> de </xsl:text>
                                 <xsl:value-of select="//auteur"/>

                          </title>
                    </head>
                    <body style="background-color:white;">
                          <xsl:apply-templates/>
                    </body>
              </html>
</xsl:template>

<xsl:template match="titre">
              <h1 style="text-align:center; color:blue;">
              <xsl:apply-templates/>
              </h1>
</xsl:template>

<xsl:template match="auteur">
              <br/>
              <h2 style="text-align:center; font-style: italic;">
              <xsl:apply-templates/>
              </h2>
              <br/>
</xsl:template>

<xsl:template match="info_traitements">

               <blockquote style="color:darkgreen;">
                          <xsl:text>But du TP du </xsl:text>
                          <xsl:value-of select="//date"/>
                          <xsl:text> : </xsl:text>
                          <xsl:value-of select="//but"/>
                          <br/>
                          <xsl:text>Auteurs: </xsl:text>
                          <xsl:value-of select="//unCreateur[1]"/>
                          <xsl:text> et </xsl:text>
                          <xsl:value-of select="//unCreateur[2]"/>
                          <br/>
                          <xsl:text>Email du responsable: </xsl:text>
                          <xsl:value-of select="//email"/>
                          <hr/>
               </blockquote>

</xsl:template>

<xsl:template match="image">
              <div align="center">
                   <img>
                        <xsl:attribute name="src">
                                       <xsl:value-of select="@chemin"/>
                        </xsl:attribute>
                    </img>
               </div>
</xsl:template>


<xsl:template match="paragraphe[@type='narration']">
              <p>
                        <xsl:for-each select="phrase[@langue='francais']">
                               <xsl:value-of select="."/>
                        </xsl:for-each>

                        <xsl:for-each select="phrase[@langue='hongrois']">
                                      <span style="color:brown; font-style: italic;">
                                            <xsl:value-of select="."/>
                                      </span>
                        </xsl:for-each>
              </p>
</xsl:template>

<xsl:template match="paragraphe[@type='dialogue']">
        <table border="3" width="300" align="center">
        <xsl:for-each select="phrase[@langue='francais']">

        <tr>
             <td>
                   <img src="images/{@locuteur}.png"/>
             </td>
             <td>  <xsl:value-of select="."/> </td>
        </tr>
        </xsl:for-each>
        </table>
        
        <table border="3" width="300" align="center">
        <xsl:for-each select="phrase[@langue='francais']">

        <tr>
             <td>
                   <img src="images/{@locuteur}.png"/>
             </td>
             <td>  <xsl:value-of select="."/> </td>
        </tr>
        </xsl:for-each>
        </table>
</xsl:template>


</xsl:stylesheet>




