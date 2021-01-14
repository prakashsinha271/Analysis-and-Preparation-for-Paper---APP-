<%@ include file="dbconnect.jsp" %>
<div class="transa" id="transa">
<sql:query var="list_module" dataSource="${mydb}">
    SELECT Branch FROM precticeset Group by Branch;
</sql:query>

<div class="examWindow" id="myExam">
	<div>
		<form action = 'practiceExam.jsp' method='post' class="form-container"  target="_blank">
		<select name="selexam" class="exselect">
  			  	<core:forEach var="row" items="${list_module.rows}">
					<option value="${row.Branch}">${row.Branch}</option>
				</core:forEach>
   			</select>
			<button type="submit" class="exbtn">Appear</button>
  		 	<button type="button" class="exbtncancel" onclick="closePre()">Close</button>
  		 </form>
	</div>
</div>
</div>