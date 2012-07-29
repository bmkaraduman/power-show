<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true"  Inherits="OboutInc.oboutAJAXPage" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script language="C#" runat="server">

public string onVote(int qNr, int aNr, int nrOfAnswers)
{
	string result = qNr.ToString();
	int [] q = new int [nrOfAnswers + 1];
	// connect to the database
	OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/vote.mdb") + ";User Id=Admin;Password=;");
	OleDbCommand myComm;
	myConn.Open();
	// add 1 vote to the answer chosen
	myComm = new OleDbCommand("UPDATE VoteOption set Result=Result+1 where QID=" + qNr + " and AID=" + aNr, myConn);
	myComm.ExecuteNonQuery();
	// get the data for the current question
	myComm = new OleDbCommand("SELECT AID, Result FROM VoteOption WHERE QID=" + qNr + " ORDER BY AID", myConn);
	OleDbDataReader myReader = myComm.ExecuteReader();
	while (myReader.Read())
		q[myReader.GetInt32(0)-1] =  myReader.GetInt32(1);
	myReader.Close();
	// get the correct answer
	myComm = new OleDbCommand("SELECT Answer FROM Answers WHERE QID=" + qNr, myConn);
	myReader = myComm.ExecuteReader();
	myReader.Read();
	int correctAnswer = myReader.GetInt32(0);
	myReader.Close();
	myConn.Close();
	// q[nrOfAnswers] holds the total number of votes for the current question
	for (int i = 0; i < nrOfAnswers; i++)
		q[nrOfAnswers] += q[i];
	for (int i = 0; i < nrOfAnswers; i++)
		result += "a" + Math.Round(((Decimal)(q[i]*100)/q[nrOfAnswers]),2);
	// the result is a string that contains the question number, the percentage for each answer, the total number of votes, the number of answers and the correct answer, divided by the "a" char
	return result + "a" + q[nrOfAnswers] + "a" + nrOfAnswers + "a" + correctAnswer;
}

</script>

<html>
	<head runat="server">
		<script language="javascript">
	
		var isFirefox = ( ( navigator.userAgent.indexOf ( "Firefox" ) != -1 ) && ( parseInt ( navigator.userAgent.charAt ( navigator.userAgent.indexOf ( "Firefox" ) + 8 ) ) >= 1 ) ) ? true : false;
		
		function callbackVote(str){
			var j = 0;
			var temp = document.getElementById("t" + str).firstChild.firstChild;
			if (temp == null){
				if (isFirefox) {
					temp = document.getElementById("t" + str).firstChild.nextSibling.firstChild;
					while (temp.nextSibling.nextSibling != null){
						j++;
						temp = temp.nextSibling.nextSibling;
					}
				}
				else {
					temp = document.getElementById("t" + str).firstChild.nextSibling.firstChild;
					while (temp.nextSibling != null){
						j++;
						temp = temp.nextSibling;
					}
				}
			}
			else
			{
				while (temp.nextSibling != null){
					j++;
					temp = temp.nextSibling;
				}
			}
			var test = 0;
			ob_post.AddParam('qNr',str);
			for (var i = 1; i <= j; i++)
				if (document.getElementById("q" + str + "_" + i).checked){
					ob_post.AddParam('aNr',i);
					test = 1;
				}
			ob_post.AddParam('nrOfAnswers',j);
			if (test)
			{
				ob_post.post(null,'onVote',writeResults);
			}
			else{
				ob_post.ResetParams();
				alert("You need to choose an option first.");
			}
		}
		
		function writeResults(result){
			var st = result.split("a");
			// j holds the number of answers
			var j = st[st.length - 2];
			// k holds the correct answer
			var k = st[st.length - 1];
			var total = 0;
			// add the table header
			// the height of each row is 30, so the height is (30 * number of rows) + 30 for the total votes
			var ih = "<table height='" + ((30 * j) + 30) + "'  border='0' cellpadding='0' cellspacing='0' class='tdText'>";
			// for each answer add a separate row that contains the answer number, the answer string, the percentage and a chart depending on the percentage
			for (var i = 1; i <= j; i++){
				ih += "<tr><td height='30' width='20'>";
				if (i != k)
					ih += "&nbsp;";
				else
					// if this is the correct answer, add the 'correct' image in the first table cell
					ih += "<img src='images/correct.jpg' height='15' width='20'>";
					
				st[i] = Math.round(st[i].replace(",", "."));
				ih += "</td><td width='20' align='center'>" + i + ".</td><td>" + document.getElementById("a" + st[0] + "_" + i).innerHTML + "</td><td>&nbsp;&nbsp;-&nbsp;&nbsp;" + st[i] + "%&nbsp;&nbsp;</td><td><div style='border:2px solid silver; width:200px;'><img src='images/poll_bar.gif' title='" + st[i] + "%' width='" + (st[i] * 2) + "' height='6'></div></td></tr>";
			}
			// add the total number of votes
			ih += "<tr><td height='30'>&nbsp;</td><td>&nbsp;</td><td colspan='3'>Total votes: " + st[st.length - 3] + "</td></td></tr></table>";
			// write the string to the div
			document.getElementById("Q" + st[0]).innerHTML = ih;
		}
		
		</script>
		
		<style>
			td {font: 10pt Tahoma; margin: 20px;}
			.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray; width: 100%; }
		</style>
	</head>
	<body>
		<br />
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">Voting example</span>
					<br /><br /><br />
					Please take your vote and click 'Submit vote' to see results <span style="color:crimson;">without reloading page</span>.
					<br /><br />
				</td>
			</tr>
		</table>
		<br />
	<span>Q1. Is there any life on mars?</span><br />
	<br />
	<div id="Q1" style="height:150px;">
	<table height="150"  border="0" cellpadding="0" cellspacing="0" id="t1">
	<tr><td height="30" width="40" align="right"><input name="q1" type="radio" id="q1_1"></td><td id="a1_1">Yes</td></tr>
	<tr><td height="30" align="right"><input name="q1" type="radio" id="q1_2"></td><td id="a1_2">No</td></tr>
	<tr><td height="30" align="right"><input name="q1" type="radio" id="q1_3"></td><td id="a1_3">There was in the past, but not now</td></tr>
	<tr><td height="30" align="right"><input name="q1" type="radio" id="q1_4"></td><td id="a1_4">I don't care</td></tr>
	<tr><td height="30" align="right">&nbsp;</td><td><button id="button1" onclick="callbackVote('1')" type="button">Submit vote</button></td></tr>
	</table>
	</div>
	<br />
	<br />
	<span>Q2. Who was the first person in space?</span><br />
	<br />
	<div id="Q2" style="height:150px;">
	<table height="150"  border="0" cellpadding="0" cellspacing="0" id="t2">
	<tr><td height="30" width="40" align="right"><input name="q2" type="radio" id="q2_1"></td><td id="a2_1">Lenin</td></tr>
	<tr><td height="30" align="right"><input name="q2" type="radio" id="q2_2"></td><td id="a2_2">Khruschov</td></tr>
	<tr><td height="30" align="right"><input name="q2" type="radio" id="q2_3"></td><td id="a2_3">Gagarin</td></tr>
	<tr><td height="30" align="right"><input name="q2" type="radio" id="q2_4"></td><td id="a2_4">Shepard</td></tr>
	<tr><td height="30" align="right">&nbsp;</td><td><button id="button2" onclick="callbackVote('2')" type="button">Submit vote</button></td></tr>
	</table>
	</div>
	<br />
	<br />
	<span>Q3. Which country has border with Afganistan?</span><br />
	<br />
	<div id="Q3" style="height:150px;">
	<table height="150"  border="0" cellpadding="0" cellspacing="0" id="t3">
	<tr><td height="30" width="40" align="right"><input name="q3" type="radio" id="q3_1"></td><td id="a3_1">Tadjikistan</td></tr>
	<tr><td height="30" align="right"><input name="q3" type="radio" id="q3_2"></td><td id="a3_2">Kazakhstan</td></tr>
	<tr><td height="30" align="right"><input name="q3" type="radio" id="q3_3"></td><td id="a3_3">Kyrgyzstan</td></tr>
	<tr><td height="30" align="right"><input name="q3" type="radio" id="q3_4"></td><td id="a3_4">Iraq</td></tr>
	<tr><td height="30" align="right">&nbsp;</td><td><button id="button3" onclick="callbackVote('3')" type="button">Submit vote</button></td></tr>
	</table>
	</div>
	<br />
	<br />
	<span>Q4. Who won Tour de France between 1999-2005?</span><br />
	<br />
	<div id="Q4" style="height:150px;">
	<table height="150"  border="0" cellpadding="0" cellspacing="0" id="t4">
	<tr><td height="30" width="40" align="right"><input name="q4" type="radio" id="q4_1"></td><td id="a4_1">Louis Armstrong</td></tr>
	<tr><td height="30" align="right"><input name="q4" type="radio" id="q4_2"></td><td id="a4_2">Neil Armstrong</td></tr>
	<tr><td height="30" align="right"><input name="q4" type="radio" id="q4_3"></td><td id="a4_3">Lance Armstrong</td></tr>
	<tr><td height="30" align="right"><input name="q4" type="radio" id="q4_4"></td><td id="a4_4">Some Armstrong</td></tr>
	<tr><td height="30" align="right">&nbsp;</td><td><button id="button4" onclick="callbackVote('4')" type="button">Submit vote</button></td></tr>
	</table>
	</div>
	<br />
	<br />
	<span>Q5. Which city has the tallest building?</span><br />
	<br />
	<div id="Q5" style="height:150px;">
	<table height="150"  border="0" cellpadding="0" cellspacing="0" id="t5">
	<tr><td height="30" width="40" align="right"><input name="q5" type="radio" id="q5_1"></td><td id="a5_1">Kuala Lumpur</td></tr>
	<tr><td height="30" align="right"><input name="q5" type="radio" id="q5_2"></td><td id="a5_2">Taipei</td></tr>
	<tr><td height="30" align="right"><input name="q5" type="radio" id="q5_3"></td><td id="a5_3">Chicago</td></tr>
	<tr><td height="30" align="right"><input name="q5" type="radio" id="q5_4"></td><td id="a5_4">Shanghai</td></tr>
	<tr><td height="30" align="right">&nbsp;</td><td><button id="button5" onclick="callbackVote('5')" type="button">Submit vote</button></td></tr>
	</table>
	</div>
	<br />
	<br />
	<span>Q6. Do you like voting?</span><br />
	<br />
	<div id="Q6" style="height:150px;">
	<table height="120"  border="0" cellpadding="0" cellspacing="0" id="t6">
	<tr><td height="30" width="40" align="right"><input name="q6" type="radio" id="q6_1"></td><td id="a6_1">What am I doing now?</td></tr>
	<tr><td height="30" align="right"><input name="q6" type="radio" id="q6_2"></td><td id="a6_2">Voting? What's that?</td></tr>
	<tr><td height="30" align="right"><input name="q6" type="radio" id="q6_3"></td><td id="a6_3">I have votes in my veines</td></tr>
	<tr><td height="30" align="right">&nbsp;</td><td><button id="button6" onclick="callbackVote('6')" type="button">Submit vote</button></td></tr>
	</table>
	</div>
	<br />
	<br />
	<span>Q7. Who was the tallest dwarf fom Snow White and the Seven Dwarfs?</span><br />
	<br />
	<div id="Q7" style="height:150px;">
	<table height="120"  border="0" cellpadding="0" cellspacing="0" id="t7">
	<tr><td height="30" width="40" align="right"><input name="q7" type="radio" id="q7_1"></td><td id="a7_1">Happy</td></tr>
	<tr><td height="30" align="right"><input name="q7" type="radio" id="q7_2"></td><td id="a7_2">Grumpy</td></tr>
	<tr><td height="30" align="right"><input name="q7" type="radio" id="q7_3"></td><td id="a7_3">Doc over Dopey</td></tr>
	<tr><td height="30" align="right"><input name="q7" type="radio" id="q7_4"></td><td id="a7_4">Sneezy or Sleepy</td></tr>
	<tr><td height="30" align="right"><input name="q7" type="radio" id="q7_5"></td><td id="a7_5">Bashful</td></tr>
	<tr><td height="30" align="right">&nbsp;</td><td><button id="button7" onclick="callbackVote('7')" type="button">Submit vote</button></td></tr>
	</table>
	</div>
	<br /><br /><br />
		
	<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	</body>
</html>
