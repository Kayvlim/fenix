package net.sourceforge.fenixedu.presentationTier.Action.phd.guidance.provider;

import java.util.Arrays;

import net.sourceforge.fenixedu.domain.phd.PhdIndividualProgramDocumentType;
import pt.ist.fenixWebFramework.renderers.DataProvider;
import pt.ist.fenixWebFramework.renderers.components.converters.Converter;
import pt.ist.fenixWebFramework.renderers.converters.EnumConverter;

public class PhdGuidanceDocumentTypeProvider implements DataProvider {

    @Override
    public Converter getConverter() {
        return new EnumConverter();
    }

    @Override
    public Object provide(Object source, Object current) {
        return Arrays.asList(PhdIndividualProgramDocumentType.FEEDBACK_REPORT, PhdIndividualProgramDocumentType.GUIDANCE_OTHER);
    }

}
