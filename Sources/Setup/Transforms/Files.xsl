<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:wix="http://schemas.microsoft.com/wix/2006/wi"
xmlns="http://schemas.microsoft.com/wix/2006/wi" 
exclude-result-prefixes="wix">
  <xsl:output method="xml" indent="yes"/>
  <xsl:variable name="localpath">..\..\Out\$(var.Configuration)\HelloWorld\</xsl:variable>
  <xsl:variable name="group-name">ProductComponents.</xsl:variable>
  <xsl:template match="wix:Wix">
    <xsl:variable name="binaries" select="wix:Fragment/wix:DirectoryRef/wix:Directory/wix:Component[(substring(wix:File/@Source, string-length(wix:File/@Source) - 5) = 'config' and not(contains(wix:File/@Source, 'vshost'))) or (substring(wix:File/@Source, string-length(wix:File/@Source) - 2) = 'exe' and not(contains(wix:File/@Source, 'vshost')))]"/>
    <Wix>
      <Fragment>
        <DirectoryRef Id="{concat($group-name, 'Files')}">
          <xsl:apply-templates select="$binaries"/>
        </DirectoryRef>
      </Fragment>
      <Fragment>
        <ComponentGroup Id="{concat($group-name, 'Files')}">
          <xsl:for-each select="$binaries">
            <ComponentRef Id="{concat($group-name, @Id)}"/>
          </xsl:for-each>
        </ComponentGroup>
      </Fragment>
    </Wix>
  </xsl:template>
  <xsl:template match="wix:Component">
    <Component Id="{concat($group-name, @Id)}" Guid="{@Guid}">
      <File Id="{concat($group-name, wix:File/@Id)}" Source="{concat($localpath, substring-after(wix:File/@Source,'\'))}" />
    </Component>
  </xsl:template>
</xsl:stylesheet>