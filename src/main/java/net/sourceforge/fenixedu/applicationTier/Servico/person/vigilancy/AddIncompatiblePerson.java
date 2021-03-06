package net.sourceforge.fenixedu.applicationTier.Servico.person.vigilancy;

import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.vigilancy.VigilantWrapper;
import pt.ist.fenixframework.Atomic;

public class AddIncompatiblePerson {

    @Atomic
    public static void run(VigilantWrapper vigilantWrapper, Person person) {
        if (vigilantWrapper.getPerson().getIncompatibleVigilantPerson() != null) {
            vigilantWrapper.getPerson().getIncompatibleVigilantPerson().setIncompatibleVigilantPerson(null);
        }
        vigilantWrapper.getPerson().setIncompatibleVigilantPerson(person);
        person.setIncompatibleVigilantPerson(vigilantWrapper.getPerson());
    }

}