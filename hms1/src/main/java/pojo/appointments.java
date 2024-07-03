package pojo;

public class appointments {
	private String puname;
	private String duname;
	private String date;
	private String time;
	private String status;
	
	public appointments() {
		super();
	}
	
	public appointments(String puname,String duname,String date, String time, String status) {
		super();
		this.puname=puname;
		this.duname=duname;
		this.date=date;
		this.time=time;
		this.status=status;
	}
	
	public String getPuname() {
		return puname;
	}
	public String setPuname(String puname) {
		return this.puname=puname;
	}
	
	public String getDuname() {
		return duname;
	}
	public String setDuname(String duname) {
		return this.duname=duname;
	}
	
	public String getDate() {
		return date;
	}
	public String setDate(String date) {
		return this.date=date;
	}
	
	public String getTime() {
		return time;
	}
	public String setTime(String time) {
		return this.time=time;
	}
	
	public String getStatus() {
		return status;
	}
	public String setStatus(String status) {
		return this.status=status;
	}

}
