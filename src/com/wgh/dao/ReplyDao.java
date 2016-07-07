package com.wgh.dao;

import com.wgh.tools.GetSqlSession;
import com.wgh.model.Reply;

public class ReplyDao {
	
    private String getNameSpace() {
        return "reply";
    }
    
    public String saveReply(Reply reply) {
    	String result = "";
		try {
		    GetSqlSession.getSqlSession().insert(getNameSpace() + ".addReply",reply);
			GetSqlSession.commit();
			result = "发表成功！";
		} catch (Exception e) {
			e.printStackTrace();
			GetSqlSession.rollback();
			result = "发表失败！";
		}
	
		return result; // 返回执行结果
    }

}
