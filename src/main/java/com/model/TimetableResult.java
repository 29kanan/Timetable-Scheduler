package com.model;

import java.util.List;

public class TimetableResult {
    // A list of all scheduled slots
    private List<TimetableSlot> scheduledSlots; 
    
    private String semesterType;
    
    // ... getters and setters
	public List<TimetableSlot> getScheduledSlots() {
		return scheduledSlots;
	}
	public void setScheduledSlots(List<TimetableSlot> scheduledSlots) {
		this.scheduledSlots = scheduledSlots;
	}
	public String getSemesterType() {
		return semesterType;
	}
	public void setSemesterType(String semesterType) {
		this.semesterType = semesterType;
	}
	
	public String toString() {

        StringBuilder sb = new StringBuilder();
        sb.append("--- ").append(" Schedule ---\n");
        
        // Loop through the list of TimeSlot objects
        for (int i = 0; i < scheduledSlots.size(); i++) {
            TimetableSlot slot = scheduledSlots.get(i);
            
            // Check if the slot is null (e.g., if you convert the 2D array row to a list
            // and the later slots are empty)
            if (slot == null) {
                sb.append("Slot ").append(i + 1).append(": -- End of Day --\n");
                break;
            }
            
            // Append the formatted output for each TimeSlot
            sb.append(slot).append("\n");
        }

        return sb.toString();
    }
}
