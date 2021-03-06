<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<bean:define id="institutionUrl" type="java.lang.String"><%= net.sourceforge.fenixedu.domain.Instalation.getInstance().getInstituitionURL() %></bean:define>
<bean:define id="institutionUrlStudents" type="java.lang.String"><%= net.sourceforge.fenixedu.domain.Instalation.getInstance().getInstituitionURL() %>pt/alunos/</bean:define>
<bean:define id="institutionUrlTeachers" type="java.lang.String"><%= net.sourceforge.fenixedu.domain.Instalation.getInstance().getInstituitionURL() %>pt/docentes/</bean:define>
<bean:define id="institutionUrlEmployees" type="java.lang.String"><%= net.sourceforge.fenixedu.domain.Instalation.getInstance().getInstituitionURL() %>pt/pessoal/</bean:define>
<bean:define id="institutionUrlCandidates" type="java.lang.String"><%= net.sourceforge.fenixedu.domain.Instalation.getInstance().getInstituitionURL() %>pt/candidatos/</bean:define>
<bean:define id="institutionUrlInternational" type="java.lang.String"><%= net.sourceforge.fenixedu.domain.Instalation.getInstance().getInstituitionURL() %>en/</bean:define>
<bean:define id="institutionUrlAlumni" type="java.lang.String"><%= net.sourceforge.fenixedu.domain.Instalation.getInstance().getInstituitionURL() %>pt/alumni/</bean:define>

<ul>
	<li><a href="<%= institutionUrl %>">In&iacute;cio</a></li>
  	<li><a href="<%= institutionUrlStudents %>">Aluno</a></li>
  	<li><a href="<%= institutionUrlTeachers %>">Docente</a></li>
	<li><a href="<%= institutionUrlEmployees %>">N&atilde;o Docente</a></li>
	<li><a href="<%= institutionUrlCandidates %>">Candidato</a></li>	
  	<li><a href="<%= institutionUrlInternational %>">International</a></li>
  	<li><a href="<%= institutionUrlAlumni %>">Alumni</a></li>
</ul>