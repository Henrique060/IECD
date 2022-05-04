<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/lista_bar_cerveja">
		<html>
			<body>
				<table border="1">
					<tr>
						<th>Cerveja</th>
						<th>Pre�o</th>
						<th>Bar</th>
					</tr>
					<xsl:for-each select="bar_cerveja">
					<xsl:sort select="@aCerveja"/>
					<xsl:sort select="@pre�o"/>
						<tr>
							<td>    <xsl:variable name="vcerveja" select="@aCerveja"/>
								<xsl:value-of select="//cerveja[@aCerveja=$vcerveja]/@nome"/>
							</td>
							<td>
								<xsl:value-of select="@pre�o"/> �
							</td>
							<td>    <xsl:variable name="vbar" select="@oBar"/>
								<xsl:value-of select="//bar[@oBar=$vbar]/@nome"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>








