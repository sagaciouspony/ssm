package cn.tjut.beans;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;

public class Employee {
    
	private Integer id;
    
    //数据校验
    @Pattern(message="后端:用户名格式不正确",regexp="(^[a-zA-Z0-9_-]{4,10}$)|(^[\\u2E80-\\u9FFF]{2,4}$)")
    private String pname;

    private String gender;

    @Email(message="后端:邮箱格式不正确")
    private String email;

    private Integer did;
    
    private Department department; 
    
	public Employee() {
		super();
	}

	public Employee(String pname, String gender, String email, Integer did) {
		super();
		this.pname = pname;
		this.gender = gender;
		this.email = email;
		this.did = did;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", pname=" + pname + ", gender=" + gender + ", email=" + email + ", department="
				+ department + "]";
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }
}