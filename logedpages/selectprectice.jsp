<%@ include file="../dbconnect.jsp" %>
<div class="transa" id="transa">
<div class="examWindow" id="myExam">
	<div>
		<form action = 'pracexam.jsp' method='post' class='form-container' target='_blank'>
		<sql:query var="stdDet" dataSource="${mydb}">
    				SELECT Branch,Sem FROM registration where Email = "${type1}";
			</sql:query>
			<core:forEach var="row10" items="${stdDet.rows}">
				<core:set var = "StdBrc" value = "${row10.Branch}"/>
				<core:set var = "StdSems" value = "${row10.Sem}"/>
			</core:forEach>
			<sql:query var="semcoded" dataSource="${mydb}">
    				SELECT * FROM subject where SemId = (SELECT SemId from semester
					where Semester = "${StdSems}" and Branches = "${StdBrc}");
			</sql:query>
			
			<select name="selexams" class="exselect">
  			  	<core:forEach var="row11" items="${semcoded.rows}">
					<option value="${row11.SCode}">${row11.SemId} - ${row11.SName}</option>
				</core:forEach>
   			</select>
			<button type="submit" class="exbtn")">Appear</button>
  		 	<button type="button" class="exbtncancel" onclick="closePre()">Close</button>
  		 </form>
	</div>
</div>
</div>