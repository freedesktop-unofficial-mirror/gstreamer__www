<?xml version='1.0'?>
<!DOCTYPE xsl:stylesheet
[
  <!ENTITY % site-entities SYSTEM "../entities.site">
  <!ENTITY % gst-entities SYSTEM "../entities.gst">
  %site-entities;
  %gst-entities;
]>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  version="1.0">

  <xsl:include href="../page.xsl" />

  <!-- this template displays the features -->
  <xsl:template match="features">
    <h2>Features of this release</h2>
    <ul>
    <xsl:for-each select="feature">
      <li><xsl:value-of select="." /></li>
    </xsl:for-each>
    </ul>
  </xsl:template>

  <!-- this template displays the issues -->
  <xsl:template match="issues">
    <h2>Known issues</h2>
    <ul>
    <xsl:for-each select="issue">
      <li><xsl:value-of select="." /></li>
    </xsl:for-each>
    </ul>
  </xsl:template>

 
  <!-- this template displays the contributors -->
  <xsl:template match="contributors">
    <h2>Contributors to this release</h2>
    <ul>
    <xsl:for-each select="person">
      <li><xsl:value-of select="." /></li>
    </xsl:for-each>
    </ul>
  </xsl:template>

  <!-- this template displays the maintainers -->
  <xsl:template match="maintainers">
    <h2>Maintainers</h2>
    <ul>
    <xsl:for-each select="person">
      <li><xsl:value-of select="." /></li>
    </xsl:for-each>
    </ul>
  </xsl:template>


  <!-- this template displays the application notes -->
  <xsl:template match="applications">
    <h2>Applications</h2>
    <xsl:copy-of select="." />
  </xsl:template>

  <!-- this template outputs the release notes -->
  <xsl:template match="release">
    <xsl:call-template name="page">
      <xsl:with-param name="title">
GStreamer: Release notes for
<xsl:value-of select="module-fancy" />&nbsp;<xsl:value-of select="version" />
"<xsl:value-of select="name" />"
      </xsl:with-param>
      <xsl:with-param name="content">
<h1>
Release notes for
<xsl:value-of select="module-fancy" />&nbsp;<xsl:value-of select="version" />
"<xsl:value-of select="name" />"
</h1>
        <xsl:copy-of select="intro" />

        <xsl:apply-templates select="features" />
        <xsl:apply-templates select="issues" />

<h2>Download</h2>
You find source releases of <xsl:copy-of select="module" /> in the
<xsl:call-template name="hyperlink">
  <xsl:with-param name="href">&site;/src/<xsl:value-of select="module" />/</xsl:with-param>
  <xsl:with-param name="text"><xsl:value-of select="module" /> download directory</xsl:with-param>
</xsl:call-template>.



<h2>GStreamer Homepage</h2>

More details can be found on the project's website,
<a href="&site;">&site;</a>.

<h2>Support and Bugs</h2>

We use Gnome's bugzilla for
<a href="&gst-bug-report;">bug reports and feature requests</a>.

<h2>Developers</h2>
CVS is hosted on cvs.freedesktop.org.  You can
<xsl:call-template name="hyperlink">
  <xsl:with-param name="href">&gst-cvs-http;/<xsl:value-of select="module" />/</xsl:with-param>
  <xsl:with-param name="text">browse the <xsl:value-of select="module" /> repository</xsl:with-param>
</xsl:call-template>.

All code is in CVS and can be checked out from there.
Interested developers of the core library, plug-ins, and applications should
subscribe to the gstreamer-devel list. If there is sufficient interest we
will create more lists as necessary.

        <xsl:apply-templates select="applications" />

        <xsl:apply-templates select="contributors" />

        <xsl:apply-templates select="maintainers" />

      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>