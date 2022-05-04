<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method='html' version='1.0' encoding="ISO-8859-1" indent='yes'/>
  <xsl:template match="/">

  <html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
  <title>Passos das Receitas</title>
  </head>
  <body>
  <h2>Passos das Receitas</h2>

    <table border="1">
      <tr bgcolor="#9acd32">
        <th align="left">Código</th>
        <th align="left">Descritivo</th>
		<th align="left">Período</th>
		<th align="left">Insert</th>
      </tr>
      <xsl:for-each select="Import/Row">
      <xsl:sort select="codigo"/>
      <tr>
        <td><xsl:value-of select="codigo"/></td>
        <td><xsl:value-of select="descritivo"/></td>
		<td><xsl:value-of select="periodo"/></td>
		<td>INSERT INTO PASSO (CODIGO, DESCRITIVO, PERIODO) VALUES (<xsl:value-of select="codigo"/>,'<xsl:value-of select="descritivo"/>',<xsl:value-of select="periodo"/>);</td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
  </xsl:template>
</xsl:stylesheet>