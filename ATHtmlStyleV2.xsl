<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns:ead="urn:isbn:1-931666-22-9"
	xmlns:ns2="http://www.w3.org/1999/xlink">
	<!--
		***********************************************************************
		*                                               		   
		* VERSION:          2.0                                          			 
		*                                                                 				
		* AUTHOR:           Matthew Peters                               		
		*                   mpeters@ucsd.edu                           		 
		*                                                                 				
		*                                                                 				
		* ABOUT:            This file has been created for use with        	
		*                   EAD output  from the Archivists' Toolkit          		
		*                   to create html 5 output for the Mandeville Special	
		*	            Collections Library, UCSD.  It is not designed 	
		*	            to be generic and satisfies the specific needs and	
		*                   processing policies of UCSD:MSCL			
		*                                                                 				
		* UPDATED           May 9, 2012                              		 
		*******************************************************************
	-->
    <xsl:output indent="yes" method="html" doctype-system="html" doctype-public="html" encoding="utf-8"/>
    <xsl:variable name="date" select="document('http://xobjex.com/service/date.xsl')/date"/>
    <xsl:variable name="collectionnum">
	<xsl:value-of select="translate(ead:ead/ead:archdesc/ead:did/ead:unitid, '.', ' ')"/>
    </xsl:variable>
    
    <xsl:template match="/">
	<html>
    	<head>
    		<title>Register of <xsl:value-of select="ead:ead/ead:archdesc/ead:did/ead:unittitle"/> - <xsl:value-of select="$collectionnum"/></title>
		<link rel="stylesheet" type="text/css" href="http://libraries.ucsd.edu/speccoll/reset.css" media="screen"/>
      		<link rel="stylesheet" type="text/css" href="mssscreen.css" media="screen"/>
      		<link rel="stylesheet" type="text/css" href="mssprint.css" media="print"/>
      		<meta http-equiv="content-Type" content="txt/html; charset=iso-8859-1"/>
      		<meta name="description">
      			<xsl:attribute name="content">Manuscript finding aid for <xsl:value-of select="ead:ead/ead:archdesc/ead:did/ead:unittitle"/></xsl:attribute>
      		</meta>
      		<meta name="keywords">
      			<xsl:attribute name="content"><xsl:value-of select="ead:ead/ead:archdesc/ead:did/ead:unittitle"/></xsl:attribute>
      		</meta>
		<script type="text/javascript" src="http://libraries.ucsd.edu/speccoll/baselib/jquery.min.js"></script>
      		<script type="text/javascript" src="js/findingaid.js"></script>
		<script type="text/javascript">
		    var FA = new fa.display();
		    $(function() {
			$('div.subseries').addClass('toggle');
			$('div.file').addClass('toggle');
			FA.togglediv('div.archdesc', 'div.toggle');
			
		    });
		</script>
    	</head>
    	<body>
	    <div id="header">
		
	    </div>
	    <div id="contentcontainer">
		<div class="content">
		    <ul id="textsize">
			<li><a href="javascript:FA.setText('sm')">small</a></li>
			<li><a href="javascript:FA.setText('med')">medium</a></li>
			<li><a href="javascript:FA.setText('lg')">large</a></li>
		    </ul>
		    <xsl:apply-templates select="ead:ead" />
		    <div id="datestamp">
			    <p>
				<br />
				Finding aid generated: <xsl:value-of select="$date/local/year"/>-<xsl:value-of select="$date/local/month"/>-<xsl:value-of select="$date/local/day"/>
			    </p>
		    </div>
		</div>
		<div id="footer">
		    <div id="footleft">
			<ul>
			    <li>Mandeville Special Collections and Archives</li>
			    <li>UC San Diego, 9500 Gilman Dr., La Jolla CA 92093</li>
			    <li>&#169;2013 Regents of the University of California. All rights reserved.</li>
			    <li><a href="mailto:spcoll@ucsd.edu">Contact Us</a></li>
			</ul>
		    </div>
		    <div id="footright">
			<a href="http://libraries.ucsd.edu/"><img id="thelibrary" src="http://libraries.ucsd.edu/speccoll/baselib/assets/librarylogo-000.png" /></a>
		    </div>
		</div>
	    </div>
	    
    	</body>
	</html>
  	<xsl:message>Styling Done</xsl:message>
    </xsl:template>
    
    <xsl:template match="ead:abbr">

    </xsl:template>
    
    <xsl:template match="ead:did/ead:abstract">
	<span class="medium_head"><xsl:value-of select="@label" /></span>
	<div class="text">
	    <p><xsl:apply-templates /></p>
	</div>
    </xsl:template>
    
    <xsl:template match="ead:accessrestrict">
	<span class="medium_head"><xsl:value-of select="ead:head" /></span>
	<xsl:apply-templates select="ead:p" />	
    </xsl:template>
    
    <xsl:template match="ead:accruals">
    </xsl:template>
    
    <xsl:template match="ead:acqinfo">
    </xsl:template>
    
    <xsl:template match="ead:address">
    </xsl:template>
    
    <xsl:template match="ead:addressline">
    </xsl:template>
    
    <xsl:template match="ead:altformavail">
	
    </xsl:template>
    
    <xsl:template match="ead:appraisal">
    </xsl:template>
    
    <xsl:template match="ead:arc">
    </xsl:template>
    
    <xsl:template match="ead:archdesc">
    	<div id="archdesc">
	    <div id="colltitle">
		<h1>Register of the <xsl:value-of select="ead:did/ead:unittitle" /><xsl:text>, </xsl:text> <xsl:value-of select="ead:did/ead:unitdate" /></h1><h1><xsl:value-of select="ead:did/ead:unitid" /></h1>
	    </div>
	    <div id="libinfo">
		<h2>Mandeville Special Collections Library</h2>
		<h2>Geisel Library</h2>
		<h2>University of California San Diego</h2>
	    </div>
	    <div id="extent" class="archdesc"><h3>Extent</h3><xsl:apply-templates select="ead:did/ead:physdesc" /></div>
	    <div id="restrictions" class="archdesc"><xsl:apply-templates select="ead:accessrestrict" /></div>
	    <div id="altform" class="archdesc"><xsl:apply-templates select="ead:altformavail" /></div>
	    <div id="abstract" class="archdesc"><xsl:apply-templates select="ead:did/ead:abstract" /></div>
	    <div class="archdesc" id="{ead:bioghist/@id}"><xsl:apply-templates select="ead:bioghist" /></div>
	    <div class="archdesc" id="{ead:scopecontent/@id}"><xsl:apply-templates select="ead:scopecontent" /></div>
	    <div id="containerlist" class="archdesc"><h3>Container List</h3><xsl:apply-templates select="ead:dsc" /></div>
    	</div>
    </xsl:template>
    
    <xsl:template match="ead:archdescgrp">
    </xsl:template>
    
    <xsl:template match="ead:archref">
    </xsl:template>
    
    <xsl:template match="ead:arrangement">
    </xsl:template>
    
    <xsl:template match="ead:author">
    </xsl:template>
    
    <xsl:template match="ead:bibliography">
    </xsl:template>
    
    <xsl:template match="ead:bibref">
    </xsl:template>
    
    <xsl:template match="ead:bibseries">
    </xsl:template>
    
    <xsl:template match="ead:bioghist">
	<ul class="archdescheader">
	    <li>
		<xsl:apply-templates select="ead:head" />
	    </li>
	    <li>
		<a href="javascript:FA.togglediv('#{@id}', 'div');" class="togglebutton" ></a>
	    </li>
	</ul>
	
	<div class="toggle">
	    <xsl:apply-templates select="ead:p" />
	</div>
    </xsl:template>
    
    <xsl:template match="ead:blockquote">
    </xsl:template>
    
    <xsl:template match="ead:c|ead:c01|ead:c02|ead:c03|ead:c04|ead:c05|ead:c06|ead:c07|ead:c08|ead:c09|ead:c10|ead:c11|ead:c12">
	<xsl:variable name="daocount" select="count(child::ead:dao)"></xsl:variable>
	<xsl:variable name="entrytype" select="@level" />
	    <div class="{$entrytype}" id="{@id}">
		<xsl:choose>
		    <xsl:when test="@level='collection'">
			<h3>
			    <xsl:choose>
				<xsl:when test="$daocount = 1">
				    <a href="{ead:dao[1]/@ns2:href}" target="_blank"><xsl:apply-templates select="ead:did/ead:unittitle" />
					<xsl:if test="ead:did/ead:unitdate">
					    <xsl:text>, </xsl:text><xsl:value-of select="ead:did/ead:unitdate" />
					</xsl:if>
				    </a>
				</xsl:when>
				<xsl:otherwise>
				    <xsl:apply-templates select="ead:did/ead:unittitle" />
				    <xsl:if test="ead:did/ead:unitdate">
					    <xsl:text>, </xsl:text><xsl:value-of select="ead:did/ead:unitdate" />
					</xsl:if>
				</xsl:otherwise>
			    </xsl:choose>
			</h3>
		    </xsl:when>
		    <xsl:when test="@level='series'">
			<ul class="containerheading">
			    <li class="seriesheading">
				<xsl:choose>
				    <xsl:when test="$daocount = 1">
					<a href="{ead:dao[1]/@ns2:href}" target="_blank"><xsl:apply-templates select="ead:did/ead:unittitle" />
					    <xsl:if test="ead:did/ead:unitdate">
						<xsl:text>, </xsl:text><xsl:value-of select="ead:did/ead:unitdate" />
					    </xsl:if>
					</a>
				    </xsl:when>
				    <xsl:otherwise>
					<xsl:apply-templates select="ead:did/ead:unittitle" />
					<xsl:if test="ead:did/ead:unitdate">
						<xsl:text>, </xsl:text><xsl:value-of select="ead:did/ead:unitdate" />
					    </xsl:if>
				    </xsl:otherwise>
				</xsl:choose>
			    </li>
			    <xsl:if test="child::ead:c">
				<li class="tog">
				    <a href="javascript:FA.togglediv('#{@id}', 'div.toggle');" class="togglebutton" ></a>
				</li>
			    </xsl:if>
			</ul>
		    </xsl:when>
		    <xsl:when test="@level='subseries'">
			<ul class="containerheading">
			    <li class="subseriesheading">
				<xsl:choose>
				    <xsl:when test="$daocount = 1">
					<a href="{ead:dao[1]/@ns2:href}" target="_blank"><xsl:apply-templates select="ead:did/ead:unittitle" /><xsl:if test="ead:did/ead:unitdate">
						<xsl:text>, </xsl:text><xsl:value-of select="ead:did/ead:unitdate" />
					    </xsl:if></a>
				    </xsl:when>
				    <xsl:otherwise>
					<xsl:apply-templates select="ead:did/ead:unittitle" />
					<xsl:if test="ead:did/ead:unitdate">
						<xsl:text>, </xsl:text><xsl:value-of select="ead:did/ead:unitdate" />
					    </xsl:if>
				    </xsl:otherwise>
				</xsl:choose>
			    </li>
			
			    <xsl:if test="child::ead:c">
				<li class="tog">
				    <a href="javascript:FA.togglediv('#{@id}', 'div.toggle');" class="togglebutton" ></a>
				</li>
			    </xsl:if>
			</ul>
		    </xsl:when>
		    <xsl:when test="@level='file' and child::ead:c[@level='file']">
			<ul class="containerheading">
			    <li class="fileheading">
				<xsl:choose>
				    <xsl:when test="$daocount = 1">
					<a href="{ead:dao[1]/@ns2:href}" target="_blank"><xsl:apply-templates select="ead:did/ead:unittitle" /><xsl:if test="ead:did/ead:unitdate">
						<xsl:text>, </xsl:text><xsl:value-of select="ead:did/ead:unitdate" />
					    </xsl:if></a>
				    </xsl:when>
				    <xsl:otherwise>
					<xsl:apply-templates select="ead:did/ead:unittitle" />
					<xsl:if test="ead:did/ead:unitdate">
						<xsl:text>, </xsl:text><xsl:value-of select="ead:did/ead:unitdate" />
					</xsl:if>
				    </xsl:otherwise>
				</xsl:choose>
			    </li>
			    <xsl:if test="child::ead:c">
				<li class="tog">
				    <a href="javascript:FA.togglediv('#{@id}', 'div.toggle');" class="togglebutton" ></a>
				</li>
			    </xsl:if>
			</ul>
		    </xsl:when>
		    <xsl:otherwise>
			<xsl:if test="@level='file'">
			    <xsl:apply-templates select="ead:did/ead:container" />
			    <xsl:choose>
				<xsl:when test="$daocount = 1">
				    <div class="filedata">
				    <a href="{ead:dao[1]/@ns2:href}" target="_blank"><xsl:apply-templates select="ead:did/ead:unittitle" /><xsl:if test="ead:did/ead:unitdate">
					    <xsl:text>, </xsl:text><xsl:value-of select="ead:did/ead:unitdate" />
					</xsl:if></a>
				    </div>
				</xsl:when>
				<xsl:otherwise>
				    <div class="filedata">
				    <xsl:apply-templates select="ead:did/ead:unittitle" />
				    <xsl:if test="ead:did/ead:unitdate">
					<xsl:text>, </xsl:text><xsl:value-of select="ead:did/ead:unitdate" />
				    </xsl:if>
				    <xsl:if test="$daocount > 1">
					<div class="daolist">
					    <ul>
						<xsl:for-each select="ead:dao">
						    <li><xsl:apply-templates select="." /></li>
						</xsl:for-each>
					    </ul>
					</div>
				    </xsl:if>
				    </div>
				</xsl:otherwise>
			    </xsl:choose>
			    <xsl:apply-templates select="ead:odd" />
			</xsl:if>
		    </xsl:otherwise>
		</xsl:choose>
		
		<xsl:apply-templates select="ead:c|ead:c01|ead:c02|ead:c03|ead:c04|ead:c05|ead:c06|ead:c07|ead:c08|ead:c09|ead:c10|ead:c11|ead:c12" />
	    </div>
    </xsl:template>
    
    <xsl:template match="ead:change">
    </xsl:template>
    
    <xsl:template match="ead:chronitem">
    </xsl:template>
    
    <xsl:template match="ead:chronlist">
    </xsl:template>
    
    <xsl:template match="ead:colspec">
    </xsl:template>
    
    <xsl:template match="ead:did/ead:container">
	<span class="boxfolder"><xsl:value-of select="@type"/>: <xsl:value-of select="." /><xsl:text> </xsl:text></span>
    </xsl:template>
    
    <xsl:template match="ead:controlaccess">
    </xsl:template>
    
    <xsl:template match="ead:corpname">
    </xsl:template>
    
    <xsl:template match="ead:creation">
    </xsl:template>
    
    <xsl:template match="ead:custodhist">
    </xsl:template>
    
    <xsl:template match="ead:dao">
	<a href="{@ns2:href}" target="_blank"><xsl:apply-templates select="ead:daodesc/ead:p" /></a>
    </xsl:template>
    
    <xsl:template match="ead:daodesc/ead:p">
	<xsl:value-of select="." />
    </xsl:template>
    
    <xsl:template match="ead:daogrp">
    </xsl:template>
    
    <xsl:template match="ead:daoloc">
    </xsl:template>
    
    <xsl:template match="ead:date">
    </xsl:template>
    
    <xsl:template match="ead:defitem">
    </xsl:template>
    
    <xsl:template match="ead:descgrp">
    </xsl:template>
    
    <xsl:template match="ead:descrules">
    </xsl:template>
    
    <xsl:template match="ead:did">
    </xsl:template>
    
    <xsl:template match="ead:dimensions">
    </xsl:template>
    
    <xsl:template match="ead:div">
    </xsl:template>
    
    <xsl:template match="ead:dsc">
	<xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="ead:dscgrp">
    </xsl:template>
    
    <xsl:template match="ead:ead">
	<xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="ead:eadgrp">
    </xsl:template>
    
    <xsl:template match="ead:eadheader">
    </xsl:template>
    
    <xsl:template match="ead:eadid">
    </xsl:template>
    
    <xsl:template match="ead:edition">
    </xsl:template>
    
    <xsl:template match="ead:editionstmt">
    </xsl:template>
    
    <xsl:template match="ead:emph">
    </xsl:template>
    
    <xsl:template match="ead:entry">
    </xsl:template>
    
    <xsl:template match="ead:event">
    </xsl:template>
    
    <xsl:template match="ead:eventgrp">
    </xsl:template>
    
    <xsl:template match="ead:expan">
    </xsl:template>
    
    <xsl:template match="ead:extent">
	<xsl:value-of select="." /><xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="ead:extptr">
    </xsl:template>

    <xsl:template match="ead:extptrloc">
    </xsl:template>
    
    <xsl:template match="ead:extref">
    </xsl:template>
    
    <xsl:template match="ead:famname">
    </xsl:template>
    
    <xsl:template match="ead:filedesc">
    </xsl:template>
    
    <xsl:template match="ead:fileplan">
    </xsl:template>
    
    <xsl:template match="ead:frontmatter">
    </xsl:template>
    
    <xsl:template match="ead:function">
    </xsl:template>
    
    <xsl:template match="ead:genreform">
    </xsl:template>
    
    <xsl:template match="ead:geogname">
    </xsl:template>
    
    <xsl:template match="ead:head">
	<span class="medium_head"><xsl:value-of select="." /></span>
    </xsl:template>
    
    <xsl:template match="ead:head01">
    </xsl:template>
    
    <xsl:template match="ead:head02">
    </xsl:template>
    
    <xsl:template match="ead:imprint">
    </xsl:template>
    
    <xsl:template match="ead:index">
    </xsl:template>
    
    <xsl:template match="ead:indexentry">
    </xsl:template>
    
    <xsl:template match="ead:item">
    </xsl:template>
    
    <xsl:template match="ead:label">
    </xsl:template>
    
    <xsl:template match="ead:langmaterial">
    </xsl:template>
    
    <xsl:template match="ead:language">
    </xsl:template>
    
    <xsl:template match="ead:langusage">
    </xsl:template>
    
    <xsl:template match="ead:lb">
    </xsl:template>
    
    <xsl:template match="ead:legalstatus">
    </xsl:template>
    
    <xsl:template match="ead:linkgrp">
    </xsl:template>
    
    <xsl:template match="ead:list">
    </xsl:template>
    
    <xsl:template match="ead:listhead">
    </xsl:template>
    
    <xsl:template match="ead:materialspec">
    </xsl:template>
    
    <xsl:template match="ead:name">
    </xsl:template>
    
    <xsl:template match="ead:namegrp">
    </xsl:template>
    
    <xsl:template match="ead:note">
    </xsl:template>
    
    <xsl:template match="ead:notestmt">
    </xsl:template>
    
    <xsl:template match="ead:num">
    </xsl:template>
    
    <xsl:template match="ead:occupation">
    </xsl:template>
    
    <xsl:template match="ead:odd">
	<xsl:apply-templates select="./ead:head" />
	<xsl:apply-templates select="ead:p" />
    </xsl:template>
    
    <xsl:template match="ead:odd/ead:head">
	<span class="small_head"><xsl:value-of select="." /></span>
    </xsl:template>
    
    <xsl:template match="ead:originalsloc">
    </xsl:template>
    
    <xsl:template match="ead:origination">
    </xsl:template>
    
    <xsl:template match="ead:otherfindaid">
    </xsl:template>
    
    <xsl:template match="ead:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="ead:persname">
    </xsl:template>
    
    <xsl:template match="ead:did/ead:physdesc">
	<xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="ead:physfacet">
    </xsl:template>
    
    <xsl:template match="ead:physloc">
    </xsl:template>
    
    <xsl:template match="ead:phystech">
    </xsl:template>
    
    <xsl:template match="ead:prefercite">
    </xsl:template>
    
    <xsl:template match="ead:processinfo">
    </xsl:template>
    
    <xsl:template match="ead:profiledesc">
    </xsl:template>
    
    <xsl:template match="ead:ptr">
    </xsl:template>
    
    <xsl:template match="ead:ptrgrp">
    </xsl:template>
    
    <xsl:template match="ead:ptrloc">
    </xsl:template>
    
    <xsl:template match="ead:publicationstmt">
    </xsl:template>
    
    <xsl:template match="ead:publisher">
    </xsl:template>
    
    <xsl:template match="ead:ref">
    </xsl:template>
    
    <xsl:template match="ead:refloc">
    </xsl:template>
    
    <xsl:template match="ead:relatedmaterial">
    </xsl:template>
    
    <xsl:template match="ead:repository">
    </xsl:template>
    
    <xsl:template match="ead:resource">
    </xsl:template>
    
    <xsl:template match="ead:revisiondesc">
    </xsl:template>
    
    <xsl:template match="ead:row">
    </xsl:template>
    
    <xsl:template match="ead:runner">
    </xsl:template>
    
    <xsl:template match="ead:scopecontent">
	<ul class="archdescheader">
	    <li>
		<xsl:apply-templates select="ead:head" />
	    </li>
	    <li>
		<a href="javascript:FA.togglediv('#{@id}', 'div');" class="togglebutton" ></a>
	    </li>
	</ul>
	<div class="toggle">
	    <xsl:apply-templates select="ead:p" />
	</div>
    </xsl:template>
    
    <xsl:template match="ead:separatedmaterial">
    </xsl:template>
    
    <xsl:template match="ead:seriesstmt">
    </xsl:template>
    
    <xsl:template match="ead:sponsor">
    </xsl:template>
    
    <xsl:template match="ead:subarea">
    </xsl:template>
    
    <xsl:template match="ead:subject">
    </xsl:template>
    
    <xsl:template match="ead:subtitle">
    </xsl:template>
    
    <xsl:template match="ead:table">
    </xsl:template>
    
    <xsl:template match="ead:tbody">
    </xsl:template>
    
    <xsl:template match="ead:tgroup">
    </xsl:template>

    <xsl:template match="ead:thead">
    </xsl:template>
    
    <xsl:template match="ead:title">
    </xsl:template>
    
    <xsl:template match="ead:titlepage">
    </xsl:template>
    
    <xsl:template match="ead:titleproper">
    </xsl:template>
    
    <xsl:template match="ead:titlestmt">
    </xsl:template>
    
    <xsl:template match="ead:unitdate">
    </xsl:template>
    
    <xsl:template match="ead:unitid">
    </xsl:template>
    
    <xsl:template match="ead:did/ead:unittitle">
	<xsl:value-of select="." />
    </xsl:template>
    
    <xsl:template match="ead:unittitle">
	<xsl:value-of select="." />
    </xsl:template>
    
    <xsl:template match="ead:userestrict">
    </xsl:template>
    
</xsl:stylesheet>

