package com.wgh.task;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimerTask;
import java.util.logging.Logger;

import org.apdplat.word.WordFrequencyStatistics;
import org.apdplat.word.WordSegmenter;
import org.apdplat.word.segmentation.SegmentationAlgorithm;
import org.apdplat.word.segmentation.Word;

import com.wgh.dao.ContentDao;
import com.wgh.dao.GridUserDao;
import com.wgh.model.Content;
import com.wgh.model.GridUser;

public class NFDFlightDataTimerTask extends TimerTask{
	private static Logger log = Logger.getLogger(NFDFlightDataTimerTask.class.toString());
	private ContentDao contentDao = null;
	private GridUserDao gridUserDao = null;
	private Apriori apriori = null;
	
	public NFDFlightDataTimerTask() {
		super();
		contentDao = new ContentDao();
		gridUserDao = new GridUserDao();
		apriori = new Apriori();
	}

	 @Override
	 public void run() {
		 runForAll();
		 runForUser();
	 }
	 
	 public void runForAll() {
	  try {
	   //在这里写你要执行的内容
		//词频统计设置
		  log.info("segmentWordForALL");

		  WordFrequencyStatistics wordFrequencyStatistics = new WordFrequencyStatistics();
		  wordFrequencyStatistics.setRemoveStopWord(true);
		  wordFrequencyStatistics.setResultPath("word-frequency-statistics.txt");
		  wordFrequencyStatistics.setSegmentationAlgorithm(SegmentationAlgorithm.MaxNgramScore);
		  //开始分词
		  Map segmentTarget = getSegmentTarget(new Content());
		  wordFrequencyStatistics.seg(segmentTarget.get("segmentTarget").toString());
		  //输出词频统计结果
		  wordFrequencyStatistics.dump();
		  
          String highestFrequencyWord = getHighestFrequencyWord(Integer.parseInt(segmentTarget.get("index").toString()), 0);
          
          
          GridUser gridUser = new GridUser();
          gridUser.setSecondline(highestFrequencyWord);
          gridUser.setGrid(Integer.parseInt(segmentTarget.get("index").toString()) + 1);
          gridUserDao.update(gridUser);
          log.info("highestFrequencyWord: " + highestFrequencyWord);
	  } catch (Exception e) {
	   log.info("-------------解析信息发生异常--------------");
	  }
	 }
	 
	 public void runForUser() {
		  try {
		   //在这里写你要执行的内容
			//词频统计设置
			  log.info("segmentWordForUser");
			  
			  int contentCount = contentDao.count();
			  int id = (int)(Math.random()*contentCount) + 1;
			  
			  int userid = contentDao.queryById(id).getUserid();
			  log.info("userid: " + userid);

			  WordFrequencyStatistics wordFrequencyStatistics = new WordFrequencyStatistics();
			  wordFrequencyStatistics.setRemoveStopWord(true);
			  wordFrequencyStatistics.setResultPath("word-frequency-statistics.txt");
			  wordFrequencyStatistics.setSegmentationAlgorithm(SegmentationAlgorithm.MaxNgramScore);
			  //开始分词
			  Content content = new Content();
			  content.setUserid(userid);
			  Map segmentTarget = getSegmentTarget(content);
			  wordFrequencyStatistics.seg(segmentTarget.get("segmentTarget").toString());
			  //输出词频统计结果
			  wordFrequencyStatistics.dump();
			  
	          String highestFrequencyWord = getHighestFrequencyWord(Integer.parseInt(segmentTarget.get("index").toString()), userid);
	          
	          
	          GridUser gridUser = new GridUser();
	          gridUser.setUserid(userid);
	          gridUser.setFirstline(highestFrequencyWord);
	          gridUser.setGrid(Integer.parseInt(segmentTarget.get("index").toString()) + 1);
	          gridUserDao.update(gridUser);
	          log.info("highestFrequencyWord: " + highestFrequencyWord);
		  } catch (Exception e) {
		   log.info("-------------解析信息发生异常--------------");
		  }
		 }
     
	 private Map getSegmentTarget(Content content) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		 Map map = new HashMap();
		 String[] method = {"getFirst", "getSecond", "getThird", "getFourth", "getFifth", "getSixth", "getSeventh", "getEighth"};
		 int x=(int)(Math.random()*8);
		 //int x = 0;
		 log.info("x: " + x);
		 List<String> aprInput = new ArrayList<String>();
		 List<Content> result = new ArrayList<Content>();
		 StringBuffer segmentTarget = new StringBuffer();
		 result = contentDao.query(content);
		 for(int i = 0; i < result.size(); i ++) {
			 Content cur = result.get(i);
			 Class clazz = cur.getClass();
			 Method m = clazz.getDeclaredMethod(method[x]);
			 String tmp = (String)m.invoke(cur);
			 segmentTarget.append(tmp+"；");
          	 StringBuffer temp1 = new StringBuffer();
			 List<Word> words = WordSegmenter.segWithStopWords(tmp);
             for(int j = 0; j < words.size(); j ++) {
            	 temp1.append(words.get(j).toString() + " ");
             }
             aprInput.add(temp1.toString());
		 }
		 
		 //System.out.println("fuck good" + aprInput.toString());
		 String[] l = new String[aprInput.size()];  
	     aprInput.toArray(l); 
		 apriori.setTransSet(l);
		 apriori.run();
		 
		 map.put("index", x);
		 map.put("segmentTarget", segmentTarget.toString());
		 return map;
	 }
	 
	 private String getHighestFrequencyWord(int index, int userid) {
		 int max = 1;
		 String result = "";
		 List<String> list = new ArrayList<String>();
		 try{
			  FileInputStream fis = new FileInputStream("word-frequency-statistics.txt");//要读的文件路径	·
			  InputStreamReader isr = new InputStreamReader(fis);//字符流
			  BufferedReader br = new BufferedReader(isr); //缓冲 
			  String line = null;
	
			  while((line=br.readLine())!=null){//字符不等于空
				  String[] numbersArray=line.split(" ");
//				  if (max <= Integer.parseInt(numbersArray[1])) {
//					  max = Integer.parseInt(numbersArray[1]);
//					  result = numbersArray[0];
//				  }
				  list.add(numbersArray[0]);
			  }
			  br.close();
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 
		 log.info(list.toString());
		 
		 GridUser gridUser = new GridUser();
		 gridUser.setUserid(userid);
		 gridUser.setGrid(index+1);
		 String thirdline = gridUserDao.query(gridUser).getThirdline();
		 String fourthline = gridUserDao.query(gridUser).getFourthline();
		 result = list.get(0);
		 
		 if(result.equals(thirdline) || result.equals(fourthline)) {
			 result = list.get(1);
		 }
		 
		 String[] cos = {"first","second","third","fourth","fifth","sixth","seventh","eighth"};
		 Map map = new HashMap();
		 map.put("grid", cos[index]);
		 map.put("word","'%" + result + "%'");
		 map.put("userid", (userid > 0 ? userid : ""));
		 
		 List<String> l = contentDao.queryForGridAndWord(map);
		 
		 log.info("l: " + l);
		 return l.get((int)(Math.random() * l.size()));
	 }
}
