package wfs.l2t.model;

import wfs.l2t.dto.dtoJobRecommended;

public interface IModelJobRecommended {
	public void update(dtoJobRecommended jobRec);
	public boolean checkIfExist(String jobId, String accountId);
	public String countJobRated(String userId);
}
