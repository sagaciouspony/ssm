package cn.tjut.beans;

public class Department {
    private Integer did;

    private String dname;
    
    @Override
	public String toString() {
		return "Department [did=" + did + ", dname=" + dname + "]";
	}

	public Department() {
		super();
	}

	public Department(Integer did, String dname) {
		super();
		this.did = did;
		this.dname = dname;
	}

	public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }
}