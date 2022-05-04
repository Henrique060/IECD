<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="4.0"
		encoding="iso-8859-1" indent="yes" />
	<xsl:template match="/">
		<html>
			<head>
				<style>
					table {
					border-collapse: collapse;
					margin: 25px 0;
					font-size: 0.9em;
					font-family: sans-serif;
					min-width: 25%;
					box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
					}
					th {
					background-color: #009879;
					color: #ffffff;
					text-align: center;
					padding: 4px 6px;
					}
					tr {
					border-bottom: 1px solid #dddddd;
					text-align: center;
					}
				</style>
			</head>
			<body>
				<table border="1">
					<tr>
						<th colspan="2" style="background-color: DarkOrchid">Bares</th>
					</tr>
					<xsl:for-each select="//bar">
						<xsl:sort select="@nome"/>
						<tr>
							<th colspan="2" style="background-color: DarkGoldenRod">
								<xsl:value-of select="@nome"/>
							</th>
						</tr>
						<tr>
							<th>Cervejas</th>
							<th>Preços</th>
						</tr>
						<xsl:variable name="vbar" select="@oBar"/>
						<xsl:for-each select="//bar_cerveja[@oBar=$vbar]">
							<xsl:sort select="@preço"/>
							<xsl:variable name="vcerveja" select="@aCerveja"/>
							<tr>
								<td style="text-align:left;">
									<xsl:value-of
										select="//cerveja[@aCerveja=$vcerveja]/@nome" />
								</td>
								<td>
									<xsl:value-of select="@preço"/> €
                                                                </td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>




















