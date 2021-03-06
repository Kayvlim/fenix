/*
 * Created on 2004/04/15
 */
package net.sourceforge.fenixedu.applicationTier.Servico.student;

import static net.sourceforge.fenixedu.injectionCode.AccessControl.check;
import net.sourceforge.fenixedu.dataTransferObject.finalDegreeWork.InfoGroup;
import net.sourceforge.fenixedu.domain.ExecutionDegree;
import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.degree.DegreeType;
import net.sourceforge.fenixedu.domain.finalDegreeWork.FinalDegreeWorkGroup;
import net.sourceforge.fenixedu.domain.student.Registration;
import net.sourceforge.fenixedu.predicates.RolePredicates;
import pt.ist.fenixframework.Atomic;

/**
 * @author Luis Cruz
 */
public class ReadFinalDegreeWorkStudentGroupByUsername {

    @Atomic
    public static InfoGroup run(final Person personUser, final ExecutionDegree executionDegree) {
        check(RolePredicates.STUDENT_PREDICATE);
        final FinalDegreeWorkGroup finalDegreeWorkGroup = findFinalDegreeWorkGroup(personUser, executionDegree);
        return InfoGroup.newInfoFromDomain(finalDegreeWorkGroup);
    }

    private static FinalDegreeWorkGroup findFinalDegreeWorkGroup(final Person personUser, final ExecutionDegree executionDegree) {
        FinalDegreeWorkGroup finalDegreeWorkGroup = find(personUser, executionDegree, DegreeType.BOLONHA_MASTER_DEGREE);
        if (finalDegreeWorkGroup == null) {
            finalDegreeWorkGroup = find(personUser, executionDegree, DegreeType.BOLONHA_INTEGRATED_MASTER_DEGREE);
        }
        if (finalDegreeWorkGroup == null) {
            finalDegreeWorkGroup = find(personUser, executionDegree, DegreeType.BOLONHA_DEGREE);
        }
        if (finalDegreeWorkGroup == null) {
            finalDegreeWorkGroup = find(personUser, executionDegree, DegreeType.DEGREE);
        }
        return finalDegreeWorkGroup;
    }

    private static FinalDegreeWorkGroup find(final Person personUser, final ExecutionDegree executionYear,
            final DegreeType degreeType) {
        for (final Registration registration : personUser.getStudent().getRegistrationsSet()) {
            if (registration.getDegreeType() == degreeType) {
                final FinalDegreeWorkGroup finalDegreeWorkGroup =
                        registration.findFinalDegreeWorkGroupForExecutionYear(executionYear);
                if (finalDegreeWorkGroup != null) {
                    return finalDegreeWorkGroup;
                }
            }
        }
        return null;
    }

}