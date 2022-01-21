package com.cloudproject.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.cloudproject.constants.Configuration;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
/**
 * Servlet implementation class ViewBookListServlet
 */
@WebServlet("/ListFileServlet")
public class ViewBookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(ViewBookListServlet.class.getName());
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		log.info("Calling List File Servlet");
		String projectId = Configuration.getProjectId();
		String bucketName = Configuration.getBucketName();
		PrintWriter out = response.getWriter();
		JSONArray resArr = new JSONArray();
		JSONObject resObject = new JSONObject();
		Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
		if (bucketName == null) {
			for (Bucket bucket : storage.list().iterateAll()) {
				System.out.println(bucket);
			}
		} else {
			Bucket bucket = storage.get(bucketName);
			if (bucket == null) {
				log.warning("No such bucket");
				return;
			}
			for (Blob blob : bucket.list().iterateAll()) {
				log.info(blob.getName());
				JSONObject obj = new JSONObject();
				obj.put("value", blob.getName());
				resArr.put(obj);
			}
		}
		resObject.put("bookList", resArr);
		out.print(resObject);
		out.flush();
		
	}
}
