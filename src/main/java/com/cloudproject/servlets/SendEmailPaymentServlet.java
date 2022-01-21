package com.cloudproject.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.cloudproject.constants.Configuration;
import com.google.cloud.ReadChannel;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.WritableByteChannel;

/**
 * Servlet implementation class SendEmailPaymentServlet
 */
@WebServlet("/SendEmailPaymentServlet")
public class SendEmailPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(SendEmailPaymentServlet.class.getName());

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		log.info("Username - " + userId);
		String selectedFileStr = request.getParameter("selectedFile");
		JSONArray files = new JSONArray(selectedFileStr);
		List<String> fileList = new ArrayList();
		for(int i = 0; i < files.length(); i++) {
			String fileName = files.getString(i);
			if(userId != null && fileName!=null) {
				downloadObject(fileName);
				fileList.add(fileName);
			}
		}
		sendMail(userId, fileList);
	}
	private static void downloadObject(String fileName) throws IOException {
		String projectId = Configuration.getProjectId();
		String bucketName = Configuration.getBucketName();
		Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
		Blob blob = storage.get(bucketName, fileName);
		ReadChannel readChannel = blob.reader();
//		WritableByteChannel outChannel = Channels.newChannel(System.out);
//		ByteBuffer bytes = ByteBuffer.allocate(64 * 1024);
//		while (readChannel.read(bytes) > 0) {
//	        bytes.flip();
//	        outChannel.write(bytes);
//	        bytes.clear();
//	    }
		File file = new File("/tmp/"+fileName);
		FileOutputStream fileOuputStream = new FileOutputStream(file);
		fileOuputStream.getChannel().transferFrom(readChannel, 0, Long.MAX_VALUE);
		fileOuputStream.close();
	}

	private static void sendMail(String recipientId, List<String> files) {

		// Sender's email ID needs to be mentioned
		String senderId = Configuration.getSenderId();
		String password = Configuration.getPassword();
		String host = Configuration.getHostId();

		// Get system properties
		Properties properties = System.getProperties();

		// Setup mail server
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		// Get the Session object.// and pass
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(senderId, password);
			}
		});
		// session.setDebug(true);
		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(senderId));

			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientId));

			// Set Subject: header field
			message.setSubject("Order Received From Bookstagram!");

			Multipart multipart = new MimeMultipart();

			

			MimeBodyPart textPart = new MimeBodyPart();

			try {
				textPart.setText("Thank you so much for purchasing books! "
						+ "We recommend you to subscribe now to our community and avail upto 12 free books");
				multipart.addBodyPart(textPart);
				for(String fileName : files) {
					File f = new File("/tmp/"+fileName);
					MimeBodyPart attachmentPart = new MimeBodyPart();
					attachmentPart.attachFile(f);
					multipart.addBodyPart(attachmentPart);
				}
				
			} catch (IOException e) {

				e.printStackTrace();

			}
			message.setContent(multipart);
			log.info("sending...");
			// Send message
			Transport.send(message);
			log.info("Sent message successfully....");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}


}
