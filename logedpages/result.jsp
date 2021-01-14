<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbconnect.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
.button {
  display: inline-block;
    border-radius: 45px;
    background-color: #f4511e;
    border: none;
    color: #FFFFFF;
    text-align: center;
    font-size: 20px;
    padding: 4px;
    width: 100px;
    transition: all 0.5s;
    cursor: pointer;
    margin: 0px;
    float: right;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
</style>

<title>Insert title here</title>
</head>
<body>
 <h2>Student Result Page - ${SubCode} - ${SelSubject} (${SemID})</h2>
<table>
  <tr>
    <th>Questions</th>
    <th>Your Answer</th>
    <th>Correct Answers</th>
    <th>Alloted Mark</th>
  </tr>
   <core:set var="Correct" value="0" scope="page" />
   <core:set var="Incorrect" value="0" scope="page" />
   <core:set var="Unattempt" value="0" scope="page" />
  <core:forEach var="row" items="${preQue.rows}"  varStatus="index">
  <tr>
    <td>
    	${index.count} ${row.Question}
    
    </td>
    <td>      
           <core:set var="qid" value="q${row.QNo}"/>				<!-- Student's Answer -->
              ${row[param[qid]]}
    </td>
    <td>${row.Answer}</td>										<!-- Correct Answer -->
    
    <core:set var="StdAns" value="${row[param[qid]]}"/>
    <core:set var="CorrAns" value="${row.Answer}"/>
   
    <core:choose>
       	<core:when test = "${not empty StdAns and StdAns==CorrAns}">
    		<td><font style="color:blue;font-weight: bolder;">Correct</font></td>
    		<core:set var="Correct" value="${Correct+1}" scope="page"/>
    	</core:when>
    	<core:when test = "${not empty StdAns and StdAns!=CorrAns}">
    		<td><font style="color:red;font-weight: bold;">Incorrect</font></td>
    		<core:set var="Incorrect" value="${Incorrect+1}" scope="page"/>
    	</core:when>
    	<core:otherwise>
    		<td><font style="color:black;">Unattempt</font></td>
    		<core:set var="Unattempt" value="${Unattempt+1}" scope="page"/>
    	</core:otherwise>
    </core:choose>
     </tr>
  </core:forEach>
  <tr>
  	<td colspan="4">
  		<table border="2">
  			<tr>
  				<td colspan="2">Over All Performance 
  				<div><button class="button" style="vertical-align:middle" onclick="window.close()"><span>Close </span></button></div></td>
  			</tr>
  			<tr>
  				<td>Attempted Questions</td>
  				<td>${Correct+Incorrect} Out of ${Correct+Incorrect+Unattempt}</td>
  			</tr>
  			<tr>
  				<td>Number of correct answer</td>
  				<td>${Correct}</td>
  			</tr>
  			<tr>
  				<td>Number of incorrect answer</td>
  				<td>${Incorrect}</td>
  			</tr>
  			<tr>
  				<td>Marks Alloted for correct answer</td>
  				<td>${Correct*1}</td>
  			</tr>
  			<tr>
  				<td>Negative Marks</td>
  				<td>${Incorrect*0.5}</td>
  			</tr>
  			<tr>
  				<td>Total Alloted Marks</td>
  				<td>${(Correct*1)-(Incorrect*0.5)}</td>
  			</tr>
  		</table>
  		<core:remove var="Correct"/>
  		<core:remove var="Incorrect"/>
  		<core:remove var="StdAns"/>
  		<core:remove var="CorrAns"/>
  	</td>
  </tr>  
</table>
</body>
</html>

