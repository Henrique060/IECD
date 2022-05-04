<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
  <name>Familia <xsl:value-of select="@nome"/></name>
  <open>1</open>
  <Style id="manBalloonStyle">
    <BalloonStyle>
      <!-- a background color for the balloon -->
      <bgColor>ffffffbb</bgColor>
      <!-- styling of the balloon text -->
      <text><![CDATA[
      <b><font color="#CC0000" size="+3">$[name]</font></b>
      <br/>
	  Local de Nascimento de 
      <font face="Courier">$[description]</font>
      <br/>
	  ]]>
	  </text>
    </BalloonStyle>
	<IconStyle id="ManStyle">
			<scale>1.3</scale>
			<Icon>
				<href>http://maps.google.com/mapfiles/kml/shapes/man.png</href>
			</Icon>
			<hotSpot x="20" y="2" xunits="pixels" yunits="pixels"/>
	</IconStyle>
  </Style>
   <Style id="womanBalloonStyle">
    <BalloonStyle>
      <!-- a background color for the balloon -->
      <bgColor>7fff0000</bgColor>
      <!-- styling of the balloon text -->
      <text><![CDATA[
      <b><font color="#CC0000" size="+3">$[name]</font></b>
      <br/>
	  Local de Nascimento de 
      <font face="Courier">$[description]</font>
      <br/>
	  ]]>
	  </text>
    </BalloonStyle>
	<IconStyle id="ManStyle">
			<scale>1.3</scale>
			<Icon>
				<href>http://maps.google.com/mapfiles/kml/shapes/woman.png</href>
			</Icon>
			<hotSpot x="20" y="2" xunits="pixels" yunits="pixels"/>
	</IconStyle>
  </Style>
	<xsl:apply-templates select='família'/>
	</Document>
</kml>
</xsl:template>

<xsl:template match="família">
	<xsl:apply-templates select="masculino | feminino"/>
</xsl:template>

<xsl:template match="masculino | feminino">
	<Placemark>
		<name><xsl:value-of select="nascimento/naturalidade"/></name>
		<description><xsl:value-of select="concat(@nomePróprio,' ',@apelido)"/></description>
		<xsl:if test="name(.)='masculino'">
			<styleUrl>#manBalloonStyle</styleUrl>
		</xsl:if>
		<xsl:if test="name(.)='feminino'">
			<styleUrl>#womanBalloonStyle</styleUrl>
		</xsl:if>
		<Point>
			<coordinates><xsl:value-of select="substring-after(nascimento/naturalidade/@coordenadas,',')"/>, <xsl:value-of select="substring-before(nascimento/naturalidade/@coordenadas,',')"/>,0</coordinates>
		</Point>
	</Placemark>
</xsl:template>
</xsl:stylesheet>