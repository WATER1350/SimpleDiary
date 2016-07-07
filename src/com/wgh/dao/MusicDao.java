package com.wgh.dao;

import com.wgh.model.Music;
import com.wgh.tools.GetSqlSession;

public class MusicDao {
	
	private String getNameSpace() {
        return "music";
    }
    
    public String saveMusic(Music music) {
    	String result = "";
		try {
		    GetSqlSession.getSqlSession().insert(getNameSpace() + ".insertMusic",music);
			GetSqlSession.commit();
			result = "添加背景音乐成功！";
		} catch (Exception e) {
			e.printStackTrace();
			GetSqlSession.rollback();
			result = "添加背景音乐失败！";
		}
	
		return result; // 返回执行结果
    }
    
    public Music queryMusic(int id) {
    	Music result = null;
		try {
		    result = GetSqlSession.getSqlSession().selectOne(getNameSpace() + ".queryMusic",id);
			GetSqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			GetSqlSession.rollback();
		}
	
		return result; // 返回执行结果
    }
    
    public String updateMusic(Music music) {
    	int result = -1;
		try {
		    result = GetSqlSession.getSqlSession().update(getNameSpace() + ".updateMusic",music);
			GetSqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			GetSqlSession.rollback();
		}
	
		return result > 0 ? "success" : "fail"; // 返回执行结果
    }
    
    public int deleteMusic(int id) {
    	int result = 0;
    	try {
    		result = GetSqlSession.getSqlSession().delete(getNameSpace()+".deleteMusic",id);
    	} catch (Exception e) {
    		e.printStackTrace();
    		GetSqlSession.rollback();
    		result = 0;
    	}
    	return result;
    }

}
