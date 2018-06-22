<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
      <wallet name="Keepass import">
	<xsl:for-each select="KeePassFile/Root//Group">
	  <folder name="{Name}">
	    <xsl:for-each select="Entry">
	      <map name="{String[Key/text() = 'Title']/Value}">
                  <mapentry name="{String[Key/text() = 'UserName']/Value}/{String[Key/text() = 'URL']/Value}"><xsl:value-of select="String[Key/text() = 'Password']/Value"/></mapentry>
	      </map>
	    </xsl:for-each>
	  </folder>
	</xsl:for-each>
      </wallet>
  </xsl:template>
</xsl:stylesheet>
