/*
 * Created on 19/Mai/2003
 *
 * 
 */
package ServidorAplicacao.Filtro;

import java.util.Collection;
import java.util.Iterator;

import DataBeans.InfoExecutionCourse;
import DataBeans.InfoRole;
import DataBeans.util.Cloner;
import Dominio.DisciplinaExecucao;
import Dominio.IDisciplinaExecucao;
import Dominio.IProfessorship;
import Dominio.ITeacher;
import ServidorAplicacao.IServico;
import ServidorAplicacao.IUserView;
import ServidorAplicacao.NotAuthorizedException;
import ServidorPersistente.IDisciplinaExecucaoPersistente;
import ServidorPersistente.IPersistentProfessorship;
import ServidorPersistente.IPersistentTeacher;
import ServidorPersistente.ISuportePersistente;
import ServidorPersistente.OJB.SuportePersistenteOJB;
import Util.RoleType;

/**
 * @author Jo�o Mota
 *
 */
public class ExecutionCourseLecturingTeacherAuthorizationFilter extends AuthorizationByRoleFilter {

	public final static ExecutionCourseLecturingTeacherAuthorizationFilter instance =
		new ExecutionCourseLecturingTeacherAuthorizationFilter();

	/**
	 * The singleton access method of this class.
	 *
	 * @return Returns the instance of this class responsible for the
	 * authorization access to services.
	 **/
	public static Filtro getInstance() {
		return instance;
	}

	/* (non-Javadoc)
	 * @see ServidorAplicacao.Filtro.AuthorizationByRoleFilter#getRoleType()
	 */
	protected RoleType getRoleType() {
		return RoleType.TEACHER;
	}

	public void preFiltragem(IUserView id, IServico servico, Object[] argumentos) throws Exception {
		if (((id != null && id.getRoles() != null && !containsRole(id.getRoles()) && !lecturesExecutionCourse(id, argumentos)))
			|| (id == null)
			|| (id.getRoles() == null)) {
			throw new NotAuthorizedException();
		}

	}

	/**
		 * @param collection
		 * @return boolean
		 */
	private boolean containsRole(Collection roles) {
		Iterator rolesIterator = roles.iterator();
		while (rolesIterator.hasNext()) {
			InfoRole infoRole = (InfoRole) rolesIterator.next();
			if (infoRole.getRoleType().equals(getRoleType()))
				return true;
		}
		return false;
	}
	/**
	 * @param id
	 * @param argumentos
	 * @return
	 */
	private boolean lecturesExecutionCourse(IUserView id, Object[] argumentos) {
		InfoExecutionCourse infoExecutionCourse = null;
		IDisciplinaExecucao executionCourse =null;
		ISuportePersistente sp;
		IProfessorship professorship = null;
		if (argumentos==null) {
			return false;
		}
		try {
			
			sp = SuportePersistenteOJB.getInstance();
			IDisciplinaExecucaoPersistente persistentExecutionCourse = sp.getIDisciplinaExecucaoPersistente();
			if (argumentos[0] instanceof InfoExecutionCourse) {
				infoExecutionCourse = (InfoExecutionCourse) argumentos[0];
				 executionCourse = Cloner.copyInfoExecutionCourse2ExecutionCourse(infoExecutionCourse);
			} else {
				executionCourse = 
						(IDisciplinaExecucao) persistentExecutionCourse.readByOId(new DisciplinaExecucao((Integer) argumentos[0]));
			}
		
			IPersistentTeacher persistentTeacher = sp.getIPersistentTeacher();
			ITeacher teacher = persistentTeacher.readTeacherByUsernamePB(id.getUtilizador());
			IPersistentProfessorship persistentProfessorship = sp.getIPersistentProfessorship();
			professorship = persistentProfessorship.readByTeacherAndExecutionCoursePB(teacher, executionCourse);

		} catch (Exception e) {
			return false;
		}
		if (professorship == null) {
			return false;
		} else {
			return true;
		}

	}

}
