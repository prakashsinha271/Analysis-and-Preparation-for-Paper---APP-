<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:query var="myquestion" dataSource="${mydb}">
		SELECT * FROM precticeset where Branch = "${param.selBranch}"
</sql:query>
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
</style>

<title>Insert title here</title>
</head>
<body>
 <h2>Student Result Page</h2>
<table>
  <tr>
    <th>Questions</th>
    <th>Your Answer</th>
    <th>Correct Answers</th>
    <th>Alloted Mark</th>
  </tr>
   <core:set var="Correct" value="0" scope="page" />
    <core:set var="Incorrect" value="0" scope="page" />
  <core:forEach var="row" items="${preQue.rows}"  varStatus="index">
  <tr>
    <td>
    	${index.count} ${row.Que}
    
    </td>
    <td>      
           <core:set var="qid" value="q${row.QNo}"/>				<!-- Student's Answer -->
              ${row[param[qid]]}
    </td>
    <td>${row[row.Answer]}</td>										<!-- Correct Answer -->
    
    <core:set var="StdAns" value="${row[param[qid]]}"/>
    <core:set var="CorrAns" value="${row[row.Answer]}"/>
   
    <core:choose>
    	<core:when test = "${StdAns==CorrAns}">
    		<td><font style="color:blue;font-weight: bolder;">Correct(+1)</font></td>
    		<core:set var="Correct" value="${Correct+1}" scope="page"/>
    	</core:when>
    	<core:otherwise>
    		<td><font style="color:red;font-weight: bold;">Incorrect(-0.5)</font></td>
    		<core:set var="Incorrect" value="${Incorrect+1}" scope="page"/>
    	</core:otherwise>
    </core:choose>
     </tr>
  </core:forEach>
  <tr>
  	<td colspan="4">
  		<table border="2">
  			<tr>
  				<td colspan="2">Over All Performance</td>
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
  	</td>
  </tr>
  
</table>
</body>
</html>

