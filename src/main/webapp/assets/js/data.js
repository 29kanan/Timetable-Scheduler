// ─────────────────────────────────────────
//  TimeTable Pro — Data Store (matches DB)
// ─────────────────────────────────────────

const DB = {

  admins: [
    { id:1, username:'bhumika', password:'bhumi@123', email:'bhumika@gmail.com' },
    { id:2, username:'abc', password:'123', email:'abc@ex.com' },
    { id:3, username:'Ankit Bakshi', password:'a', email:'a@gmail.com' }
  ],

  departments: [
    { dept_id:101, dept_name:'Computer Science Engineering', HOD_name:'Mr. Ankit Bakshi' },
    { dept_id:102, dept_name:'Data Science', HOD_name:'Mr. Ankit Bakshi' }
  ],

  rooms: [
    { room_id:1, room_name:'Class Room', room_num:101 },
    { room_id:2, room_name:'CS Class', room_num:102 },
    { room_id:3, room_name:'Lab', room_num:103 },
    { room_id:4, room_name:'Lab', room_num:104 }
  ],

  teachers: [
    { fac_id:1,  email:'sachin@gmail.com',  username:'Sachin Malviya',      password:'sc',   phone:'1233344555', dept:'Computer Science Engineering' },
    { fac_id:2,  email:'asth@gmail.com',    username:'Aastha Sharma',       password:'as',   phone:'6667775554', dept:'Computer Science Engineering' },
    { fac_id:3,  email:'ankitB@gmail.com',  username:'Ankit Bakshi',        password:'ab',   phone:'7865345678', dept:'Computer Science Engineering' },
    { fac_id:4,  email:'been@gmail.com',    username:'Beena Pal',           password:'bp',   phone:'9454565555', dept:'Computer Science Engineering' },
    { fac_id:5,  email:'ishitaM@gmail.com', username:'Ishita Maheshwari',   password:'im',   phone:'0123456789', dept:'Computer Science Engineering' },
    { fac_id:6,  email:'nikt@gmail.com',    username:'Nikita Sen',          password:'ns',   phone:'3333555588', dept:'Data Science' },
    { fac_id:7,  email:'shls@gmail.com',    username:'Shailesh Tiwari',     password:'st',   phone:'9454565655', dept:'Computer Science Engineering' },
    { fac_id:8,  email:'shk@gmail.com',     username:'Sheekhi Guru',        password:'sg',   phone:'6267207194', dept:'Computer Science Engineering' },
    { fac_id:9,  email:'ypldh@gmail.com',   username:'Y. P. Ladhe',         password:'ypl',  phone:'6666777788', dept:'Computer Science Engineering' },
    { fac_id:10, email:'rajesh@gmail.com',  username:'Rajesh Gyanchandani', password:'rg',   phone:'9454565555', dept:'Computer Science Engineering' },
    { fac_id:11, email:'ak@gmail.com',      username:'Ankit Shukla',        password:'as',   phone:'9454565555', dept:'Computer Science Engineering' },
    { fac_id:12, email:'eshita@gmail.com',  username:'Eshita Maheshwari',   password:'e',    phone:'9454565555', dept:'Computer Science Engineering' },
    { fac_id:13, email:'abc@gmail.com',     username:'abc',                 password:'abc',  phone:'6267207194', dept:'Computer Science Engineering' },
    { fac_id:14, email:'abcd@gmail.com',    username:'abcd',                password:'abcd', phone:'3333333333', dept:'Data Science' },
    { fac_id:15, email:'jaya@gmail.com',    username:'Jaya Jain',           password:'j',    phone:'1234567812', dept:'Computer Science Engineering' },
    { fac_id:16, email:'a@gmail.com',       username:'AA',                  password:'123',  phone:'6267207194', dept:'Computer Science Engineering' }
  ],

  pending: [
    { faculty_id:1, name:'b', phone:'9454565555', email:'b@gmail.com', dept:'Computer Science Engineering', password:'b' }
  ],

  rejected: [],

  subjects: [
    { sub_id:1,  sub_name:'Theory Of Computation',       sub_code:'CS-501',     sub_abbr:'TOC',                   subject_type:'Theory', sem:'5 sem', dept_id:101, faculty_id:3  },
    { sub_id:2,  sub_name:'Internet Web Technology',     sub_code:'CS-504(A)',   sub_abbr:'IWT',                   subject_type:'Theory', sem:'5 sem', dept_id:101, faculty_id:8  },
    { sub_id:3,  sub_name:'Cyber Security',              sub_code:'CS-503(C)',   sub_abbr:'Cybersecurity',         subject_type:'Theory', sem:'5 sem', dept_id:101, faculty_id:2  },
    { sub_id:4,  sub_name:'Database Management System',  sub_code:'CS-502',      sub_abbr:'DBMS',                  subject_type:'Theory', sem:'5 sem', dept_id:101, faculty_id:5  },
    { sub_id:5,  sub_name:'Python Lab',                  sub_code:'CS-506',      sub_abbr:'Python Lab lab',        subject_type:'Lab',    sem:'5 sem', dept_id:101, faculty_id:5  },
    { sub_id:6,  sub_name:'Theory Of Computation Lab',   sub_code:'CS-501L',     sub_abbr:'TOC lab',               subject_type:'Lab',    sem:'5 sem', dept_id:101, faculty_id:3  },
    { sub_id:7,  sub_name:'Database Management Lab',     sub_code:'CS-502L',     sub_abbr:'DBMS lab',              subject_type:'Lab',    sem:'5 sem', dept_id:101, faculty_id:5  },
    { sub_id:8,  sub_name:'Minor Project',               sub_code:'CS-508',      sub_abbr:'Minor Project lab',     subject_type:'Lab',    sem:'5 sem', dept_id:101, faculty_id:5  },
    { sub_id:9,  sub_name:'Evaluation Of Internship II', sub_code:'CS-507',      sub_abbr:'Ev. of Internship lab', subject_type:'Lab',    sem:'5 sem', dept_id:101, faculty_id:4  },
    { sub_id:10, sub_name:'Linux',                       sub_code:'CS-505',      sub_abbr:'Linux lab',             subject_type:'Lab',    sem:'5 sem', dept_id:101, faculty_id:10 },
    { sub_id:11, sub_name:'Java',                        sub_code:'CS-509',      sub_abbr:'java lab',              subject_type:'Lab',    sem:'5 sem', dept_id:101, faculty_id:11 }
  ],

  timetable: [
    { tt_id:1,  sem:'5 sem', day:'Monday',    time_slot:'10:15-11:10', sub_abbr:'IWT',                   fac_id:8,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:2,  sem:'5 sem', day:'Monday',    time_slot:'11:10-12:05', sub_abbr:'TOC',                   fac_id:3,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:33, sem:'5 sem', day:'Monday',    time_slot:'12:40-01:35', sub_abbr:'IWT',                   fac_id:8,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:3,  sem:'5 sem', day:'Monday',    time_slot:'01:35-02:30', sub_abbr:'java lab',              fac_id:11, room_id:3, dept_id:101, year:'2025-26' },
    { tt_id:4,  sem:'5 sem', day:'Monday',    time_slot:'02:40-03:35', sub_abbr:'DBMS',                  fac_id:5,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:5,  sem:'5 sem', day:'Monday',    time_slot:'03:35-04:30', sub_abbr:'Cybersecurity',         fac_id:2,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:6,  sem:'5 sem', day:'Tuesday',   time_slot:'10:15-11:10', sub_abbr:'DBMS',                  fac_id:5,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:7,  sem:'5 sem', day:'Tuesday',   time_slot:'11:10-12:05', sub_abbr:'IWT',                   fac_id:8,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:8,  sem:'5 sem', day:'Tuesday',   time_slot:'01:35-02:30', sub_abbr:'java lab',              fac_id:11, room_id:3, dept_id:101, year:'2025-26' },
    { tt_id:9,  sem:'5 sem', day:'Tuesday',   time_slot:'02:40-03:35', sub_abbr:'TOC',                   fac_id:3,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:10, sem:'5 sem', day:'Tuesday',   time_slot:'03:35-04:30', sub_abbr:'Cybersecurity',         fac_id:2,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:11, sem:'5 sem', day:'Wednesday', time_slot:'10:15-11:10', sub_abbr:'Cybersecurity',         fac_id:2,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:12, sem:'5 sem', day:'Wednesday', time_slot:'11:10-12:05', sub_abbr:'IWT',                   fac_id:8,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:13, sem:'5 sem', day:'Wednesday', time_slot:'12:40-01:35', sub_abbr:'TOC',                   fac_id:3,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:14, sem:'5 sem', day:'Wednesday', time_slot:'01:35-02:30', sub_abbr:'DBMS',                  fac_id:5,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:15, sem:'5 sem', day:'Wednesday', time_slot:'03:35-04:30', sub_abbr:'DBMS lab',              fac_id:5,  room_id:3, dept_id:101, year:'2025-26' },
    { tt_id:16, sem:'5 sem', day:'Thursday',  time_slot:'10:15-11:10', sub_abbr:'DBMS',                  fac_id:5,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:17, sem:'5 sem', day:'Thursday',  time_slot:'11:10-12:05', sub_abbr:'Cybersecurity',         fac_id:2,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:18, sem:'5 sem', day:'Thursday',  time_slot:'12:40-01:35', sub_abbr:'TOC',                   fac_id:3,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:19, sem:'5 sem', day:'Thursday',  time_slot:'01:35-02:30', sub_abbr:'IWT',                   fac_id:8,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:20, sem:'5 sem', day:'Thursday',  time_slot:'03:35-04:30', sub_abbr:'TOC lab',               fac_id:3,  room_id:3, dept_id:101, year:'2025-26' },
    { tt_id:21, sem:'5 sem', day:'Friday',    time_slot:'10:15-11:10', sub_abbr:'DBMS',                  fac_id:5,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:22, sem:'5 sem', day:'Friday',    time_slot:'11:10-12:05', sub_abbr:'Cybersecurity',         fac_id:2,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:23, sem:'5 sem', day:'Friday',    time_slot:'12:40-01:35', sub_abbr:'Ev. of Internship lab', fac_id:4,  room_id:3, dept_id:101, year:'2025-26' },
    { tt_id:24, sem:'5 sem', day:'Friday',    time_slot:'01:35-02:30', sub_abbr:'Ev. of Internship lab', fac_id:4,  room_id:3, dept_id:101, year:'2025-26' },
    { tt_id:25, sem:'5 sem', day:'Friday',    time_slot:'02:40-03:35', sub_abbr:'Minor Project lab',     fac_id:5,  room_id:3, dept_id:101, year:'2025-26' },
    { tt_id:26, sem:'5 sem', day:'Friday',    time_slot:'03:35-04:30', sub_abbr:'Minor Project lab',     fac_id:5,  room_id:3, dept_id:101, year:'2025-26' },
    { tt_id:27, sem:'5 sem', day:'Saturday',  time_slot:'10:15-11:10', sub_abbr:'TOC',                   fac_id:3,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:28, sem:'5 sem', day:'Saturday',  time_slot:'11:10-12:05', sub_abbr:'IWT',                   fac_id:8,  room_id:2, dept_id:101, year:'2025-26' },
    { tt_id:29, sem:'5 sem', day:'Saturday',  time_slot:'12:40-01:35', sub_abbr:'java lab',              fac_id:11, room_id:3, dept_id:101, year:'2025-26' },
    { tt_id:30, sem:'5 sem', day:'Saturday',  time_slot:'01:35-02:30', sub_abbr:'java lab',              fac_id:11, room_id:3, dept_id:101, year:'2025-26' },
    { tt_id:31, sem:'5 sem', day:'Saturday',  time_slot:'02:40-03:35', sub_abbr:'Python Lab lab',        fac_id:5,  room_id:3, dept_id:101, year:'2025-26' },
    { tt_id:32, sem:'5 sem', day:'Saturday',  time_slot:'03:35-04:30', sub_abbr:'Python Lab lab',        fac_id:5,  room_id:3, dept_id:101, year:'2025-26' }
  ],

  facMessages: {
    'rajesh@gmail.com': 'Your account has been APPROVED by admin!',
    'ak@gmail.com': 'Your account has been APPROVED by admin!',
    'eshita@gmail.com': 'Your account has been APPROVED by admin!',
    'abc@gmail.com': 'Your account has been APPROVED by admin!',
    'sachin@gmail.com': 'Your account has been APPROVED by admin!'
  },

  nextTtId: 34,
  nextDeptId: 103,
  nextRoomId: 5
};

// ── Helpers ──
const avatarColors = [
  'linear-gradient(135deg,#3b82f6,#6366f1)',
  'linear-gradient(135deg,#8b5cf6,#ec4899)',
  'linear-gradient(135deg,#10b981,#3b82f6)',
  'linear-gradient(135deg,#f59e0b,#ef4444)',
  'linear-gradient(135deg,#14b8a6,#6366f1)',
  'linear-gradient(135deg,#f97316,#ec4899)',
  'linear-gradient(135deg,#06b6d4,#3b82f6)',
  'linear-gradient(135deg,#84cc16,#10b981)'
];

function getAvatarColor(i) { return avatarColors[i % avatarColors.length]; }

function getInitials(name) {
  return name.split(' ').slice(0,2).map(w=>w[0]||'').join('').toUpperCase();
}

function getFacultyName(fac_id) {
  const t = DB.teachers.find(t => t.fac_id === fac_id);
  return t ? t.username : '—';
}

function getFacultyShort(fac_id) {
  const name = getFacultyName(fac_id);
  const parts = name.split(' ');
  if (parts.length >= 2) return parts[0][0] + '. ' + parts[parts.length-1];
  return name;
}

function getRoomName(room_id) {
  const r = DB.rooms.find(r => r.room_id === room_id);
  return r ? r.room_name + ' ' + r.room_num : '—';
}

function isLab(sub_abbr) {
  return sub_abbr && (sub_abbr.toLowerCase().includes('lab') || sub_abbr.toLowerCase().includes('project') || sub_abbr.toLowerCase().includes('intern'));
}

function getSubjectFacId(sub_abbr, dept_id) {
  const s = DB.subjects.find(s => s.sub_abbr === sub_abbr && s.dept_id === dept_id);
  return s ? s.faculty_id : null;
}
