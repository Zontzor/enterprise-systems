<?xml version ="1.0"?>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
<xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <body>
        <h1>Invoice Number: <xsl:value-of select="invoice/invoice_number"/></h1>
        <h2>Invoice Date: <xsl:value-of select="invoice/invoice_date"/></h2>
        
        <xsl:apply-templates select="invoice/item"/>
        
        <h2>Payment Info: <xsl:value-of select="invoice/payment_information"/></h2>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="item">
    <xsl:apply-templates select="item_name"/>  
    <xsl:apply-templates select="price"/>
    <xsl:apply-templates select="quantity"/>
  </xsl:template>
  
  <xsl:template match="item_name">
    <h4>Item: <xsl:value-of select="."/></h4>
  </xsl:template>
  
  <xsl:template match="price">
    Price: <xsl:value-of select="."/>
    <br />
  </xsl:template>
  
  <xsl:template match="quantity">
    Quantity: <xsl:value-of select="."/>
  </xsl:template>
  
</xsl:stylesheet>