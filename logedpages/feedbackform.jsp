<%@ include file="../dbconnect.jsp" %>
<style>
body {
	background-color: #000;
}
html,
body {
	height: 100%;
}
.form-container
{
	background-color: #fff;
    padding-left: 20%;
    border-radius: 2%;
    padding-bottom: 5%;
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
    width: 160px;
    transition: all 0.5s;
    cursor: pointer;
    margin-top: 10px;
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
<body>
<div class="row " style="margin-top: 8%">
    <div class="col-md-6 col-md-offset-3 form-container">
        <h2>Feedback:</h2>
        <p>
            Please provide your feedback below, your valuable feedback help us to improve our services:
        </p>
        <form method="post" id="reused_form">
            <div class="row">
                <div class="col-sm-12 form-group">
                <label><b>How was the level of questions?</b></label>
                <p>
                    
                    <input type="radio" name="level">
                    Bad
                    <br>

                   <input type="radio" name="level">
                    Average
                    <br>

                    <input type="radio" name="level">
                    Good
                     <br>
                </p>
                <label><b>How was the interface?</b></label>
                <p>
                    
                    <input type="radio" name="interface">
                    Difficult
                    <br>

                   
                    <input type="radio" name="interface">
                    Average
                    <br>

                   
                    <input type="radio" name="interface">
                    Userfriendly
                    <br>
                </p>
                <label><b>How likely are you to attempt exam on our site again?</b></label>
                <p>
                    
                    <input type="radio" name="like">
                    Not at all
                    <br>

                    
                    <input type="radio" name="like">
                    Maybe
                    <br>

                    
                    <input type="radio" name="like">
                    Very
                    <br>
                </p>
                 <label><b>Would you suggest our site to others?</b></label>
                <p>
                    
                    <input type="radio" name="suggest">
                    Never
                    <br>

                   
                    <input type="radio" name="suggest">
                    Yes
                    <br>

                    
                    <input type="radio" name="suggest">
                    Definitely
                    <br>
                </p>
                <label><b>How was the marking scheme?</b></label>
                <p>
                    
                    <input type="radio" name="marking">
                    Not fair
                    <br>

                    
                    <input type="radio" name="marking">
                    Moderately fair<br>
                  
                    <input type="radio" name="marking">
                    Truely fair
                    <br>
                </p>
                <label><b>Were we able to cover all topics from subject?</b></label>
                <p>
                    
                    <input type="radio" name="cover">
                    No
                    <br>

                    
                    <input type="radio" name="cover">
                    Some
                    <br>

                    
                    <input type="radio" name="cover">
                    Yes
                    <br>
                </p>
                <label><b>How do you rate your overall experience?</b></label>
                <p>
                    
                    <input type="radio" name="experience">
                    Bad
                    <br>

                    
                    <input type="radio" name="experience">
                    Average
                    <br>

                   
                    <input type="radio" name="experience">
                    Good
                    <br>
                </p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 form-group">
                    <label for="comments">
                        Comments:</label>
                        </div>
                  <div>
                    <textarea class="form-control" type="textarea" name="comments" id="comments" placeholder="Your Comments" maxlength="80%" rows="7" cols="50"></textarea>
                </div>
            </div>
            <div class="row">
                <button class="button" style="vertical-align:middle" onclick="window.close();"><span>Save and Exit</span></button>
            </div>

        </form>
    </div>
</div>