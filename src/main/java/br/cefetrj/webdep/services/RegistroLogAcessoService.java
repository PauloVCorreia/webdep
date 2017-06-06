package br.cefetrj.webdep.services;

import java.util.List;

import javax.persistence.Query;

import br.cefetrj.webdep.model.dao.GenericDAO;
import br.cefetrj.webdep.model.dao.PersistenceManager;
import br.cefetrj.webdep.model.entity.RegistroLogAcesso;
import br.cefetrj.webdep.model.entity.Sistema;
import br.cefetrj.webdep.model.entity.Usuario;
import br.cefetrj.webdep.model.entity.Versao;

public class RegistroLogAcessoService {
	
	public static void insertRegistroLogAcesso(RegistroLogAcesso s) {
		PersistenceManager pm = PersistenceManager.getInstance();

		pm.beginTransaction();

		GenericDAO<RegistroLogAcesso> dao = pm.createGenericDAO(RegistroLogAcesso.class);
		dao.insert(s);

		pm.commitTransaction();

	}
	
	public static void updateRegistroLogAcesso(RegistroLogAcesso s) {
		PersistenceManager pm = PersistenceManager.getInstance();

		pm.beginTransaction();

		GenericDAO<RegistroLogAcesso> dao = pm.createGenericDAO(RegistroLogAcesso.class);
		dao.update(s);

		pm.commitTransaction();

	}
	
	public static List<RegistroLogAcesso> searchRegistroLogAcessoByUsuario(Usuario u) {
		PersistenceManager pm = PersistenceManager.getInstance();
		try {
			Query q = pm.createQuery("FROM RegistroLogAcesso WHERE usuario = :param ");
			
			q.setParameter("param", u);

			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static List<RegistroLogAcesso> searchRegistroLogAcessoBySistema(Sistema s) {
		PersistenceManager pm = PersistenceManager.getInstance();
		try {
			Query q = pm.createQuery("FROM RegistroLogAcesso r WHERE r.sistema = :param");
			
			q.setParameter("param", s);

			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void deleteRegistroLogAcesso (RegistroLogAcesso r) {
		PersistenceManager pm = PersistenceManager.getInstance();

		pm.beginTransaction();

		GenericDAO<RegistroLogAcesso> dao = pm.createGenericDAO(RegistroLogAcesso.class);
		dao.delete(r);

		pm.commitTransaction();
	}

	public static List<RegistroLogAcesso> listAllRegisters() {
		List<RegistroLogAcesso> regsAcesso = null;
		PersistenceManager pManager = PersistenceManager.getInstance();
		try {
			pManager.beginTransaction();
			
			GenericDAO<RegistroLogAcesso> regAcessoDAO = pManager.createGenericDAO(RegistroLogAcesso.class);
			regsAcesso = regAcessoDAO.listAll();
			
			pManager.commitTransaction();
		} catch (Exception e) {
			pManager.rollbackTransaction();
		}
		
		return 	regsAcesso;	
	}
	
	
	public static List<RegistroLogAcesso> listRegistroLogAcessoByFilters(Sistema sistema, 
			List<Versao> versoes, String[] codigos){
		
		PersistenceManager pm = PersistenceManager.getInstance();
		try {
			Query q = pm.createQuery(""
					+ "FROM RegistroLogAcesso r "
					+ "WHERE r.sistema = :sistema "
					+ "  AND r.codigo in (:codigos) ");
			
			//q.setParameter("sistema", s);
			

			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
		//return null;
	}
	
}
