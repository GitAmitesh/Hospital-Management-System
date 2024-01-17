package pojo;

public class patients {
	private String name;
	private String username;
	private String email;
	private long phone;
	private String fatherName;
	private String city;
	private String address;
	private String dob;
	private int age;
	private String gender;
	private String bloodGroup;
	private String disease;
	
	public patients() {
		super();
	}
	
	public patients(String name, String username,String email,long phone,String fatherName,String city,String address,String dob,int age,String gender,String bloodGroup,String disease) {
		super();
		this.name=name;
		this.username=username;
		this.email=email;
		this.phone=phone;
		this.fatherName=fatherName;
		this.city=city;
		this.address=address;
		this.dob=dob;
		this.age=age;
		this.gender=gender;
		this.bloodGroup=bloodGroup;
		this.disease=disease;
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
	
	public String getFatherName() {
		return fatherName;
	}
	public String setFatherName(String fatherName) {
		return this.fatherName=fatherName;
	}
	
	public String getCity() {
		return city;
	}
	public String setCity(String city) {
		return this.city=city;
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
	
	public int getAge() {
		return age;
	}
	public int setAge(int age) {
		return this.age=age;
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
	
	public String getDisease() {
		return disease;
	}
	public String setDisease(String disease) {
		return this.disease=disease;
	}
}
