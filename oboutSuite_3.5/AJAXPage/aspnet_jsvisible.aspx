<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Import Namespace="OboutInc" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e) 
	{
		if (!IsCallback)
		{
			myCalendar.DateToday  = new DateTime(1983, 5, 22);
			myCalendar.ShowYearSelector = true;
			myCalendar.TitleText = "";
		}
    }
	
	[JSVisible]
	public string ComputeAge(string name, int year)
	{
		int age = DateTime.Now.Year - year;
		return name + " is " + age + " years old.";
	}
</script>

<html>
	<head runat="server">
		<script language="JavaScript">
		function ComputeAgeClient() {
			var name = document.getElementById('txtName').value;
			var year = document.getElementById('txtDate').value.split('/')[2];
			
			document.getElementById('divComputeAge').innerHTML = ComputeAge(name, year);
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
					<span class="title">JSVisible</span><br /><br /><br />
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
					<input type="button" value="Compute Age" onclick="ComputeAgeClient()" />
				</td>
			</tr>
		</table>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
	</body>
</html>
			