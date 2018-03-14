package pojo;

public class Address {
    private Integer defaultAddress;
    private Integer aid;
    private String name;
    private String other;
    private String user;
    private String phone;
    private Integer uid;
	public Integer getDefaultAddress() {
		return defaultAddress;
	}
	public void setDefaultAddress(Integer defaultAddress) {
		this.defaultAddress = defaultAddress;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	
    public String toString(){
        return name+other+""+user+""+phone;
    }
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
