<%@ include file="../dbconnect.jsp" %>
<link rel="stylesheet" href="../css/style.css?v=2"/>

<sql:query var="preQue" dataSource="${mydb}" scope="session">
    SELECT * FROM question where SCode = "${exesel}";
</sql:query>
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
  margin-top: 50px;
}
.dot {
  height: 20px;
  width: 20px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
}

</style>
</head>
<body>

<div class="navbar">
<table style="width:100%;">
	<tr>
		<th colspan="4"><h2>Practice Set of Analysis and Preparation for Paper</h2></th>
		
	</tr>
	<tr>
		<td><h3 style="color: lightcyan;">Subject: ${SubCode} - ${SelSubject} (${SemID})</h3></td>
		<td><h3>Time remaining: </h3></td><td><h3><p id="demo"></p></h3></td>
		<td><form><input type="button" value="Calculator" onClick="window.alert('Under Construction')"></form></td>
	</tr>
</table>
</div>

<div class="main">
<form action="result.jsp" method="post" id="frm1">
			<div class="main" style="padding-left:5%">
				<hr>
				<core:forEach var="row" items="${preQue.rows}">
					<div><b>
   						<span class="dot">${row.QNo}</span>
						<label>${row.Question}</label>
						</b><div>
							
							<label><span class="checkmark">
       						<input type="radio" name="q${row.QNo}" value="OP1" id="rb">${row.op1}</span></label>
       					</div>
						<div>
     						<label><span class="checkmark">
       						<input type="radio" name="q${row.QNo}"  value="OP2" id="rb">${row.op2}</span></label>
       					</div>
						<div>
     						<label><span class="checkmark">
       						<input type="radio" name="q${row.QNo}" value="OP3" id="rb">${row.op3}</span></label>
       					</div>
						<div>
     						<label><span class="checkmark">
       						<input type="radio" name="q${row.QNo}" value="OP4" id="rb">${row.op4}</span></label>
       					</div>
       					<div>
     						<label><span class="checkmark">
       						<input type="radio" name="q${row.QNo}" style="display:none;">Reset</span></label>
       					</div>
  					</div>
  					<br><hr>
  				</core:forEach>
            	<div style="padding: 2% 0% 0% 0%;">
            		<input type="button" onclick="myFunction()" value="Submit">
				</div>
			</div>
		</form>    
</div>
</body>

<script>
var dt = new Date();
document.getElementById("datetime").innerHTML = dt.toLocaleDateString();
</script>


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
  					if (distance < 0) {
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
<!-- 	
<script type="text/javascript">
 var radio_button_list = document.getElementsByName('q${row.QNo}');
 var radio_button;
 var count;
 for(count = 0; count<radio_button_list.length; count++)
 {
  radio_button_list[count].onclick = function(){
   if(radio_button == this)
   {
    this.checked = false;
    radio_button = null;
   }
   else
   {
    radio_button = this;
   }
  };
 }
</script>
 -->