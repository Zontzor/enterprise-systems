<?xml version ="1.0"?>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
<xsl:output method="html"/>
  <xsl:template match="/">
    
    <html>
      <body>
        <h2>Reminders</h2>
        
        <table border = "1"> 
          <tr bgcolor = "#9acd32"> 
            <th>To: </th> 
            <th>From: </th> 
            <th>Heading: </th> 
            <th>Body: </th>
         </tr> 
          <xsl:for-each select="notes/note">
          <tr>
            <td><xsl:value-of select="to"/></td> 
            <td><xsl:value-of select="from"/></td> 
            <td><xsl:value-of select="heading"/></td> 
            <td><xsl:value-of select="body"/></td> 
          </tr> 
          </xsl:for-each>
        </table> 
        
      </body>
    </html>
    
  </xsl:template>
</xsl:stylesheet>