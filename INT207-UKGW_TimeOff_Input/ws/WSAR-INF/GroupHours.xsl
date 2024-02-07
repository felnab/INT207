<?xml version='1.0'?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:key name="keyemp" match="ABSINP" use="emp" />
<xsl:template match="/">
	<ABSINP>

	<xsl:for-each-group select="/ABSINP/Abs" group-by="concat(Batch_ID,'|',action,'|',emp,'|',erncd,'|',HRate,'|',PayEndDate)">
	<Abs>
	<Batch_ID><xsl:value-of select="distinct-values(current-group()/Batch_ID)"/></Batch_ID>
<action><xsl:value-of select="distinct-values(current-group()/action)"/></action>
<emp><xsl:value-of select="distinct-values(current-group()/emp)"/></emp>

<erncd><xsl:value-of select="distinct-values(current-group()/erncd)"/></erncd>
<PayEndDate><xsl:value-of select="distinct-values(current-group()/PayEndDate)"/></PayEndDate>
<Hours><xsl:value-of select="format-number(sum(current-group()/Hours),'######.00')"/></Hours>
</Abs>
  </xsl:for-each-group>

</ABSINP>
</xsl:template>

</xsl:stylesheet>