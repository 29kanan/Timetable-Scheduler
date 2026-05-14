// ================= PAGE SWITCHING =================
function showPage(id, btn) {
    document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
    document.querySelectorAll('nav button').forEach(b => b.classList.remove('active'));

    document.getElementById('page-' + id).classList.add('active');
    btn.classList.add('active');
}

// ================= SUBJECTS =================
function showSubjects() {
    const branch = document.getElementById('branchSelect').value;
    const sem = document.getElementById('semesterSelect').value;
    const result = document.getElementById('subjectResult');

    if (!branch || !sem) {
        result.innerHTML = `
        <div class="empty-box">
            <div class="e-icon">⚠️</div>
            <p>Please select both branch and semester first.</p>
        </div>`;
        return;
    }

    result.innerHTML = `
    <div class="empty-box">
        <div class="e-icon">📚</div>
        <p>Subjects will be loaded from database soon...</p>
    </div>`;
}

// ================= TIMETABLE =================
function showTimetable() {
    const branch = document.getElementById('ttbranch').value;
    const sem = document.getElementById('ttsemester').value;
    const result = document.getElementById('timetableResult');

    if (!branch || !sem) {
        result.innerHTML = `
        <div class="empty-box">
            <div class="e-icon">⚠️</div>
            <p>Please select both a branch and a semester.</p>
        </div>`;
        return;
    }

    result.innerHTML = `
    <div class="empty-box">
        <div class="e-icon">📅</div>
        <p>Timetable will be loaded from database soon...</p>
    </div>`;
}

// ================= RESET =================
function resetTimetable() {
    document.getElementById('timetableResult').innerHTML = '';
}

// ================= INIT =================
resetTimetable();