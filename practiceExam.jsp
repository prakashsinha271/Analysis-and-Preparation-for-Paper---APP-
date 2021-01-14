<%@ include file="dbconnect.jsp" %>
<link rel="stylesheet" href="./css/style.css?v=2"/>

<sql:query var="preQue" dataSource="${mydb}" scope="session">
    SELECT * FROM precticeset where Branch = "${param.selexam}";
</sql:query>
 <!--  -->
<div class="rowx" style="background-color: #bbb;">
 	<div class="columnx left" style="background-color:#aaa;">
 		<h2 style="color: lightcyan; font-weight: bolder;">Welcome to Practice Set of AAP</h2>
 		<div><h3 style="color: lightcyan;">Branch Name : ${param.selexam}</h3></div>
			<h2 style="color: black;">Time remaining: <p id="demo"></p></h2>
			
	</div>
  <div class="columnx right" style="background-color:#bbb;">
		<form action="result.jsp" method="post" id="frm1">
			<div class="main" style="padding-left:5%">
				<core:forEach var="row" items="${preQue.rows}">
					<div>
   						<label>${row.QNo}</label>
						<label>${row.Que}</label>
						<div>
					
     						<label><span class="checkmark">
       						<input type="radio" name="q${row.QNo}" value="OP1">${row.OP1}</span></label>
       					</div>
						<div>
     						<label><span class="checkmark">
       						<input type="radio" name="q${row.QNo}"  value="OP2">${row.OP2}</span></label>
       					</div>
						<div>
     						<label><span class="checkmark">
       						<input type="radio" name="q${row.QNo}" value="OP3">${row.OP3}</span></label>
       					</div>
						<div>
     						<label><span class="checkmark">
       						<input type="radio" name="q${row.QNo}" value="OP4" >${row.OP4}</span></label>
       					</div>
  					</div>
  				</core:forEach>
            	<div style="padding: 2% 0% 0% 0%;">
            		<input type="button" onclick="myFunction()" value="Submit">
				</div>
			</div>
		</form>    
	 </div>
</div>

			<script>
				// Set the date we're counting down to
				var countDownDate = (new Date().getTime())+(90*60*1000);

				// Update the count down every 1 second
				var x = setInterval(function() {

 					// Get today's date and time
  					var now = new Date().getTime();
    
  					// Find the distance between now and the count down date
  					var distance = countDownDate - now;
    
  					// Time calculations for days, hours, minutes and seconds
  					
  					var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  					var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  					var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
  					// Output the result in an element with id="demo"
  					document.getElementById("demo").innerHTML = hours + "h " + minutes + "m " + seconds + "s ";
    
  					// If the count down is over, write some text 
  					if (distance <= 0) {
   	 					clearInterval(x);
   	 					document.getElementById("demo").innerHTML = "EXPIRED";
   	 					myFunction();
    				}
				}, 1000);
			</script>
<script>
function myFunction() {
	alert("Paper will submit....")
	  document.getElementById("frm1").submit();
}
	</script>
<%@ include file="footer.jsp" %>
