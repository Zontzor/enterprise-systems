<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <order_document orderid="{order/orderid}">
    <responsible_person><xsl:value-of select="order/person"/></responsible_person>

    <parties>
      <ship_to>
        <name><xsl:value-of select="order/shipto/name"/></name>
        <address>
          <address_line><xsl:value-of select="order/shipto/address"/></address_line>
          <city><xsl:value-of select="order/shipto/city"/></city>
          <country><xsl:value-of select="order/shipto/country"/></country>
        </address>
      </ship_to>
    </parties>

   <items>
     <xsl:for-each select="order/item">
       <name><xsl:value-of select="name"/></name>
       <title><xsl:value-of select="title"/></title>
       <id><xsl:value-of select="id"/></id>
       <note><xsl:value-of select="note"/></note>
       <quantity><xsl:value-of select="quantity"/></quantity>
       <price><xsl:value-of select="price"/></price>
     </xsl:for-each>
   </items>

    <xsl:call-template name="write_quantity_total">
    </xsl:call-template>

    <xsl:call-template name="write_order_total">
    </xsl:call-template>

  </order_document>

</xsl:template>


<xsl:template name="write_quantity_total">
  <xsl:variable name="quantity" select="sum(order/item/quantity)"/>
  <quantity_total>
    <xsl:value-of select="$quantity"/>
  </quantity_total>
</xsl:template>


<xsl:template name="write_order_total">
  <xsl:variable name="quantity" select="sum(order/item/price)"/>

  <order_total>
    <xsl:value-of select="$quantity"/>
  </order_total>
</xsl:template>

</xsl:stylesheet>
