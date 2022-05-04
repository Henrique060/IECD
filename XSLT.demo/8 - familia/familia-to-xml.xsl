<?xml version="1.0"  encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:icd="http://icd-functions">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:variable name="doc" select="/"/>
	<xsl:variable name="hoje" select="current-date()"/>
	<xsl:function name="icd:dif-anos">
		<xsl:param name="inicial"/>
		<xsl:param name="final"/>
		<xsl:value-of select="year-from-date($final) - year-from-date($inicial) - number(month-from-date($final) > month-from-date($inicial) or (month-from-date($inicial) = month-from-date($final) and day-from-date($inicial) > day-from-date($final) ) )"/>
	</xsl:function>
	<xsl:function name="icd:nome">
		<xsl:param name="id"/>
		<xsl:value-of select="concat($doc/família/*[@id=$id]/@nomePróprio,' ',$doc/família/*[@id=$id]/@apelido)"/>
	</xsl:function>
	<xsl:function name="icd:pai">
		<xsl:param name="id"/>
		<xsl:value-of select="$doc/família/*[@id=$id]/nascimento/progenitores/@pai"/>
	</xsl:function>
	<xsl:function name="icd:mãe">
		<xsl:param name="id"/>
		<xsl:value-of select="$doc/família/*[@id=$id]/nascimento/progenitores/@mãe"/>
	</xsl:function>
	<xsl:function name="icd:irmãos">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/família/masculino[(nascimento/progenitores/@pai = icd:pai($id) or nascimento/progenitores/@mãe = icd:mãe($id)) and not (@id=$id)]"/>
	</xsl:function>
	<xsl:function name="icd:irmãs">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/família/feminino[(nascimento/progenitores/@pai = icd:pai($id) or nascimento/progenitores/@mãe = icd:mãe($id)) and not (@id=$id)]"/>
	</xsl:function>
	
	<xsl:function name="icd:filhos">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/família/masculino[(nascimento/progenitores/@pai = $id or nascimento/progenitores/@mãe = $id) and not (@id=$id)]"/>
	</xsl:function>
	<xsl:function name="icd:filhas">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/família/feminino[(nascimento/progenitores/@pai = $id or nascimento/progenitores/@mãe = $id) and not (@id=$id)]"/>
	</xsl:function>
	
	<xsl:function name="icd:avôs">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/família/masculino[(@id = icd:pai(icd:pai($id)) or @id = icd:pai(icd:mãe($id))) and not (@id=$id)]"/>
	</xsl:function>
	<xsl:function name="icd:avós">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/família/feminino[(@id = icd:mãe(icd:pai($id)) or @id = icd:mãe(icd:mãe($id))) and not (@id=$id)]"/>
	</xsl:function>

	<!-- início do template -->
	<xsl:template match="/família">
		<família nome="{@nome}">
			<xsl:apply-templates select="masculino | feminino">
			<xsl:sort select="icd:dif-anos(nascimento/@data,$hoje)" order="ascending" data-type="number"/>
			<xsl:sort select="@nomePróprio" order="ascending"/>
			</xsl:apply-templates>
		</família>
	</xsl:template>
	<xsl:template match="masculino | feminino">
		<membro nome="{icd:nome(@id)}" pai='{icd:nome(icd:pai(@id))}' mãe='{icd:nome(icd:mãe(@id))}' nascido="{nascimento/@data}" idade="{icd:dif-anos(nascimento/@data,$hoje)}">
			<irmãos>
				<xsl:for-each select="icd:irmãos(@id)">
					<irmão>
						<xsl:value-of select='icd:nome(@id)'/>
					</irmão>
				</xsl:for-each>
				<xsl:for-each select="icd:irmãs(@id)">
					<irmã>
							<xsl:value-of select='icd:nome(@id)'/>
					</irmã>
				</xsl:for-each>
			</irmãos>
			<filhos>
				<xsl:for-each select="icd:filhos(@id)">
					<filho>
						<xsl:value-of select='icd:nome(@id)'/>
					</filho>
				</xsl:for-each>
				<xsl:for-each select="icd:filhas(@id)">
					<filha>
							<xsl:value-of select='icd:nome(@id)'/>
					</filha>
				</xsl:for-each>
			</filhos>
			<avós>
				<xsl:for-each select="icd:avôs(@id)">
					<avô>
						<xsl:value-of select='icd:nome(@id)'/>
					</avô>
				</xsl:for-each>
				<xsl:for-each select="icd:avós(@id)">
						<avó>
							<xsl:value-of select='icd:nome(@id)'/>
						</avó>
				</xsl:for-each>
			</avós>
		</membro>
	</xsl:template>
	<xsl:template match="//text()"/>
</xsl:stylesheet>
