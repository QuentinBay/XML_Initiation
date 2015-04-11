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

  <!-- Affichage de l en-tete -->
  <xsl:template match="en-tete">
    <!-- Utilisons un tableau pour afficher l image a cote du titre -->
    <table cellspacing="30" align="center">
      <tbody>
        <tr>
          <td>
            <img src="images/prince.png"/>
          </td>
          <td>
            <!-- Affichage du titre en bleu -->
            <h1 style="text-align:center; color:blue;">
              <xsl:value-of select="titre"/>
            </h1>
            <!-- <br/>  Saut a la ligne -->

            <!-- Affichage de l auteur en italic -->
            <h2 style="text-align:center; font-style: italic;">
              <xsl:value-of select="auteur"/>
            </h2>
            <!-- <br/> Saut a la ligne -->

            <!-- Affichage des informations sur le binome en vert -->
            <blockquote style="color:darkgreen;">
              <xsl:text>But du TP du </xsl:text>
              <xsl:value-of select="//date"/>
              <xsl:text> : </xsl:text>
              <xsl:value-of select="//but"/>
              <br/> <!-- Saut a la ligne -->

              <xsl:text>Auteurs: </xsl:text>
              <xsl:value-of select="//unCreateur[1]"/>
              <xsl:text> et </xsl:text>
              <xsl:value-of select="//unCreateur[2]"/>
              <br/> <!-- Saut a la ligne -->

              <xsl:text>Email du responsable: </xsl:text>
              <xsl:value-of select="//email"/>
            </blockquote>
          </td>
        </tr>
      </tbody>
    </table>
    <hr/> <!-- affichage d une ligne horizontale -->
    <h3>Début du texte:</h3>
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




