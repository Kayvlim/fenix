package net.sourceforge.fenixedu.dataTransferObject.commons;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import net.sourceforge.fenixedu.domain.CurricularCourse;
import net.sourceforge.fenixedu.domain.Degree;
import net.sourceforge.fenixedu.domain.DegreeCurricularPlan;
import net.sourceforge.fenixedu.domain.DomainReference;
import net.sourceforge.fenixedu.domain.ExecutionSemester;
import net.sourceforge.fenixedu.domain.degreeStructure.DegreeModule;
import net.sourceforge.fenixedu.presentationTier.renderers.converters.DomainObjectKeyConverter;
import pt.ist.fenixWebFramework.renderers.DataProvider;
import pt.ist.fenixWebFramework.renderers.components.converters.BiDirectionalConverter;
import pt.ist.fenixWebFramework.renderers.components.converters.Converter;

public class SearchCurricularCourseByDegree implements Serializable {

    private DomainReference<ExecutionSemester> executionSemester;
    private DegreeByExecutionYearBean degreeBean;
    private DomainReference<DegreeCurricularPlan> degreeCurricularPlan;
    private CurricularCourseByExecutionSemesterBean curricularCourseBean;

    public SearchCurricularCourseByDegree(final ExecutionSemester executionSemester) {
	setExecutionSemester(executionSemester);
    }

    public ExecutionSemester getExecutionSemester() {
	return (this.executionSemester != null) ? this.executionSemester.getObject() : null;
    }

    public void setExecutionSemester(ExecutionSemester executionSemester) {
	this.executionSemester = (executionSemester != null) ? new DomainReference<ExecutionSemester>(executionSemester) : null;
    }

    public DegreeByExecutionYearBean getDegreeBean() {
	return degreeBean;
    }

    public void setDegreeBean(DegreeByExecutionYearBean degreeBean) {
	this.degreeBean = degreeBean;
	removeDegreeCurricularPlan();
	removeCurricularCourseBean();
    }

    public boolean hasDegreeBean() {
	return getDegreeBean() != null;
    }

    public DegreeCurricularPlan getDegreeCurricularPlan() {
	return (this.degreeCurricularPlan != null) ? this.degreeCurricularPlan.getObject() : null;
    }

    public void setDegreeCurricularPlan(DegreeCurricularPlan degreeCurricularPlan) {
	if (hasDegreeBean() && getDegreeBean().getDegree().hasDegreeCurricularPlans(degreeCurricularPlan)) {
	    this.degreeCurricularPlan = (degreeCurricularPlan != null) ? new DomainReference<DegreeCurricularPlan>(
		    degreeCurricularPlan) : null;
	} else {
	    this.degreeCurricularPlan = null;
	}
	removeCurricularCourseBean();
    }

    public void removeDegreeCurricularPlan() {
	this.degreeCurricularPlan = null;
    }

    public boolean hasDegreeCurricularPlan() {
	return getDegreeCurricularPlan() != null;
    }

    public CurricularCourseByExecutionSemesterBean getCurricularCourseBean() {
	return curricularCourseBean;
    }

    public void setCurricularCourseBean(CurricularCourseByExecutionSemesterBean curricularCourseBean) {
	this.curricularCourseBean = curricularCourseBean;
    }

    public void removeCurricularCourseBean() {
	this.curricularCourseBean = null;
    }

    public boolean hasCurricularCourseBean() {
	return this.curricularCourseBean != null;
    }

    static public class SearchCurricularCourseBolonhaDegreesProvider implements DataProvider {

	@Override
	public Object provide(Object source, Object currentValue) {

	    final SearchCurricularCourseByDegree bean = (SearchCurricularCourseByDegree) source;
	    final List<DegreeByExecutionYearBean> result = new ArrayList<DegreeByExecutionYearBean>();

	    for (final Degree degree : Degree.readBolonhaDegrees()) {
		result.add(new DegreeByExecutionYearBean(degree, bean.getExecutionSemester().getExecutionYear()));
	    }

	    Collections.sort(result);
	    return result;
	}

	@Override
	public Converter getConverter() {
	    return new BiDirectionalConverter() {

		@Override
		public Object convert(Class type, Object value) {
		    return DegreeByExecutionYearBean.buildFrom((String) value);
		}

		@Override
		public String deserialize(Object object) {
		    return (object == null) ? "" : ((DegreeByExecutionYearBean) object).getKey();
		}
	    };
	}
    }

    static public class SearchCurricularCourseDegreeCurricularPlansProvider implements DataProvider {

	@Override
	public Object provide(Object source, Object currentValue) {
	    final SearchCurricularCourseByDegree bean = (SearchCurricularCourseByDegree) source;

	    if (bean.hasDegreeBean()) {
		final List<DegreeCurricularPlan> result = getDegreeCurricularPlans(bean);
		Collections.sort(result, DegreeCurricularPlan.COMPARATOR_BY_NAME);
		return result;

	    } else {
		return Collections.<DegreeCurricularPlan> emptyList();
	    }
	}

	private List<DegreeCurricularPlan> getDegreeCurricularPlans(final SearchCurricularCourseByDegree bean) {
	    return new ArrayList<DegreeCurricularPlan>(bean.getDegreeBean().getDegreeCurricularPlans());
	}

	@Override
	public Converter getConverter() {
	    return new DomainObjectKeyConverter();
	}
    }

    static public class SearchCurricularCourseCurricularCoursesProvider implements DataProvider {

	@Override
	public Object provide(Object source, Object currentValue) {
	    final SearchCurricularCourseByDegree bean = (SearchCurricularCourseByDegree) source;
	    if (bean.hasDegreeBean() && bean.hasDegreeCurricularPlan()) {
		return getSortedCurricularCourses(bean);
	    }
	    return Collections.<DegreeCurricularPlan> emptyList();
	}

	private List<CurricularCourseByExecutionSemesterBean> getSortedCurricularCourses(final SearchCurricularCourseByDegree bean) {
	    final DegreeCurricularPlan dcp = bean.getDegreeCurricularPlan();
	    final List<CurricularCourseByExecutionSemesterBean> result = new ArrayList<CurricularCourseByExecutionSemesterBean>();

	    for (final DegreeModule degreeModule : dcp.getDcpDegreeModules(CurricularCourse.class, bean.getExecutionSemester())) {
		result.add(new CurricularCourseByExecutionSemesterBean((CurricularCourse) degreeModule, bean
			.getExecutionSemester()));
	    }

	    Collections.sort(result);
	    return result;
	}

	@Override
	public Converter getConverter() {
	    return new BiDirectionalConverter() {

		@Override
		public Object convert(Class type, Object value) {
		    return CurricularCourseByExecutionSemesterBean.buildFrom((String) value);
		}

		@Override
		public String deserialize(Object object) {
		    return (object == null) ? "" : ((CurricularCourseByExecutionSemesterBean) object).getKey();
		}
	    };
	}
    }
}
