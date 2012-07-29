<%@ Page Language="C#" Inherits="cs_sync" Src="cs_sync.aspx.cs" %>

<html>
	<head runat="server"><style>
			.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray; width: 100%; }
		</style></head>
	<body>
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">Synchronous Callback</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<input type="button" id="myButton" onclick="SyncCallback()" value="Sync Callback now!"></input>
		<br />
		<br />
		<div id="myDIV" style="border:2px solid silver; width:200px; height:25px;font:bold 12px Verdana;">&nbsp;</div>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>

<script language="JavaScript">
	function SyncCallback() {
		ob_post.AddParam('number1', 49583);
		ob_post.AddParam('number2', 83924);
		alert('The data has been sent to the server using the synchronous method.\n\nThe result retrieved from the server is: ' + ob_post.post(null,'onDnD2'));		
	}
	
	var i=0;
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
	fill();
</script>