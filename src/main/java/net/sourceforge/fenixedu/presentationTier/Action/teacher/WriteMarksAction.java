package net.sourceforge.fenixedu.presentationTier.Action.teacher;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.applicationTier.Servico.teacher.InsertEvaluationMarks;
import net.sourceforge.fenixedu.applicationTier.Servico.teacher.TeacherAdministrationSiteComponentService;
import net.sourceforge.fenixedu.dataTransferObject.ISiteComponent;
import net.sourceforge.fenixedu.dataTransferObject.InfoEvaluation;
import net.sourceforge.fenixedu.dataTransferObject.InfoMark;
import net.sourceforge.fenixedu.dataTransferObject.InfoSiteCommon;
import net.sourceforge.fenixedu.dataTransferObject.InfoSiteMarks;
import net.sourceforge.fenixedu.dataTransferObject.TeacherAdministrationSiteView;
import net.sourceforge.fenixedu.presentationTier.Action.base.FenixDispatchAction;
import net.sourceforge.fenixedu.presentationTier.Action.exceptions.FenixActionException;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.upload.FormFile;
import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.core.security.Authenticate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author Tânia Pousão
 * 
 */
public class WriteMarksAction extends FenixDispatchAction {

    private static final Logger logger = LoggerFactory.getLogger(WriteMarksAction.class);

    public ActionForward loadFile(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionErrors actionErrors = new ActionErrors();
        HashMap hashMarks = new HashMap();

        String lineReader = null;

        String objectCode = getObjectCode(request);
        String evaluationCode = getEvaluationCode(request);
        request.setAttribute("objectCode", objectCode);
        request.setAttribute("evaluationCode", evaluationCode);

        // Read uploaded file
        DynaActionForm marksForm = (DynaActionForm) form;

        FormFile formFile = (FormFile) marksForm.get("theFile");
        if (!(formFile.getContentType().equals("text/plain"))) {
            prepareInputForward(request, objectCode, evaluationCode);
            actionErrors.add("FileNotExist", new ActionError("error.ficheiro.impossivelLer"));

            saveErrors(request, actionErrors);
            return mapping.findForward("viewMarksOptions");
        }

        InputStreamReader input = new InputStreamReader(formFile.getInputStream());
        BufferedReader reader = new BufferedReader(input);

        // parsing uploaded file
        int n = 0;
        String studentNumber = null;
        String mark = null;
        StringTokenizer stringTokenizer = null;

        try {
            for (lineReader = reader.readLine(); lineReader != null; lineReader = reader.readLine(), n++) {
                if ((lineReader != null) && (lineReader.length() != 0)) {
                    stringTokenizer = new StringTokenizer(lineReader);
                    try {
                        studentNumber = stringTokenizer.nextToken().trim();
                    } catch (NoSuchElementException e2) {
                        prepareInputForward(request, objectCode, evaluationCode);
                        actionErrors.add("BadFormatFile", new ActionError("error.file.badFormat"));

                        saveErrors(request, actionErrors);
                        return mapping.findForward("viewMarksOptions");

                    }

                    try {
                        mark = stringTokenizer.nextToken().trim();

                    } catch (NoSuchElementException e1) {
                        prepareInputForward(request, objectCode, evaluationCode);
                        actionErrors.add("BadFormatFile", new ActionError("error.file.badFormat"));

                        saveErrors(request, actionErrors);
                        return mapping.findForward("viewMarksOptions");

                    }
                    hashMarks.put(studentNumber, mark);
                }

            }
        } catch (IOException e) {
            prepareInputForward(request, objectCode, evaluationCode);
            actionErrors.add("FileNotExist", new ActionError("error.ficheiro.impossivelLer"));

            saveErrors(request, actionErrors);
            return mapping.findForward("viewMarksOptions");
        }

        if (n == 0) {
            prepareInputForward(request, objectCode, evaluationCode);
            actionErrors.add("BadFormatFile", new ActionError("error.file.badFormat"));
            saveErrors(request, actionErrors);
            return mapping.findForward("viewMarksOptions");
        }
        reader.close();

        User userView = Authenticate.getUser();

        TeacherAdministrationSiteView siteView = null;

        try {
            siteView = InsertEvaluationMarks.runInsertEvaluationMarks(objectCode, evaluationCode, hashMarks);
        } catch (FenixServiceException e) {
            logger.error(e.getMessage(), e);
            throw new FenixActionException(e);
        }
        request.setAttribute("siteView", siteView);

        // check for errors in service
        InfoSiteMarks infoSiteMarks = (InfoSiteMarks) siteView.getComponent();
        if (infoSiteMarks.getStudentsListErrors() != null && infoSiteMarks.getStudentsListErrors().size() > 0) {
            ListIterator iterator = infoSiteMarks.getStudentsListErrors().listIterator();
            while (iterator.hasNext()) {

                String sNumber = (String) iterator.next();

                actionErrors.add("studentNonExistence", new ActionError("errors.student.nonExisting", sNumber));
            }
            saveErrors(request, actionErrors);
        }

        if (infoSiteMarks.getMarksListErrors() != null && infoSiteMarks.getMarksListErrors().size() > 0) {
            ListIterator iterator = infoSiteMarks.getMarksListErrors().listIterator();
            while (iterator.hasNext()) {
                InfoMark infoMark = (InfoMark) iterator.next();
                actionErrors.add(
                        "invalidMark",
                        new ActionError("errors.invalidMark", infoMark.getMark(), String.valueOf((infoMark.getInfoFrequenta()
                                .getAluno().getNumber()).intValue())));

            }
            saveErrors(request, actionErrors);

        }
        if (!actionErrors.isEmpty()) {
            return mapping.getInputForward();
        }

        return mapping.findForward("viewMarksOptions");
    }

    private void prepareInputForward(HttpServletRequest request, String objectCode, String evaluationCode)
            throws FenixActionException {
        User userView = getUserView(request);
        ISiteComponent commonComponent = new InfoSiteCommon();

        try {
            TeacherAdministrationSiteView siteView =
                    TeacherAdministrationSiteComponentService.runTeacherAdministrationSiteComponentService(objectCode,
                            commonComponent, new InfoEvaluation(), evaluationCode, null);

            request.setAttribute("siteView", siteView);
            request.setAttribute("objectCode", ((InfoSiteCommon) siteView.getCommonComponent()).getExecutionCourse()
                    .getExternalId());
        } catch (FenixServiceException e) {
            throw new FenixActionException(e);
        }
        request.setAttribute("evaluationCode", evaluationCode);
    }

    public ActionForward writeMarks(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        ActionErrors actionErrors = new ActionErrors();

        DynaActionForm marksForm = (DynaActionForm) form;

        HashMap hashMarks = (HashMap) marksForm.get("hashMarks");

        String objectCode = getObjectCode(request);
        String evaluationCode = getEvaluationCode(request);
        request.setAttribute("objectCode", objectCode);
        request.setAttribute("evaluationCode", evaluationCode);

        User userView = getUserView(request);

        Object[] args = { objectCode, evaluationCode, hashMarks };
        TeacherAdministrationSiteView siteView = null;

        try {
            siteView = InsertEvaluationMarks.runInsertEvaluationMarks(objectCode, evaluationCode, hashMarks);
        } catch (FenixServiceException e) {
            throw new FenixActionException(e);
        }

        request.setAttribute("siteView", siteView);

        InfoSiteMarks infoSiteMarks = (InfoSiteMarks) siteView.getComponent();
        // Check if ocurr errors in service
        if ((infoSiteMarks.getMarksListErrors() != null && infoSiteMarks.getMarksListErrors().size() > 0)) {

            // list with errors Invalid Marks
            ListIterator iterator = infoSiteMarks.getMarksListErrors().listIterator();
            while (iterator.hasNext()) {
                InfoMark infoMark = (InfoMark) iterator.next();

                actionErrors.add(
                        "invalidMark",
                        new ActionError("errors.invalidMark", infoMark.getMark(), String.valueOf((infoMark.getInfoFrequenta()
                                .getAluno().getNumber()).intValue())));
            }
            saveErrors(request, actionErrors);
        }

        if (infoSiteMarks.getStudentsListErrors() != null && infoSiteMarks.getStudentsListErrors().size() > 0) {
            ListIterator iterator = infoSiteMarks.getStudentsListErrors().listIterator();
            while (iterator.hasNext()) {

                String studentNumber = (String) iterator.next();

                actionErrors.add("studentNonExistence", new ActionError("errors.student.nonExisting", studentNumber));
            }
            saveErrors(request, actionErrors);
        }

        if (!actionErrors.isEmpty()) {
            return mapping.getInputForward();
        }

        return mapping.findForward("viewMarksOptions");
    }

    private String getEvaluationCode(HttpServletRequest request) {
        String evaluationCodeString = (String) request.getAttribute("evaluationCode");
        if (evaluationCodeString == null) {
            evaluationCodeString = request.getParameter("evaluationCode");
        }
        return evaluationCodeString;
    }

    private String getObjectCode(HttpServletRequest request) {
        String objectCodeString = (String) request.getAttribute("objectCode");
        if (objectCodeString == null) {
            objectCodeString = request.getParameter("objectCode");
        }
        return objectCodeString;
    }
}
