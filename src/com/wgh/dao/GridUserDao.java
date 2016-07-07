package com.wgh.dao;

import java.util.ArrayList;
import java.util.List;

import com.wgh.model.Content;
import com.wgh.model.GridUser;
import com.wgh.tools.GetSqlSession;

public class GridUserDao {
	
   private String getNameSpace() {
	   return "gridUser";
   }
   
   public int save(GridUser gridUser) {
		int result = 0;
		try {
		    result = GetSqlSession.getSqlSession().insert(getNameSpace() + ".insertGridUser",gridUser);
		} catch (Exception e) {
			e.printStackTrace();
			GetSqlSession.rollback();
			//result = "用户注册失败！";
		} finally {
			GetSqlSession.commit();
			//result = "用户注册成功！";
		}
	
		return result; // 返回执行结果
	}
   
   public GridUser query(GridUser gridUser) {
   	GridUser result = new GridUser();
   	try {
   		result = GetSqlSession.getSqlSession().selectOne(getNameSpace() + ".queryGridUser",gridUser);
   	} catch (Exception e) {
   		e.printStackTrace();
   		GetSqlSession.rollback();
   	} finally {
   		GetSqlSession.commit();
   	}
   	
   	return result;
   }
   
   public String update(GridUser gridUser) {
	   String result = "";
	   try {
		   GetSqlSession.getSqlSession().update(getNameSpace() + ".update",gridUser);
		   result = "更新成功！";
	   } catch (Exception e) {
	   		e.printStackTrace();
	   		GetSqlSession.rollback();
	   		result = "更新失败！";
	   } finally {
	   		GetSqlSession.commit();
	   }
	   
	   return result;
   }
}
