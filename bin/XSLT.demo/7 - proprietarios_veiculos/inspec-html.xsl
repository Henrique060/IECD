<?xml version="1.0" encoding="ISO-8859-1"?>
<!--Apresenta lista com datas de inspe��o -->
<!--Sample XSL Porf�rio Filipe -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<html>
			<body>
				<table border="1">
					<tr>
						<th>Matr�cula</th>
						<th>Inspe��o</th>
						<th>Propriet�rio</th>
					</tr>
					<xsl:for-each select="//VE�CULO">
					<xsl:sort select="@MATR�CULA"/> 
						<tr>
							<td>
								<xsl:value-of select="@MATR�CULA"/>
							</td>
							<td>
								<xsl:value-of select="@DATAINSPE��O"/>
							</td>
							<td>
								<xsl:value-of select="../NOME"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>

