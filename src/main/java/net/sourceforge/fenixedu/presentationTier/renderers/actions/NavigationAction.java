package net.sourceforge.fenixedu.presentationTier.renderers.actions;

import javax.servlet.http.HttpServletRequest;

import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;

import org.apache.struts.action.Action;
import org.fenixedu.bennu.core.domain.User;
import org.fenixedu.bennu.core.security.Authenticate;

import pt.ist.fenixframework.DomainObject;
import pt.ist.fenixframework.FenixFramework;

public abstract class NavigationAction extends Action {
    public static final String NAVIGATION_SHOW = "show";

    protected User getUserView(HttpServletRequest request) {
        return Authenticate.getUser();

    }

    protected String getGivenSchema(HttpServletRequest request) {
        return request.getParameter("schema");
    }

    protected String getGivenLayout(HttpServletRequest request) {
        return request.getParameter("layout");
    }

    protected DomainObject getTargetObject(HttpServletRequest request) throws FenixServiceException, ClassNotFoundException {
        return FenixFramework.getDomainObject(request.getParameter("oid"));
    }

    protected String getCompleteTypeName(String typeName) {
        if (typeName.startsWith("net.sourceforge.fenixedu.domain.")) {
            return typeName;
        } else {
            return "net.sourceforge.fenixedu.domain." + typeName;
        }
    }

    public static String getTypeName(Class type) {
        String typeName = type.getName();

        if (typeName.startsWith("net.sourceforge.fenixedu.domain.")) {
            typeName = typeName.substring("net.sourceforge.fenixedu.domain.".length());
        }

        return typeName;
    }
}
