package com.algorithm;

import com.dao.LectureDetailsDAO;
import java.util.LinkedHashMap;
import java.util.Map;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.model.AlgorithmInputModel;
import com.model.LectureDetailsImpl;
import com.model.LectureDetailsTO;
import com.model.TimeSlot;
import com.model.TimetableFormInputDTO;
import com.model.TimetableResult;
import com.model.TimetableSlot;
import com.dao.LectureDetailsDAOImpl;

public class TimetableGenerator {
	
	static LectureDetailsDAO ldao=new LectureDetailsDAOImpl();

	static int totalFaculty = ldao.getTotalFaculty("odd");
	
	public static boolean isFacultyAvailable(TimeSlot[][] facultySlots, int facultyId, int slotIndex) {
	    if (facultyId <= 0 || facultyId > totalFaculty) {
	        return false;
	    }
	    return !facultySlots[facultyId - 1][slotIndex].isMarked();
	}

	// Mark faculty as busy on a specific slot
	public static void markFacultyBusy(TimeSlot[][] facultySlots, int facultyId, int slotIndex) {
	    if (facultyId > 0 && facultyId <= facultySlots.length) {
	    	facultySlots[facultyId - 1][slotIndex].setMarked(true);
	    }
	}
	
	public static TimeSlot[][][] createWeeklyLecSlotsWithClone(TimeSlot[][] templateLecSlots) {
	    
	    TimeSlot[][][] weeklyLecSlots = new TimeSlot[6][8][8];
	    
	    for (int dayIdx = 0; dayIdx < 6; dayIdx++) {
	        for (int classIdx = 0; classIdx < 8; classIdx++) {
	            for (int slotIdx = 0; slotIdx < 8; slotIdx++) {
	                weeklyLecSlots[dayIdx][classIdx][slotIdx] = 
	                    templateLecSlots[classIdx][slotIdx].clone();
	            }
	        }
	    }
	    
	    return weeklyLecSlots;
	}
	
	public static TimeSlot[][][] createWeeklyFacultySlotsWithClone(TimeSlot[][] templateFacultySlots) {
	    
	    TimeSlot[][][] weeklyLecSlots = new TimeSlot[6][totalFaculty][8];
	    
	    for (int dayIdx = 0; dayIdx < 6; dayIdx++) {
	        for (int facultyIdx = 0; facultyIdx < totalFaculty; facultyIdx++) {
	            for (int slotIdx = 0; slotIdx < 8; slotIdx++) {
	                weeklyLecSlots[dayIdx][facultyIdx][slotIdx] = 
	                	templateFacultySlots[facultyIdx][slotIdx].clone();
	            }
	        }
	    }
	    return weeklyLecSlots;
	}
	
	public static TimeSlot[][] buildLectureSlots(TimetableFormInputDTO tdto) {
		
		TimeSlot[][] LecSlots=new TimeSlot[8][6+tdto.getNumOfBreaks()];
		
		final LocalTime START_TIME = LocalTime.of(10, 15);
        final int NUM_OF_LECTURES_PER_DAY = 6;
        
        final int LEC_DURATION = tdto.getLecDuration();       
        final int NUM_OF_BREAKS = tdto.getNumOfBreaks();     
        final int[] BREAKS_DURATIONS_ARRAY = tdto.getBreaksDuration();
        
        final int BREAK_FREQUENCY = (NUM_OF_BREAKS > 0) 
                ? NUM_OF_LECTURES_PER_DAY / (NUM_OF_BREAKS + 1)
                : NUM_OF_LECTURES_PER_DAY;
        
        LocalTime currentTime = START_TIME;
        int lectureCounter = 0; 
        int breakCounter = 0;   
        
        for (int slotIndex = 0; slotIndex < 8; slotIndex++) {
            
            if (lectureCounter >= NUM_OF_LECTURES_PER_DAY && breakCounter >= NUM_OF_BREAKS) {
                break; 
            }
            
            boolean isBreakTime = (breakCounter < NUM_OF_BREAKS) && 
                    (lectureCounter == (breakCounter + 1) * BREAK_FREQUENCY);
            
            if(isBreakTime) {
            	int currentBreakDuration = BREAKS_DURATIONS_ARRAY[breakCounter];
            	LocalTime breakEnd=currentTime.plusMinutes(currentBreakDuration);
            	
            	for (int classIndex = 0; classIndex < 8; classIndex++) {
            	    TimeSlot breakSlot = new TimeSlot();
            	    breakSlot.setStartTime(currentTime);
            	    breakSlot.setEndTime(breakEnd);
            	    breakSlot.setMarked(true);
            	    LecSlots[classIndex][slotIndex] = breakSlot;
            	}
            	
            	currentTime = breakEnd; 
                breakCounter++;
        	}
            else if(lectureCounter < NUM_OF_LECTURES_PER_DAY) {
                LocalTime lectureEnd = currentTime.plusMinutes(LEC_DURATION);
                
                for (int classIndex = 0; classIndex < 8; classIndex++) {
                    TimeSlot lectureSlot = new TimeSlot(); // ← NEW object per class
                    lectureSlot.setStartTime(currentTime);
                    lectureSlot.setEndTime(lectureEnd);
                    LecSlots[classIndex][slotIndex] = lectureSlot;
                }
                
                currentTime = lectureEnd;
                lectureCounter++;
            }
        }
        
		return LecSlots;
		
	}
	

	public static TimeSlot[][] buildFacultySlots(TimetableFormInputDTO tdto) {
	    
	    TimeSlot[][] FacultySlots = new TimeSlot[totalFaculty][8];
	    
	    final LocalTime START_TIME = LocalTime.of(10, 15);
	    final int NUM_OF_LECTURES_PER_DAY = 6;
	    
	    final int LEC_DURATION = tdto.getLecDuration();       
	    final int NUM_OF_BREAKS = tdto.getNumOfBreaks();     
	    final int[] BREAKS_DURATIONS_ARRAY = tdto.getBreaksDuration();
	    
	    final int BREAK_FREQUENCY = (NUM_OF_BREAKS > 0) 
	            ? NUM_OF_LECTURES_PER_DAY / (NUM_OF_BREAKS + 1)
	            : NUM_OF_LECTURES_PER_DAY;
	    
	    LocalTime currentTime = START_TIME;
	    int lectureCounter = 0; 
	    int breakCounter = 0;   
	    
	    for (int slotIndex = 0; slotIndex < 8; slotIndex++) {
	        
	        if (lectureCounter >= NUM_OF_LECTURES_PER_DAY && breakCounter >= NUM_OF_BREAKS) {
	            break; 
	        }
	        
	        boolean isBreakTime = (breakCounter < NUM_OF_BREAKS) && 
	                (lectureCounter == (breakCounter + 1) * BREAK_FREQUENCY);
	        
	        if(isBreakTime) {
	            int currentBreakDuration = BREAKS_DURATIONS_ARRAY[breakCounter];
	            LocalTime breakEnd = currentTime.plusMinutes(currentBreakDuration);
	            
	            // CREATE SEPARATE TimeSlot FOR EACH FACULTY
	            for (int facultyIndex = 0; facultyIndex < totalFaculty; facultyIndex++) {
	                TimeSlot breakSlot = new TimeSlot();  // ← NEW object each time
	                breakSlot.setStartTime(currentTime);
	                breakSlot.setEndTime(breakEnd);
	                FacultySlots[facultyIndex][slotIndex] = breakSlot;
	            }
	            
	            currentTime = breakEnd; 
	            breakCounter++;
	        }
	        else if(lectureCounter < NUM_OF_LECTURES_PER_DAY) {
	            LocalTime lectureEnd = currentTime.plusMinutes(LEC_DURATION);
	            
	            // CREATE SEPARATE TimeSlot FOR EACH FACULTY
	            for (int facultyIndex = 0; facultyIndex < totalFaculty; facultyIndex++) {
	                TimeSlot lectureSlot = new TimeSlot();  // ← NEW object each time
	                lectureSlot.setStartTime(currentTime);
	                lectureSlot.setEndTime(lectureEnd);
	                FacultySlots[facultyIndex][slotIndex] = lectureSlot;
	            }
	            
	            currentTime = lectureEnd;
	            lectureCounter++;
	        }
	    }
	    
	    return FacultySlots;
	}

	public static void assignLectures(AlgorithmInputModel model, String[] days, TimeSlot[][] FacultySlots, List<List<TimetableSlot>> ttSlotWeeklyList) {

	    List<LectureDetailsImpl> allLectures = model.getAllLectures();

	    // Group lectures by className (preserves insertion order)
	    Map<Integer, List<LectureDetailsImpl>> lecturesByClass = new LinkedHashMap<>();
	    for (LectureDetailsImpl lec : allLectures) {
	        lecturesByClass.computeIfAbsent(lec.getClassId(), k -> new ArrayList<>()).add(lec);
	    }

	    List<Integer> classOrder = new ArrayList<>(lecturesByClass.keySet());

	    // Track remaining frequency per subject per class
	    Map<Integer, Map<String, Integer>> freqTracker = new LinkedHashMap<>();
	    for (Map.Entry<Integer, List<LectureDetailsImpl>> entry : lecturesByClass.entrySet()) {
	        Map<String, Integer> subjectFreq = new LinkedHashMap<>();
	        for (LectureDetailsImpl lec : entry.getValue()) {
	            subjectFreq.put(lec.getSubjectShortName(), lec.getFrequency());
	        }
	        freqTracker.put(entry.getKey(), subjectFreq);
	    }

        TimetableFormInputDTO tdto=model.getTimetableInp();

	    TimeSlot[][] LecSlots1=buildLectureSlots(tdto);
	    int totalSlotsPerDay = LecSlots1[0].length;
	    
	    for (int dayIdx = 0; dayIdx < days.length; dayIdx++) {
	        String day = days[dayIdx];

	        TimeSlot[][] LecSlots=buildLectureSlots(tdto);
			
	        for (int classIdx = 0; classIdx < classOrder.size(); classIdx++) {
	            int classId = classOrder.get(classIdx);
	            List<LectureDetailsImpl> lectures = lecturesByClass.get(classId);
	            Map<String, Integer> freqMap = freqTracker.get(classId);

	            // Separate labs and theories with remaining frequency > 0
	            List<LectureDetailsImpl> labs = new ArrayList<>();
	            List<LectureDetailsImpl> theories = new ArrayList<>();
	            for (LectureDetailsImpl lec : lectures) {
	                int rem = freqMap.getOrDefault(lec.getSubjectShortName(), 0);
	                if (rem > 0) {
	                    if (lec.getSubjectType().equals("Lab")) labs.add(lec);
	                    else theories.add(lec);
	                }
	            }
	            
	            theories.sort((a, b) ->
	            freqMap.getOrDefault(b.getSubjectShortName(), 0) -
	            freqMap.getOrDefault(a.getSubjectShortName(), 0)
	            );
	            
	            labs.sort((a, b) ->
	            freqMap.getOrDefault(b.getSubjectShortName(), 0) -
	            freqMap.getOrDefault(a.getSubjectShortName(), 0)
	            );

	            String sem = lectures.get(0).getSemester();
	            boolean labAtEnd = sem.equals("1A") || sem.equals("1B") || sem.equals("3");

	         // --- Separate labs into regular and project/internship ---
	            List<LectureDetailsImpl> regularLabs = new ArrayList<>();
	            List<LectureDetailsImpl> projectLabs = new ArrayList<>();

	            for (LectureDetailsImpl lab : labs) {
	                if (isProjectLab(lab.getSubjectShortName()))
	                    projectLabs.add(lab);
	                else
	                    regularLabs.add(lab);
	            }

	            // Sort both by remaining frequency descending
	            regularLabs.sort((a, b) ->
	                freqMap.getOrDefault(b.getSubjectShortName(), 0) -
	                freqMap.getOrDefault(a.getSubjectShortName(), 0)
	            );
	            projectLabs.sort((a, b) ->
	                freqMap.getOrDefault(b.getSubjectShortName(), 0) -
	                freqMap.getOrDefault(a.getSubjectShortName(), 0)
	            );

	            // --- Assign Project/Internship lab (first 4 slots) ---
	            if (!projectLabs.isEmpty()) {
	                LectureDetailsImpl chosenLab = projectLabs.get(0);
	                int slot1 = -1, slot2 = -1;
	                for (int s = 0; s < 3; s++) {
	                    if (!LecSlots[classIdx][s].isMarked() && !LecSlots[classIdx][s + 1].isMarked()
	                            && isFacultyAvailable(FacultySlots, chosenLab.getFacultyId(), s)
	                            && isFacultyAvailable(FacultySlots, chosenLab.getFacultyId(), s + 1)) {
	                        slot1 = s;
	                        slot2 = s + 1;
	                        break;
	                    }
	                }
	                if (slot1 >= 0) {
	                    addTimetableSlot(classId, day, chosenLab.getSubjectShortName(), chosenLab.getFacultyId(), LecSlots[classIdx][slot1], ttSlotWeeklyList.get(dayIdx));
	                    addTimetableSlot(classId, day, chosenLab.getSubjectShortName(), chosenLab.getFacultyId(), LecSlots[classIdx][slot2], ttSlotWeeklyList.get(dayIdx));
	                    LecSlots[classIdx][slot1].setMarked(true);
	                    LecSlots[classIdx][slot2].setMarked(true);
	                    markFacultyBusy(FacultySlots, chosenLab.getFacultyId(), slot1);
	                    markFacultyBusy(FacultySlots, chosenLab.getFacultyId(), slot2);
	                    freqMap.put(chosenLab.getSubjectShortName(), freqMap.get(chosenLab.getSubjectShortName()) - 1);
	                }
	            }

	         // Try each regular lab until one works
	            for (LectureDetailsImpl chosenLab : regularLabs) {
	                int slot1 = -1, slot2 = -1;
	                for (int s = totalSlotsPerDay - 2; s >= 0; s--) {
	                    if (!LecSlots[classIdx][s].isMarked() && !LecSlots[classIdx][s + 1].isMarked()) {
	                        slot1 = s;
	                        slot2 = s + 1;
	                        break;
	                    }
	                }
	                if (slot1 >= 0
	                        && isFacultyAvailable(FacultySlots, chosenLab.getFacultyId(), slot1)
	                        && isFacultyAvailable(FacultySlots, chosenLab.getFacultyId(), slot2)) {
	                    addTimetableSlot(classId, day, chosenLab.getSubjectShortName(), chosenLab.getFacultyId(), LecSlots[classIdx][slot1], ttSlotWeeklyList.get(dayIdx));
	                    addTimetableSlot(classId, day, chosenLab.getSubjectShortName(), chosenLab.getFacultyId(), LecSlots[classIdx][slot2], ttSlotWeeklyList.get(dayIdx));
	                    LecSlots[classIdx][slot1].setMarked(true);
	                    LecSlots[classIdx][slot2].setMarked(true);
	                    markFacultyBusy(FacultySlots, chosenLab.getFacultyId(), slot1);
	                    markFacultyBusy(FacultySlots, chosenLab.getFacultyId(), slot2);
	                    freqMap.put(chosenLab.getSubjectShortName(), freqMap.get(chosenLab.getSubjectShortName()) - 1);
	                    break; // assigned successfully, stop trying
	                }
	            }

	         // --- Assign Theory slots (rotating) ---
	            Set<String> assignedToday = new HashSet<>();
	            int theoryCount = theories.size();
	            int assigned = 0;

	            for (int s = 0; s < totalSlotsPerDay && assigned < theoryCount; s++) {
	                if (LecSlots[classIdx][s].isMarked()) continue;

	                for (int t = 0; t < theoryCount; t++) {
	                    int idx = (assigned + t) % theoryCount;
	                    LectureDetailsImpl chosenTheory = theories.get(idx);

	                    if (assignedToday.contains(chosenTheory.getSubjectShortName())) continue;
	                    if (freqMap.getOrDefault(chosenTheory.getSubjectShortName(), 0) <= 0) continue;
	                    if (!isFacultyAvailable(FacultySlots, chosenTheory.getFacultyId(), s)) continue;

	                    addTimetableSlot(classId, day, chosenTheory.getSubjectShortName(),
	                            chosenTheory.getFacultyId(), LecSlots[classIdx][s],
	                            ttSlotWeeklyList.get(dayIdx));
	                    LecSlots[classIdx][s].setMarked(true);
	                    markFacultyBusy(FacultySlots, chosenTheory.getFacultyId(), s);
	                    freqMap.put(chosenTheory.getSubjectShortName(),
	                            freqMap.get(chosenTheory.getSubjectShortName()) - 1);
	                    assignedToday.add(chosenTheory.getSubjectShortName());
	                    assigned++;
	                    break;
	                }
	                System.out.println("Day: " + day + " Class: " + classId + " Slot: " + s + " Marked: " + LecSlots[classIdx][s].isMarked() + " Assigned: " + assigned);
	            }
	            
	        }
	        for (TimeSlot[] row : FacultySlots)
	            for (TimeSlot slot : row)
	                if (slot != null) slot.setMarked(false);
	    }
	    System.out.println("Total lectures: " + allLectures.size());
	    System.out.println("Total faculty: " + totalFaculty);
	    System.out.println("Total classes: " + classOrder.size());
	}
	
	// Helper to differentiate labs
	private static boolean isProjectLab(String subjectName) {
	    String lower = subjectName.toLowerCase();
	    return lower.contains("project") || lower.contains("ev.");
	}

	// Helper to create and add a TimetableSlot
	private static void addTimetableSlot(int classId, String day, String lectureName, int facultyId, TimeSlot slot, List<TimetableSlot> dayList) {
	    TimetableSlot ttSlot = new TimetableSlot();
	    ttSlot.setClassId(classId);
	    ttSlot.setDay(day);
	    ttSlot.setLectureName(lectureName);
	    ttSlot.setFacultyId(facultyId);
	    ttSlot.setSlot(slot);
	    dayList.add(ttSlot);
	}

	public static void printWeeklyLecSlots(TimeSlot[][][] weeklyLecSlots, String[] days, String[] classNames) {
	    System.out.println("==================================================");
	    System.out.println("           WEEKLY LECTURE SLOTS (BY CLASS)        ");
	    System.out.println("==================================================");

	    int totalDays = weeklyLecSlots.length;
	    int totalClasses = weeklyLecSlots[0].length;
	    int totalSlots = weeklyLecSlots[0][0].length;

	    for (int dayIdx = 0; dayIdx < totalDays; dayIdx++) {
	        String day = days[dayIdx];
	        
	        System.out.println("\n--- DAY: " + day + " ---");
	        
	        // Print header for the time slots
	        System.out.print("Class |");
	        for(int s = 0; s < totalSlots; s++) {
	            System.out.printf(" Slot %-4d |", s);
	        }
	        System.out.println();
	        System.out.println("------" + "--------|".repeat(totalSlots));
	        
	        // Print slots for each class
	        for (int classIdx = 0; classIdx < totalClasses; classIdx++) {
	            System.out.printf("%-5s |", classNames[classIdx]);
	            for (int slotIdx = 0; slotIdx < totalSlots; slotIdx++) {
	                TimeSlot slot = weeklyLecSlots[dayIdx][classIdx][slotIdx];
	                // Assuming TimeSlot has a descriptive toString() or a way to show state
	                String content = slot.isMarked() ? "BUSY" : "FREE";
	                System.out.printf(" %-8s |", content);
	            }
	            System.out.println();
	        }
	    }
	}
	
	public static void printWeeklyFacultySlots(TimeSlot[][][] weeklyFacultySlots, String[] days) {
	    System.out.println("\n==================================================");
	    System.out.println("          WEEKLY FACULTY SLOTS (BY FACULTY)       ");
	    System.out.println("==================================================");

	    int totalDays = weeklyFacultySlots.length;
	    int totalFaculty = weeklyFacultySlots[0].length;
	    int totalSlots = weeklyFacultySlots[0][0].length;
	    
	    // Note: We assume Faculty IDs range from 0 to totalFaculty-1

	    for (int dayIdx = 0; dayIdx < totalDays; dayIdx++) {
	        String day = days[dayIdx];
	        
	        System.out.println("\n--- DAY: " + day + " ---");

	        // Print header for the time slots
	        System.out.print("Fac ID |");
	        for(int s = 0; s < totalSlots; s++) {
	            System.out.printf(" Slot %-4d |", s);
	        }
	        System.out.println();
	        System.out.println("-------" + "--------|".repeat(totalSlots));
	        
	        // Print availability for each faculty
	        for (int facIdx = 0; facIdx < totalFaculty; facIdx++) {
	            System.out.printf(" %-5d |", facIdx);
	            for (int slotIdx = 0; slotIdx < totalSlots; slotIdx++) {
	                TimeSlot slot = weeklyFacultySlots[dayIdx][facIdx][slotIdx];
	                // Assuming TimeSlot has a way to show if the faculty is busy (marked)
	                String content = slot.isMarked() ? "BUSY" : "FREE";
	                System.out.printf(" %-8s |", content);
	            }
	            System.out.println();
	        }
	    }
	}
	
	public static TimetableResult generate(AlgorithmInputModel model) {
		
		TimetableFormInputDTO tdto=model.getTimetableInp();
		//LectureDetailsTO ldto=new LectureDetailsImpl();
		
		List<List<TimetableSlot>> ttSlotWeeklyList=new ArrayList<List<TimetableSlot>>();
		
		for(int i=0; i<6; i++) {
			ttSlotWeeklyList.add(new ArrayList<TimetableSlot>());
		}
		
		TimeSlot[][] facultySlots=buildFacultySlots(tdto);
		
		String[] days= {"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
		TimetableResult ttResult=new TimetableResult();
		
		assignLectures(model, days, facultySlots, ttSlotWeeklyList);
		//LecSlots = assignTheoryLecture(model.getTheoryLectureList(), model.getTotalTheoryLectures(), model, days, LecSlots, ttSlotWeeklyList, facultySlots);
		List<TimetableSlot> ttFinal=new ArrayList<TimetableSlot>();
		for(int i=0;i<6;i++) {
			ttFinal.addAll(ttSlotWeeklyList.get(i));
		}
		
		ttResult.setScheduledSlots(ttFinal);
		
		
		return ttResult;
		
	}
	
}
