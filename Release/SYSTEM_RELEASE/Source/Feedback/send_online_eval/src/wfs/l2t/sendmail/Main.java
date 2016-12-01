package wfs.l2t.sendmail;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream.GetField;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import wfs.l2t.dao.DAOAccount;
import wfs.l2t.dao.DAOConnection;
import wfs.l2t.dao.DAOJob;
import wfs.l2t.dto.dtoAccount;
import wfs.l2t.dto.dtoJob;

public class Main {

	public static void Send(String email) {
		Md5Utility md5 = new Md5Utility();
		DAOAccount daoAccount = new DAOAccount();		
		List<dtoAccount> accountList = daoAccount.getAccountByEmail(email);
		Random rand = new Random();
		SendMail mail = new SendMail();
		for (dtoAccount ac : accountList) {									
				int ck = rand.nextInt();
				String token = ac.email + ac.password + ck;
				token = md5.md5(token);
				token = md5.md5(token);
				String link = context + "id=" + ac.accountId + "&token=" + token + "&ck=" + ck;				
				mail.Send(ac.userName, ac.email, link);
				System.out.print("\nSend mail to " + ac.email);			
		}
	}

	public static String context = "";

	private static String getContextPath() throws IOException {
		String path = null;
		FileReader reader = new FileReader("config.txt");
		BufferedReader in = new BufferedReader(reader);
		path = in.readLine();
		in.close();
		return path;
	}

	public static void main(String[] args) {

		if (args.length > 0) {

			if (DAOConnection.init()) {
				try {
					System.out.print("\nTry to get context path!");
					context = getContextPath();
					if (context != null) {
						System.out.print("\nGet context path successfully!");
						DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
						System.out.print("\nStarting send email!");

						Send(args[0]);

						System.out.print("\nDone!");
					} else {
						System.out.print("\nCann't get context path!");
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					System.out.print("\nConfig file not found!");
				}
			} else {
				System.out.print("\nmysql_config file not found!");
			}
		}
		else
		{
			
			System.out.println("Don't have args");
		}

	}

}
