<?xml version='1.0'?>
<!DOCTYPE xsl:stylesheet
[
  <!ENTITY % site-entities SYSTEM "../entities.site">
  %site-entities;
]>


<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  version="1.0">

<xsl:include href="../page.xsl" />

<!-- this template outputs a complete <a href > for a component and version -->
<xsl:template name="hyperlink">
  <xsl:param name="id" />
  <xsl:param name="component" />
  <xsl:param name="milestone" />

  <xsl:element name="a">
    <xsl:attribute name="href">
http://bugzilla.gnome.org/buglist.cgi?product=GStreamer&amp;component=<xsl:value-of select="$component" /><![CDATA[&]]>target_milestone=<xsl:value-of select="$milestone" /></xsl:attribute>
    <xsl:value-of select="$milestone" />
  </xsl:element>
</xsl:template>


<xsl:template match="module">
<td valign="top">
<table border="1">
<tr><td><xsl:value-of select="@id" /></td></tr>
<!-- unresolved bugs for this component -->
<tr>
  <td>
    <xsl:element name="a">
      <xsl:attribute name="href">
http://bugzilla.gnome.org/buglist.cgi?product=GStreamer&amp;component=<xsl:value-of select="component" />&amp;bug_status=UNCONFIRMED&amp;bug_status=NEW&amp;bug_status=ASSIGNED&amp;bug_status=NEEDINFO&amp;bug_status=REOPENED&amp;form_name=query
      </xsl:attribute>
unresolved
    </xsl:element>
  </td>
</tr>

  <xsl:for-each select="milestones/milestone">
<tr>
  <td>
  <xsl:call-template name="hyperlink">
    <xsl:with-param name="id"><xsl:value-of select="../../@id" /></xsl:with-param>
    <xsl:with-param name="component"><xsl:value-of select="../../component" /></xsl:with-param>
    <xsl:with-param name="milestone"><xsl:value-of select="." /></xsl:with-param>
  </xsl:call-template>
  </td>
</tr>
  </xsl:for-each>
</table>
</td>
</xsl:template>

<xsl:template match="buglists">
  <xsl:call-template name="page">
    <xsl:with-param name="title">GStreamer: Bug Lists</xsl:with-param>
    <xsl:with-param name="content">
<h1>Bug Lists</h1>
<table>
<tr>
<xsl:apply-templates />
</tr>

<tr>
  <td colspan="4">
<a href="http://bugzilla.gnome.org/buglist.cgi?product=GStreamer&amp;bug_status=UNCONFIRMED&amp;bug_status=NEW&amp;bug_status=ASSIGNED&amp;bug_status=NEEDINFO&amp;bug_status=REOPENED&amp;form_name=query">All unresolved bugs</a>
  </td>
</tr>
</table>

    </xsl:with-param>
  </xsl:call-template>

</xsl:template>

</xsl:stylesheet>