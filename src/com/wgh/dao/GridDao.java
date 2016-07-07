package com.wgh.dao;

import java.util.ArrayList;
import java.util.List;

import com.wgh.model.Grid;
import com.wgh.tools.GetSqlSession;

public class GridDao {
	
	private String getNameSpace() {
        return "grid";
    }
    
    public Grid queryByGridId(int id) {
    	Grid result = new Grid();
		try {
		    result = GetSqlSession.getSqlSession().selectOne(getNameSpace() + ".queryByGridId",id);
			GetSqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			GetSqlSession.rollback();
		}
	
		return result; // 返回执行结果
    }
    
    public List<Grid> query() {
    	List<Grid> result = new ArrayList<Grid>();
		try {
		    result = GetSqlSession.getSqlSession().selectList(getNameSpace() + ".query");
			GetSqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			GetSqlSession.rollback();
		}
	
		return result; // 返回执行结果
    }
    
    public int update(Grid grid) {
    	int result = 0;
    	try {
    		result = GetSqlSession.getSqlSession().update(getNameSpace()+".update", grid);
    		GetSqlSession.commit();
    	} catch (Exception e) {
    		e.printStackTrace();
    		GetSqlSession.rollback();
    	}
    	return result;
    }
}
