<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<script language="C#" runat="server">
	public void ServerUseConfirmDialog () {
		// these are the params that can be sent to the result function along with the response
		Hashtable ht = new Hashtable();
		ht.Add("param1", 1);
		ht.Add("param2", "a");
		
		// call the ShowConfirmDialog function with the message, the function to call
		// after the user answers, and the extra parameters the function should have.
		// the initial client side function that called this function (ServerUseConfirmDialog)
		// will receive the final answer of function Confirm
		ShowConfirmationDialog("Are you sure?", "Confirm", ht);
	}

	public string Confirm (bool response, int param1, string param2) {
		// response is true or false depending on user choice
		// the rest of the params is what we saved as the last
		// parameter of ShowConfirmationDialog
		if (response)
		{
			// user chose OK
			//
			// do some execution
			//
			return "You clicked Ok";
		}
		else 
		{
			// user chose Cancel
			//
			// do some execution
			//
			return "You clicked Cancel";
		}
	}
</script>

<html>
	<head runat="server">
		<script language="JavaScript">
			function ShowConfirmationDialog() {
				ob_post.post(null, 'ServerUseConfirmDialog', 
					function(r)
					{
						alert('the response is: ' + r)
					}
				);
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
					<span class="title">ShowConfirmationDialog</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<input type="button" id="button1" onclick="ShowConfirmationDialog()" value="Callback now!"></input>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	</body>
</html>