<?xml version="1.0" encoding="utf-8"?>
<!-- -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html"/>

  <!-- Ajoute un espace entre le bord gauche de la fenetre et le texte -->
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

  <!-- Affichage du titre en bleu -->
  <xsl:template match="titre">
    <h1 style="text-align:center; color:blue;">
      <xsl:apply-templates/>
    </h1>
  </xsl:template>

  <!-- Affichage de l'auteur en italic -->
  <xsl:template match="auteur">
    <br/> <!-- Saut a la ligne -->
    <h2 style="text-align:center; font-style: italic;">
      <xsl:apply-templates/>
    </h2>
    <br/>
  </xsl:template>

  <!-- Affichage des informations sur le binome -->
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

  <!-- Affichage des images -->
  <xsl:template match="image">
      <div align="center">
         <img>
            <xsl:attribute name="src">
               <xsl:value-of select="@chemin"/>
            </xsl:attribute>
          </img>
       </div>
  </xsl:template>

  <!-- Affichage des paragraphes de narration en noir pour le francais et en marron pour le hongrois -->
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

  <!-- Affichage des dialogues des personnages dans un tableau avec leur image -->
  <xsl:template match="paragraphe[@type='dialogue']">
    <table width="90%" align="center">
      <tbody>
        <tr>
          <!-- Tableau de dialogue en francais -->
          <td width="45%">
            <table border="1" width="100%" cellpadding="10">
              <xsl:for-each select="phrase[@langue='francais']">
                <tbody>
                  <tr>
                    <td width="50">
                      <img src="images/{@locuteur}.png"/>
                    </td>
                    <td>  
                      <xsl:value-of select="."/> 
                    </td>
                  </tr>
                </tbody>
              </xsl:for-each>
            </table>
          </td>
          <td></td>
          <!-- Tableau de dialogue en hongrois -->
          <td width="45%">
            <table border="1" width="100%" cellpadding="10">
              <xsl:for-each select="phrase[@langue='hongrois']">
                <tbody>
                  <tr>
                    <td width="50">
                      <img src="images/{@locuteur}.png"/>
                    </td>
                    <td>
                      <span style="font-style: italic; color: brown;">
                        <xsl:value-of select="."/>
                      </span>
                    </td>
                  </tr>
                </tbody>
              </xsl:for-each>
            </table>
          </td>
        </tr>
      </tbody>
    </table> 
  </xsl:template>


</xsl:stylesheet>




