package com.wgh.dao;

import com.wgh.model.Administrator;
import com.wgh.tools.GetSqlSession;
import com.wgh.dao.AdministratorDao;

public class AdministratorDao {
	
	private String getNameSpace() {
		return "administrator";
	}
	
	public Administrator query(Administrator admin) {
		Administrator result = null;
		
		try {
			result = GetSqlSession.getSqlSession().selectOne(getNameSpace() + ".query",admin);
			GetSqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			GetSqlSession.rollback();
		}
		
		return result;
	}

}
