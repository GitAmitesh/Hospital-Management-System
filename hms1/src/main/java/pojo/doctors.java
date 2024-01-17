package pojo;

public class doctors {
	private String name;
	private String username;
	private String email;
	private long phone;
	private String address;
	private String dob;
	private String gender;
	private String bloodGroup;
	private String specialisation;
	
	public doctors() {
		super();
	}
	
	public doctors(String name, String username,String email,long phone,String address,String dob,String gender,String bloodGroup,String specialisation) {
		super();
		this.name=name;
		this.username=username;
		this.email=email;
		this.phone=phone;
		this.address=address;
		this.dob=dob;
		this.gender=gender;
		this.bloodGroup=bloodGroup;
		this.specialisation=specialisation;
	}
	
	public String getName() {
		return name;
	}
	public String setName(String name) {
		return this.name=name;
	}
	
	public String getUsername() {
		return username;
	}
	public String setUsername(String username) {
		return this.username=username;
	}
	
	public String getEmail() {
		return email;
	}
	public String setEmail(String email) {
		return this.email=email;
	}
	
	public long getPhone() {
		return phone;
	}
	public long setPhone(long phone) {
		return this.phone=phone;
	}
	
	public String getAddress() {
		return address;
	}
	public String setAddress(String address) {
		return this.address=address;
	}
	
	public String getDob() {
		return dob;
	}
	public String setDob(String dob) {
		return this.dob=dob;
	}
	
	public String getGender() {
		return gender;
	}
	public String setGender(String gender) {
		return this.gender=gender;
	}
	
	public String getBloodGroup() {
		return bloodGroup;
	}
	public String setBloodGroup(String bloodGroup) {
		return this.bloodGroup=bloodGroup;
	}
	
	public String getSpecialisation() {
		return specialisation;
	}
	public String setSpecialisation(String specialisation) {
		return this.specialisation=specialisation;
	}
}
