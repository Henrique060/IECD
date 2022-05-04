<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h2>Lista de Ingredientes:</h2>
				<table border="1">
					<xsl:apply-templates select="ingredienteLista"/>
					<xsl:apply-templates select="ingredienteLista/ingrediente"/>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ingredienteLista">
		<tr bgcolor="yellow">
			<th>Quantidade</th>
			<th>Substância</th>
		</tr>
	</xsl:template>
	<xsl:template match="ingredienteLista/ingrediente">
		<tr bgcolor="wheat">
			<td>
				<xsl:apply-templates select="@qtd"/>
			</td>
			<td>
				<xsl:value-of select="."/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="ingredienteLista/ingrediente/@qtd">
		<xsl:value-of select="."/>
		<xsl:value-of select="./../@und"/>
	</xsl:template>
</xsl:stylesheet>
