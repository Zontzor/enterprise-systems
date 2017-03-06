<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:template match="/">
<html><head><title>Display Shipment</title></head><body>

	<b>Shipment Number: </b><xsl:value-of select="shipment/@shipmentid"/>
	<p />
	
	<table border = "0"> 
		<tr>
			<td><b>Consignor: </b></td>
			<td><xsl:value-of select="shipment/consignor/name"/></td>
			<td><b>Consignee: </b></td>
			<td><xsl:value-of select="shipment/consignee/name"/></td>
		</tr>
		<tr>
			<td></td>
			<td><xsl:value-of select="shipment/consignor/address_line_1"/></td>
			<td></td>
			<td><xsl:value-of select="shipment/consignee/address_line_1"/></td>
		</tr>
		<tr>
			<td></td>
			<td><xsl:value-of select="shipment/consignor/address_line_2"/></td>
			<td></td>
			<td><xsl:value-of select="shipment/consignee/address_line_2"/></td>
		</tr>
		<tr>
			<td></td>
			<td><xsl:value-of select="shipment/consignor/address_line_3"/></td>
			<td></td>
			<td><xsl:value-of select="shipment/consignee/address_line_3"/></td>
		</tr>
		<tr>
			<td></td>
			<td><xsl:value-of select="shipment/consignor/address_line_4"/></td>
			<td></td>
			<td><xsl:value-of select="shipment/consignee/address_line_4"/></td>
		</tr>
	</table>
	<p />
	
	<b>Summary</b>
	<br />
	<xsl:call-template name="write_total_weight">
		<xsl:with-param name="total_weight" select="shipment/details/total_weight"/>
		<xsl:with-param name="total_weight_uom" select="shipment/details/total_weight_uom"/>
	</xsl:call-template>
	
		
</body></html>

</xsl:template>

<xsl:template match="/shipment/item">

	your code here...

</xsl:template>	

<xsl:template name="write_total_weight">
	<xsl:param name="total_weight" />
	<xsl:param name="total_weight_uom" />
	
	Total weight: <xsl:value-of select= "$total_weight"/> <xsl:text> </xsl:text> <xsl:value-of select= "$total_weight_uom"/>
	
</xsl:template>
	
</xsl:stylesheet>	
