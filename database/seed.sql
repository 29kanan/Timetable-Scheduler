# insert queries for faculties table

insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. ANKIT BAKSHI", "ankbk@gmail.com", "+919999999999", "CS", "ab", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Ms. ESHITA MAHESHWARI", "eps@gmail.com", "+918888888888", "CS", "em", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. RAJESH GYANCHANDANI", "raj@gmail.com", "+917777777777", "DS", "rg", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mrs. SHEEKHI GURU", "shk@gmail.com", "+916666666666", "CS", "sg", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. SHAILESH TIWARI", "sha@gmail.com", "+915555555555", "CS", "st", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mrs. BEENA PAL", "bee@gmail.com", "+914444444444", "CS", "bp", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. Y.P. LADHE", "lad@gmail.com", "+913333333333", "CS", "ypl", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. SADIQUE KHAN", "sad@gmail.com", "+916767676767", "Mathematics", "sk", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. SANDEEP DONGRE", "snd@gmail.com", "+916868686868", "CS", "sd", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Dr. REEMA TUTEJA", "rem@gmail.com", "+914545454545", "Mathematics", "rt", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. ANKIT SHUKLA", "anksh@gmail.com", "+915656565656", "CS", "as", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. AMIT KANUNGO", "amt@gmail.com", "+918989898989", "DS", "ak", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. SACHIN MALVIYA", "sac@gmail.com", "+917878787878", "CS", "sm", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Dr. SAPNA ARZARE", "sap@gmail.com", "+912424242424", "DS", "sa", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. PRADEEP MISHRA", "pra@gmail.com", "+913535353535", "DS", "pm", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. RAMAKANT SHUKLA", "ramk@gmail.com", "+914646464646", "CS", "rs", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. SANIDHYA NAGAR", "san@gmail.com", "+915757575757", "CS", "sn", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. PIYUSH VISHWAKARMA", "piy@gmail.com", "+916868686868", "DS", "pv", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mrs. SHRADHA PALIWAL", "shd@gmail.com", "+914848484848", "CS", "sp", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Ms. ALIYA KHAN", "aly@gmail.com", "+918181818181", "DS", "ak", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mrs. NIKITA SEN", "nkt@gmail.com", "+914545454545", "CS", "ns", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mr. RAVI PANCHPANDEY", "rvp@gmail.com", "+919080908090", "DS", "rp", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Ms. JAYA JAIN", "jya@gmail.com", "+917272727272", "Mathematics", "jj", '10:15:00', '16:30:00');
insert into login_teacher(username,email,phone,dept,password,avail_start,avail_end) values("Mrs. KIRTI VIBHUTI", "kir@gmail.com", "+916363636363", "CS", "kv", '10:15:00', '16:30:00');

# insert queries for Departments table

insert into departments(dept_name, HOD_name) values ("CS Department", "Mr ANKIT BAKSHI");
insert into departments(dept_name, HOD_name) values ("DS Department", "Mr ANKIT BAKSHI");

# insert queries for Subjects table
    
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-101","Engineering Chemistry","Chemistry","Theory",14,"1A",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-101","Engineering Chemistry","Chemistry","Theory",9,"1B",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-102","Mathematics-1","M-1","Theory",8,"1A",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-102","Mathematics-1","M-1","Theory",23,"1B",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-103","English for communication","EFC","Theory",15,"1A",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-103","English for communication","EFC","Theory",15,"1B",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-104","Basic Electrical & Electronics ENGG.","BEEE","Theory",16,"1A",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-104","Basic Electrical & Electronics ENGG.","BEEE","Theory",24,"1B",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-105","ENGG. Graphics","EG","Theory",7,"1A",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-105","ENGG. Graphics","EG","Theory",17,"1B",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-106","Workshop Practice","Workshop Practice","Lab",18,"1A",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-106","Workshop Practice","Workshop Practice","Lab",18,"1B",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-301","Enery & Environmental Engineering","EEE","Theory",9,"3",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-302","Discrete structure","Discrete Structure","Theory",10,"3",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-303","Data Structure","Data Structure","Theory",11,"3",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-304","Digital System","Digital System","Theory",12,"3",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-305","Object Oriented Programming & Methodology","OOPM","Theory",13,"3",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-306","Computer Workshop(Java)","Workshop Java","Lab",11,"3",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("BT-107","Evaluation of Internship-1","Ev. of Internshi-1","Lab",3,"3",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-301","Technical Communication","Technical Comm.","Theory",20,"3",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-302","Introduction to Probability & Statistics","IP & S","Theory",10,"3",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-303","Data Structure","Data Structure","Theory",11,3,2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-304","Database Management System","DBMS","Theory",3,3,2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-305","Object Oriented Programming & Methodology","OOPM","Theory",21,"3",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-306","Computer Workshop(Python)","Workshop Python","Lab",11,"3",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-501","Theory of Computation","TOC","Theory",1,"5",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-502","Database Management System","DBMS","Theory",2,"5",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-503(C)","Cyber Security","Cyber Security","Theory",3,"5",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-504(A)","Internet and Web Technology","IWT","Theory",4,"5",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-505","Lab(Linux)","Linux lab","Lab",5,"5",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-506","Lab(Python)","Python lab","Lab",2,"5",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-508","Minor Project","Minor Project","Lab",2,"5",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-507","Evaluation of Internship-2","Ev. of Internship-2","Lab",6,"5",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-501","Theory of Computation","TOC","Theory",1,"5",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-502","Machine Learning","ML","Theory",19,"5",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-503(A)","Data Mining & Warehousing","Data Mining","Theory",6,"5",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-504(C)","Computer Organisation & Architecture","COA","Theory",21,5,2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-506","Computer Organisation & Architecture Lab","COA","Lab",22,5,2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-508","Minor Project","Minor Project","Lab",2,5,2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-507","Evaluation of Internship-2","Ev. of Internship-2","Lab",6,"5",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-701","Software Architecture","SA","Theory",3,"7",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-702(C)","Wireless & Mobile Computing","Wireless & Mo.Com.","Theory",1,"7",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-703(B)","Data Mining & Warehousing","DM & Warehousing","Theory",6,"7",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-704","Wireless & Mobile Computing Lab","Wireless & Mo.Com. Lab","Lab",1,"7",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-705","Data Mining & Warehousing Lab","Data Mining Lab","Lab",6,"7",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-706","Major Project-1","Major Project","Lab",13,"7",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CS-607","Evaluation of Internship-3","Ev. of Internship-3","Lab",19,"7",1);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-701","Data Engineering","Data Engineering","Theory",13,"7",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-702(A)","Data Analytics & Visualization","DA & V","Theory",19,"7",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-703(A)","Cryptography & Information Security","C & IS","Theory",2,"7",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-704","Data Analytics & Visualization Lab","DA & V Lab","Lab",19,"7",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-705","Cryptography & Information Security Lab","C & IS Lab","Lab",2,"7",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-706","Major Project-1","Major Project","Lab",13,"7",2);
insert into Subjects(sub_code,sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("CD-607","Evaluation of Internship-3","Ev. of Internship-3","Lab",19,"7",2);

# inserting more labs-----------

insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Data Structure lab","Data Structure lab","Lab",11,"3",1);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Data Structure lab","Data Structure lab","Lab",11,"3",2);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Digital System lab","Digital System lab","Lab",12,"3",1);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Object Oriented Programming & Methodology lab","OOPM lab","Lab",13,"3",1);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Data Engineering lab","Data Engineering lab","Lab",13,"7",2);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Engineering Chemistry lab","Chemistry lab","Lab",9,"1B",1);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Engineering Chemistry lab","Chemistry lab","Lab",14,"1A",1);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Database Management System lab","DBMS lab","Lab",3,"3",2);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Theory of Computation lab","TOC lab","Lab",1,"5",1);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Theory of Computation lab","TOC lab","Lab",1,"5",2);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Database Management System lab","DBMS lab","Lab",2,"5",1);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Object Oriented Programming & Methodology lab","OOPM lab","Lab",21,"3",2);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Software Architecture lab","SA lab","Lab",3,"7",1);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Basic Electrical & Electronics ENGG. lab","BEEE lab","Lab",16,"1A",1);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("Basic Electrical & Electronics ENGG. lab","BEEE lab","Lab",24,"1B",1);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("ENGG. Graphics lab","EG lab","Lab",7,"1A",1);
insert into Subjects(sub_name,sub_abbr,subject_type,faculty_id,sem,dept_id) values("ENGG. Graphics lab","EG lab","Lab",17,"1B",1);

-- select * from subjects where subject_type="Lab" order by faculty_id;
-- select * from subjects where subject_type="Lab" order by sem, dept_id, faculty_id;
-- select count(*) from subjects where subject_type="Lab";



insert into classes_name(class_name, sem, dept_id) values("CS-1A","1A",1);
insert into classes_name(class_name, sem, dept_id) values("CS-1B","1B",1);
insert into classes_name(class_name, sem, dept_id) values("CS-3","3",1);
insert into classes_name(class_name, sem, dept_id) values("DS-3","3",2);
insert into classes_name(class_name, sem, dept_id) values("CS-5","5",1);
insert into classes_name(class_name, sem, dept_id) values("DS-5","5",2);
insert into classes_name(class_name, sem, dept_id) values("CS-7","7",1);
insert into classes_name(class_name, sem, dept_id) values("DS-7","7",2);

