<%@ Page Language="C#" Inherits="cs_addparam1" Src="cs_addparam1.aspx.cs" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<html>
	<head runat="server">
		<script language="JavaScript">
		function ComputeAge() {
			var name = document.getElementById('txtName').value;
			var year = document.getElementById('txtDate').value.split('/')[2];
			
			ob_post.AddParam('name', name);
			ob_post.AddParam('year', year);
			ob_post.post(null, "ComputeAge", ResultComputeAge);
		}
		
		function ResultComputeAge(result , ex) {
			document.getElementById('divComputeAge').innerHTML = result;
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
					<span class="title">AddParam</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td  class="tdText">
					Name:
				</td>
				<td>
					<input type="text" id="txtName" style="height:20px;" value="John" />
				</td>
			</tr>
			<tr>
				<td class="tdText">
					Date Of Birth:
				</td>
				<td>
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td align="left" valign="middle">
								<input type="text" ID="txtDate" style="height:20px;" readonly value='5/22/1983' />&#160;
							</td>
							<td align="right" valign="middle">
								<obout:Calendar id="myCalendar" runat="server" 
									DatePickerMode="true"
									MonthWidth="175"
									Columns="1"
									MonthHeight="140"
									TextBoxId="txtDate" 
									DatePickerImagePath ="images/icon2.gif"
									ShortDayNames="Su,Mo,Tu,We,Th,Fr,Sa" MonthMarginWidth="4" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="tdText">
					<br />
					<div id="divComputeAge" style="color:red;font-weight:bold"><br /></div>
					<br />
					<input type="button" value="Compute Age" onclick="ComputeAge()" />
				</td>
			</tr>
		</table>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>
			