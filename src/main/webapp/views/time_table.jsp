<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Time Table</title>

<style>
    body{
        font-family: Arial, Helvetica, sans-serif;
        margin:10px;
        color:#000;
    }

    
    .college{
        text-align:center;
        font-size:20px;
        font-weight:900;
        margin-bottom:4px;
    }
    .subhead{
        text-align:center;
        font-size:10px;
        font-weight:700;
        margin:2px 0;
    }

    
    table{
        border-collapse:collapse;
        width:100%;
        min-width:900px; 
        font-size:13px;
        font-weight:700; 
    }

    th, td{
        border:2px solid #000; 
        padding:7px;
        text-align:center;
        vertical-align:middle;
    }

    th{
        font-weight:900;
    }

    
    .wrapper{
        overflow-x:auto;
    }

    .mt{
        margin-top:10px;
    }

    .right{
        text-align:right;
        font-weight:900;
        margin-top:10px;
    }
</style>
</head>

<body>
<div class="container">
<div class="college">
    SHRI DADAJI INSTITUTE OF TECHNOLOGY AND SCIENCE, KHANDWA
</div>
<div class="subhead">
    TIME TABLE V SEM COMPUTER SCIENCE ENGG. JUNE – DEC 2024-25
</div>
<div>
  W.E.F.: 
<div align="right">
  Room No. 319
   </div>
   </div>
</div>
<div class="wrapper mt">
<table>
    <tr>
        <th>Day / Time</th>
        <th>10:15-11:10</th>
        <th>11:10-12:05</th>
        <th>12:05-12:40</th>
        <th>12:40-01:35</th>
        <th>01:35-02:30</th>
        <th>02:30-02:40</th>
        <th>02:40-03:35</th>
        <th>03:35-04:30</th>
    </tr>

    <tr>
        <th>MONDAY</th>
        <td>IWT</td>
        <td>TOC</td>
        <td rowspan="6">RECESS</td>
        <td>Java Lab</td>
        <td>Java Lab</td>
        <td rowspan="6">BREAK</td>
        <td>DBMS</td>
        <td>Cyber Security</td>
    </tr>

    <tr>
        <th>TUESDAY</th>
        <td>DBMS</td>
        <td>IWT</td>
        <td>Java Lab</td>
        <td>Java Lab</td>
        <td>TOC</td>
        <td>Cyber Security</td>
    </tr>

    <tr>
        <th>WEDNESDAY</th>
        <td>Cyber Security</td>
        <td>IWT</td>
        <td>TOC</td>
        <td>DBMS</td>
        <td>DBMS Lab</td>
        <td>Cyber Security</td>
    </tr>

    <tr>
        <th>THURSDAY</th>
        <td>DBMS</td>
        <td>Cyber Security</td>
        <td>TOC</td>
        <td>IWT</td>
        <td>TOC Lab</td>
        <td>Minor Project Lab</td>
    </tr>

    <tr>
        <th>FRIDAY</th>
        <td>DBMS</td>
        <td>Cyber Security</td>
        <td>DBMS</td>
        <td>IWT</td>
        <td>Evaluation of Internship-II</td>
        <td>Minor Project Lab</td>
    </tr>

    <tr>
        <th>SATURDAY</th>
        <td>TOC</td>
        <td>IWT</td>
        <td>Java Lab</td>
        <td>Java Lab</td>
        <td>Python Lab</td>
        <td>Games & Library</td>
    </tr>
</table>
</div>


<div class="wrapper mt">
<table>
    <tr>
        <th>CS-501</th>
        <td>Theory of Computation</td>
        <td>Mr. Ankit Bakshi</td>
    </tr>
    <tr>
        <th>CS-502</th>
        <td>Database Management System</td>
        <td>Ms. Ishita Maheshwari</td>
    </tr>
    <tr>
        <th>CS-503</th>
        <td>Cyber Security</td>
        <td>Mr. Rajesh gyanchandani </td>
    </tr>
    <tr>
        <th>CS-504</th>
        <td>Internet & Web Technology</td>
        <td>Mrs. Sheekhi Guru </td>
    </tr>
    <tr>
        <th>CS-505</th>
        <td>Lab (Linux)</td>
        <td>Mr. Rajesh gyanchandani</td>
    </tr> 
     <tr>
        <th>CS-506</th>
        <td>Lab (python)</td>
        <td>Ms. Ishita Maheshwari</td>
    </tr>
     <tr>
        <th>CS-507</th>
        <td>Evaluation of Internship-II</td>
        <td>Mrs. Beena pal</td>
    </tr>
     <tr>
        <th>CS-508</th>
        <td> Minor Project</td>
        <td>Ms. Ishita Maheshwari</td>
    </tr>
    <tr>
        <th></th>
        <td>Games & Library</td>
        <td>Mr. V. P. Ladhe / Mr. Ram Bhatore</td>
    </tr>
</table>
</div>

<div class="right">
    Dean Academics<br>
    SDITS, Khandwa
</div>
<div class="col-md-4 ">
	<SCRIPT LANGUAGE="JavaScript"> 
if (window.print) {
document.write('<input type=button style="background-color:lightblue" class="btn btn-default btn-block" name=print value="Print" onClick="window.print()">');
}

</script>	
<%-- <input type="submit"  class="btn btn-default btn-block" name="button6" id="button" value="print"> --%>
                                            </div>
</body>
</html>
