<%@ include file="../dbconnect.jsp" %>
<core:set var="exesel" value="${param.selexams}" scope="session"/>
<sql:query var="std_details" dataSource="${mydb}">
    SELECT * FROM registration where Email = "${type1}";
</sql:query>
<sql:query var="preDet" dataSource="${mydb}" scope="session">
    SELECT * FROM subject where SCode = "${exesel}";
</sql:query>
<core:forEach var="row5" items="${preDet.rows}">
	<core:set var = "SelSubject" value = "${row5.SName}" scope="session"/>
	<core:set var = "SemID" value = "${row5.SemId}" scope="session"/>
	<core:set var = "SubCode" value = "${row5.SCode}" scope="session"/>
</core:forEach>


<style>
body {margin:0;}

.navbar {
  overflow: hidden;
  background-color: #333;
  position: fixed;
  top: 0;
  width: 100%;
}
h2,h3{
	color: aqua;
}

.main {
  padding: 16px;
  margin-top: 100px;
}
</style>
</head>
<body>

<div class="navbar">
  <h2>
  	<core:forEach var="row" items="${std_details.rows}">
    	Candidate Name: ${row.FirstName} - ${type1}
	</core:forEach></h2>
    	<h3>Exam Details: ${SubCode} ${SelSubject} (${SemID}), Exam Date - <span id="datetime"></span>
</h2>
</div>

<div class="main">
 <div class="field-item even"><p><strong>Steps For Accessing Your Exam Online:</strong></p>

<ul>
	<li>Read all the instructions carefully.</li>
	<li>Close all active other irrelevant tabs and windows.</li>
	<li>Click on <b>I Agree</b> button.</li>
	<li>Click on the <b>Start Exam</b> to open the exam portal.</li>
</ul>

<p><br>
<strong>Before starting the exam:</strong></p>

<p>Please verify that the student's name appears correctly in top of the browser.</p>
<form>
You are allowed to use only online virtual calculator.
<input type="button" value="Demo Calculator" onClick="window.open('https://www.tcsion.com/OnlineAssessment/ScientificCalculator/Calculator.html','window','width=500,height=350')">
</form>
<p><strong>During the exam:</strong></p>

<ul>
	<li>The student may not use his or her textbook, course notes, or receive help from a instructor or any other outside source.</li>
	<li>Students must complete the question multiple-choice exam within the 90-minute time frame allotted for the exam.</li>
	<li>Students must not stop the session and then return to it. This is especially important in the online environment where the system will "time-out" and not allow the student or you to reenter the exam site.</li>
</ul>

<p><strong>Questions and marking details</strong></p>

<ul>
	<li>This test consist 20 questions.</li>
	<li>Correct answer carried 1 mark.</li>
	<li><b>There is negative marking for incorrect answer.</b></li>
	<li>Negative marks 0.5 will be deduct for each incorrect answer.</li>
	<li>Test will be of 90 minutes</li>
	<li>You can scroll down to see next questions</li>
</ul>

<h4><strong>What to do if your online exam is interrupted</strong></h4>

<ul>
	<li>If your online exam is interrupted, click the Back button on your web browser to see if you can return to the exam. If not, follow the instructions below to resume taking the exam.
	<em>Note: Answers are saved after your final submission. If you have to log back in to complete your exam, your prior answers will not be remain.</em></li>
	<li>Reconnect to the Internet and log back into Blackboard.</li>
	<li>Follow your original instructions to access the exam login page.</li>
	<li>Ask your instructor to re-enter the Username and Password, then select the checkbox "Show list of unfinished exams, only select to re-enter an exam already in progress."This will enable you to resume taking the exam, close to the point before the interruption occurred.</li>
	<li>Have your instructor enter the Username and Password provided in the email from The College and click enter.</li>
</ul>

<h4><strong>Support</strong></h4>

<p>If you have any questions, please contact the Analysis and Preparation for Paper directly or email example@email.com</p>
</div>
  <form id="demoForm">
  <label><span class="checkmark">
 <input type="checkbox" name="myCheck" value="1" id="myCheck" required/>I have read all the instructions carefully and I am ready for appear in exam.
 </span></label>
<input type="button" onclick="myFunction1()" value="Start Exam">
</form> 
</div>
</body>

<script>
var dt = new Date();
document.getElementById("datetime").innerHTML = dt.toLocaleDateString();
</script>

<script>
function myFunction1() {
	var checkBox = document.getElementById("myCheck");
	if (checkBox.checked == true)
	{
		alert("You will be redirect to exam portal, Best of luck")
		window.open("feedbackform.jsp", "_self");
		window.open('practicpaper.jsp','window','width=1366,height=768');
		
	}
	else
		{
		alert("Please select 'Check Box'!!")
		}
	
}
	</script>