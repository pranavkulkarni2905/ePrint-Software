package com.print.controller.user;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;



import com.google.zxing.pdf417.PDF417Reader;
import com.print.DAO.UserDAO;
import com.print.email.SendMail;

/**
 * Servlet implementation class FileUploadController
 */
@MultipartConfig
@WebServlet("/FileUploadController")
public class FileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String setName=request.getParameter("setName");
		int userId=Integer.parseInt(request.getParameter("userId"));
	
		System.out.println(setName);
		System.out.println(userId);
		
		SendMail sm=new SendMail();
		
		String token=sm.generateOTP();
		
		UserDAO ud=new UserDAO();
		int i1=0;
		
		List<Part> files = (List<Part>) request.getParts();
		for (int i=0;i<files.size()-2;i++){
		    String imageFileName = files.get(i).getSubmittedFileName(); // Get the selected image file name
		    System.out.println("Selected Image File Name: " + imageFileName);
		    
		    String uploadPath="C:/Users/NCS/eclipse-workspace/Print Management Software/src/main/webapp/user-doc/"+imageFileName;  // upload path where we have to upload our actual image
			System.out.println("Upload Path : "+uploadPath);
		
			
			try
			{
			
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=files.get(i).getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
			}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			 i1=ud.uploadDocuments(userId,setName,token,imageFileName);
			
			
			
		}
		HttpSession session=request.getSession();

		
		if(i1>0) {
			session.setAttribute("upload-success",true);
			
			response.sendRedirect("user/send-document.jsp");
		}else {
			session.setAttribute("upload-fail",false);
			response.sendRedirect("user/send-document.jsp");
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
