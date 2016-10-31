package wfs.l2t.model;

import java.util.List;

import wfs.l2t.dto.dtoJob;

public interface IModelJob {
	public List<dtoJob> getJobRecommended(String userId, int offset);
	public String trimAll(String txt);
	public String getShortDescription(String jobId);
}
