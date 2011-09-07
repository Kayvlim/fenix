package net.sourceforge.fenixedu.domain.accounting.events;

import java.util.Set;

import net.sourceforge.fenixedu.dataTransferObject.accounting.AccountingTransactionDetailDTO;
import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.User;
import net.sourceforge.fenixedu.domain.accounting.Account;
import net.sourceforge.fenixedu.domain.accounting.AccountType;
import net.sourceforge.fenixedu.domain.accounting.EntryType;
import net.sourceforge.fenixedu.domain.accounting.Event;
import net.sourceforge.fenixedu.domain.accounting.EventType;
import net.sourceforge.fenixedu.domain.accounting.PaymentMode;
import net.sourceforge.fenixedu.domain.accounting.PostingRule;
import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import net.sourceforge.fenixedu.domain.organizationalStructure.Unit;
import net.sourceforge.fenixedu.util.Money;

import org.joda.time.DateTime;

import pt.ist.fenixWebFramework.services.Service;
import pt.utl.ist.fenix.tools.resources.LabelFormatter;

public class MicroPaymentEvent extends MicroPaymentEvent_Base {

    protected MicroPaymentEvent() {
	super();
    }

    protected MicroPaymentEvent(Person person, Unit destinationUnit, Money amount) {
	super();
	init(person, destinationUnit, amount);
    }

    protected void init(Person person, Unit destinationUnit, Money amount) {
	super.init(EventType.MICRO_PAYMENT, person);
	setAmount(amount);
	setDestinationUnit(destinationUnit);
	Set<? extends Event> affiliations = person.getEventsByEventType(EventType.INSTITUTION_AFFILIATION);
	for (Event event : affiliations) {
	    InstitutionAffiliationEvent affiliation = (InstitutionAffiliationEvent) event;
	    if (affiliation.isOpen()) {
		setAffiliationEvent(affiliation);
		return;
	    }
	}
	throw new DomainException("error.accounting.events.MicroPaymentEvent.personHasNoInstitutionAffiliation");
    }

    @Override
    protected Account getFromAccount() {
	return getAffiliationEvent().getToAccount();
    }

    @Override
    public Account getToAccount() {
	return getDestinationUnit().getAccountBy(AccountType.INTERNAL);
    }

    @Override
    public LabelFormatter getDescriptionForEntryType(EntryType entryType) {
	final LabelFormatter labelFormatter = new LabelFormatter();
	labelFormatter.appendLabel(LabelFormatter.ENUMERATION_RESOURCES, entryType.name(), getAmount().toString());
	return labelFormatter;
    }

    @Override
    public PostingRule getPostingRule() {
	return getAffiliationEvent().getInstitution().getUnitServiceAgreementTemplate()
		.findPostingRuleBy(getEventType(), getWhenOccured(), null);
    }

    @Service
    public static MicroPaymentEvent create(User responsible, Person person, Unit destinationUnit, Money amount) {
	MicroPaymentEvent event = new MicroPaymentEvent(person, destinationUnit, amount);
	event.process(responsible, event.calculateEntries(), new AccountingTransactionDetailDTO(new DateTime(),
		PaymentMode.CREDIT_SPENDING));
	return event;
    }

    public Unit getOwnerUnit() {
	return getDestinationUnit();
    }

}
