<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="iso-8859-1" indent="yes"/>
	<xsl:template match="/">
		<html>
			<body>  <h1>** Utilizadores **</h1>
				<table border="1">
					<tr>
						<th>Nome</th>
						<th>Nível</th>
					</tr>
					<xsl:for-each select="//utilizador">
					<xsl:sort select="nome"/> 
						<tr>
							<td>
								<xsl:value-of select="nome"/>
							</td>
							<td>
								<xsl:value-of select="nivel"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>




