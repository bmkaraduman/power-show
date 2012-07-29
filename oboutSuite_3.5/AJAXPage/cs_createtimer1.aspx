<%@ Page Language="C#" Inherits="cs_createtimer1" Src="cs_createtimer1.aspx.cs" %>
<html>
	<head runat="server">
		<script language="JavaScript">
			function fill(){
				if (i>=48){
					document.getElementById("myDIV").innerHTML=" ";
					i=0;
				}
				else{
					document.getElementById("myDIV").innerHTML+="&middot; ";
					i++;
				}
				setTimeout("fill()",500);
			}
			
			function fillDiv(divID) {
				document.getElementById(divID).innerHTML += "<span style='color:red'>O </span>";
				i += 2;
			}
			
			function CreateTimer() {
				document.getElementById('myDIVNote').style.display = 'inline';
				ob_post.post(null, 'ServerCreateTimer', function(){});
			}
			
			function CancelTimer() {
				document.getElementById('myDIVNote').style.display = 'none';
				ob_post.post(null, 'ServerCancelTimer', function(){});
			}
		</script>
		<style>
			.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray; width: 100%; }
		</style>
	</head>
	<body>
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">CreateTimer/CancelTimer</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<div id="myDIV" style="padding-top:3px;border:2px solid silver; width:400px; height:25px;font:bold 10px Verdana;">&nbsp;</div>
		<span style="color:gray;font:bold 9px Verdana;display:none" id="myDIVNote">
			* The red <span style="color:red">O</span> is set when the client function is triggered.
		</span>
		<br />
		<br />
		<input type="button" id="button2" onclick="CreateTimer()" value="Create Callback Timer!"></input>
		&nbsp;&nbsp;
		<input type="button" id="button3" onclick="CancelTimer()" value="Cancel Callback Timer!"></input>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>

<script>
	var i = 0;
	fill();
</script>