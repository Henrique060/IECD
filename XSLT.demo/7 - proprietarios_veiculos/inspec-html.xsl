<?xml version="1.0" encoding="ISO-8859-1"?>
<!--Apresenta lista com datas de inspeção -->
<!--Sample XSL Porfírio Filipe -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<html>
			<body>
				<table border="1">
					<tr>
						<th>Matrícula</th>
						<th>Inspeção</th>
						<th>Proprietário</th>
					</tr>
					<xsl:for-each select="//VEÍCULO">
					<xsl:sort select="@MATRÍCULA"/> 
						<tr>
							<td>
								<xsl:value-of select="@MATRÍCULA"/>
							</td>
							<td>
								<xsl:value-of select="@DATAINSPEÇÃO"/>
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

