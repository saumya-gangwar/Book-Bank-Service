package com.cloudproject.servlets;


import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cloudproject.constants.Configuration;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

//https://happycoding.io/tutorials/google-cloud/cloud-storage

@WebServlet("/UploadFileServlet")
@MultipartConfig
public class UploadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final Logger log = Logger.getLogger(UploadFileServlet.class.getName());
	 
	 public void doPost(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
		 	List<Part> parts = (List<Part>)request.getParts();
		 	for(Part filePart : parts) {
		 		 String fileName = filePart.getSubmittedFileName();
		 		 log.info("File:- " + fileName);
				 InputStream fileInputStream = filePart.getInputStream();
				 uploadToCloudStorage(fileName, fileInputStream);
		 	}
//		    Part filePart = request.getPart("myFile");
		    response.setContentType("text/html;");
//		    response.getWriter().println("File has been Successfully uploaded!");
		    response.sendRedirect("SuccessSubscription.jsp");
		   }
	 
	 
	 private static String uploadToCloudStorage(String fileName, InputStream fileInputStream) {
		 	String projectId = Configuration.getProjectId();
		    String bucketName = Configuration.getBucketName();
		    Storage storage =
		        StorageOptions.newBuilder().setProjectId(projectId).build().getService();
		    BlobId blobId = BlobId.of(bucketName, fileName);
		    BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();
		    Blob blob = storage.create(blobInfo, fileInputStream);
		    return blob.getMediaLink();
		  }
}
