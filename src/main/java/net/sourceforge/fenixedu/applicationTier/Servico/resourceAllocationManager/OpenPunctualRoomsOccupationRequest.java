package net.sourceforge.fenixedu.applicationTier.Servico.resourceAllocationManager;

import static net.sourceforge.fenixedu.injectionCode.AccessControl.check;
import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.PunctualRoomsOccupationRequest;
import net.sourceforge.fenixedu.predicates.RolePredicates;

import org.joda.time.DateTime;

import pt.ist.fenixframework.Atomic;

public class OpenPunctualRoomsOccupationRequest {

    @Atomic
    public static void run(PunctualRoomsOccupationRequest request, Person person) {
        check(RolePredicates.RESOURCE_ALLOCATION_MANAGER_PREDICATE);
        if (request != null) {
            request.openRequestAndAssociateOwnerOnlyForEmployess(new DateTime(), person);
        }
    }
}