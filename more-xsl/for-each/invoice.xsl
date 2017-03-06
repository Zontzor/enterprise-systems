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
        
        <xsl:for-each select="invoice/item">
          <h4>Item: <xsl:value-of select="item_name"/></h4>
          <div>Price: <xsl:value-of select="price"/></div>
          <div>Quantity: <xsl:value-of select="quantity"/></div>
        </xsl:for-each>
        
        <h2>Payment Info: <xsl:value-of select="invoice/payment_information"/></h2>
      </body>
    </html>
    
  </xsl:template>
</xsl:stylesheet>