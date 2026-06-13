package com.model;

public class Classes_name {

    private int classId;
    private String className;
    private String sem;
    private int deptId;

    public Classes_name() {
    }

    public Classes_name(int classId, String className, String sem, int deptId) {
        this.classId = classId;
        this.className = className;
        this.sem = sem;
        this.deptId = deptId;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getSem() {
        return sem;
    }

    public void setSem(String sem) {
        this.sem = sem;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }
}
