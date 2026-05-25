<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Timetable</title>
<style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { 
        font-family: 'Public Sans', 'Segoe UI', sans-serif; 
        background-color: rgba(13, 82, 179, 0.7);
        display: flex; 
        justify-content: center; 
        align-items: center;
        min-height: 100vh;
        padding: 20px; 
    }
    form { 
        background-color: #ffffff; 
        padding: 40px 35px; 
        border-radius: 20px; 
        box-shadow: 0 20px 60px rgba(0,0,0,0.2); 
        max-width: 500px; 
        width: 100%; 
    }
    h2 { 
        color: #1a1a2e; 
        text-align: center;
        font-size: 26px;
        font-weight: 700;
        margin-bottom: 8px;
    }
    .subtitle {
        text-align: center;
        color: #888;
        font-size: 14px;
        margin-bottom: 28px;
    }
    .form-section { 
        margin-bottom: 16px; 
        padding: 0;
        border: none;
        background: none;
    }
    .form-section label { 
        display: block; 
        margin-bottom: 6px; 
        font-weight: 600; 
        font-size: 13px;
        color: #555; 
    }
    .form-section input[type="number"],
    .form-section select { 
        width: 100%; 
        padding: 12px 18px; 
        border: 1.5px solid #e8e8e8; 
        border-radius: 50px; 
        font-size: 14px;
        color: #1a1a2e;
        background-color: #f8f9fa;
        outline: none;
        transition: border-color 0.2s;
        font-family: inherit;
    }
    .form-section input[type="number"]:focus,
    .form-section select:focus {
        border-color: #1572e8;
        background-color: #fff;
    }
    .radio-group {
        display: flex;
        gap: 20px;
        padding: 12px 18px;
        border: 1.5px solid #e8e8e8;
        border-radius: 50px;
        background-color: #f8f9fa;
    }
    .radio-group label {
        display: inline;
        font-weight: normal;
        color: #1a1a2e;
        margin: 0;
        cursor: pointer;
    }
    input[type="radio"] { 
        margin-right: 5px; 
        accent-color: #1572e8; 
    }
    #duration {
        margin-top: 12px;
    }
    #duration p {
        margin-bottom: 12px;
    }
    #duration label {
        display: block;
        font-size: 13px;
        font-weight: 600;
        color: #555;
        margin-bottom: 6px;
    }
    #duration input[type="number"] {
        width: 100%;
        padding: 12px 18px;
        border: 1.5px solid #e8e8e8;
        border-radius: 50px;
        font-size: 14px;
        background-color: #f8f9fa;
        outline: none;
        font-family: inherit;
    }
    button[type="submit"] { 
        background-color: rgba(13, 82, 179); 
        color: white; 
        padding: 14px 20px; 
        border: none; 
        border-radius: 50px; 
        cursor: pointer; 
        font-size: 16px; 
        font-weight: 600;
        letter-spacing: 0.5px;
        transition: background-color 0.3s, transform 0.1s; 
        width: 100%; 
        margin-top: 20px; 
    }
    button[type="submit"]:hover { background-color: #1262c4; }
    button[type="submit"]:active { transform: scale(0.98); }
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath}/TimetableFormInputServlet" method="post">
		<h2>Create Timetable</h2>
	    <p class="subtitle">Configure your timetable settings</p>
        <div class="form-section">
            <label for="semester">Semesters</label>
            <div class="radio-group">
		        <label><input type="radio" value="odd" name="semester"/> Odd</label>
		        <label><input type="radio" value="even" name="semester"/> Even</label>
		    </div>
        </div>
        <div class="form-section">
            <label for="lec-duration">Duration of each lecture (in minutes)</label>
            <input type="number" name="lec-duration" placeholder="e.g. 55">
        </div>
        <div class="form-section">
            <label for="breaks">How many breaks?</label>
            <select name="breaks" id="breaks" onchange="breakDuration()">
                <option value="">Select</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
            <div id="duration" name="break-duration" class="form-section"></div>
        </div>
        <button type="submit">Continue -></button>
    </form>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Run on initial load in case a default value is set
            breakDuration(); 
        });

        function breakDuration(){
            const brk = document.getElementById("breaks");
            // Check if brk.value is empty string (from 'Select' option)
            const num = brk.value ? parseInt(brk.value, 10) : 0; 
            const cont = document.getElementById("duration");
            
            // Clear old content efficiently
            cont.innerHTML = ""; 

            if(!isNaN(num) && num > 0){
                for(let i = 1; i <= num; i++){
                    
                    // 1. Create the <p> container
                    const p = document.createElement('p');
                    
                    // 2. Create the <label>
                    const label = document.createElement('label');
                    label.htmlFor = 'break-duration-${i}';
                    label.textContent = "Enter Duration of break-"+i+": " + " (in minutes)";
                    
                    // 3. Create the <input>
                    const input = document.createElement('input');
                    input.type = 'number';
                    input.id = "break-duration-"+i;
                    input.name = "break-duration-"+i; // CRITICAL NAME MATCH
                    input.setAttribute('min', '5'); // Enforce minimum duration
                    input.setAttribute('required', 'true');
                    
                    // 4. Assemble and Append
                    p.appendChild(label);
                    p.appendChild(input);
                    
                    cont.appendChild(p);
                }
            }
        }
    </script>
</body>
</html>