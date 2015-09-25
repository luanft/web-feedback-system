package wfs.l2t.sendmail;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import wfs.l2t.dao.DAOAccount;
import wfs.l2t.dao.DAOJob;
import wfs.l2t.dto.dtoAccount;
import wfs.l2t.dto.dtoJob;

public class Main {

	public static void sendDaily() {
		Md5Utility md5 = new Md5Utility();
		String context = "http://localhost:8080/web-feedback-system/recommendation?";
		DAOAccount daoAccount = new DAOAccount();
		DAOJob daoJob = new DAOJob();
		List<dtoAccount> accountList = daoAccount.getAllAccount("daily");
		Random rand = new Random();
		SendMail mail = new SendMail();
		for (dtoAccount ac : accountList) {
			List<dtoJob> jobRec = daoJob.getJobByCategory(ac);
			daoJob.addRecommendationJobs(jobRec, ac.accountId);
			int ck = rand.nextInt();
			String token = ac.email + ac.password + ck;
			token = md5.md5(token);
			token = md5.md5(token);
			String link = context + "id=" + ac.accountId + "&token=" + token
					+ "&ck=" + ck;
			mail.Send(ac.userName, ac.email, link);
		}
	}

	public static void sendWeekly() {
		Md5Utility md5 = new Md5Utility();
		String context = "http://localhost:8080/web-feedback-system/recommendation?";
		DAOAccount daoAccount = new DAOAccount();
		DAOJob daoJob = new DAOJob();
		List<dtoAccount> accountList = daoAccount.getAllAccount("weekly");
		Random rand = new Random();
		SendMail mail = new SendMail();
		for (dtoAccount ac : accountList) {
			List<dtoJob> jobRec = daoJob.getJobByCategory(ac);
			daoJob.addRecommendationJobs(jobRec, ac.accountId);
			int ck = rand.nextInt();
			String token = ac.email + ac.password + ck;
			token = md5.md5(token);
			token = md5.md5(token);
			String link = context + "id=" + ac.accountId + "&token=" + token
					+ "&ck=" + ck;
			mail.Send(ac.userName, ac.email, link);
		}
	}

	public static void sendMonthly() {
		Md5Utility md5 = new Md5Utility();
		String context = "http://localhost:8080/web-feedback-system/recommendation?";
		DAOAccount daoAccount = new DAOAccount();
		DAOJob daoJob = new DAOJob();
		List<dtoAccount> accountList = daoAccount.getAllAccount("monthly");
		Random rand = new Random();
		SendMail mail = new SendMail();
		for (dtoAccount ac : accountList) {
			List<dtoJob> jobRec = daoJob.getJobByCategory(ac);
			daoJob.addRecommendationJobs(jobRec, ac.accountId);
			int ck = rand.nextInt();
			String token = ac.email + ac.password + ck;
			token = md5.md5(token);
			token = md5.md5(token);
			String link = context + "id=" + ac.accountId + "&token=" + token
					+ "&ck=" + ck;
			mail.Send(ac.userName, ac.email, link);
		}
	}

	public static void main(String[] args) {

		DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date dateobj = new Date();
		if (dateobj.getDay() == Calendar.MONDAY) {
			sendWeekly();
		}
		if (dateobj.getDate() == 1) {
			sendMonthly();
		}		
		sendDaily();
		System.out.print("\nDone!");
	}

}
