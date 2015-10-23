package wfs.l2t.sendmail;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;

import wfs.l2t.dto.dtoAccount;

public class SendMail {

	public SendMail() {
	}

	public void Send(String name, String mailReceive, String link) {
		new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		new Date();
		String host = "smtp.gmail.com";
		String port = "587";
		String userName = "uit.recsys@gmail.com";
		String password = "l2t_recsys";		
		String subject = "Thông báo việc làm";
		String message = "";
		String header = "";
		String body1 = "";
		String body2 = "";
		String footer = "";
		
	    try {
	        BufferedReader in = new BufferedReader(new FileReader("header.txt"));
	        String str;
	        while ((str = in.readLine()) != null) {
	            header +=str;
	        }
	        in.close();
	    } catch (IOException e) {
	    }
	    try {
	        BufferedReader in = new BufferedReader(new FileReader("body1.txt"));
	        String str;
	        while ((str = in.readLine()) != null) {
	            body1 +=str;
	        }
	        in.close();
	    } catch (IOException e) {
	    }
	    try {
	        BufferedReader in = new BufferedReader(new FileReader("body2.txt"));
	        String str;
	        while ((str = in.readLine()) != null) {
	            body2 +=str;
	        }
	        in.close();
	    } catch (IOException e) {
	    }
	    try {
	        BufferedReader in = new BufferedReader(new FileReader("footer.txt"));
	        String str;
	        while ((str = in.readLine()) != null) {
	            footer +=str;
	        }
	        in.close();
	    } catch (IOException e) {
	    }
	    message = header + name + body1 + "10 " + body2 + link + footer;
		try {
			EmailUtility.sendEmail(host, port, userName, password, mailReceive, subject, message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
