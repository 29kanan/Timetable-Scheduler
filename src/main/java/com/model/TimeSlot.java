package com.model;

import java.time.*;

public class TimeSlot implements Cloneable{

	private LocalTime startTime;
	private LocalTime endTime;
	private boolean isMarked=false;
	
	
	public LocalTime getStartTime() {
		return startTime;
	}
	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}
	public LocalTime getEndTime() {
		return endTime;
	}
	public void setEndTime(LocalTime endTime) {
		this.endTime = endTime;
	}
	public boolean isMarked() {
		return isMarked;
	}
	public void setMarked(boolean isMarked) {
		this.isMarked = isMarked;
	}
	
	@Override
    public String toString() {
        return "TimeSlot{" +
                "start=" + startTime +
                ", end=" + endTime +
                '}';
    }
	
	@Override
    public TimeSlot clone() {
        try {
            TimeSlot cloned = (TimeSlot) super.clone();
            // LocalTime is immutable, so no need to clone it
            return cloned;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }
	
}
