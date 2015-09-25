package wfs.l2t.sendmail;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;

public class SendMail {

	public SendMail() {
	}

	public void Send(String name, String mail, String link) {
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date dateobj = new Date();
		String time = df.format(dateobj);
		String host = "smtp.gmail.com";
		String port = "587";
		String userName = "uit.recsys@gmail.com";
		String password = "l2t_recsys";
		String toAddress = mail;
		String subject = "Mời bạn tham gia khảo sát hệ thống";
		String message = "Chào "
				+ name
				+ "!<br><br>"
				+ "Chúng tôi gửi bạn trang khảo sát này để mong nhận được sự phản hồi từ bạn. <br>"
				+ "Mong bạn bỏ chút thời gian đánh giá để chúng tôi hoàn thiện hệ thống và để phục vụ bạn tốt hơn! <br>"
				+ "Link khảo sát:" + link
				+ "<br>Cảm ơn bạn đã quan tâm.<br> Trân trọng!" +
				"<br><br> Đã gửi vào lúc "+ time + ", từ uit.jobrec";

		try {
			EmailUtility.sendEmail(host, port, userName, password, toAddress,
					subject, message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
