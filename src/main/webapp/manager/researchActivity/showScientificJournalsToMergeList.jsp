<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html:xhtml/>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://fenix-ashes.ist.utl.pt/fenix-renderers" prefix="fr" %>


<h2><bean:message key="title.scientificJournal.merge" bundle="SCIENTIFIC_COUNCIL_RESOURCES"/></h2>

<div class="infoop2">
	<p><bean:message key="label.merge.scientific.journal.instructions" bundle="SCIENTIFIC_COUNCIL_RESOURCES"/></p>
</div>

<p class="mtop2 mbottom05"><strong><bean:message key="label.merge.scientific.journal.selected" bundle="SCIENTIFIC_COUNCIL_RESOURCES"/>:</strong></p>
<fr:form action="/mergeScientificJournal.do?method=chooseScientificJournal">
	<fr:edit id="mergeList" name="mergeList" 
		type="net.sourceforge.fenixedu.dataTransferObject.PageContainerBean">
		<fr:layout name="pages">
			<fr:property name="classes" value="tstyle1 mtop05"/>
			<fr:property name="paged" value="false"/>
			<fr:property name="subSchema" value="scientific.journal.merge.list.full"/>
			<fr:property name="buttonLabel" value="button.researchActivity.choose"/>
			<fr:property name="bundle" value="SCIENTIFIC_COUNCIL_RESOURCES"/>
		</fr:layout>
	</fr:edit>
</fr:form>


<p class="mtop15 mbottom05"><strong><bean:message key="label.merge.scientific.journal.new.details" bundle="SCIENTIFIC_COUNCIL_RESOURCES"/>:</strong></p>
<div class="forminline dinline">
	<fr:form action="/mergeScientificJournal.do">
		<html:hidden property="method" value="mergeResearchActivity"/>
		<fr:edit schema="scientific.journal.new.properties" id="researchActivity" name="mergeList" type="net.sourceforge.fenixedu.dataTransferObject.MergeResearchActivityPageContainerBean">
			<fr:destination name="invalid" path="/mergeScientificJournal.do?method=invalid"/>
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle5 thlight thright thmiddle mtop05"/>
				<fr:property name="columnClasses" value=",,tdclear tderror1"/>
			</fr:layout>
		</fr:edit>
		<html:submit><bean:message key="submit" bundle="SCIENTIFIC_COUNCIL_RESOURCES"/></html:submit>
	</fr:form>
	<fr:form action="/mergeScientificJournal.do?method=back">
		<fr:edit id="mergeListNotVisible" name="mergeList" visible="false"/>
		<html:submit><bean:message key="return" bundle="SCIENTIFIC_COUNCIL_RESOURCES"/></html:submit>
	</fr:form>
</div>