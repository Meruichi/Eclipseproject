package evaluation;

public class EvaluationDTO {

	int evaluationID;
	String userID;
	String championName;
	String championSeason;
	String championDivide;
	String evaluationTitle;
	String evaluationContent;
	String totalScore;
	String laneScore;
	String teamFightScore;
	int recommendCount;
	
	public int getEvaluationID() {
		return evaluationID;
	}
	public void setEvaluationID(int evaluationId) {
		this.evaluationID = evaluationId;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getChampionName() {
		return championName;
	}
	public void setChampionName(String championName) {
		this.championName = championName;
	}
	public String getChampionSeason() {
		return championSeason;
	}
	public void setChampionSeason(String championSeason) {
		this.championSeason = championSeason;
	}
	public String getChampionDivide() {
		return championDivide;
	}
	public void setChampionDivide(String championDivide) {
		this.championDivide = championDivide;
	}
	public String getEvaluationTitle() {
		return evaluationTitle;
	}
	public void setEvaluationTitle(String evaluationTitle) {
		this.evaluationTitle = evaluationTitle;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getLaneScore() {
		return laneScore;
	}
	public void setLaneScore(String laneScore) {
		this.laneScore = laneScore;
	}
	public String getTeamFightScore() {
		return teamFightScore;
	}
	public void setTeamFightScore(String teamFightScore) {
		this.teamFightScore = teamFightScore;
	}
	public int getRecommendCount() {
		return recommendCount;
	}
	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}
	
	public EvaluationDTO() {}
	
	public EvaluationDTO(int evaluationID, String userID, String championName, String championSeason,
			String championDivide, String evaluationTitle, String evaluationContent, String totalScore,
			String laneScore, String teamFightScore, int recommendCount) {
		super();
		this.evaluationID = evaluationID;
		this.userID = userID;
		this.championName = championName;
		this.championSeason = championSeason;
		this.championDivide = championDivide;
		this.evaluationTitle = evaluationTitle;
		this.evaluationContent = evaluationContent;
		this.totalScore = totalScore;
		this.laneScore = laneScore;
		this.teamFightScore = teamFightScore;
		this.recommendCount = recommendCount;
	}
	
	
	
}
