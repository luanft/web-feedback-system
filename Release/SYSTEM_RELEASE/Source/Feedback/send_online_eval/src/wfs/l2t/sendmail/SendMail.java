package wfs.l2t.sendmail;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import wfs.l2t.dto.dtoAccount;
import wfs.l2t.dto.dtoJob;

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
		String subject = "[Hệ thống khuyến nghị việc làm] Mời bạn thực hiện khảo sát";
		String message = "";
		try {
			File fileDir = new File("mail/body.txt");
			BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(fileDir), "UTF8"));
			String str;
			while ((str = in.readLine()) != null) {				
				message += str;
			}
			in.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		message = message.replace("{name}", name);
		message = message.replace("{link}", link);
		try {
			EmailUtility.sendEmail(host, port, userName, password, mailReceive, subject, message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
