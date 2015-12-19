package wfs.l2t.dto;

import java.util.ArrayList;
import java.util.List;

public class dtoAccountStatistic extends dtoAccount {
	private int numberJobSent=0;
	private int numberJobRated=0;
	int rateFiveStar=0;
	int rateFourStar=0;
	int rateThreeStar=0;
	int rateTwoStar=0;
	int rateOneStar=0;
	List<dtoRecJobStatistic> listRecJob;
	public List<dtoRecJobStatistic> getListRecJob() {
		
		return listRecJob;
	}
	public void setListRecJob(List<dtoRecJobStatistic> listRecJob) {
		this.listRecJob= new ArrayList<dtoRecJobStatistic>();
		this.listRecJob.addAll(listRecJob);
	}
	public int getRateFiveStar() {
		return rateFiveStar;
	}
	public void setRateFiveStar(int rateFiveStar) {
		this.rateFiveStar = rateFiveStar;
	}
	public int getRateFourStar() {
		return rateFourStar;
	}
	public void setRateFourStar(int rateFourStar) {
		this.rateFourStar = rateFourStar;
	}
	public int getRateThreeStar() {
		return rateThreeStar;
	}
	public void setRateThreeStar(int rateThreeStar) {
		this.rateThreeStar = rateThreeStar;
	}
	public int getRateTwoStar() {
		return rateTwoStar;
	}
	public void setRateTwoStar(int rateTwoStar) {
		this.rateTwoStar = rateTwoStar;
	}
	public int getRateOneStar() {
		return rateOneStar;
	}
	public void setRateOneStar(int rateOneStar) {
		this.rateOneStar = rateOneStar;
	}
	public int getNumberJobSent() {
		return numberJobSent;
	}
	public void setNumberJobSent(int numberJobSent) {
		this.numberJobSent = numberJobSent;
	}
	public int getNumberJobRated() {
		return numberJobRated;
	}
	public void setNumberJobRated(int numberJobRate) {
		this.numberJobRated = numberJobRate;
	}
}
