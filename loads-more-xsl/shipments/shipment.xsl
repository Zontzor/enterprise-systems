<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:template match="/">
<html><head><title>Display Shipment</title></head><body>

	<b>Shipment Number: </b><xsl:value-of select="shipment/@shipmentid"/>
	<p/>
	
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
	<p/>
	
	<b>Summary</b>
	<br/>
	<xsl:call-template name="write_summary">
		<xsl:with-param name="total_weight" select="shipment/details/total_weight"/>
		<xsl:with-param name="total_weight_uom" select="shipment/details/total_weight_uom"/>
	</xsl:call-template>
	<p/> 
		
	<xsl:call-template name="write_order_info">
	</xsl:call-template>
		
</body></html>
</xsl:template>


<xsl:template name="write_summary">
	<xsl:param name="total_weight" />
	<xsl:param name="total_weight_uom" />
	
	<xsl:variable name="item_count" select="count(/shipment/item)"/>  
	<xsl:variable name="average_weight" select="$total_weight div $item_count"/>  
	<xsl:variable name="quantity_count" select="sum(/shipment/item/quantity)"/> 
	
	Total number of items: <xsl:value-of select= "$item_count"/><br/>
	Total weight: <xsl:value-of select= "$total_weight"/> <xsl:text> </xsl:text> <xsl:value-of select= "$total_weight_uom"/><br/>
	Average Weight Per Item Line: <xsl:value-of select= "$average_weight"/><br/>
	Total Quantity: <xsl:value-of select= "$quantity_count"/> 
</xsl:template>


<xsl:template name="write_order_info">
	<table>
		<tr>
	    <th>Sequence</th>
	    <th>ID</th> 
	    <th>Title</th>
			<th>Note</th>
	    <th>Quantity</th> 
	    <th>Price</th>
			<th>Line Total</th>
	  </tr>
		
		<xsl:variable name="sequence" select="quantity"/>
		
		<xsl:for-each select="shipment/item">
			<xsl:variable name="quantity" select="quantity"/>  
			<xsl:variable name="price" select="price"/> 
			<tr>
				<td><xsl:value-of select="position()"/></td>
				<td><xsl:value-of select="id"/></td>
				<td><xsl:value-of select="title"/></td>
				<td><xsl:value-of select="note"/></td>
				<td><xsl:value-of select="quantity"/></td>
				<td><xsl:value-of select="price"/></td>
				<td><xsl:value-of select="$quantity * $price"/></td>
			</tr>
		</xsl:for-each>
		
	</table>
</xsl:template>	

	
</xsl:stylesheet>	
