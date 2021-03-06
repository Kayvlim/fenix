package net.sourceforge.fenixedu.presentationTier.backBeans.coordinator;

import java.util.List;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.applicationTier.Servico.masterDegree.administrativeOffice.thesis.ReadActiveMasterDegreeThesisDataVersionsByDegreeCurricularPlan;
import net.sourceforge.fenixedu.injectionCode.IllegalDataAccessException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author - Shezad Anavarali (shezad@ist.utl.pt)
 * 
 */
public class ListStudentThesis {

    private static final Logger logger = LoggerFactory.getLogger(ListStudentThesis.class);

    private String degreeCurricularPlanID;

    public ListStudentThesis() {
    }

    public String getDegreeCurricularPlanID() {
        return degreeCurricularPlanID;
    }

    public void setDegreeCurricularPlanID(String degreeCurricularPlanID) {
        this.degreeCurricularPlanID = degreeCurricularPlanID;

        ((HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest()).setAttribute(
                "degreeCurricularPlanID", degreeCurricularPlanID);

    }

    public List getMasterDegreeThesisDataVersions() {

        try {
            return ReadActiveMasterDegreeThesisDataVersionsByDegreeCurricularPlan.run(degreeCurricularPlanID);
        } catch (IllegalDataAccessException e) {
            // TODO Auto-generated catch block
            logger.error(e.getMessage(), e);
        } catch (FenixServiceException e) {
            // TODO Auto-generated catch block
            logger.error(e.getMessage(), e);
        }

        return null;

    }

}