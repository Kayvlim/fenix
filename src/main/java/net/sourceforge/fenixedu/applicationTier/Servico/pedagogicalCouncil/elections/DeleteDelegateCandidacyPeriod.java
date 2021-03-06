package net.sourceforge.fenixedu.applicationTier.Servico.pedagogicalCouncil.elections;

import static net.sourceforge.fenixedu.injectionCode.AccessControl.check;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.dataTransferObject.pedagogicalCouncil.elections.ElectionPeriodBean;
import net.sourceforge.fenixedu.domain.Degree;
import net.sourceforge.fenixedu.domain.ExecutionYear;
import net.sourceforge.fenixedu.domain.elections.DelegateElection;
import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import net.sourceforge.fenixedu.predicates.RolePredicates;
import pt.ist.fenixframework.Atomic;
import pt.ist.fenixframework.FenixFramework;

public class DeleteDelegateCandidacyPeriod {

    @Atomic
    public static void run(ElectionPeriodBean bean) throws FenixServiceException {
        check(RolePredicates.PEDAGOGICAL_COUNCIL_PREDICATE);
        try {
            DelegateElection election = bean.getElection();
            election.deleteCandidacyPeriod();
        } catch (DomainException ex) {
            throw new FenixServiceException(ex.getMessage(), ex.getArgs());
        }
    }

    @Atomic
    public static void run(ElectionPeriodBean bean, String degreeOID) throws FenixServiceException {
        check(RolePredicates.PEDAGOGICAL_COUNCIL_PREDICATE);
        final ExecutionYear executionYear = ExecutionYear.readCurrentExecutionYear();

        Degree degree = FenixFramework.getDomainObject(degreeOID);

        DelegateElection election =
                degree.getYearDelegateElectionWithLastCandidacyPeriod(executionYear, bean.getCurricularYear());

        if (election != null) {
            bean.setElection(election);
        } else {
            throw new FenixServiceException("error.elections.edit.electionNotFound", new String[] { degree.getSigla(),
                    bean.getCurricularYear().getYear().toString() });
        }

        run(bean);
    }
}