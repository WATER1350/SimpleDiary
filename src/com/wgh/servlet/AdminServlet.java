package com.wgh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wgh.model.Administrator;
import com.wgh.model.Grid;
import com.wgh.model.User;
import com.wgh.dao.AdministratorDao;
import com.wgh.dao.GridDao;
import com.wgh.dao.UserDao;
import com.wgh.model.JsonRes;
	
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(AdminServlet.class.toString());
	private AdministratorDao administratorDao = null;
	private GridDao gridDao = null;
	private JsonRes jsonRes = null;
	private UserDao userDao = null;
	
	public AdminServlet() {
		super();
		administratorDao = new AdministratorDao();
		gridDao = new GridDao();
		jsonRes = new JsonRes();
		userDao = new UserDao();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);// 执行doPost()方法
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("login".equals(action)) { // 用户登录
			this.login(request, response);
		} else if ("exit".equals(action)) {// 用户退出
			this.exit(request, response);
		} else if ("listAllGrid".equals(action)) {
			this.listAllGrid(request, response);
		} else if ("updateGrid".equals(action)) {
			this.updateGrid(request, response);
			//log.info("fuck updateGrid");
		} else if ("listAllUser".equals(action)) {
			this.listAllUser(request, response);
		} else if ("deleteUser".equals(action)) {
			this.deleteUser(request, response);
		}
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		log.info("login administrator");
		Administrator f = new Administrator();
		f.setUsername(request.getParameter("username")); // 获取并设置用户名
		f.setPassword(request.getParameter("password")); // 获取并设置密码
        
		log.info(f.getUsername());
		log.info(f.getPassword());
		Administrator r = administratorDao.query(f);
		if (r != null) {// 当用户登录成功时
			HttpSession session = request.getSession();
			session.setAttribute("username", r.getUsername());// 保存用户名fg
			
			request.getRequestDispatcher("/admin/index.jsp").forward(request,
					response);// 重定向页面
		} else {// 当用户登录不成功时
			request.setAttribute("returnValue", "您输入的用户名或密码错误，请重新输入！");
			request.getRequestDispatcher("userMessage.jsp").forward(request,
					response);// 重定向页面
		}
	}
	
	private void exit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	
	private void listAllGrid(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		    HttpSession session = request.getSession();
		    String username = session.getAttribute("username").toString();
            if(username == null || username.equals("")) {
            	request.getRequestDispatcher("/admin/sign-in.jsp").forward(request,
    					response);// 重定向页面
            }
		
		    List<Grid> l = gridDao.query();
		    ObjectMapper mapper = new ObjectMapper();
		    String jsonInString = mapper.writeValueAsString(l);
		    response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print(jsonInString); 							// 输出检测结果
			out.flush();
			out.close();
		    request.getRequestDispatcher("/admin/index.jsp").forward(request,
					response);
	}
	
	private void updateGrid(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
			Grid f = new Grid();
			f.setGrid(Integer.parseInt(request.getParameter("grid").toString())); 
			f.setFirstline(request.getParameter("firstline").toString());
			f.setSecondline(request.getParameter("secondline").toString());
			f.setThirdline(request.getParameter("thirdline").toString());
			f.setFourthline(request.getParameter("fourthline").toString());

		    int l = gridDao.update(f);
		    jsonRes.setSuccess(l > 0 ? true : false);
		    ObjectMapper mapper = new ObjectMapper();
		    String jsonInString = mapper.writeValueAsString(jsonRes);
		    response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print(jsonInString); 							// 输出检测结果
			out.flush();
			out.close();
		    //request.getRequestDispatcher("/admin/index.jsp").forward(request,
			//		response);
	}
	
	private void listAllUser(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
			HttpSession session = request.getSession();
		    String username = session.getAttribute("username").toString();
	        if(username == null || username.equals("")) {
	        	request.getRequestDispatcher("/admin/sign-in.jsp").forward(request,
						response);// 重定向页面
	        }
		
		    int start = Integer.parseInt(request.getParameter("start").toString());
		    int limit = Integer.parseInt(request.getParameter("limit").toString());
		    
		    User user = new User();
		    user.setStart(start);
		    user.setLimit(limit);
		    
		    JsonRes res = new JsonRes();
		    List<User> rows = userDao.queryByPage(user);
		    int results = userDao.count();
		    
		    res.setResults(results);
		    res.setRows(rows);
		    
		    ObjectMapper mapper = new ObjectMapper();
		    String jsonInString = mapper.writeValueAsString(res);
		    response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print(jsonInString); 							// 输出检测结果
			out.flush();
			out.close();
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		    HttpSession session = request.getSession();
		    int id = Integer.parseInt(request.getParameter("id").toString());
		    
		    int l = userDao.deleteById(id);
		    jsonRes.setSuccess(l > 0 ? true : false);
		    ObjectMapper mapper = new ObjectMapper();
		    String jsonInString = mapper.writeValueAsString(jsonRes);
		    response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print(jsonInString); 							// 输出检测结果
			out.flush();
			out.close();
	}

}
