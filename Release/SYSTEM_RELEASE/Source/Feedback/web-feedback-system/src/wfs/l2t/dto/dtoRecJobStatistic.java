package wfs.l2t.dto;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class dtoRecJobStatistic extends dtoJob {
	Timestamp time= null;
	int numberRating=0;
	int fiveStarRating=0;
	int fourStarRating=0;
	int threeStarRating=0;
	int twoStarRating=0;
	int oneStarRating=0;
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

	//làm tiếp danh sách người dùng đánh giá công việc này
	public int getFourStarRating() {
		return fourStarRating;
	}

	public void setFourStarRating(int fourStarRating) {
		this.fourStarRating = fourStarRating;
	}

	public int getThreeStarRating() {
		return threeStarRating;
	}

	public void setThreeStarRating(int threeStarRating) {
		this.threeStarRating = threeStarRating;
	}

	public int getTwoStarRating() {
		return twoStarRating;
	}

	public void setTwoStarRating(int twoStarRating) {
		this.twoStarRating = twoStarRating;
	}

	public int getOneStarRating() {
		return oneStarRating;
	}

	public void setOneStarRating(int oneStarRating) {
		this.oneStarRating = oneStarRating;
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

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}


}
