package net.sourceforge.fenixedu.presentationTier.renderers.degreeStructure;

import net.sourceforge.fenixedu.domain.CurricularCourse;
import net.sourceforge.fenixedu.domain.DegreeCurricularPlan;
import net.sourceforge.fenixedu.domain.ExecutionSemester;
import net.sourceforge.fenixedu.domain.curricularPeriod.CurricularPeriod;
import net.sourceforge.fenixedu.domain.degreeStructure.Context;
import net.sourceforge.fenixedu.domain.degreeStructure.CourseGroup;
import net.sourceforge.fenixedu.util.CurricularPeriodLabelFormatter;
import pt.ist.fenixWebFramework.renderers.components.HtmlTable;
import pt.ist.fenixWebFramework.renderers.components.HtmlTableCell;
import pt.ist.fenixWebFramework.renderers.components.HtmlTableRow;
import pt.ist.fenixWebFramework.renderers.components.HtmlText;

public class DegreeCurricularPlanGroupsLayout extends DegreeCurricularPlanLayout {

    public DegreeCurricularPlanGroupsLayout(DegreeCurricularPlanRenderer degreeCurricularPlanRenderer) {
        super(degreeCurricularPlanRenderer);
    }

    @Override
    protected void draw(final DegreeCurricularPlan degreeCurricularPlan, final HtmlTable main) {
        drawCourseGroupRow(degreeCurricularPlan.getRoot(), null, main, 0);
    }

    private void drawCourseGroupRow(final CourseGroup courseGroup, final Context previous, final HtmlTable main, int level) {
        drawCourseGroupName(courseGroup, main, level);
        drawCurricularRulesRows(courseGroup, previous, main, level + 1);
        drawCurricularCourseRows(courseGroup, main, level + 1);
        drawCourseGroupRows(courseGroup, main, level + 1);
    }

    private void drawCourseGroupRows(final CourseGroup courseGroup, final HtmlTable main, int level) {
        for (final Context context : courseGroup.getSortedOpenChildContextsWithCourseGroups(getExecutionInterval())) {
            drawCourseGroupRow((CourseGroup) context.getChildDegreeModule(), context, main, level);
        }
    }

    private void drawCourseGroupName(final CourseGroup courseGroup, final HtmlTable mainTable, final int level) {
        final HtmlTableRow groupRow = mainTable.createRow();
        groupRow.setClasses(getCourseGroupRowClass());
        addTabsToRow(groupRow, level);

        final HtmlTableCell cell = groupRow.createCell();
        cell.setClasses(getLabelCellClass());
        cell.setBody(new HtmlText(courseGroup.getNameI18N().getContent()));

        if (showCourses() && courseGroup.hasAnyChildContextWithCurricularCourse()) {
            cell.setColspan(getMaxColSpanForTextOnGroupsWithChilds() - level);
            drawCurricularPeriodHeader(groupRow);
            drawCourseLoadHeader(groupRow);
            drawEctsCreditsHeader(groupRow);
        } else {
            cell.setColspan(getMaxLineSize() - level);
        }
    }

    private void drawCurricularPeriodHeader(final HtmlTableRow row) {
        final HtmlTableCell cell = row.createCell();
        cell.setClasses(getCourseLoadCellClass());
        cell.setColspan(2);
        cell.setText(getLabel("label.degreeCurricularPlan.renderer.curricular.period"));
    }

    private void drawCourseLoadHeader(final HtmlTableRow row) {
        final HtmlTableCell cell = row.createCell();
        cell.setClasses(getCourseLoadCellClass());
        cell.setText(getLabel("label.degreeCurricularPlan.renderer.course.load"));
    }

    private void drawEctsCreditsHeader(final HtmlTableRow row) {
        final HtmlTableCell cell = row.createCell();
        cell.setClasses(getEctsCreditsCellClass());
        cell.setText(getLabel("label.degreeCurricularPlan.renderer.ects"));
    }

    private void drawCurricularCourseRows(final CourseGroup courseGroup, final HtmlTable main, int level) {
        if (showCourses()) {
            for (final Context context : courseGroup.getSortedOpenChildContextsWithCurricularCourses(getExecutionInterval())) {
                drawCurricularCourseRow(context, main, level);
            }
        }
    }

    private void drawCurricularCourseRow(final Context context, final HtmlTable main, int level) {
        final HtmlTableRow row = main.createRow();
        addTabsToRow(row, level);
        row.setClasses(getCurricularCourseRowClass());

        final CurricularCourse curricularCourse = (CurricularCourse) context.getChildDegreeModule();
        if (curricularCourse.isOptionalCurricularCourse()) {
            drawCurricularCourseName(curricularCourse, row, false, level);
            drawContextInformation(context.getCurricularPeriod(), row);
            drawOptionalCellInformation(row);

        } else if (curricularCourse.isSemestrial(getExecutionInterval())) {
            drawCurricularCourseName(curricularCourse, row, isCurricularCourseLinkable(), level);
            drawContextInformation(context.getCurricularPeriod(), row);
            drawRegime(curricularCourse, row);
            drawCourseLoad(curricularCourse, context.getCurricularPeriod(), row);
            drawEctsCredits(curricularCourse, context.getCurricularPeriod(), row);

        } else {
            drawAnualCurricularCourseRow(context, row, level);
        }

        drawCurricularRulesRows(curricularCourse, context, main, level);
    }

    private void drawAnualCurricularCourseRow(final Context context, final HtmlTableRow row, final int level) {

        final CurricularCourse curricularCourse = (CurricularCourse) context.getChildDegreeModule();
        if (curricularCourse.hasCompetenceCourse()) {

            if (curricularCourse.getCompetenceCourse().hasOneCourseLoad(getExecutionInterval())) {
                drawCurricularCourseName(curricularCourse, row, isCurricularCourseLinkable(), level);
                drawContextInformation(context.getCurricularPeriod(), row);
                drawRegime(curricularCourse, row);
                drawCourseLoad(curricularCourse, context.getCurricularPeriod(), row);
                drawEctsCredits(curricularCourse, context.getCurricularPeriod(), row);
            } else {

                final CurricularPeriod firstCP = context.getCurricularPeriod();
                final ExecutionSemester firstES = getExecutionInterval().getExecutionSemesterFor(firstCP.getChildOrder());

                drawCurricularCourseName(curricularCourse, row, isCurricularCourseLinkable(), level);
                drawContextInformation(firstCP, row);
                drawRegime(curricularCourse, row);
                drawCourseLoad(curricularCourse, firstCP, firstES, row);
                drawEctsCredits(curricularCourse, firstCP, firstES, row);

                final CurricularPeriod secondCP = context.getCurricularPeriod().getNext();
                final ExecutionSemester secondES = getExecutionInterval().getExecutionSemesterFor(secondCP.getChildOrder());

                drawCurricularCourseName(curricularCourse, row, false, level);
                drawContextInformation(secondCP, row);
                drawRegime(curricularCourse, row);
                drawCourseLoad(curricularCourse, secondCP, secondES, row);
                drawEctsCredits(curricularCourse, secondCP, secondES, row);
            }

        } else {
            drawCurricularCourseName(curricularCourse, row, isCurricularCourseLinkable(), level);
            drawContextInformation(context.getCurricularPeriod(), row);
            drawRegime(curricularCourse, row);
            drawCourseLoad(curricularCourse, context.getCurricularPeriod(), row);
            drawEctsCredits(curricularCourse, context.getCurricularPeriod(), row);
        }
    }

    private void drawContextInformation(final CurricularPeriod period, final HtmlTableRow row) {
        final HtmlTableCell cell = row.createCell();
        cell.setClasses(getCurricularPeriodCellClass());
        cell.setText(CurricularPeriodLabelFormatter.getFullLabel(period, true));
    }

    private void drawCourseLoad(final CurricularCourse course, final CurricularPeriod period, final ExecutionSemester interval,
            final HtmlTableRow row) {

        final HtmlTableCell cell = row.createCell();
        cell.setClasses(getCourseLoadCellClass());

        if (course.isOptionalCurricularCourse()) {
            cell.setText(EMPTY_CELL);
        } else {
            final StringBuilder builder = new StringBuilder();

            builder.append(getLabel("label.degreeCurricularPlan.renderer.acronym.contact.load")).append("-");
            builder.append(roundValue(course.getContactLoad(period, interval))).append(" ");

            builder.append(getLabel("label.degreeCurricularPlan.renderer.acronym.autonomous.work")).append("-");
            builder.append(course.getAutonomousWorkHours(period, interval).toString()).append(" ");

            builder.append(getLabel("label.degreeCurricularPlan.renderer.acronym.total.load")).append("-");
            builder.append(course.getTotalLoad(period, interval));

            cell.setText(builder.toString());
        }

        cell.setTitle(getLabel("label.degreeCurricularPlan.renderer.title.course.load"));
    }

    private void drawEctsCredits(final CurricularCourse course, final CurricularPeriod period, final ExecutionSemester interval,
            final HtmlTableRow row) {
        final HtmlTableCell cell = row.createCell();
        cell.setClasses(getEctsCreditsCellClass());
        cell.setText(course.isOptionalCurricularCourse() ? EMPTY_CELL : course.getEctsCredits(period, interval).toString());
    }

}
