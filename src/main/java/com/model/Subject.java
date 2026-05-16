package com.model;


public class Subject {

    private int sub_id;
    private String sub_name;
    private String sub_code;
    private String sub_abbr;
    private String subject_type;
    private String sem;
    private int dept_id;
    private int fac_id;
    private int frequency;
    

   

	public Subject() {
		
	}
    
    
	public Subject(String sub_name, String sub_code, String sub_abbr, String subject_type, String sem, int dept_id,int fac_id , int frequency) {
		
		this.sub_name = sub_name;
		this.sub_code = sub_code;
		this.sub_abbr = sub_abbr;
		this.subject_type = subject_type;
		this.sem = sem;
		this.dept_id = dept_id;
		this.fac_id=fac_id;
		this.frequency = frequency;
	}


	public Subject(int sub_id, String sub_name, String sub_code, String sub_abbr, String subject_type, String sem,
			int dept_id,int fac_id , int frequency) {
		this.sub_id = sub_id;
		this.sub_name = sub_name;
		this.sub_code = sub_code;
		this.sub_abbr = sub_abbr;
		this.subject_type = subject_type;
		this.sem = sem;
		this.dept_id = dept_id;
		this.fac_id=fac_id;
		this.frequency = frequency;
		
	}
	public int getSub_id() { return sub_id; }
    public void setSub_id(int sub_id) { this.sub_id = sub_id; }

    public String getSub_name() { return sub_name; }
    public void setSub_name(String sub_name) { this.sub_name = sub_name; }

    public String getSub_code() { return sub_code; }
    public void setSub_code(String sub_code) { this.sub_code = sub_code; }

    public String getSub_abbr() { return sub_abbr; }
    public void setSub_abbr(String sub_abbr) { this.sub_abbr = sub_abbr; }

    public String getSubject_type() { return subject_type; }
    public void setSubject_type(String subject_type) { this.subject_type = subject_type; }

    public String getSem() { return sem; }
    public void setSem(String sem) { this.sem = sem; }

    public int getDept_id() { return dept_id; }
    public void setDept_id(int dept_id) { this.dept_id = dept_id; }
    
    public int getFac_id() {
		return fac_id;
	}


	public void setFac_id(int fac_id) {
		this.fac_id = fac_id;
	}
 
	 public int getFrequency() {
			return frequency;
		}


		public void setFrequency(int frequency) {
			this.frequency = frequency;
		}

}

