package pojo;

public class users {
	private String username;
	private String password;
	private String userType;
	
	public users() {
		super();
	}
	
	public users(String username,String password,String userType) {
		super();
		this.username=username;
		this.password=password;
		this.userType=userType;
	}
	
	public String getUsername() {
		return username;
	}
	public String setUsername(String username) {
		return this.username=username;
	}
	
	public String getPassword() {
		return password;
	}
	public String setPassword(String password) {
		return this.password=password;
	}
	
	public String getUserType() {
		return userType;
	}
	public String setUserType(String userType) {
		return this.userType=userType;
	}
}
