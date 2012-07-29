<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<script language="C#" runat="server">
	public void ServerCreateTimer () {
		if (Session["nrCallback"] != null)
			Session["nrCallback"] = 0;
			
		CreateTimer("MyTimer", "myServerMethod", "myClientFunction", 2000);
	}
	
	public void ServerCancelTimer () {
		if (Session["nrCallback"] != null)
			Session["nrCallback"] = 0;
			
		CancelTimer("MyTimer");
	}
	
	public string myServerMethod() {
		if (Session["nrCallback"] == null)
			Session["nrCallback"] = 0;
			
		Session["nrCallback"] = Int32.Parse(Session["nrCallback"].ToString()) + 1;
		
		return Session["nrCallback"].ToString();
	}
	
</script>

<html>
	<head runat="server">
		<script language="JavaScript">
			function myClientFunction(result, ex) {
				document.getElementById("myDIV").innerHTML += "<span style='color:red'>" + result + " </span>";
				i += 3;
			}
		
			function fill() {
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
		<div id="myDIV" style="padding-top:3px;border:2px solid silver; width:400px; height:25px;font:bold 12px Verdana;">&nbsp;</div>
		<span style="color:gray;font:bold 9px Verdana;display:none" id="myDIVNote">
			* The red number represents the number of callbacks made to the server.
		</span>
		<br />
		<br />
		<input type="button" id="button4" onclick="CreateTimer()" value="Create Callback Timer!"></input>
		&nbsp;&nbsp;
		<input type="button" id="button5" onclick="CancelTimer()" value="Cancel Callback Timer!"></input>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	</body>
</html>

<script>
	var i = 0;
	fill();
</script>