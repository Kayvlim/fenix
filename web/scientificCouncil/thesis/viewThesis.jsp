<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>

<bean:define id="thesisId" name="thesis" property="idInternal"/>
<bean:define id="degreeId" name="degreeId"/>
<bean:define id="executionYearId" name="executionYearId"/>

<html:xhtml/>

<em><bean:message key="scientificCouncil.thesis.process" /></em>
<h2><bean:message key="title.scientificCouncil.thesis.evaluated.view"/></h2>

<ul>
	<logic:notEmpty name="degreeId"><logic:notEmpty name="executionYearId">
    <li>
		<bean:define id="url">/scientificCouncilManageThesis.do?method=listScientificComission&amp;degreeId=<bean:write name="degreeId"/>&amp;executionYearId=<bean:write name="executionYearId"/></bean:define>
		<html:link page="<%= url %>">
			<bean:message key="link.list.scientific.comission"/>
		</html:link>
    </li>
    </logic:notEmpty></logic:notEmpty>
    <li>
        <html:link page="/scientificCouncilManageThesis.do?method=listThesis">
            <bean:message key="link.scientificCouncil.thesis.list.back"/>
        </html:link>
    </li>
	<logic:present name="thesis" property="dissertation">
		<logic:present name="containsThesisFileReadersGroup">
    		<li>
				<bean:define id="url">/scientificCouncilManageThesis.do?method=showMakeDocumentUnavailablePage&amp;degreeId=<bean:write name="degreeId"/>&amp;executionYearId=<bean:write name="executionYearId"/>&amp;thesisID=<bean:write name="thesisId"/></bean:define>
				<html:link page="<%= url %>">
					<bean:message key="link.thesis.make.documents.unavailable"/>
				</html:link>
    		</li>
    	</logic:present>
		<logic:notPresent name="containsThesisFileReadersGroup">
    		<li>
				<bean:define id="url">/scientificCouncilManageThesis.do?method=showMakeDocumentsAvailablePage&amp;degreeId=<bean:write name="degreeId"/>&amp;executionYearId=<bean:write name="executionYearId"/>&amp;thesisID=<bean:write name="thesisId"/></bean:define>
				<html:link page="<%= url %>">
					<bean:message key="link.thesis.make.documents.available"/>
				</html:link>
    		</li>
    		<li>
				<bean:define id="url">/scientificCouncilManageThesis.do?method=showSubstituteDocumentsPage&amp;degreeId=<bean:write name="degreeId"/>&amp;executionYearId=<bean:write name="executionYearId"/>&amp;thesisID=<bean:write name="thesisId"/></bean:define>
				<html:link page="<%= url %>">
					<bean:message key="link.thesis.substitute.documents"/>
				</html:link>
    		</li>
    		<li>
				<bean:define id="url">/scientificCouncilManageThesis.do?method=showSubstituteExtendedAbstractPage&amp;degreeId=<bean:write name="degreeId"/>&amp;executionYearId=<bean:write name="executionYearId"/>&amp;thesisID=<bean:write name="thesisId"/></bean:define>
				<html:link page="<%= url %>">
					<bean:message key="link.thesis.substitute.extended.abstract"/>
				</html:link>
    		</li>
    	</logic:notPresent>
    </logic:present>
</ul>

<%-- Approve proposal --%>
<logic:present name="showMakeDocumentUnavailablePage">
    <div class="warning0" style="padding: 1em;">
        <strong><bean:message key="label.attention" bundle="APPLICATION_RESOURCES"/>:</strong><br/>
        <bean:message key="message.thesis.make.documents.unavailable"/>
        <div class="mtop1 forminline">
        <fr:form action="<%= String.format("/scientificCouncilManageThesis.do?method=makeDocumentUnavailablePage&amp;&amp;thesisID=%s&amp;degreeID=%s&amp;executionYearID=%s", thesisId, degreeId, executionYearId) %>">
                <html:submit>
                    <bean:message key="button.scientificCouncil.thesis.documents.make.unavailable"/>
                </html:submit>
            </fr:form>
        <fr:form action="<%= String.format("/scientificCouncilManageThesis.do?method=viewThesis&amp;&amp;thesisID=%s&amp;degreeID=%s&amp;executionYearID=%s", thesisId, degreeId, executionYearId) %>">
                <html:cancel>
                    <bean:message key="button.cancel"/>
                </html:cancel>
            </fr:form>
        </div>
    </div>
</logic:present>
<logic:present name="showMakeDocumentsAvailablePage">
    <div class="warning0" style="padding: 1em;">
        <strong><bean:message key="label.attention" bundle="APPLICATION_RESOURCES"/>:</strong><br/>
        <bean:message key="message.thesis.make.documents.available"/>
        <div class="mtop1 forminline">
        <fr:form action="<%= String.format("/scientificCouncilManageThesis.do?method=makeDocumentAvailablePage&amp;&amp;thesisID=%s&amp;degreeID=%s&amp;executionYearID=%s", thesisId, degreeId, executionYearId) %>">
                <html:submit>
                    <bean:message key="button.scientificCouncil.thesis.documents.make.available"/>
                </html:submit>
            </fr:form>
        <fr:form action="<%= String.format("/scientificCouncilManageThesis.do?method=viewThesis&amp;&amp;thesisID=%s&amp;degreeID=%s&amp;executionYearID=%s", thesisId, degreeId, executionYearId) %>">
                <html:cancel>
                    <bean:message key="button.cancel"/>
                </html:cancel>
            </fr:form>
        </div>
    </div>
</logic:present>
<logic:present name="showSubstituteDocumentsPage">
	<div class="infoop2 mvert15">
    	<p>
        	<bean:message key="label.student.thesis.upload.dissertation.message"/>
    	</p>
	</div>

	<fr:form encoding="multipart/form-data" action="<%= String.format("/scientificCouncilManageThesis.do?method=substituteDocuments&amp;&amp;thesisID=%s&amp;degreeID=%s&amp;executionYearID=%s", thesisId, degreeId, executionYearId) %>">
    	<fr:edit id="dissertationFile" name="fileBean" schema="student.thesisBean.upload.dissertation">
        	<fr:layout name="tabular">
            	<fr:property name="classes" value="tstyle5 tdtop thlight thright thmiddle"/>
            	<fr:property name="columnClasses" value=",,tdclear tderror1"/>
        	</fr:layout>
        
    	    <fr:destination name="cancel" path="<%= String.format("/scientificCouncilManageThesis.do?method=viewThesis&amp;&amp;thesisID=%s&amp;degreeID=%s&amp;executionYearID=%s", thesisId, degreeId, executionYearId) %>"/>
    	</fr:edit>
    
	    <html:submit>
    	    <bean:message key="button.submit"/>
    	</html:submit>
    	<html:cancel>
	        <bean:message key="button.cancel"/>
	    </html:cancel>
	</fr:form>
</logic:present>
<logic:present name="showSubstituteExtendedAbstractPage">
	<div class="infoop2 mvert15">
    	<p>
        	<bean:message key="label.student.thesis.upload.extended.abstract.message"/>
    	</p>
	</div>

	<fr:form encoding="multipart/form-data" action="<%= String.format("/scientificCouncilManageThesis.do?method=substituteExtendedAbstract&amp;&amp;thesisID=%s&amp;degreeID=%s&amp;executionYearID=%s", thesisId, degreeId, executionYearId) %>">
    	<fr:edit id="extendedAbstractFile" name="fileBean" schema="student.thesisBean.upload">
        	<fr:layout name="tabular">
            	<fr:property name="classes" value="tstyle5 tdtop thlight thright thmiddle"/>
            	<fr:property name="columnClasses" value=",,tdclear tderror1"/>
        	</fr:layout>
        
    	    <fr:destination name="cancel" path="<%= String.format("/scientificCouncilManageThesis.do?method=viewThesis&amp;&amp;thesisID=%s&amp;degreeID=%s&amp;executionYearID=%s", thesisId, degreeId, executionYearId) %>"/>
    	</fr:edit>
    
	    <html:submit>
    	    <bean:message key="button.submit"/>
    	</html:submit>
    	<html:cancel>
	        <bean:message key="button.cancel"/>
	    </html:cancel>
	</fr:form>
</logic:present>


<%-- Dissertation --%>

<h3 class="mtop15 mbottom05"><bean:message key="title.scientificCouncil.thesis.evaluation.details"/></h3>

<fr:view name="thesis" schema="thesis.jury.proposal.information">
    <fr:layout name="tabular">
    		<fr:property name="classes" value="tstyle2 thlight thright mtop05 mbottom05"/>
    		<fr:property name="columnClasses" value="width12em,,"/>
    </fr:layout>
</fr:view>

<%-- general process information --%>
<div class="infoop2 mtop1">
	<bean:define id="stateKey" type="java.lang.String">ThesisPresentationState.<bean:write name="thesisPresentationState" property="name"/>.label</bean:define>
	<p class="mvert0">
		<strong><bean:message bundle="APPLICATION_RESOURCES" key="<%= stateKey %>"/></strong>
	</p>
</div>

<h3 class="mtop15 mbottom05"><bean:message key="label.thesis.abstract"/></h3>

<logic:notEqual name="thesis" property="thesisAbstractInBothLanguages" value="true">
    <bean:message key="label.thesis.abstract.empty"/>
</logic:notEqual>

<logic:equal name="thesis" property="thesisAbstractInBothLanguages" value="true">
    <div style="border: 1px solid #ddd; background: #fafafa; padding: 0.5em; margin-bottom: 1em;">
        <fr:view name="thesis" property="thesisAbstract">
            <fr:layout>
                <fr:property name="language" value="pt"/>
                <fr:property name="showLanguageForced" value="true"/>
            </fr:layout>
        </fr:view>
    </div>

    <div style="border: 1px solid #ddd; background: #fafafa; padding: 0.5em; margin-bottom: 1em;">
		<fr:view name="thesis" property="thesisAbstract">
			<fr:layout>
				<fr:property name="language" value="en"/>
				<fr:property name="showLanguageForced" value="true"/>
			</fr:layout>
		</fr:view>
	</div>
</logic:equal>

<h3 class="mtop15 mbottom05"><bean:message key="label.thesis.keywords"/></h3>

<logic:notEqual name="thesis" property="keywordsInBothLanguages" value="true">
	<p>
		<em><bean:message key="label.thesis.keywords.empty"/></em>
    </p>
</logic:notEqual>

<logic:equal name="thesis" property="keywordsInBothLanguages" value="true">
    <p>
        <fr:view name="thesis" property="keywords">
            <fr:layout>
                <fr:property name="language" value="pt"/>
                <fr:property name="showLanguageForced" value="true"/>
            </fr:layout>
        </fr:view>
    </p>
    
    <p>
        <fr:view name="thesis" property="keywords">
            <fr:layout>
                <fr:property name="language" value="en"/>
                <fr:property name="showLanguageForced" value="true"/>
            </fr:layout>
        </fr:view>
    </p>
</logic:equal>

<h3 class="mtop15 mbottom05"><bean:message key="title.scientificCouncil.thesis.evaluation.extendedAbstract"/></h3>

<logic:empty name="thesis" property="extendedAbstract">
    <bean:message key="label.scientificCouncil.thesis.evaluation.noExtendedAbstract"/>
</logic:empty>

<logic:notEmpty name="thesis" property="extendedAbstract">
    <fr:view name="thesis" property="extendedAbstract" layout="values" schema="coordinator.thesis.file"/>
    (<fr:view name="thesis" property="extendedAbstract.size" layout="fileSize"/>)
</logic:notEmpty>

<h3 class="mtop15 mbottom05"><bean:message key="title.scientificCouncil.thesis.evaluation.dissertation"/></h3>

<logic:empty name="thesis" property="dissertation">
    <bean:message key="label.scientificCouncil.thesis.evaluation.noDissertation"/>
</logic:empty>

<logic:notEmpty name="thesis" property="dissertation">
    <fr:view name="thesis" property="dissertation" layout="values" schema="coordinator.thesis.file"/>
    (<fr:view name="thesis" property="dissertation.size" layout="fileSize"/>)
</logic:notEmpty>

<h3 class="mtop15 mbottom05"><bean:message key="title.scientificCouncil.thesis.evaluation.gradeAndDate"/></h3>

<fr:view name="thesis" schema="coordinator.thesis.revision.view">
    <fr:layout name="tabular">
    		<fr:property name="classes" value="tstyle2 thlight thright mtop05 mbottom05"/>
    		<fr:property name="columnClasses" value="width12em,,"/>
    </fr:layout>
</fr:view>

<%-- Jury --%>
<h3 class="separator2 mtop2"><bean:message key="title.scientificCouncil.thesis.review.section.jury"/></h3>

<%-- Orientation --%>
<h4 class="mtop25 mbottom05"><bean:message key="title.scientificCouncil.thesis.review.section.orientation"/></h4>

<logic:empty name="thesis" property="orientator">
    <logic:empty name="thesis" property="coorientator">
        <p>
            <em><bean:message key="title.scientificCouncil.thesis.review.orientation.empty"/></em>
        </p>
    </logic:empty>
</logic:empty>

<logic:notEmpty name="thesis" property="orientator">
    <fr:view name="thesis" property="orientator" layout="tabular" schema="thesis.jury.proposal.person.loginInfo">
        <fr:layout name="tabular">
            <fr:property name="classes" value="tstyle2 thlight thright mtop05 mbottom0"/>
            <fr:property name="columnClasses" value="width12em,width35em,"/>
        </fr:layout>
    </fr:view>
    <logic:equal name="thesis" property="orientatorCreditsDistributionNeeded" value="true">
        <table class="tstyle2 thlight thright mtop0 mbottom05 tgluetop">
            <tr>
                <th class="width12em"><bean:message key="label.scientificCouncil.thesis.edit.teacher.credits"/>:</th>
                <td class="width35em">
                    <logic:empty name="thesis" property="orientatorCreditsDistribution">-</logic:empty>
                    <logic:notEmpty name="thesis" property="orientatorCreditsDistribution">
                        <fr:view name="thesis" property="orientatorCreditsDistribution"/> %
                    </logic:notEmpty>
                </td>
            </tr>
        </table>
    </logic:equal>
</logic:notEmpty>
  
<logic:notEmpty name="thesis" property="coorientator">
    <fr:view name="thesis" property="coorientator" layout="tabular" schema="thesis.jury.proposal.person.loginInfo">
        <fr:layout name="tabular">
            <fr:property name="classes" value="tstyle2 thlight thright mtop05 mbottom0"/>
            <fr:property name="columnClasses" value="width12em,width35em,"/>
        </fr:layout>
    </fr:view>
    <logic:equal name="thesis" property="coorientatorCreditsDistributionNeeded" value="true">
        <table class="tstyle2 thlight thright mtop0 mbottom05 tgluetop">
            <tr>
                <th class="width12em"><bean:message key="label.scientificCouncil.thesis.edit.teacher.credits"/>:</th>
                <td class="width35em">
                    <logic:empty name="thesis" property="coorientatorCreditsDistribution">-</logic:empty>
                    <logic:notEmpty name="thesis" property="coorientatorCreditsDistribution">
                        <fr:view name="thesis" property="coorientatorCreditsDistribution"/> %
                    </logic:notEmpty>
                </td>
            </tr>
        </table>
    </logic:equal>
</logic:notEmpty>

<%-- Jury/President --%>
<h4 class="mtop2 mbottom05"><bean:message key="title.scientificCouncil.thesis.review.section.jury.president"/></h4>

<logic:empty name="thesis" property="president">
    <p>
        <bean:message key="title.scientificCouncil.thesis.review.president.empty"/>
    </p>
</logic:empty>

<logic:notEmpty name="thesis" property="president">
    <fr:view name="thesis" property="president" layout="tabular" schema="thesis.jury.proposal.person.loginInfo">
        <fr:layout name="tabular">
        		<fr:property name="classes" value="tstyle2 thlight thright mtop05 mbottom05"/>
        		<fr:property name="columnClasses" value="width12em,width35em,"/>
        </fr:layout>
    </fr:view>
</logic:notEmpty>

<%-- Jury/"Vowels" --%>
<h4 class="mtop2 mbottom05"><bean:message key="title.scientificCouncil.thesis.review.section.vowels"/></h4>

<logic:empty name="thesis" property="vowels">
    <p>
        <bean:message key="title.scientificCouncil.thesis.review.vowels.empty"/>
    </p>
</logic:empty>

<logic:notEmpty name="thesis" property="vowels">
    <logic:iterate id="vowel" name="thesis" property="vowels">
        <fr:view name="vowel" layout="tabular" schema="thesis.jury.proposal.person.loginInfo">
            <fr:layout name="tabular">
            		<fr:property name="classes" value="tstyle2 thlight thright mtop05 mbottom05"/>
            		<fr:property name="columnClasses" value="width12em,width35em,"/>
            </fr:layout>
        </fr:view>
    </logic:iterate>
</logic:notEmpty>
