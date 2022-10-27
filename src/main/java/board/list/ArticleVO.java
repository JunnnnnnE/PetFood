package board.list;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

public class ArticleVO {
	private int articleNO;
	private String title;
	private String content;
	private String imageFileName;
	private Date writeDate;
	private String id;
	private int count;
	
	public ArticleVO() {
		
	}


	public ArticleVO(int articleNO, String title, String content, String imageFileName,
			String id) {
		super();
		this.articleNO = articleNO;
		this.title = title;
		this.content = content;
		this.imageFileName = imageFileName;
		this.id = id;
	}

	public int getArticleNO() {
		return articleNO;
	}


	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}

	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
	
	


	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName!=null && imageFileName.length()!=0) {
				this.imageFileName = URLEncoder.encode(imageFileName, "UTF-8");  //파일이름에 특수문자가 있을 경우 인코딩합니다.
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public Date getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}
	
	
	
	
	

}
