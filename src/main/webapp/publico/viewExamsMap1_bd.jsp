<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %><%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %><html:xhtml/><%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %><%@ taglib uri="http://jakarta.apache.org/taglibs/struts-example-1.0" prefix="app" %><%@ page import="net.sourceforge.fenixedu.presentationTier.Action.resourceAllocationManager.utils.PresentationConstants" %><%@ page import="net.sourceforge.fenixedu.domain.degree.DegreeType" %><bean:define id="institutionUrl" type="java.lang.String"><%= net.sourceforge.fenixedu.domain.Instalation.getInstance().getInstituitionURL() %></bean:define>
<div class="breadcumbs mvert0">
	<a href="<%= institutionUrl %>"><%=net.sourceforge.fenixedu.domain.organizationalStructure.Unit.getInstitutionAcronym()%></a>
	<bean:define id="institutionUrlTeaching" type="java.lang.String"><%= net.sourceforge.fenixedu.domain.Instalation.getInstance().getInstituitionURL() %><bean:message key="link.institution" bundle="GLOBAL_RESOURCES"/></bean:define>
	&nbsp;&gt;&nbsp;
	<a href="<%=institutionUrlTeaching%>"><bean:message  bundle="PUBLIC_DEGREE_INFORMATION" key="public.degree.information.label.education"/></a>
	<logic:present name="degree">
		&nbsp;&gt;&nbsp;
		<html:link page="<%= "/showDegreeSite.do?method=showDescription&amp;degreeID=" + request.getAttribute("degreeID").toString() %>"><bean:write name="degree" property="sigla"/></html:link>
		<logic:present name="infoDegreeCurricularPlan" >
			&nbsp;&gt;&nbsp;
			<html:link page="<%= "/showDegreeSite.do?method=showCurricularPlan&amp;degreeID=" + request.getAttribute("degreeID").toString() + "&amp;degreeCurricularPlanID=" + pageContext.findAttribute("degreeCurricularPlanID").toString()+ "&amp;executionPeriodOID=" + request.getAttribute(PresentationConstants.EXECUTION_PERIOD_OID)  %>" ><bean:write name="infoDegreeCurricularPlan" property="name" /></html:link>
			&nbsp;&gt;&nbsp;
			<bean:message  key="public.degree.information.label.exams" bundle="PUBLIC_DEGREE_INFORMATION" />
		</logic:present>
	</logic:present>
</div>

<!-- COURSE NAME -->
<h1>	<logic:notEmpty name="degree" property="phdProgram">		<bean:write name="degree" property="phdProgram.presentationName"/>	</logic:notEmpty>	<logic:empty name="degree" property="phdProgram">		<bean:write name="degree" property="presentationName"/>	</logic:empty></h1>

<logic:notPresent name="infoDegreeCurricularPlan" >
	<p><em><bean:message bundle="DEFAULT" key="error.impossibleExecutionDegreeList" arg0="<%=net.sourceforge.fenixedu.domain.organizationalStructure.Unit.getInstitutionAcronym()%>"/></em></p>
</logic:notPresent>

<logic:present name="infoDegreeCurricularPlan" >

	<!-- CURRICULAR PLAN -->
	<h2 class="greytxt">
		<bean:message key="public.degree.information.label.curricularPlan"  bundle="PUBLIC_DEGREE_INFORMATION" />
		<bean:write name="infoDegreeCurricularPlan" property="name"/>
		<logic:notEmpty name="infoDegreeCurricularPlan" property="initialDate">
			<logic:empty name="infoDegreeCurricularPlan" property="endDate">
				(<bean:message bundle="PUBLIC_DEGREE_INFORMATION"  key="public.degree.information.label.since" />
				<bean:define id="initialDate" name="infoDegreeCurricularPlan" property="initialDate" />
				<%= initialDate.toString().substring(initialDate.toString().lastIndexOf(" ")+1) %>)
			</logic:empty>
			<logic:notEmpty name="infoDegreeCurricularPlan" property="endDate">
				(<bean:message bundle="PUBLIC_DEGREE_INFORMATION"  key="public.degree.information.label.of" />
				<bean:define id="initialDate" name="infoDegreeCurricularPlan" property="initialDate" />
				<%= initialDate.toString().substring(initialDate.toString().lastIndexOf(" ")+1) %>
				<bean:message bundle="PUBLIC_DEGREE_INFORMATION"  key="public.degree.information.label.to" />
				<bean:define id="endDate" name="infoDegreeCurricularPlan" property="endDate" />	
				<%= endDate.toString().substring(endDate.toString().lastIndexOf(" ")) %>)
			</logic:notEmpty>
		</logic:notEmpty>	
	</h2>

	<h2 class="arrow_bullet">
		<bean:message bundle="PUBLIC_DEGREE_INFORMATION" key="public.degree.information.label.exams" />
	</h2>

	<logic:notPresent name="lista" scope="request">
		<p><em><bean:message bundle="DEFAULT" key="error.curricularPlanHasNoExecutionDegreesInNotClosedYears" arg0="<%=net.sourceforge.fenixedu.domain.organizationalStructure.Unit.getInstitutionAcronym()%>"/></em></p>
	</logic:notPresent>
	<logic:present name="lista" scope="request">
		<bean:define id="listaNew" name="lista" />
		<html:form action="/chooseExamsMapContextDANew.do" method="get">
			<html:hidden bundle="HTMLALT_RESOURCES" altKey="<%="hidden." + PresentationConstants.EXECUTION_PERIOD_OID%>" property="<%=PresentationConstants.EXECUTION_PERIOD_OID%>" value="<%= ""+request.getAttribute(PresentationConstants.EXECUTION_PERIOD_OID)%>" />
			<html:hidden bundle="HTMLALT_RESOURCES" altKey="hidden.page" property="page" value="1"/>
			<html:hidden bundle="HTMLALT_RESOURCES" altKey="hidden.method" property="method" value="choose"/>
			<html:hidden bundle="HTMLALT_RESOURCES" altKey="hidden.degreeID" property="degreeID" value="<%= ""+request.getAttribute("degreeID")%>" />
			<html:hidden bundle="HTMLALT_RESOURCES" altKey="hidden.degreeCurricularPlanID" property="degreeCurricularPlanID" value="<%= pageContext.findAttribute("degreeCurricularPlanID").toString()%>" />
			<html:hidden bundle="HTMLALT_RESOURCES" altKey="hidden.lista" property="lista" value="<%= pageContext.findAttribute("listaNew").toString()%>" />
			
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
				    <td><bean:message bundle="PUBLIC_DEGREE_INFORMATION" key="public.degree.information.property.executionPeriod"/>:</td>
				    <td>
						<html:select bundle="HTMLALT_RESOURCES" property="indice" size="1" onchange="this.form.submit();">
							<html:options property="value" labelProperty="label" collection="lista"/>
						</html:select>
				    </td>
				    <td>
						<html:submit styleId="javascriptButtonID" styleClass="altJavaScriptSubmitButton" bundle="HTMLALT_RESOURCES" altKey="submit.submit">
							<bean:message key="button.submit"/>
						</html:submit>
					</td>
				</tr>
			</table>
		</html:form>

		<logic:notPresent name="<%=PresentationConstants.INFO_EXAMS_MAP%>">
			<p><em><bean:message bundle="DEFAULT" key="error.curricularPlanHasNoExecutionDegreesInGivenPeriod" arg0="<%=net.sourceforge.fenixedu.domain.organizationalStructure.Unit.getInstitutionAcronym()%>"/></em></p>
		</logic:notPresent>
		<logic:present name="<%=PresentationConstants.INFO_EXAMS_MAP%>">
			<div>
				<app:generateNewExamsMap name="<%= PresentationConstants.INFO_EXAMS_MAP %>" user="public" mapType=" "/>
			</div>
		</logic:present>
	</logic:present>

</logic:present>
