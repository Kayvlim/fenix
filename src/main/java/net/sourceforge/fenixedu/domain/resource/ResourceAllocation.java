package net.sourceforge.fenixedu.domain.resource;

import net.sourceforge.fenixedu.domain.exceptions.DomainException;

import org.fenixedu.bennu.core.domain.Bennu;

public abstract class ResourceAllocation extends ResourceAllocation_Base {

    protected ResourceAllocation() {
        super();
        setRootDomainObject(Bennu.getInstance());
    }

    public void delete() {
        super.setResource(null);
        setRootDomainObject(null);
        super.deleteDomainObject();
    }

    @Override
    public void setResource(Resource resource) {
        if (resource == null) {
            throw new DomainException("error.allocation.no.space");
        }
        super.setResource(resource);
    }

    public boolean isSpaceOccupation() {
        return false;
    }

    public boolean isVehicleAllocation() {
        return false;
    }

    public boolean isPersonSpaceOccupation() {
        return false;
    }

    public boolean isMaterialSpaceOccupation() {
        return false;
    }

    public boolean isExtensionSpaceOccupation() {
        return false;
    }

    public boolean isUnitSpaceOccupation() {
        return false;
    }

    public boolean isEventSpaceOccupation() {
        return false;
    }

    public boolean isGenericEventSpaceOccupation() {
        return false;
    }

    public boolean isWrittenEvaluationSpaceOccupation() {
        return false;
    }

    public boolean isLessonSpaceOccupation() {
        return false;
    }

    public boolean isLessonInstanceSpaceOccupation() {
        return false;
    }

    public boolean isNotLessonSpaceOccupation() {
        return isLessonInstanceSpaceOccupation() || isLessonSpaceOccupation();
    }

    @Deprecated
    public boolean hasResource() {
        return getResource() != null;
    }

    @Deprecated
    public boolean hasBennu() {
        return getRootDomainObject() != null;
    }

}
