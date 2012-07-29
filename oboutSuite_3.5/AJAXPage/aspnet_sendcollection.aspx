<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<script language="C#" runat="server">
	public void SendCollection(string myCollectionParam) {
		
		string[] myCollection = myCollectionParam.Split(new char[]{'|'});
		
		string myCollectionString = string.Empty;
		for (int i=0;i<myCollection.Length;i++)
		{
			myCollectionString += myCollectionString == string.Empty ? myCollection[i] : ", " + myCollection[i];
		}
		
		ShowAlert("The collection items are: " + myCollectionString);
	}
	
</script>

<html>
	<head runat="server">
		<script language="JavaScript">
			function SendCollection() {
				var myCollection = new Array();
				myCollection[0] = "Saab";
				myCollection[1] = "Volvo";
				myCollection[2] = "BMW";
				
				var myCollectionParam = "";
				for (i=0;i<myCollection.length;i++)
				{
					myCollectionParam += (myCollectionParam == "") ? myCollection[i] : "|" + myCollection[i];
				}
				
				ob_post.post(null, 'SendCollection', function(){}, {"myCollectionParam":myCollectionParam});
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
					<span class="title">Send Collection</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<input type="button" id="button2" onclick="SendCollection()" value="Send Collection to Server!"></input>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	</body>
</html>