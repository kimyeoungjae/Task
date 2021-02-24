package model;

public class DTO {
	
	private String current_dt;
	private String camera_id;
	private String object_id;
	private String activity;
	private String feed;
	private String drinking;
	
	public DTO(String current_dt, String camera_id, String object_id, String activity, String feed, String drinking) {
		this.current_dt = current_dt;
		this.camera_id = camera_id;
		this.object_id = object_id;
		this.activity = activity;
		this.feed = feed;
		this.drinking = drinking;
	}
	
	public DTO(String camera_id, String object_id) {
		this.camera_id = camera_id;
		this.object_id = object_id;
	}
	
	public String getCurrent_dt() {
		return current_dt;
	}
	public void setCurrent_dt(String current_dt) {
		this.current_dt = current_dt;
	}
	public String getCamera_id() {
		return camera_id;
	}
	public void setCamera_id(String camera_id) {
		this.camera_id = camera_id;
	}
	public String getObject_id() {
		return object_id;
	}
	public void setObject_id(String object_id) {
		this.object_id = object_id;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getFeed() {
		return feed;
	}
	public void setFeed(String feed) {
		this.feed = feed;
	}
	public String getDrinking() {
		return drinking;
	}
	public void setDrinking(String drinking) {
		this.drinking = drinking;
	}
	
	
	
	

}
