package wfs.l2t.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class dtoRecJobStatistic extends dtoJob {
	String time= null;
	int numberRating=0;
	int fiveStarRating=0;
	List<dtoAccount> userRateOneStar;
	List<dtoAccount> userRateTwoStar;
	List<dtoAccount> userRateThreeStar;
	List<dtoAccount> userRateFourStar;
	List<dtoAccount> userRateFiveStar;
	public List<dtoAccount> getUserRateOneStar() {
		return userRateOneStar;
	}

	public void setUserRateOneStar(List<dtoAccount> userRateOneStar) {
		this.userRateOneStar=new ArrayList<dtoAccount>();
		for(dtoAccount acc : userRateOneStar)
		{
			this.userRateOneStar.add(acc);
		}
	}

	public List<dtoAccount> getUserRateTwoStar() {
		return userRateTwoStar;
	}

	public void setUserRateTwoStar(List<dtoAccount> userRateTwoStar) {
		this.userRateTwoStar=new ArrayList<dtoAccount>();
		for(dtoAccount acc : userRateTwoStar)
		{
			this.userRateTwoStar.add(acc);
		}
	}

	public List<dtoAccount> getUserRateThreeStar() {
		return userRateThreeStar;
	}

	public void setUserRateThreeStar(List<dtoAccount> userRateThreeStar) {
		this.userRateThreeStar=new ArrayList<dtoAccount>();
		for(dtoAccount acc : userRateThreeStar)
		{
			this.userRateThreeStar.add(acc);
		}
	}

	public List<dtoAccount> getUserRateFourStar() {
		return userRateFourStar;
	}

	public void setUserRateFourStar(List<dtoAccount> userRateFourStar) {
		this.userRateFourStar=new ArrayList<dtoAccount>();
		for(dtoAccount acc : userRateFourStar)
		{
			this.userRateFourStar.add(acc);
		}
	}

	public List<dtoAccount> getUserRateFiveStar() {
		return userRateFiveStar;
	}

	public void setUserRateFiveStar(List<dtoAccount> userRateFiveStar) {
		this.userRateFiveStar=new ArrayList<dtoAccount>();
		for(dtoAccount acc : userRateFiveStar)
		{
			this.userRateFiveStar.add(acc);
		}
	}

	

	public int getNumberRating() {
		return numberRating;
	}

	public void setNumberRating(int numberRating) {
		this.numberRating = numberRating;
	}

	public int getFiveStarRating() {
		return fiveStarRating;
	}

	public void setFiveStarRating(int fiveStarRating) {
		this.fiveStarRating = fiveStarRating;
	}

	public String getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = new SimpleDateFormat("dd/MM/yyyy").format(time);
	}


}
