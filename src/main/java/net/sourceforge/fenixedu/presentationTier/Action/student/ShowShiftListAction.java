package net.sourceforge.fenixedu.presentationTier.Action.student;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sourceforge.fenixedu.applicationTier.Servico.resourceAllocationManager.LerAlunosDeTurno;
import net.sourceforge.fenixedu.applicationTier.Servico.student.ReadShiftsByTypeFromExecutionCourse;
import net.sourceforge.fenixedu.dataTransferObject.InfoCourseExecutionAndListOfTypeLessonAndInfoShift;
import net.sourceforge.fenixedu.dataTransferObject.InfoExecutionCourse;
import net.sourceforge.fenixedu.dataTransferObject.InfoShift;
import net.sourceforge.fenixedu.dataTransferObject.InfoShiftEnrolment;
import net.sourceforge.fenixedu.dataTransferObject.ShiftKey;
import net.sourceforge.fenixedu.dataTransferObject.TypeLessonAndInfoShift;
import net.sourceforge.fenixedu.domain.ShiftType;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * @author João Mota
 */

public class ShowShiftListAction extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String indexes = request.getParameter("index");
        String[] indexij = indexes.split("-");
        Integer indexi = new Integer(indexij[0]);
        Integer indexj = new Integer(indexij[1]);

        InfoShiftEnrolment iSE = (InfoShiftEnrolment) request.getAttribute("infoShiftEnrolment");
        InfoExecutionCourse executionCourse = null;
        ShiftType lessonType = null;

        List infoEnrollmentWithShift = iSE.getInfoEnrolmentWithShift();
        executionCourse =
                ((InfoCourseExecutionAndListOfTypeLessonAndInfoShift) (infoEnrollmentWithShift.get(indexi.intValue())))
                        .getInfoExecutionCourse();

        lessonType =
                ((TypeLessonAndInfoShift) ((InfoCourseExecutionAndListOfTypeLessonAndInfoShift) (iSE.getInfoEnrolmentWithShift()
                        .get(indexi.intValue()))).getTypeLessonsAndInfoShifts().get(indexj.intValue())).getTypeLesson();

        List shiftsList = new ArrayList();

        try {
            shiftsList = ReadShiftsByTypeFromExecutionCourse.run(executionCourse, lessonType);
            if (!shiftsList.isEmpty()) {
                request.setAttribute("shiftsList", shiftsList);
            }

        } catch (Exception e) {
            ActionErrors actionErrors = new ActionErrors();
            actionErrors.add("unableToReadShifts", new ActionError("errors.unableToReadShifts"));
            saveErrors(request, actionErrors);
            return mapping.getInputForward();
        }

        try {
            List vacancies = new ArrayList();
            Iterator iterator = shiftsList.iterator();
            while (iterator.hasNext()) {
                InfoShift element = (InfoShift) iterator.next();

                List students = LerAlunosDeTurno.run(new ShiftKey(element.getNome(), element.getInfoDisciplinaExecucao()));
                Integer vacancy = element.getLotacao();

                vacancy = new Integer(vacancy.intValue() - students.size());
                vacancies.add(vacancy);
            }

            if (!vacancies.isEmpty()) {
                request.setAttribute("vacancies", vacancies);
            }
        } catch (Exception e) {
            ActionErrors actionErrors = new ActionErrors();
            actionErrors.add("unableToReadVacancies", new ActionError("errors.unableToReadVacancies"));
            saveErrors(request, actionErrors);
            return mapping.getInputForward();
        }

        return mapping.findForward("viewShiftsList");

    }

}