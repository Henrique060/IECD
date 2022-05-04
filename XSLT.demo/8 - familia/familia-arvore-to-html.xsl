<?xml version="1.0"  encoding="ISO-8859-1"?>
<!-- esta transforma��o deve ser aplicada ao documento produzido pela transforma��o 'familia-arvore.xsl'  -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:icd="http://icd-functions">
	<xsl:output method="html" encoding="ISO-8859-1" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates select='fam�lia'>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="fam�lia">
		<html>
			<title>Lista dos membros da fam�la <xsl:value-of select="@nome"/>
			</title>
			<body>
				<xsl:apply-templates select='membro'/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="membro">
		<hr/>
		<center>
			<table width="80%">
				<tr colspan="3">
					<center>
						<ul>
							<li>Nome: <xsl:value-of select="@nome"/> (<xsl:value-of select="@idade"/>)
			</li>
							
							<xsl:choose>
							<xsl:when test="not(@pai=' ')">
								<li>Pai: <xsl:value-of select="@pai"/>
								</li>
							</xsl:when>
							</xsl:choose>
							<xsl:choose>
							<xsl:when test="not(@m�e=' ')">
								<li>M�e: <xsl:value-of select="@m�e"/>
								</li>
							</xsl:when>
							</xsl:choose>
						</ul>
					</center>
				</tr>
				<tr>
					<th>Irm�os</th>
					<th>Filhos</th>
					<th>Av�s</th>
				</tr>
				<tr>
					<td>
						<center>
							<ul>
								<xsl:for-each select="irm�os/*">
									<li>
										<xsl:value-of select="."/>
									</li>
								</xsl:for-each>
							</ul>
						</center>
					</td>
					<td>
						<center>
							<ul>
								<xsl:for-each select="filhos/*">
									<li>
										<xsl:value-of select="."/>
									</li>
								</xsl:for-each>
							</ul>
						</center>
					</td>
					<td>
						<center>
							<ul>
								<xsl:for-each select="av�s/*">
									<li>
										<xsl:value-of select="."/>
									</li>
								</xsl:for-each>
							</ul>
						</center>
					</td>
				</tr>
			</table>
		</center>
	</xsl:template>
	<xsl:template match="//text()"/>
</xsl:stylesheet>
