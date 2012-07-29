<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<script runat="server" language="c#">
	public string onDnD2(int number1, int number2)
	{
		DateTime dt = DateTime.Now;
		while (DateTime.Now.Subtract(dt).Seconds < 3) { }
		return (number1 + number2).ToString();
	}
</script>
<html>
	<head runat="server">
		<script language="JavaScript">
			function ASyncCallback() {
				ob_post.AddParam('number1', 49583);
				ob_post.AddParam('number2', 83924);
				ob_post.post(null,'onDnD2',myFunction);
			}
			
			function myFunction(result){
				alert("The data has been sent to the server using the asynchronous method.\n\nThe result retrieved from the server is: " + result);
			}
			
			function fill(){
				if (i==24){
					document.getElementById("myDIV").innerHTML=" ";
					i=0;
				}
				else{
					document.getElementById("myDIV").innerHTML+=". ";
					i++;
				}
				setTimeout("fill()",500);
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
					<span class="title">Asynchronous Callback</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<input type="button" id="myButton" onclick="ASyncCallback()" value="ASync Callback now!"></input>
		<br />
		<br />
		<div id="myDIV" style="border:2px solid silver; width:200px; height:25px;font:bold 12px Verdana;">&nbsp;</div>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
	</body>
</html>

<script language="JavaScript">
	var i=0;
	fill();
</script>