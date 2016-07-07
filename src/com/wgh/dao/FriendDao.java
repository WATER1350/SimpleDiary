package com.wgh.dao;

import com.wgh.tools.ConnDB;
import com.wgh.tools.GetSqlSession;
import com.wgh.model.Friend;

public class FriendDao {
	
	public FriendDao() {
	}
	
    private String getNameSpace() {
        return "friend";
    }
    
    public String saveFriend(Friend friend) {
    	String result = "";
		try {
		    GetSqlSession.getSqlSession().insert(getNameSpace() + ".addFriend",friend);
			GetSqlSession.commit();
			result = "添加好友成功！";
		} catch (Exception e) {
			e.printStackTrace();
			GetSqlSession.rollback();
			result = "添加好友失败！";
		}
	
		return result; // 返回执行结果
    }

}
