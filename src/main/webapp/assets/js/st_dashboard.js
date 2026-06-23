// ================= PAGE SWITCHING =================
const contextPath = document.querySelector('meta[name="contextPath"]').content;
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
        <div class="e-icon">⏳</div>
        <p>Loading subjects...</p>
    </div>`;

    fetch(`${contextPath}/StudentGetSubjects?branch=${encodeURIComponent(branch)}&sem=${encodeURIComponent(sem)}`)
        .then(res => res.json())
        .then(data => {
            if (data.error) {
                result.innerHTML = `<div class="empty-box"><div class="e-icon">❌</div><p>${data.error}</p></div>`;
                return;
            }
            if (!data.length) {
                result.innerHTML = `<div class="empty-box"><div class="e-icon">📭</div><p>No subjects found.</p></div>`;
                return;
            }

            // Separate theory and lab
            const theory = data.filter(s => s.type && s.type.toLowerCase() === 'theory');
            const labs   = data.filter(s => s.type && s.type.toLowerCase() !== 'theory');

            let html = `<table class="subject-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Subject Name</th>
                        <th>Abbreviation</th>
                        <th>Type</th>
						<th>Faculty</th>
                    </tr>
                </thead>
                <tbody>`;

            data.forEach((s, i) => {
                const badgeClass = s.type && s.type.toLowerCase() !== 'theory' ? 'badge-lab' : 'badge-theory';
                html += `<tr>
                    <td>${i + 1}</td>
                    <td>${s.name}</td>
                    <td>${s.abbr}</td>
                    <td><span class="type-badge ${badgeClass}">${s.type}</span></td>
					<td>${s.faculty}</td>
                </tr>`;
            });

            html += `</tbody></table>
            <div class="subject-summary">
                <span>📖 Theory: <strong>${theory.length}</strong></span>
                <span>🔬 Lab: <strong>${labs.length}</strong></span>
                <span>📚 Total: <strong>${data.length}</strong></span>
            </div>`;

            result.innerHTML = html;
        })
        .catch(err => {
            result.innerHTML = `<div class="empty-box"><div class="e-icon">❌</div><p>Error: ${err.message}</p></div>`;
        });
}

// ================= TIMETABLE =================
function showTimetable() {
	const branch = document.getElementById('ttBranch').value;
	const sem = document.getElementById('ttSemester').value;
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
        <div class="e-icon">⏳</div>
        <p>Loading timetable...</p>
    </div>`;

	fetch(`${contextPath}/StudentGetTimetable?branch=${encodeURIComponent(branch)}&sem=${encodeURIComponent(sem)}`)
        .then(res => res.json())
        .then(data => {
            if (data.error) {
                result.innerHTML = `<div class="empty-box"><div class="e-icon">❌</div><p>${data.error}</p></div>`;
                return;
            }
            if (!data.length) {
                result.innerHTML = `<div class="empty-box"><div class="e-icon">📭</div><p>No timetable found.</p></div>`;
                return;
            }

            // Group by className -> day -> slots
            const dayOrder = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
            const classMap = {};

            data.forEach(row => {
                if (!classMap[row.class]) classMap[row.class] = {};
                if (!classMap[row.class][row.day]) classMap[row.class][row.day] = [];
                classMap[row.class][row.day].push(row);
            });

            // Collect all unique time slots sorted
            const timeSlotSet = new Set();
            data.forEach(row => timeSlotSet.add(row.start + " - " + row.end));
            const timeSlots = [...timeSlotSet].sort();

            let html = "";

            Object.keys(classMap).forEach(className => {
                const dayMap = classMap[className];

                html += `<div class="tt-class-section">
                    <div class="tt-class-title">📅 ${className}</div>
                    <div class="table-responsive">
                    <table class="tt-grid-table">
                        <thead><tr><th>Day</th>`;

                timeSlots.forEach(ts => { html += `<th>${ts}</th>`; });
                html += `</tr></thead><tbody>`;

                const dayShort = {
                    "Monday":"Mon","Tuesday":"Tue","Wednesday":"Wed",
                    "Thursday":"Thu","Friday":"Fri","Saturday":"Sat"
                };

                dayOrder.forEach(day => {
                    const slots = dayMap[day];
                    if (!slots) return;

                    // Build map of timeSlot -> row
                    const slotMap = {};
                    slots.forEach(s => { slotMap[s.start + " - " + s.end] = s; });

                    html += `<tr><td class="day-col">${dayShort[day] || day}</td>`;

                    timeSlots.forEach(ts => {
                        const slot = slotMap[ts];
                        if (slot) {
                            const name = slot.lecture.toLowerCase();
                            const isLab = name.includes("lab") || name.includes("workshop") ||
                                          name.includes("project") || name.includes("internship");
                            const cls = isLab ? "lab-cell" : "theory-cell";
                            html += `<td class="${cls}">${slot.lecture}</td>`;
                        } else {
                            html += `<td class="empty-cell">—</td>`;
                        }
                    });

                    html += `</tr>`;
                });

                html += `</tbody></table></div></div>`;
            });

            result.innerHTML = html;
        })
        .catch(err => {
            result.innerHTML = `<div class="empty-box"><div class="e-icon">❌</div><p>Error: ${err.message}</p></div>`;
        });
}

// ================= RESET =================
function resetTimetable() {
    document.getElementById('timetableResult').innerHTML = '';
}
function resetResult() {
    document.getElementById('subjectResult').innerHTML = '';
}

// ================= INIT =================
resetTimetable();