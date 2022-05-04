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
		<xsl:value-of select="concat($doc/fam�lia/*[@id=$id]/@nomePr�prio,' ',$doc/fam�lia/*[@id=$id]/@apelido)"/>
	</xsl:function>
	<xsl:function name="icd:pai">
		<xsl:param name="id"/>
		<xsl:value-of select="$doc/fam�lia/*[@id=$id]/nascimento/progenitores/@pai"/>
	</xsl:function>
	<xsl:function name="icd:m�e">
		<xsl:param name="id"/>
		<xsl:value-of select="$doc/fam�lia/*[@id=$id]/nascimento/progenitores/@m�e"/>
	</xsl:function>
	<xsl:function name="icd:irm�os">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/fam�lia/masculino[(nascimento/progenitores/@pai = icd:pai($id) or nascimento/progenitores/@m�e = icd:m�e($id)) and not (@id=$id)]"/>
	</xsl:function>
	<xsl:function name="icd:irm�s">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/fam�lia/feminino[(nascimento/progenitores/@pai = icd:pai($id) or nascimento/progenitores/@m�e = icd:m�e($id)) and not (@id=$id)]"/>
	</xsl:function>
	
	<xsl:function name="icd:filhos">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/fam�lia/masculino[(nascimento/progenitores/@pai = $id or nascimento/progenitores/@m�e = $id) and not (@id=$id)]"/>
	</xsl:function>
	<xsl:function name="icd:filhas">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/fam�lia/feminino[(nascimento/progenitores/@pai = $id or nascimento/progenitores/@m�e = $id) and not (@id=$id)]"/>
	</xsl:function>
	
	<xsl:function name="icd:av�s">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/fam�lia/masculino[(@id = icd:pai(icd:pai($id)) or @id = icd:pai(icd:m�e($id))) and not (@id=$id)]"/>
	</xsl:function>
	<xsl:function name="icd:av�s">
		<xsl:param name="id"/>
		<xsl:sequence select="$doc/fam�lia/feminino[(@id = icd:m�e(icd:pai($id)) or @id = icd:m�e(icd:m�e($id))) and not (@id=$id)]"/>
	</xsl:function>

	<!-- in�cio do template -->
	<xsl:template match="/fam�lia">
		<fam�lia nome="{@nome}">
			<xsl:apply-templates select="masculino | feminino">
			<xsl:sort select="icd:dif-anos(nascimento/@data,$hoje)" order="ascending" data-type="number"/>
			<xsl:sort select="@nomePr�prio" order="ascending"/>
			</xsl:apply-templates>
		</fam�lia>
	</xsl:template>
	<xsl:template match="masculino | feminino">
		<membro nome="{icd:nome(@id)}" pai='{icd:nome(icd:pai(@id))}' m�e='{icd:nome(icd:m�e(@id))}' nascido="{nascimento/@data}" idade="{icd:dif-anos(nascimento/@data,$hoje)}">
			<irm�os>
				<xsl:for-each select="icd:irm�os(@id)">
					<irm�o>
						<xsl:value-of select='icd:nome(@id)'/>
					</irm�o>
				</xsl:for-each>
				<xsl:for-each select="icd:irm�s(@id)">
					<irm�>
							<xsl:value-of select='icd:nome(@id)'/>
					</irm�>
				</xsl:for-each>
			</irm�os>
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
			<av�s>
				<xsl:for-each select="icd:av�s(@id)">
					<av�>
						<xsl:value-of select='icd:nome(@id)'/>
					</av�>
				</xsl:for-each>
				<xsl:for-each select="icd:av�s(@id)">
						<av�>
							<xsl:value-of select='icd:nome(@id)'/>
						</av�>
				</xsl:for-each>
			</av�s>
		</membro>
	</xsl:template>
	<xsl:template match="//text()"/>
</xsl:stylesheet>
