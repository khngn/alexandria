/**
 * 
 */
package au.gov.nla.khn.alexandria.model;

/**
 * @author K.H.Nguyen
 *
 */
public class Person {

	private int id;
	private String name, phoneNumber, email;
	
	public Person() {}
	
	public Person(int id, String name, String phoneNumber, String email) {
		this.id = id;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.email = email;
	}
	
	public Person(String name, String phoneNumber, String email) {
		this(0, name, phoneNumber, email);
	}
	
	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public String getEmail() {
		return email;
	}
	
	public boolean isValid() {
		return (name != null) && (!name.isEmpty()) && (phoneNumber != null)
				&& (!phoneNumber.isEmpty()) && (email != null)
				&& (!email.isEmpty()); 
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
