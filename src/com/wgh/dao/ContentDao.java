package com.wgh.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.wgh.tools.GetSqlSession;
import com.wgh.model.Content;

public class ContentDao {
	
    private String getNameSpace() {
        return "content";
    }
    
    public String saveContent(Content content) {
    	String result = "";
		try {
		    GetSqlSession.getSqlSession().insert(getNameSpace() + ".insertContent",content);
			GetSqlSession.commit();
			result = "保存成功！";
		} catch (Exception e) {
			e.printStackTrace();
			GetSqlSession.rollback();
			result = "保存失败！";
		}
	
		return result; // 返回执行结果
    }
    
    public List<Content> query(Content content) {
    	List<Content> result = new ArrayList<Content>();
    	try {
    		result = GetSqlSession.getSqlSession().selectList(getNameSpace() + ".query", content);
    		GetSqlSession.commit();
    	} catch (Exception e) {
    		e.printStackTrace();
    		GetSqlSession.rollback();
    	}
    	
    	return result;
    }
    
    public Content queryById(int id) {
    	Content result = new Content();
    	try {
    		result = GetSqlSession.getSqlSession().selectOne(getNameSpace() + ".queryById", id);
    		GetSqlSession.commit();
    	} catch (Exception e) {
    		e.printStackTrace();
    		GetSqlSession.rollback();
    	}
    	
    	return result;
    }
    
    public List<String> queryForGridAndWord(Map map) {
    	List<String> result = new ArrayList<String>();
    	try {
    		result = GetSqlSession.getSqlSession().selectList(getNameSpace() + ".queryForGridAndWord", map);
    		GetSqlSession.commit();
    	} catch (Exception e) {
    		e.printStackTrace();
    		GetSqlSession.rollback();
    	}
    	return result;
    }
    
    public int count() {
    	int result = 0;
    	try {
    		result = GetSqlSession.getSqlSession().selectOne(getNameSpace() + ".count");
    		GetSqlSession.commit();
    	} catch (Exception e) {
    		e.printStackTrace();
    		GetSqlSession.rollback();
    	}
    	
    	return result;
    }
}
