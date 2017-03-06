<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html><head><title>Grade Report</title></head><body>
    
    <xsl:call-template name="print_grade">
      <xsl:with-param name="target_grade" select="'A'"/>
    </xsl:call-template>
    <p/>
      
    <xsl:call-template name="print_grade">
      <xsl:with-param name="target_grade" select="'B'"/>
    </xsl:call-template>
    <p />
    
    <xsl:call-template name="print_grade">
      <xsl:with-param name="target_grade" select="'C'"/>
    </xsl:call-template>
    <p />
    
  </body></html>
  </xsl:template>
  
  <xsl:template name="print_grade">
    <xsl:param name="target_grade" />
    
    <xsl:variable name="student_count" select="count(/class/student)"/>  
    <xsl:variable name="target_grade_count" select="count(/class/student[grade=$target_grade])"/>  
    <xsl:variable name="target_grade_percent" select="$target_grade_count div $student_count * 100"/>  
    
    <h1><xsl:value-of select="$target_grade" /></h1>
    
    Number of students receiving grade: <b><xsl:value-of select= "$target_grade_count"/></b><br/>
    Percentage of students receiving grade: <b><xsl:value-of select= "$target_grade_percent"/></b><br/>
  </xsl:template>

</xsl:stylesheet>