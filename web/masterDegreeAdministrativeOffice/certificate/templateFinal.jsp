<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="net.sourceforge.fenixedu.presentationTier.Action.resourceAllocationManager.utils.PresentationConstants" %>
<br />
<br />
<div align="right" style="margin-right: 100px; color: #000;">Dr. Nuno Riscado</div>
<div align="right" style="margin-right: 100px; color: #000;">(Coordenador do Núcleo de Pós-Graduação e Formação Contínua)</div>
<br />
<p><bean:write name="<%= PresentationConstants.DATE %>" /></p>