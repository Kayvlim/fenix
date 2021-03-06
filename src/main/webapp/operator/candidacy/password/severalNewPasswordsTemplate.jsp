<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%@page import="net.sourceforge.fenixedu.util.FenixConfigurationManager"%>
<html:html xhtml="true">
<head>
	<title>Nova Password</title>
</head>

<!-- TODO: cleanup page: done at 1h44 a.m. -->
<body>
    
    <logic:iterate id="passwordBean" name="passwordBeans">
    <table width="100%" height="100%" border="0">
    <tr height="30"><td>
     <table width="100%" border="0" valign="top">
      <tr> 
        <td height="100" colspan="2">
          <table border="0" width="100%" height="100" align="center" cellpadding="0" cellspacing="0">
            <tr> 
              <td width="50" height="100">
               <img src="<%= request.getContextPath() %>/masterDegreeAdministrativeOffice/guide/images/istlogo.gif" alt="<bean:message key="istlogo" arg0="<%=net.sourceforge.fenixedu.domain.organizationalStructure.Unit.getInstitutionName().getContent()%>" bundle="IMAGE_RESOURCES" />" width="50" height="104" border="0"/> 
              </td>
              <td>
                &nbsp;
              </td>
              <td>
                <table border="0" width="100%" height="100%">
                  <tr valign="top" align="left"> 
                    <td>&nbsp;<b><bean:message key="institution.nameUpperCase" bundle="GLOBAL_RESOURCES"/></b><br/>
                      &nbsp;<b>Centro de Informática do <%=net.sourceforge.fenixedu.domain.organizationalStructure.Unit.getInstitutionName()%></b><br/>
                      <hr size="1">
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
	</table>

	</td>
	</tr>
    <tr valign="top"><td>

	<table width="100%" border="0">
	 <tr>
	 <td>
      <table width="100%" border="0">
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td> <bean:message bundle="MANAGER_RESOURCES" key="label.masterDegree.administrativeOffice.requesterName"/> </td>
            <td> <bean:write name="passwordBean" property="person.name"/> </td>
          </tr>
          <tr>
            <td> <bean:message bundle="MANAGER_RESOURCES" key="label.candidate.identificationDocumentType"/> </td>
            <td> 
            	<bean:define id="idType" name="passwordBean" property="person.idDocumentType"/>
            	<bean:message bundle="MANAGER_RESOURCES" key='<%=idType.toString()%>' bundle="ENUMERATION_RESOURCES"/> 
            </td>
          </tr>
          <tr>
            <td> <bean:message bundle="MANAGER_RESOURCES" key="label.candidate.identificationDocumentNumber"/> </td>
            <td> <bean:write name="passwordBean" property="person.documentIdNumber"/> </td>
          </tr>
          
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
       
          <tr>
            <td width="40%"><strong><bean:message  key="label.operator.candidacy.system.access"/>:</strong></td>
            <td width="60%">&nbsp;</td>
          </tr>
          <tr>
            <td> <bean:message bundle="MANAGER_RESOURCES" key="label.candidate.username"/> </td>
            <td> 
            	<logic:present name="passwordBean" property="person.istUsername">
            		<bean:write name="passwordBean" property="person.istUsername"/>
            	</logic:present>
            	<logic:notPresent name="passwordBean" property="person.istUsername">
            		<bean:write name="passwordBean" property="person.username"/>
            	</logic:notPresent>
            </td>
          </tr>          
	      <tr>
	        <td> <bean:message bundle="MANAGER_RESOURCES" key="label.candidate.password"/> </td>
	        <td> <font face="Verdana"><bean:write name="passwordBean" property="password"/> </font></td>
	      </tr>
          
          <tr>
            <td> <bean:message bundle="MANAGER_RESOURCES" key="label.candidate.accessAddress"/> </td>
            <td> <%= FenixConfigurationManager.getConfiguration().getLoginPage() %> </td>
          </tr>

          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          
	  </table>

	 </td>
	 </tr>
	</table>
	</td>
	</tr>




	<tr height="30">
	<td>

    <table width="100%" border="0">
     <tr>	 
	 <td>
	 	<table align="center" width="100%" valign="bottom">
	      <tr>
          <td colspan="2" valign="bottom" >
            <div align="center">
              <font size="2"> Documento processado por computador.</font> 
            </div>
            <hr size="1" color="#000000" width="100%">
            <div align="center">
              <font size="2"> Av. Rovisco Pais, 1 1049-001 Lisboa Codex Telefone: 218417336 Fax: 218419531 Contribuinte Nº: 501507930</font>
            </div>
          </td>
          </tr>
        </table>
     </td>	 
	 </tr>
	</table>

    </td>
    </tr>
    </table>
    </logic:iterate>
    </body>
</html:html>
