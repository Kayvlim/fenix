<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/taglibs-datetime.tld" prefix="dt" %>
<%@ page import="ServidorApresentacao.Action.sop.utils.SessionConstants" %>
<%@ page import="java.lang.Integer" %>
<%@ page import="java.lang.String" %>
<%@ page import="Util.TipoCurso" %>

<logic:notPresent name="siteView">
<table align="center" cellpadding='0' cellspacing='0'>
    <tr align="center">
        <td>
            <span class="error">
                <bean:message key="errors.invalidSiteExecutionCourse"/>
            </span>
        </td>
    </tr>
</table>
</logic:notPresent>

<logic:present name="siteView">
    <logic:notPresent name="siteView" property="component">
        <table align="center"  cellpadding='0' cellspacing='0'>
			<tr align="center">
				<td>
					<span class="error">
					     <bean:message key="message.public.notfound.executionCourse"/> 
					 </span>
				</td>
			</tr>
		</table>
    </logic:notPresent>


<logic:present name="siteView" property="component">
    <br/>
<bean:define id="component" name="siteView" property="commonComponent" />
<bean:define id="curricularCourses" name="component" property="associatedDegrees" />


<div id="associated-degrees">
		<logic:iterate id="curricularCourse" name="curricularCourses" >
			<bean:define id="infoDegreeCurricularPlan" name="curricularCourse" property="infoDegreeCurricularPlan"/>
			<bean:define id="degreeCurricularPlanID" name="infoDegreeCurricularPlan" property="idInternal" />
	   		<logic:equal name="degreeCurricularPlanID" value="<%= request.getAttribute("degreeCurricularPlanID").toString() %>" >
			<br/>
			<div  class="breadcumbs"><a href="http://www.ist.utl.pt/index.shtml">IST</a> > 
			<bean:define id="degreeType" name="infoDegreeCurricularPlan" property="infoDegree.tipoCurso" />	
			<logic:equal name="degreeType" value="<%= TipoCurso.MESTRADO_OBJ.toString() %>">
				 <html:link page="<%= "/showDegrees.do?method=master&executionPeriodOID=" + request.getAttribute(SessionConstants.EXECUTION_PERIOD_OID) %>" >Ensino Mestrados</html:link>
			</logic:equal>
			<logic:equal name="degreeType" value="<%= TipoCurso.LICENCIATURA_OBJ.toString() %>">
				<html:link page="<%= "/showDegrees.do?method=nonMaster&executionPeriodOID=" + request.getAttribute(SessionConstants.EXECUTION_PERIOD_OID) %>" >Ensino Licenciaturas</html:link>		
			</logic:equal>
			&gt;&nbsp;
			<html:link page="<%= "/showDegreeSite.do?method=showDescription&amp;executionPeriodOID=" + request.getAttribute(SessionConstants.EXECUTION_PERIOD_OID) + "&amp;degreeID=" + request.getAttribute("degreeID").toString() + "&amp;executionDegreeID="  +  request.getAttribute("executionDegreeID") + "&amp;index=" + request.getAttribute("index") %>">
				<bean:write name="infoDegreeCurricularPlan" property="infoDegree.sigla" />
			</html:link>&gt;&nbsp;
			<html:link page="<%= "/showDegreeSite.do?method=showCurricularPlan&amp;degreeID=" + request.getAttribute("degreeID") + "&amp;degreeCurricularPlanID=" + pageContext.findAttribute("degreeCurricularPlanID").toString() + "&amp;executionPeriodOID=" + request.getAttribute(SessionConstants.EXECUTION_PERIOD_OID) + "&amp;executionDegreeID="  + "&amp;index=" + request.getAttribute("index")  %>" >
			<bean:message key="label.curricularPlan"/>
			</html:link>&gt;&nbsp; 
			<html:link page="<%= "/chooseExamsMapContextDA.do?executionPeriodOID=" +  request.getAttribute(SessionConstants.EXECUTION_PERIOD_OID) + "&amp;degreeID="+ request.getAttribute("degreeID") + "&amp;degreeCurricularPlanID="+ pageContext.findAttribute("degreeCurricularPlanID").toString() + "&amp;page=1&method=choose&selectAllCurricularYears=on" + "&amp;index=" + request.getAttribute("index") %>" >
				<bean:message key="label.exams"/> 
			</html:link>&gt;&nbsp; 
			<%= request.getAttribute("sigla").toString() %>
</div>	

<!-- P�GINA EM INGL�S -->
	<div class="version">
		<span class="px10">
			<html:link page="<%= "/showDegreeSite.do?method=showCurricularPlan&amp;inEnglish=true&amp;executionPeriodOID=" + request.getAttribute(SessionConstants.EXECUTION_PERIOD_OID) + "&amp;degreeID=" +  request.getAttribute("degreeID") + "&amp;executionDegreeID="  +  request.getAttribute("executionDegreeID") + "&amp;index=" + request.getAttribute("index") %>" >english version</html:link> <img src="<%= request.getContextPath() %>/images/icon_uk.gif" alt="Icon: English version!" width="16" height="12" />
	</span>	
	</div>
	<div class="clear"></div> 
<h1><bean:write name="infoDegreeCurricularPlan" property="infoDegree.tipoCurso" />&nbsp;<bean:write name="infoDegreeCurricularPlan" property="infoDegree.nome" /></h1>

<h2>
<span class="greytxt">
	<bean:message key="label.curricularPlan"/>
	<bean:message key="label.the" />
	<bean:define id="initialDate" name="infoDegreeCurricularPlan" property="initialDate" />		
	<%= initialDate.toString().substring(initialDate.toString().lastIndexOf(" ")+1) %>
	<logic:notEmpty name="infoDegreeCurricularPlan" property="endDate">
		<bean:define id="endDate" name="infoDegreeCurricularPlan" property="endDate" />	
		-<%= endDate.toString().substring(endDate.toString().lastIndexOf(" ")) %>
	</logic:notEmpty>
</span>
</h2>
<br />
</logic:equal>

	</logic:iterate>
	</div>
    
    
    
    
        <bean:define id="component" name="siteView" property="component" />
	
        <logic:notEmpty name="component" property="initialStatement">
            <table align="center" cellspacing="0" width="90%">
             <tr>
               <td class="citation">
                 <p><bean:write name="component" property="initialStatement" filter="false"/></p>
               </td>
            </tr>
            </table>		
         <br/>
         <br/>
        </logic:notEmpty>
		
        <logic:notEmpty name="component" property="lastAnnouncement" >		
            <bean:define id="announcement" name="component" property="lastAnnouncement"/>
            <table id="anuncios" cellspacing="0" width="90%">
            	<tr>
                    <td  class="ultAnuncioAviso"> 
            		<img alt="" border="0"  src="<%= request.getContextPath() %>/images/icon_warning.gif"  />
            		<bean:message key="message.lastAnnouncement"/> 
                    </td>      
                </tr>
                 <tr>
                    <td class="ultAnuncio">
                    	<img alt="" border="0"  src="<%= request.getContextPath() %>/images/icon_anuncio.gif"  />
                    	<html:link  page="<%="/viewSite.do"+"?method=announcements&amp;objectCode=" + pageContext.findAttribute("objectCode") %>">
                    	<bean:write name="announcement" property="title"/>:
                    	</html:link>	
                    	<br/>
                        <bean:write name="announcement" property="information" filter="false"/>
                    </td>
                 </tr>
                 <tr>		
           		<td class="ultAnuncio-date">	
           			<bean:message key="message.modifiedOn"/>
           			<dt:format pattern="dd-MM-yyyy HH:mm">
           			    <bean:write name="announcement" property="lastModifiedDate.time"/>
           			  </dt:format>
                </td>
                </tr>           
             </table>
        </logic:notEmpty>
<br/>
<br/>
<br/>
<br/>
<br/>

    
     <logic:notEmpty 	name="component" property="alternativeSite" >	
            <h2><bean:message key="message.siteAddress" /></h2>
            <bean:define id="alternativeSite" name="component" property="alternativeSite"/>
            <html:link href="<%=(String)pageContext.findAttribute("alternativeSite") %>" target="_blank">
			<bean:write name="alternativeSite" />
            </html:link>
			<br/>
			<br/>
		
	</logic:notEmpty>			

   
     <logic:notEmpty name="component" property="introduction">
     	
        <h2><bean:message key="message.introduction" /></h2>
          <p><bean:write name="component" property="introduction" filter="false" /></p>
         <br/>
        <br/>
      </logic:notEmpty>
	
	
        <table>
            
        <logic:notEmpty name="component" property="responsibleTeachers">	
	
           
                <tr>
            	<td>
            		<h2><bean:message key="label.lecturingTeachers"/></h2>	
            	</td>
                </tr>	

            <logic:iterate id="infoResponsableTeacher" name="component" property="responsibleTeachers">
            	<tr>
            	<td>
				<bean:write name="infoResponsableTeacher" property="infoPerson.nome" /> <bean:message key="label.responsible"/>
                </td>
                </tr>
            </logic:iterate>	
        </logic:notEmpty>
        <logic:notEmpty name="component" property="lecturingTeachers" >	
             
            <logic:empty name="component" property="responsibleTeachers">	
	            
               
                <tr>
                <td>
                <h2><bean:message key="label.lecturingTeachers"/></h2>	
                </td>
                </tr>	
             </logic:empty>
            <logic:iterate id="infoTeacher" name="component" property="lecturingTeachers">
                <tr>
                <td>
				<bean:write name="infoTeacher" property="infoPerson.nome" /> 
                </td>
                </tr>
            </logic:iterate>	

        </logic:notEmpty>
     
         </table>
       
    </logic:notEmpty> 
   </logic:present>
</logic:present>