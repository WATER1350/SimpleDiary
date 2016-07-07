package com.wgh.servlet;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.wgh.dao.DiaryDao;
import com.wgh.dao.UserDao;
import com.wgh.dao.FriendDao;
import com.wgh.dao.MusicDao;
import com.wgh.dao.ReplyDao;
import com.wgh.dao.ContentDao;
import com.wgh.dao.GridUserDao;
import com.wgh.model.Diary;
import com.wgh.model.Friend;
import com.wgh.model.Reply;
import com.wgh.model.Music;
import com.wgh.model.Content;
import com.wgh.model.GridUser;
import com.wgh.tools.MyPagination;

import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * Servlet implementation class DiaryServlet
 */
public class DiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private static final Log logger= 
	MyPagination pagination = null;// 数据分页类的对象
	DiaryDao dao = null;// 日记相关的数据库操作类的对象
	UserDao userDao = null;
	FriendDao friendDao = null;
	ReplyDao replyDao = null;
	MusicDao musicDao = null;
	ContentDao contentDao = null;
	GridUserDao gridUserDao;
	Logger log = Logger.getLogger("DiaryServlet");

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DiaryServlet() {
		super();
		// TODO Auto-generated constructor stub
		dao = new DiaryDao();// 实例化日记相关的数据库操作类的对象
		userDao = new UserDao();
		friendDao = new FriendDao();
		replyDao = new ReplyDao();
		musicDao = new MusicDao();
		contentDao = new ContentDao();
		gridUserDao = new GridUserDao();
	    log.setLevel(Level.INFO); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("preview".equals(action)) {
			preview(request, response); // 预览九宫格日记
		} else if ("save".equals(action)) {
			save(request, response); // 保存九宫格日记
		} else if ("listAllDiary".equals(action)) {
			listAllDiary(request, response); // 查询全部九宫格日记
		} else if ("listMyDiary".equals(action)) {
			listMyDiary(request, response); // 查询我的日记
		} else if ("delDiary".equals(action)) {
			delDiary(request, response); // 删除我的日记
		} else if ("addfriend".equals(action)) {
			addfriend(request, response);
		} else if ("comment".equals(action)) {
			comment(request, response);
		} else if ("uploadMusic".equals(action)) {
			uploadMusic(request, response);
		} else if ("savePicture".equals(action)) {
			savePicture(request, response);
		} else if ("previewPicture".equals(action)) {
			previewPicture(request, response);
		} else if ("previewVideo".equals(action)) {
			previewVideo(request, response);
		} else if ("saveVideo".equals(action)) {
			saveVideo(request,response);
		} else if ("writeDiary".equals(action)) {
			writeDiary(request, response);
		} else if("playSetting".equals(action)) {
			playSetting(request, response);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);// 执行doPost()方法
	}

	/**
	 * 功能：删除日记
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delDiary(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")); // 获取要删除的日记的ID
		String imgName = request.getParameter("imgName"); // 获取图片名
		String url = request.getParameter("url"); // 获取返回的URL地址
		log.info("url: "+url);
		int rtn = dao.delDiary(id);// 删除日记
		PrintWriter out = response.getWriter();
		if (rtn > 0) {// 当删除日记成功时
			/************* 删除日记图片及缩略图 ******************/
			String path = getServletContext().getRealPath("\\")+ "images\\diary\\";
			java.io.File file = new java.io.File(path + imgName + "scale.jpg");// 获取缩略图
			file.delete();		//删除指定的文件
			file = new java.io.File(path + imgName + ".png");// 获取日记图片
			file.delete();
			/*******************************/
			out
					.println("<script>alert('删除日记成功！');window.location.href='DiaryServlet?action="
							+ url + "';</script>");
		} else {// 当删除日记失败时
			out
					.println("<script>alert('删除日记失败，请稍后重试！');history.back();</script>");
		}
	}

	/**
	 * 功能：查询我的日记
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void listMyDiary(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 获取日记内容
		String strPage = (String) request.getParameter("Page");// 获取当前页码
		int Page = 1;
		List<Diary> list = null;
		if (strPage == null) {
			int userid = Integer.parseInt(session.getAttribute("uid")
					.toString()); // 获取用户ID号
			String sql = "select d.id,d.title,d.address,d.writeTime,d.userid,u.username,d.detail,d.type from tb_diary d inner join tb_user u on u.id=d.userid  where d.userid="
					+ userid + " order by d.writeTime DESC";// 应用内联接查询日记信息
			pagination = new MyPagination();
			list = dao.queryDiary(sql); // 获取日记内容
			int pagesize = 4; // 指定每页显示的记录数
			list = pagination.getInitPage(list, Page, pagesize); // 初始化分页信息
			request.getSession().setAttribute("pagination", pagination);// 保存分页信息
		} else {
			pagination = (MyPagination) request.getSession().getAttribute(
					"pagination");// 获取分页信息
			Page = pagination.getPage(strPage);
			list = pagination.getAppointPage(Page); // 获取指定页数据
		}
		
		for (int i = 0; i < list.size(); i ++) {
			Diary current = list.get(i);
			current.setReplyList(dao.queryReply(current.getId()));
		}
		
		request.setAttribute("diaryList", list); // 保存当前页的日记信息
		request.setAttribute("Page", Page); // 保存的当前页码
		request.setAttribute("url", "listMyDiary");// 保存当前页的URL地址
		request.getRequestDispatcher("listAllDiary.jsp").forward(request,
				response);// 重定向页面到listAllDiary.jsp
	}

	/**
	 * 功能：预览九宫格日记
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void preview(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String title = request.getParameter("title");// 获取日记标题
		String template = request.getParameter("template");// 获取日记模板
		String weather = request.getParameter("weather");// 获取天气
		String detail = request.getParameter("detail");// 获取日记正文
		String visibility = request.getParameter("visibility");// 获取日记可见权限
		// 获取日记内容
		String[] content = request.getParameterValues("content");
		for (int i = 0; i < content.length; i++) {
			if (content[i].equals(null) || content[i].equals("")
					|| content[i].equals("请在此输入文字")) {
				content[i] = "没啥可说的";	//为没有设置内容的项目设置默认值
			}
		}
		HttpSession session = request.getSession(true);	//获取HttpSession
		session.setAttribute("template", template);// 保存选择的模板
		session.setAttribute("weather", weather); // 保存天气
		session.setAttribute("title", title); // 保存日记标题
		session.setAttribute("diary", content); // 保存日记内容
		session.setAttribute("detail", detail);
		session.setAttribute("visibility", visibility);
		request.getRequestDispatcher("preview.jsp").forward(request, response);// 重定向页面
	}

	/**
	 * 功能：保存九宫格日记
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void save(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		BufferedImage image = (BufferedImage) session.getAttribute("diaryImg");
		String url = request.getRequestURL().toString();// 获取请求的URL地址
		url = request.getRealPath("/");// 获取请求的实际地址
		long date = new Date().getTime();// 获取当前时间
		Random r = new Random(date);
		long value = r.nextLong();// 生成一个长整型的随机数
		url = url + "images/diary/" + value;// 生成图片的URL地址
		String scaleImgUrl = url + "scale.jpg";// 生成缩略图的URL地址
		url = url + ".png";
		ImageIO.write(image, "PNG", new File(url));
		/***************** 生成图片缩略图 ******************************************/
		File file = new File(url); // 获取原文件
		Image src = ImageIO.read(file);
		int old_w = src.getWidth(null);// 获取原图片的宽
		int old_h = src.getHeight(null);// 获取原图片的高
		int new_w = 0;// 新图片的宽
		int new_h = 0;// 新图片的高
		double temp = 0;// 缩放比例
		/********* 计算缩放比例 ***************/
		double tagSize = 200;
		if (old_w > old_h) {
			temp = old_w / tagSize;
		} else {
			temp = old_h / tagSize;
		}
		/*************************************/
		new_w = (int) Math.round(old_w / temp);// 计算新图片的宽
		new_h = (int) Math.round(old_h / temp);// 计算新图片的高
		image = new BufferedImage(new_w, new_h, BufferedImage.TYPE_INT_RGB);
		src = src.getScaledInstance(new_w, new_h, Image.SCALE_SMOOTH);
		image.getGraphics().drawImage(src, 0, 0, new_w, new_h, null);
		ImageIO.write(image, "JPG", new File(scaleImgUrl)); // 保存缩略图文件
		/***********************************************************************/
		/**** 将填写的日记保存到数据库中 *****/
		Diary diary = new Diary();
		diary.setAddress(String.valueOf(value));// 设置图片地址
		diary.setTitle(session.getAttribute("title").toString());// 设置日记标题
		diary.setUserid(Integer.parseInt(session.getAttribute("uid").toString()));// 设置用户ID
		diary.setDetail(session.getAttribute("detail").toString());//设置日记正文
		diary.setVisibility(Integer.parseInt(session.getAttribute("visibility").toString()));//设置日记可见权限
		diary.setType(0);
		int rtn = dao.saveDiary(diary); // 保存日记
		PrintWriter out = response.getWriter();
		if (rtn > 0) {// 当保存成功时
			out
					.println("<script>alert('保存成功！');window.location.href='DiaryServlet?action=listAllDiary';</script>");
			String[] content = (String[]) session.getAttribute("diary");
			Content diaryContent = new Content();
			diaryContent.setUserid(Integer.parseInt(session.getAttribute("uid").toString()));
			log.info("content: " + content[4]);
			diaryContent.setFirst(content[0]);
			diaryContent.setSecond(content[1]);
			diaryContent.setThird(content[2]);
			diaryContent.setFourth(content[3]);
			diaryContent.setFifth(content[5]);
			diaryContent.setSixth(content[6]);
			diaryContent.setSeventh(content[7]);
			diaryContent.setEighth(content[8]);
			contentDao.saveContent(diaryContent);
			
			for(int i = 1; i <= 8; i ++) {
			  GridUser gridUser = new GridUser();
			  gridUser.setUserid(Integer.parseInt(session.getAttribute("uid").toString()));
			  gridUser.setGrid(i);

			  if(i <= 4) {
				  String thirdline = gridUserDao.query(gridUser).getFourthline();
				  if(thirdline.equals(content[i - 1])) {
					  continue;
				  }
				  gridUser.setThirdline(gridUserDao.query(gridUser).getFourthline());
			      gridUser.setFourthline(content[i - 1]);
			  } else if(i > 4){
				  String thirdline = gridUserDao.query(gridUser).getFourthline();
				  if(thirdline.equals(content[i])) {
					  continue;
				  }
				  gridUser.setThirdline(gridUserDao.query(gridUser).getFourthline());
				  gridUser.setFourthline(content[i]);
			  }
			  gridUserDao.update(gridUser);
			}
		} else {// 当保存失败时
			out
					.println("<script>alert('保存日记失败，请稍后重试！');history.back();</script>");
		}
		/*********************************/
	}

	/**
	 * 功能：查询全部九宫格日记
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void listAllDiary(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String strPage = (String) request.getParameter("Page");// 获取当前页码

		int Page = 1;
		List<Diary> list = null;
		if (strPage == null) {// 当页面初次运行
			String sql = "select d.id,d.title,d.address,d.writeTime,d.userid,u.username,d.detail,d.type "
					   + "from tb_diary d inner join tb_user u on u.id=d.userid "
					   + "where d.visibility=1 and (d.userid in "
					   + "(select f.friendid "
					   + "from tb_friend f "
					   + "where f.userid="
					   + request.getSession().getAttribute("uid")
					   + ") or d.userid="
					   + request.getSession().getAttribute("uid")
					   + ") order by d.writeTime DESC limit 50";
			pagination = new MyPagination();
			list = dao.queryDiary(sql); // 获取日记内容
			int pagesize = 4; // 指定每页显示的记录数
			list = pagination.getInitPage(list, Page, pagesize); // 初始化分页信息
			request.getSession().setAttribute("pagination", pagination);
		} else {
			pagination = (MyPagination) request.getSession().getAttribute(
					"pagination");
			Page = pagination.getPage(strPage);// 获取当前页码
			list = pagination.getAppointPage(Page); // 获取指定页数据
		}
		
		for (int i = 0; i < list.size(); i ++) {
			Diary current = list.get(i);
			current.setReplyList(dao.queryReply(current.getId()));
		}
		
		request.setAttribute("diaryList", list); // 保存当前页的日记信息
		request.setAttribute("Page", Page); // 保存的当前页码
		request.setAttribute("url", "listAllDiary");// 保存当前页面的URL
		request.getRequestDispatcher("listAllDiary.jsp").forward(request,
				response);// 重定向页面

	}
	
	private void addfriend(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("friend");
		int res = userDao.queryUserid(username);		//调用UserDao类的checkUser()方法判断用户是否被注册
		String result = "";
		
		if(res > 0) {
			Friend friend1 = new Friend();
			friend1.setUserid(Integer.parseInt(request.getSession().getAttribute("uid").toString()));
			friend1.setFriendid(res);
			result = friendDao.saveFriend(friend1);
		} else {
			result = "该好友不存在";
		}
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print(result); 							// 输出检测结果
		out.flush();
		out.close();
	}
	
	private void comment(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int whoid = Integer.parseInt(request.getParameter("whoid").toString());
		String whoname = (request.getParameter("whoname").toString());
		int whoesid = Integer.parseInt(request.getParameter("whoesid").toString());
		String whoesname = request.getParameter("whoesname").toString();
		int diaryid = Integer.parseInt(request.getParameter("diaryid").toString());
		String replyContent = request.getParameter("reply").toString();
		
		log.info(whoname);
		
		Reply reply = new Reply();
		reply.setWhoid(whoid);
		reply.setWhoname(whoname);
		reply.setWhoesid(whoesid);
		reply.setWhoesname(whoesname);
		reply.setDiaryid(diaryid);
		reply.setReplyContent(replyContent);
		String result = replyDao.saveReply(reply);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print(result); 							// 输出检测结果
		out.flush();
		out.close();
		
	}
	
	private void playSetting(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Music music = new Music();
		int id = Integer.parseInt(request.getSession().getAttribute("uid").toString());
		music.setUserid(id);
		int auto = Integer.parseInt(request.getParameter("auto").toString());
		music.setAuto(auto);
		String result = musicDao.updateMusic(music);
		session.setAttribute("auto", auto != 1 ? "" : "autoplay");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	private void uploadMusic(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		log.info("uploadMusic linzsh");
		response.setContentType("text/html;charset=UTF8");
		request.setCharacterEncoding("UTF8");
		HttpSession session = request.getSession();
		String error = "";
		int maxSize = 50 * 1024 * 1024;
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try{
			List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
			Iterator itr = items.iterator();
			while(itr.hasNext()) {
				FileItem item = (FileItem)itr.next();
				log.info(item.getName());
				if(!item.isFormField()) {
					if(item.getName()!=null && !item.getName().equals("")){
						long upFileSize = item.getSize();
						String fileName = item.getName();
						//log.info(new String(upFileSize));
						log.info("hello" + fileName);
						if (upFileSize > maxSize){
							error = "您上传的文件太大，请选择不超过50MB的文件";
							break;
						}
						File tempFile = new File(fileName);
						long date = new Date().getTime();// 获取当前时间
						Random r = new Random(date);
						long value = r.nextLong();// 生成一个长整型的随机数
						File file = new File(request.getRealPath("music"), value+".mp3");
						log.info(file.getPath());
						InputStream is = item.getInputStream();
						int buffer = 1024;
						int length = 0;
						byte[] b = new byte[buffer];
						FileOutputStream fos = new FileOutputStream(file);
						while((length = is.read(b)) > 0) {
							fos.write(b, 0, length);
						}
						is.close();
						fos.close();
						log.info("文件上传成功");
						Music music = new Music();
						music.setMusicname(value+".mp3");
						int id = Integer.parseInt(request.getSession().getAttribute("uid").toString());
						music.setUserid(id);
						music.setAuto(1);
						Music oldMusic = musicDao.queryMusic(id); 
						String oldMusicName = oldMusic != null ? oldMusic.getMusicname() : "";
						if(!oldMusicName.equals("")) {
							musicDao.deleteMusic(id);
							String pathToDelete = getServletContext().getRealPath("\\")+ "music\\";
							java.io.File fileToDelete = new java.io.File(pathToDelete + oldMusicName);// 获取缩略图
							fileToDelete.delete();		//删除指定的文件
						}
						musicDao.saveMusic(music);
						session.setAttribute("music", music.getMusicname());
					}else{
						error = "没有选择上传文件！";
					}
				}
			}
		}catch(Exception e) {
			log.info("出错了");
			e.printStackTrace();
			error = "上传文件出现错误： "+e.getMessage();
		}
		if(!"".equals(error)){
			request.setAttribute("error", error);
		}else{
			request.setAttribute("result", "文件上传成功！");
		}
		//log.info("页面要跳转了");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	public void savePicture(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.info("linzsh here");
		HttpSession session = request.getSession(true);
		/**** 将填写的日记保存到数据库中 *****/
		Diary diary = new Diary();
		int type = Integer.parseInt(request.getParameter("type").toString());
		if(type != 3) {
			diary.setAddress(session.getAttribute("pictureName").toString());// 设置图片地址
		}
		diary.setTitle(request.getParameter("title").toString());// 设置日记标题
		diary.setUserid(Integer.parseInt(session.getAttribute("uid").toString()));// 设置用户ID
		diary.setDetail(request.getParameter("detail").toString());//设置日记正文
		diary.setVisibility(Integer.parseInt(request.getParameter("visibility").toString()));//设置日记可见权限
		diary.setType(Integer.parseInt(request.getParameter("type").toString()));
		int rtn = dao.saveDiary(diary); // 保存日记
		PrintWriter out = response.getWriter();
		log.info("rtn: "+ rtn);
		if (rtn > 0) {// 当保存成功时
			out
					.println("保存成功！");
			session.setAttribute("pictureName", "");
		} else {// 当保存失败时
			out
					.println("保存日记失败，请稍后重试！");
		}
		/*********************************/
	}
	
	public void saveVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.info("linzsh here");
		HttpSession session = request.getSession(true);
		/**** 将填写的日记保存到数据库中 *****/
		Diary diary = new Diary();
		diary.setAddress(session.getAttribute("videoName").toString());// 设置图片地址
		diary.setTitle(request.getParameter("title").toString());// 设置日记标题
		diary.setUserid(Integer.parseInt(session.getAttribute("uid").toString()));// 设置用户ID
		diary.setDetail(request.getParameter("detail").toString());//设置日记正文
		diary.setVisibility(Integer.parseInt(request.getParameter("visibility").toString()));//设置日记可见权限
		diary.setType(Integer.parseInt(request.getParameter("type").toString()));
		int rtn = dao.saveDiary(diary); // 保存日记
		PrintWriter out = response.getWriter();
		log.info("rtn: "+ rtn);
		if (rtn > 0) {// 当保存成功时
			out
					.println("保存成功！");
			session.setAttribute("videoName", "");
		} else {// 当保存失败时
			out
					.println("保存日记失败，请稍后重试！");
		}
		/*********************************/
	}
	
	public void previewPicture(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.info("previewPicture");
		response.setContentType("text/html;charset=GBK");
		request.setCharacterEncoding("GBK");
		HttpSession session = request.getSession();
		String error = "";
		int maxSize = 50 * 1024 * 1024;
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try{
			List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
			Iterator itr = items.iterator();
			while(itr.hasNext()) {
				FileItem item = (FileItem)itr.next();
				log.info(item.getName());
				if(!item.isFormField()) {
					if(item.getName()!=null && !item.getName().equals("")){
						long upFileSize = item.getSize();
						String fileName = item.getName();
						//log.info(new String(upFileSize));
						log.info("hello" + fileName);
						if (upFileSize > maxSize){
							error = "您上传的文件太大，请选择不超过50MB的文件";
							break;
						}
						File tempFile = new File(fileName);
						File file = new File(request.getRealPath("/images/upload"), tempFile.getName());
						log.info(file.getPath());
						InputStream is = item.getInputStream();
						int buffer = 1024;
						int length = 0;
						byte[] b = new byte[buffer];
						FileOutputStream fos = new FileOutputStream(file);
						while((length = is.read(b)) > 0) {
							fos.write(b, 0, length);
						}
						is.close();
						fos.close();
						session.setAttribute("pictureName",tempFile.getName());
					}else{
						error = "没有选择上传文件！";
					}
				}
			}
		}catch(Exception e) {
			log.info("出错了");
			e.printStackTrace();
			error = "上传文件出现错误： "+e.getMessage();
		}
		if(!"".equals(error)){
			request.setAttribute("error", error);
		}else{
			request.setAttribute("result", "文件上传成功！");
		}
		//log.info("页面要跳转了");
		request.getRequestDispatcher("writeOrdinaryDiary.jsp").forward(request, response);
	}
	
	public void previewVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		request.setCharacterEncoding("GBK");
		HttpSession session = request.getSession();
		String error = "";
		int maxSize = 500 * 1024 * 1024;
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try{
			List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
			Iterator itr = items.iterator();
			while(itr.hasNext()) {
				FileItem item = (FileItem)itr.next();
				log.info(item.getName());
				if(!item.isFormField()) {
					if(item.getName()!=null && !item.getName().equals("")){
						long upFileSize = item.getSize();
						String fileName = item.getName();
						//log.info(new String(upFileSize));
						log.info("hello" + fileName);
						if (upFileSize > maxSize){
							error = "您上传的文件太大，请选择不超过50MB的文件";
							break;
						}
						File tempFile = new File(fileName);
						File file = new File(request.getRealPath("videos/upload"), tempFile.getName());
						log.info(file.getPath());
						InputStream is = item.getInputStream();
						int buffer = 1024;
						int length = 0;
						byte[] b = new byte[buffer];
						FileOutputStream fos = new FileOutputStream(file);
						while((length = is.read(b)) > 0) {
							fos.write(b, 0, length);
						}
						is.close();
						fos.close();
						session.setAttribute("videoName",tempFile.getName());
					}else{
						error = "没有选择上传文件！";
					}
				}
			}
		}catch(Exception e) {
			log.info("出错了");
			e.printStackTrace();
			error = "上传文件出现错误： "+e.getMessage();
		}
		if(!"".equals(error)){
			request.setAttribute("error", error);
		}else{
			request.setAttribute("result", "文件上传成功！");
		}
		//log.info("页面要跳转了");
		request.getRequestDispatcher("writeOrdinaryDiary.jsp").forward(request, response);
	}
	
	public void writeDiary(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<GridUser > content = new ArrayList<GridUser >(); 
		for(int i = 0; i < 8; i ++) {
			GridUser gridUser = new GridUser();
			gridUser.setUserid(Integer.parseInt(session.getAttribute("uid").toString()));
			gridUser.setGrid(i + 1);
			content.add(gridUserDao.query(gridUser));
		}
		
		session.setAttribute("grid",content);
		request.getRequestDispatcher("writeDiary.jsp").forward(request, response);
		
	}
}
