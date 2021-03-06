<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://fenix-ashes.ist.utl.pt/fenix-renderers" prefix="fr" %>
<html:xhtml/>

<em><bean:message key="label.teacherPortal" bundle="APPLICATION_RESOURCES"/></em>
<h2><bean:message key="see.specified.rooms.reserve.title" bundle="APPLICATION_RESOURCES"/></h2>
<bean:define id="isTeacher" value="<%= new Boolean(net.sourceforge.fenixedu.injectionCode.AccessControl.getPerson().hasAnyProfessorships()).toString() %>" />


<logic:equal name="isTeacher" value="true">
	<logic:messagesPresent message="true">
		<p>
			<span class="error0"><!-- Error messages go here -->
				<html:messages id="message" message="true" bundle="APPLICATION_RESOURCES">
					<bean:write name="message"/>
				</html:messages>
			</span>
		</p>
	</logic:messagesPresent>	
		
	<logic:notEmpty name="roomsReserveBean">
	
		<bean:define id="punctualRequest" name="roomsReserveBean" property="reserveRequest" />	
		<bean:define id="currentStateName" name="punctualRequest" property="currentState.name" />
		<ul>
			<li>
				<html:link page="/roomsReserveManagement.do?method=viewReserves">		
					<bean:message bundle="APPLICATION_RESOURCES" key="label.return"/>
				</html:link>
			</li>
			<logic:equal name="currentStateName" value="NEW">
				<li>
					<bean:define id="prepareEditURL">/roomsReserveManagement.do?method=prepareEdit&punctualReserveID=<bean:write name="punctualRequest" property="externalId"/></bean:define>
					<html:link page="<%= prepareEditURL %>">		
						<bean:message bundle="APPLICATION_RESOURCES" key="label.edit.rooms.reserve.request"/>
					</html:link>
				</li>
			</logic:equal>
		</ul>
		
		<table class="tstyle1 thlight thright">			
			<tr>
				<th><bean:message key="label.rooms.reserve.order" bundle="APPLICATION_RESOURCES"/>:</th>
				<td><fr:view name="punctualRequest" property="subject" /></td>				
			</tr>	
			<tr>
				<th><bean:message key="label.rooms.reserve.state" bundle="APPLICATION_RESOURCES"/>:</th>
				<td><span class="highlight1"><bean:message name="currentStateName" bundle="APPLICATION_RESOURCES"/></span></td>
			</tr>
			<tr>
				<th><bean:message key="label.rooms.reserve.periods" bundle="APPLICATION_RESOURCES"/>:</th>	
				<td>					
					<logic:notEmpty name="punctualRequest" property="genericEvents">
						<ul class="list6 nobullet">
							<logic:iterate id="genericEvent" name="punctualRequest" property="genericEvents">
								<li>
									<bean:write name="genericEvent" property="ganttDiagramEventPeriod"/>
									-
									<bean:write name="genericEvent" property="ganttDiagramEventObservations"/>
								</li>
							</logic:iterate>
						</ul>
					</logic:notEmpty>
					<logic:empty name="punctualRequest" property="genericEvents">
						-
					</logic:empty>
				</td>						
			</tr>
			<tr>
				<th><bean:message key="label.find.spaces.campus" bundle="APPLICATION_RESOURCES"/></th>
				<logic:notEmpty name="punctualRequest" property="campus">
					<td><fr:view name="punctualRequest" property="campus.spaceInformation.presentationName"/></td>
				</logic:notEmpty>
				<logic:empty name="punctualRequest" property="campus">
					<td>-</td>
				</logic:empty>
			</tr>	
			<tr>
				<th><bean:message key="label.rooms.reserve.description" bundle="APPLICATION_RESOURCES"/>:</th>
				<td><fr:view name="punctualRequest" property="description"/></td>
			</tr>													
		</table>
		
		<bean:define id="comments" name="punctualRequest" property="commentsWithoutFirstCommentOrderByDate" />
		<logic:empty name="comments">
			<p class="mtop1 mbottom15">
				<em><bean:message key="label.rooms.reserve.empty.comments" bundle="APPLICATION_RESOURCES"/></em>		
			</p>
		</logic:empty>
		<logic:notEmpty name="comments">
			<bean:define id="punctualRequestObject" name="punctualRequest" type="net.sourceforge.fenixedu.domain.PunctualRoomsOccupationRequest" />
			<logic:iterate id="comment" name="comments" type="net.sourceforge.fenixedu.domain.PunctualRoomsOccupationComment">
				
				<%
					if(punctualRequestObject.getRequestor().equals(comment.getOwner())) {
				%>					
					<div style="border: 1px solid #ddc; padding: 0.5em; background: #fafaea;" class="mtop15">			
						<p class="color888 mvert025"><bean:write name="comment" property="presentationInstant"/></p>
						<p class="mvert025"><strong><bean:write name="comment" property="owner.name"/> (<bean:write name="comment" property="owner.username"/>)</strong></p>
						<p class="mvert025"><fr:view name="comment" property="description"/></p>
						<logic:notEmpty name="comment" property="state">
							<logic:equal name="comment" property="state.name" value="RESOLVED">
								<p class="mvert05"><strong><bean:message key="label.rooms.reserve.resolved" bundle="SOP_RESOURCES"/></strong></p>		
							</logic:equal>
						</logic:notEmpty>		
					</div>
				<%
					} else {
				%>								
					<div style="border: 1px solid #ddd; padding: 0.5em; background: #fafafa;" class="mtop15">			
						<p class="color888 mvert025"><bean:write name="comment" property="presentationInstant"/></p>
						<p class="mvert025"><strong><bean:write name="comment" property="owner.name"/> (<bean:write name="comment" property="owner.username"/>)</strong></p>
						<p class="mvert025"><fr:view name="comment" property="description"/></p>
						<logic:notEmpty name="comment" property="state">
							<logic:equal name="comment" property="state.name" value="RESOLVED">
								<p class="mvert05"><strong><bean:message key="label.rooms.reserve.resolved" bundle="SOP_RESOURCES"/></strong></p>		
							</logic:equal>
						</logic:notEmpty>		
					</div>			
				<%
					}
				%>
						
			</logic:iterate>
		</logic:notEmpty>
				
		<logic:notEqual name="currentStateName" value="NEW">
		
			<logic:equal name="currentStateName" value="RESOLVED">
				<div class="infoop2 mtop15">
					<p><bean:message key="label.rooms.reserve.teacher.reopen.instructions" bundle="APPLICATION_RESOURCES"/></p>
				</div>
			</logic:equal>
		
			<p class="mtop15 mbottom05"><bean:message key="label.rooms.reserve.new.comment" bundle="APPLICATION_RESOURCES"/>:</p>
			<fr:form action="/roomsReserveManagement.do">
				<html:hidden property="method" value="createNewComment"/>
				<bean:define id="seeReserveURL">/roomsReserveManagement.do?method=seeSpecifiedRoomsReserve&amp;punctualReserveID=<bean:write name="punctualRequest" property="externalId"/></bean:define>
	
				<fr:hasMessages for="roomsReserveNewComment">
					<p>
						<span class="error0">			
							<fr:message for="roomsReserveNewComment" show="message"/>
						</span>
					</p>
				</fr:hasMessages>
				
				<bean:define id="seeReserveURL">/roomsReserveManagement.do?method=seeSpecifiedRoomsReserve&punctualReserveID=<bean:write name="punctualRequest" property="externalId"/></bean:define>
				<fr:edit id="roomsReserveNewComment" name="roomsReserveBean" slot="description" 
					validator="net.sourceforge.fenixedu.presentationTier.renderers.validators.RequiredMultiLanguageStringValidator"
					type="net.sourceforge.fenixedu.dataTransferObject.teacher.RoomsReserveBean">
					<fr:edit name="roomsReserveBean" id="roomsReserveBeanWithNewComment" nested="true" visible="false"/>
					<fr:layout name="area">
						<fr:property name="rows" value="6" />
						<fr:property name="columns" value="55"/>										
					</fr:layout>
					<fr:destination name="input" path="<%= seeReserveURL %>"/>
				</fr:edit>		
				
				<p>
				<html:submit><bean:message key="label.submit" bundle="APPLICATION_RESOURCES"/></html:submit>
				<logic:equal name="currentStateName" value="RESOLVED">
					<html:submit onclick="this.form.method.value='createNewCommentAndReOpenRequest';this.form.sumit();">
						<bean:message key="label.submit.and.reopen" bundle="APPLICATION_RESOURCES"/>
					</html:submit>
				</logic:equal>			
				</p>
			</fr:form>
			
			<logic:notEmpty name="punctualRequest" property="genericEvents">
				<jsp:include page="../../resourceAllocationManager/roomsPunctualScheduling/legend.jsp" />
			</logic:notEmpty>
					
		</logic:notEqual>
		
	</logic:notEmpty>

</logic:equal>

