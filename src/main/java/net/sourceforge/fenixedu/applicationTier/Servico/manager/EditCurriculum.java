/*
 * Created on 16/Set/2003
 */
package net.sourceforge.fenixedu.applicationTier.Servico.manager;

import static net.sourceforge.fenixedu.injectionCode.AccessControl.check;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.NonExistingServiceException;
import net.sourceforge.fenixedu.dataTransferObject.InfoCurriculum;
import net.sourceforge.fenixedu.domain.CurricularCourse;
import net.sourceforge.fenixedu.domain.Curriculum;
import net.sourceforge.fenixedu.domain.ExecutionYear;
import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.predicates.RolePredicates;
import pt.ist.fenixframework.Atomic;
import pt.ist.fenixframework.FenixFramework;

/**
 * @author lmac1
 */

public class EditCurriculum {

    @Atomic
    public static void run(InfoCurriculum infoCurriculum, String language, String username) throws FenixServiceException {
        check(RolePredicates.MANAGER_OR_OPERATOR_PREDICATE);
        CurricularCourse curricularCourse =
                (CurricularCourse) FenixFramework.getDomainObject(infoCurriculum.getInfoCurricularCourse().getExternalId());

        if (curricularCourse == null) {
            throw new NonExistingServiceException();
        }

        Person person = Person.readPersonByUsername(username);
        if (person == null) {
            throw new NonExistingServiceException();
        }

        ExecutionYear executionYear = infoCurriculum.getExecutionYear();

        Curriculum curriculum = curricularCourse.findLatestCurriculumModifiedBefore(executionYear.getBeginDate());

        if (curriculum == null) {
            curriculum = new Curriculum();

            curriculum.setLastModificationDate(executionYear.getBeginDate());
            curriculum.setCurricularCourse(curricularCourse);
        }

        if (!curriculum.getLastModificationDate().before(executionYear.getBeginDate())
                && !curriculum.getLastModificationDate().after(executionYear.getEndDate())) {

            curriculum.edit(infoCurriculum.getGeneralObjectives(), infoCurriculum.getOperacionalObjectives(),
                    infoCurriculum.getProgram(), infoCurriculum.getGeneralObjectivesEn(),
                    infoCurriculum.getOperacionalObjectivesEn(), infoCurriculum.getProgramEn());

        } else {
            Curriculum newCurriculum = new Curriculum();
            newCurriculum.setCurricularCourse(curricularCourse);

            newCurriculum.edit(infoCurriculum.getGeneralObjectives(), infoCurriculum.getOperacionalObjectives(),
                    infoCurriculum.getProgram(), infoCurriculum.getGeneralObjectivesEn(),
                    infoCurriculum.getOperacionalObjectivesEn(), infoCurriculum.getProgramEn());
        }

        curriculum.setLastModificationDate(executionYear.getBeginDate());
    }
}