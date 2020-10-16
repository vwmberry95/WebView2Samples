<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:wix="http://schemas.microsoft.com/wix/2006/wi" xmlns="http://schemas.microsoft.com/wix/2006/wi" version="1.0" exclude-result-prefixes="xsl wix">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- By default, copy all elements and nodes into the output. -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
    
    <!-- Make sure files generated by running WebView2APISample.exe are not included -->
	<xsl:key name="file-search" match="wix:Component[contains(wix:File/@Source, 'WebView2APISample.exe.WebView2')]" use="@Id"/>
	
    <!-- Sample code on if end developer chose to exclude the pdb files -->
    <xsl:key name="file-search" match="wix:Component[contains(wix:File/@Source, '.pdb')]" use="@Id"/>

    <!-- Do Nothing to these files if key file-search are found. -->
	<xsl:template match="wix:Component[key('file-search', @Id)]"/>
	<xsl:template match="wix:ComponentRef[key('file-search', @Id)]"/>
</xsl:stylesheet>