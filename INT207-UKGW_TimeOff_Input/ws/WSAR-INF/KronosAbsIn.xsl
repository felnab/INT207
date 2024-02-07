<?xml version='1.0'?>
<xsl:stylesheet version="2.0"
xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://Microsoft.LobServices.OracleDB/2007/03/SYSADM/Table/PS_GEX_SMTRK_IN">
<xsl:output method="xml" indent="yes" />
<!--<xsl:param name="IndStores"/> -->
	
	<xsl:template name="FormatDT">
     <xsl:param name="DateTimeStr" />

   

     <xsl:variable name="mm">
         <xsl:value-of select="substring($DateTimeStr,6,2)" />
     </xsl:variable>

     <xsl:variable name="dd">
        <xsl:value-of select="substring($DateTimeStr,9,2)" />
     </xsl:variable>

     <xsl:variable name="yyyy">
        <xsl:value-of select="substring($DateTimeStr,1,4)" />
     </xsl:variable>

     <xsl:value-of select="concat($yyyy,$mm, $dd)" />
  </xsl:template>

   <xsl:template name="ChgDateToNum">
  <xsl:choose>
        <xsl:when test="format-date(current-date(), '[F]') ='Sunday'">
       <xsl:value-of select="1"/></xsl:when>
	   <xsl:when test="format-date(current-date(), '[F]') ='Monday'">
	    <xsl:value-of select="2"/></xsl:when>
		   <xsl:when test="format-date(current-date(), '[F]') ='Tuesday'">
	    <xsl:value-of select="3"/></xsl:when>
		   <xsl:when test="format-date(current-date(), '[F]') ='Wednesday'">
	    <xsl:value-of select="4"/></xsl:when>
		   <xsl:when test="format-date(current-date(), '[F]') ='Thursday'">
	    <xsl:value-of select="5"/></xsl:when>
		   <xsl:when test="format-date(current-date(), '[F]') ='Friday'">
	    <xsl:value-of select="6"/></xsl:when>
	   <xsl:otherwise><xsl:value-of select="0"/></xsl:otherwise>
</xsl:choose> 
  
  
</xsl:template> 

<xsl:variable name="Curdate">
<xsl:value-of select="current-date()"/>
</xsl:variable>
   <xsl:variable name="DayOfWeek">
        <xsl:call-template name="ChgDateToNum"></xsl:call-template>
     </xsl:variable>

<xsl:variable name="SDayOfWeek">
        <xsl:choose>
        <xsl:when test="$DayOfWeek = 0">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P6D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 1">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P7D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 2">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P8D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 3">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P9D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek=4">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P10D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 5">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P11D')"/>
	   </xsl:when>
	   
	   <xsl:otherwise><xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P12D')"/></xsl:otherwise>
	   
	
</xsl:choose> 
     </xsl:variable>

	 <xsl:variable name="EDayOfWeek">
         <xsl:choose>
        <xsl:when test="$DayOfWeek = 0">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P7D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 1">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P1D') "/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 2">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P2D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 3">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P3D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 4">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P4D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 5">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P5D')"/>
	   </xsl:when>
	   
	   <xsl:otherwise><xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P6D')"/></xsl:otherwise>
</xsl:choose> 
     </xsl:variable>

	<xsl:variable name="FSdate">
        <xsl:value-of select="concat(substring($SDayOfWeek,1,4),substring($SDayOfWeek,6,2),substring($SDayOfWeek,9,2))" />
           <!--  <xsl:value-of select="'20190210'"/>-->
     </xsl:variable>
<xsl:variable name="Cdate">
        <xsl:value-of select="concat(substring($Curdate,1,4),substring($Curdate,6,2),substring($Curdate,9,2))" />
     </xsl:variable>
     <xsl:variable name="FEdate">
      <xsl:value-of select="concat(substring($EDayOfWeek,1,4),substring($EDayOfWeek,6,2),substring($EDayOfWeek,9,2))" />
        <!--  <xsl:value-of select="'20190216'"/>-->
     </xsl:variable>
	  <xsl:variable name="GLPdate">
      
    <xsl:value-of select="'20191229'"/>
	 </xsl:variable>
	 <xsl:variable name="NEdate">
       <xsl:value-of select="normalize-space(concat(substring($EDayOfWeek,1,4),'-',substring($EDayOfWeek,6,2),'-',substring($EDayOfWeek,9,2),'T00:00:00'))" /> 
     <!-- <xsl:value-of select="'2019-02-16T00:00:00'"/>-->
	 </xsl:variable>
	

     
<xsl:variable name="list" select="fn:tokenize('501 502 503 504 505 513 514 515 519 522 523 563 539 HOL', '\s+')" />

 
 <xsl:variable name="Ind" select="fn:tokenize('1635 0687 0607 0617 0619 0621 0625 0632 0643 0645 0646 0664 0665 0670 0675 0678 0681 0682 0683 0688 0695 0697 0698 1041 1219 1602 1603 1633 1670 3384 6384 0648', '\s+')" />
 <!--<xsl:variable name="Ind" select="fn:tokenize('$IndStores', '\s+')" />-->
 
 	 <xsl:template name="WeekType">
	   <xsl:param name="KronosDateStrIN" />
  <xsl:choose>
        <xsl:when test="$KronosDateStrIN &gt;$FEdate">F</xsl:when>
     <xsl:when test="$KronosDateStrIN &lt;$FSdate">P</xsl:when>
	   <xsl:otherwise>C</xsl:otherwise>
	   </xsl:choose> 
  
  </xsl:template>

<xsl:template match="/">



	
	<ABSINP>
	<xsl:for-each select="ns0:Insert/ns0:RECORDSET/ns0:PS_GEX_SMTRK_INRECORDINSERT">
<xsl:sort select="normalize-space(ns0:REG_HRS)" order="descending" />
	 <xsl:variable name="OffStrDate">
       <xsl:call-template name="FormatDT">
                    <xsl:with-param name="DateTimeStr" select="ns0:PAY_END_DT"/>
                </xsl:call-template>
 </xsl:variable>
  <xsl:variable name="Wtype">
       <xsl:call-template name="WeekType">
                    <xsl:with-param name="KronosDateStrIN" select="$OffStrDate"/>
                </xsl:call-template>
 </xsl:variable>

 <xsl:variable name="GLiveB">
        <xsl:choose>  
        <xsl:when test="$OffStrDate &gt;=$GLPdate">N</xsl:when>
          <xsl:otherwise>Y</xsl:otherwise>
	   </xsl:choose>      
 </xsl:variable>
<!--<xsl:if test="((string(fn:index-of($list, normalize-space(ns0:ERNCD)))!='') and (string(fn:index-of($Ind, normalize-space(ns0:DEPTID)))=''))">-->
 
 <xsl:if test="((string(fn:index-of($list, normalize-space(ns0:ERNCD)))!='') and (string(fn:index-of($Ind, normalize-space(ns0:DEPTID)))='') and ($GLiveB='N'))">
 <Abs>

<Batch_ID>
<xsl:value-of select="concat('ABS',ns0:DEPTID_HOME,'-',$Cdate)"/>
</Batch_ID>
<action>
<xsl:choose>
      
     <xsl:when test="( normalize-space(ns0:ERNCD) ='515' and(($Wtype='P') or($Wtype='F') ) and (ns0:SEPCHK ='1') and (ns0:REG_HRS &lt;  0))">2% Vacation</xsl:when>
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='513' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0))">Vacation</xsl:when> 
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='519' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0))">Vacation Week 4/5/6</xsl:when>
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='522' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0)) ">Previous Year Vacation</xsl:when>
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='523' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0)) ">Vacation Previous Year 4/5/6</xsl:when>
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='563' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0)) ">Previous Year Vacation 2%</xsl:when>
      
	   <xsl:when test="( normalize-space(ns0:ERNCD) ='503' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0)) ">Bereavement</xsl:when>
	    <xsl:when test="( normalize-space(ns0:ERNCD) ='514' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0)) ">Birthday</xsl:when>
		 <xsl:when test="( normalize-space(ns0:ERNCD) ='502' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0)) ">Holiday Time Off - Hourly</xsl:when>
		  <xsl:when test="( normalize-space(ns0:ERNCD) ='HOL' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0)) ">Holiday Time Off - Salary</xsl:when>
		   <xsl:when test="( normalize-space(ns0:ERNCD) ='501' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0)) ">Incidental Time</xsl:when>
		    <xsl:when test="( normalize-space(ns0:ERNCD) ='504' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0)) ">Jury Duty</xsl:when>
			 <xsl:when test="( normalize-space(ns0:ERNCD) ='505' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0)) ">Personal Day</xsl:when> 

	  <xsl:when test="( normalize-space(ns0:ERNCD) ='539' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&lt;0)) ">Alternative Vacation</xsl:when> 
	  
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='515' and(($Wtype='P') or($Wtype='F') ) and (ns0:SEPCHK ='1') and ((ns0:REG_HRS)&gt;=0)) ">Additional Vacation 2%</xsl:when>
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='513' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0))">Additional Vacation</xsl:when> 
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='519' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0))">Additional Vacation Weeks 4/5/6</xsl:when>
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='522' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0)) ">Additional Vacation Previous Year</xsl:when>
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='523' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0)) ">Additional Vacation Previous Year Weeks 4/5/6</xsl:when>
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='563' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0)) ">Additional Vacation Previous Year 2%</xsl:when>
      
	   <xsl:when test="( normalize-space(ns0:ERNCD) ='503' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0)) ">Additional Bereavement</xsl:when>
	    <xsl:when test="( normalize-space(ns0:ERNCD) ='514' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0)) ">Additional Birthday</xsl:when>
		 <xsl:when test="( normalize-space(ns0:ERNCD) ='502' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0)) ">Additional Holiday - Hourly</xsl:when>
		  <xsl:when test="( normalize-space(ns0:ERNCD) ='HOL' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0)) ">Additional Holiday - Salary</xsl:when>
		   <xsl:when test="( normalize-space(ns0:ERNCD) ='501' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0)) ">Additional Incidental</xsl:when>
		    <xsl:when test="( normalize-space(ns0:ERNCD) ='504' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0)) ">Additional Jury Duty</xsl:when>
			 <xsl:when test="( normalize-space(ns0:ERNCD) ='505' and (($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and ((ns0:REG_HRS)&gt;=0)) ">Additional Personal Day</xsl:when> 

			  <xsl:when test="((ns0:ERNCD =('501')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Incidental</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('502')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Holiday - Hourly</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('503')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Bereavement</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('504')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Jury Duty</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('505')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Personal Day</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('513')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Vacation</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('514')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Birthday</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('515')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Vacation 2%</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('519')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Vacation Weeks 4/5/6</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('522')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Vacation Previous Year</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('523')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Vacation Previous Year Weeks 4/5/6</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('563')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Vacation Previous Year 2%</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('HOL')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">Additional Holiday - Salary</xsl:when>
	    
      <xsl:when test="((ns0:ERNCD =('513') and ($Wtype='C')) or ((ns0:ERNCD =('513')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Vacation</xsl:when>
           <xsl:when test="((ns0:ERNCD =('515') and ($Wtype='C')) or ((ns0:ERNCD =('515')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">2% Vacation</xsl:when>
       <xsl:when test="((ns0:ERNCD =('503') and ($Wtype='C')) or ((ns0:ERNCD =('503')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Bereavement</xsl:when>
	<xsl:when test="((ns0:ERNCD =('514') and ($Wtype='C')) or ((ns0:ERNCD =('514')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Birthday</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('502') and ($Wtype='C')) or ((ns0:ERNCD =('502')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Holiday Time Off - Hourly</xsl:when>
	  <xsl:when test="((ns0:ERNCD =('HOL') and ($Wtype='C')) or ((ns0:ERNCD =('HOL')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Holiday Time Off - Salary</xsl:when>
    <xsl:when test="((ns0:ERNCD =('501') and ($Wtype='C')) or ((ns0:ERNCD =('501')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Incidental Time</xsl:when>
	
	  <xsl:when test="((ns0:ERNCD =('539') and ($Wtype='C')) or ((ns0:ERNCD =('539')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Alternative Vacation</xsl:when>
	  
       <xsl:when test="((ns0:ERNCD =('504') and ($Wtype='C')) or ((ns0:ERNCD =('504')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">JuryDuty</xsl:when>
	<xsl:when test="((ns0:ERNCD =('505') and ($Wtype='C')) or ((ns0:ERNCD =('505')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Personal Day</xsl:when>
	
    <xsl:when test="((ns0:ERNCD =('522') and ($Wtype='C')) or ((ns0:ERNCD =('522')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Previous Year Vacation</xsl:when>
		 <xsl:when test="((ns0:ERNCD =('523') and ($Wtype='C')) or ((ns0:ERNCD =('523')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Vacation Previous Year 4/5/6</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('519') and ($Wtype='C')) or ((ns0:ERNCD =('519')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Vacation Week 4/5/6</xsl:when>
   
      <xsl:when test="((ns0:ERNCD =('563') and ($Wtype='C')) or ((ns0:ERNCD =('563')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('P'))))">Previous Year Vacation 2%</xsl:when>

</xsl:choose>      
 
</action>
<emp> <xsl:value-of select="normalize-space(ns0:EMPLID)"/>
</emp>
 
<erncd>		


<xsl:choose>
<xsl:when test="( (normalize-space(ns0:ERNCD) ='501') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">501A</xsl:when>
 <xsl:when test="( (normalize-space(ns0:ERNCD) ='502') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0)">502A</xsl:when>
	<xsl:when test="( (normalize-space(ns0:ERNCD) ='503') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">503A</xsl:when>
	<xsl:when test="( (normalize-space(ns0:ERNCD) ='504') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">504A</xsl:when>
	  <xsl:when test="( (normalize-space(ns0:ERNCD) ='505') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">505A</xsl:when>
	  <xsl:when test="( (normalize-space(ns0:ERNCD) ='513') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">513A</xsl:when>
	  <xsl:when test="( (normalize-space(ns0:ERNCD) ='514') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">514A</xsl:when>
	  <xsl:when test="( (normalize-space(ns0:ERNCD) ='515') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">515A</xsl:when>
	  <xsl:when test="( (normalize-space(ns0:ERNCD) ='519') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">519A</xsl:when>
	   <xsl:when test="( (normalize-space(ns0:ERNCD) ='522') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">522A</xsl:when>
	  <xsl:when test="( (normalize-space(ns0:ERNCD) ='523') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">523A</xsl:when>
	  <xsl:when test="( (normalize-space(ns0:ERNCD) ='563') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">563A</xsl:when>
	   <xsl:when test="( (normalize-space(ns0:ERNCD) ='HOL') and(($Wtype='P') or($Wtype='F') )and (ns0:SEPCHK ='1')and (ns0:REG_HRS)&gt;=0) ">HOLA</xsl:when>
	
	 <xsl:when test="((ns0:ERNCD =('501')) and (string-length(ns0:SEPCHK) =0)  and ($Wtype=('F')))">501A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('502')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">502A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('503')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">503A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('504'))  and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">504A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('505')) and (string-length(ns0:SEPCHK) =0)  and ($Wtype=('F')))">505A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('513')) and (string-length(ns0:SEPCHK) =0)  and ($Wtype=('F')))">513A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('514')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">514A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('515')) and (string-length(ns0:SEPCHK) =0)  and ($Wtype=('F')))">515A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('519')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">519A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('522')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">522A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('523')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">523A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('563')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">563A</xsl:when>
	 <xsl:when test="((ns0:ERNCD =('HOL')) and (string-length(ns0:SEPCHK) =0) and ($Wtype=('F')))">HOLA</xsl:when>
	
	 <xsl:otherwise>
	<xsl:value-of select="substring (ns0:ERNCD,1,3)"/>
	  </xsl:otherwise>
	 </xsl:choose>  
</erncd>
 


	


<PayEndDate>

<xsl:value-of select="ns0:PAY_END_DT"/>
</PayEndDate>
 <Hours>
		     <xsl:choose>
          <xsl:when test="normalize-space(ns0:REG_HRS) ='0.00'">0</xsl:when>
		
         <xsl:otherwise>
                   <xsl:value-of select="ns0:REG_HRS"/>
            </xsl:otherwise>
       </xsl:choose>
		  </Hours>
		 <HRate><xsl:value-of select="ns0:HOURLY_RT"/></HRate>
		
		  </Abs>
		   </xsl:if>
		  </xsl:for-each>
		</ABSINP>
	

</xsl:template>

</xsl:stylesheet>