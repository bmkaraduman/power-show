<%@ Page Language="vb" Inherits="company" Src="vb_company.aspx.vb" %>
<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_NET" %>
<%@ Register TagPrefix="ogrid" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head id="Head1" runat="server">
		<title>obout ASP.NET Splitter examples</title>
		
		<style type="text/css">
		    .tdText {
		        font:11px Verdana;
		        color:#333333;
            }
		</style>
		<script type="text/javascript">
			function CompanySelect()
			{
				var cID = gridCompany.SelectedRecords[0].ID;
				splDV.loadPage("RightContent", "vb_companydetails.aspx?cID=" + cID);
			}
		</script>
	</head>
	<body>
	    <form id="Form1" runat="server">
	    <br />
		<span class="tdText"><b>ASP.NET Splitter - Company Details </b></span>
	    <br /><br />
	     <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
        <br /><br />
		<div style="width:686px;height:440px;border:1px solid #ebe9ed">
		<obspl:HorizontalSplitter StyleFolder="styles/default" id="splDV" runat="server" CookieDays="0">
			<TopPanel HeightMin="150" HeightMax="250" HeightDefault="200" >
				<header height="25">
					<table style="background-color:#f7f7f7" width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="tdText" style="padding-left:19px;width:50px;">
								<b>Id</b>
							</td>
							<td class="tdText" style="padding-left:11px;width:392px;">
								<b>Name</b>
							</td>
							<td class="tdText" style="padding-left:15px;">
								<b>Contact</b>
							</td>
						</tr>
					</table>
				</header>
				<content>
					<div class="tdText" style="padding-left:0px;padding-top:0px">
						<ogrid:Grid id="gridCompany" runat="server" KeepSelectedRecords="false" 
							AllowAddingRecords="false" CallbackMode="true" Serialize="true" AllowColumnResizing="true" ShowHeader="false"
							ShowFooter="false" AllowRecordSelection="true" AllowMultiRecordSelection="false" 
							PageSize="12"  FolderStyle="../Grid/styles/style_7" AutoGenerateColumns="false">
							<ClientSideEvents OnClientSelect="CompanySelect" />
							<Columns>
								<ogrid:Column DataField="ID" HeaderText="ID" Width="50" runat="server" />
								<ogrid:Column DataField="name" HeaderText="Name" Width="330" runat="server" />
								<ogrid:Column DataField="contact" HeaderText="Contact" Width="288" runat="server" />
							</Columns>	
						</ogrid:Grid>					
					</div>
				</content>
			</TopPanel>
			<BottomPanel>
				<content Url="vb_companydetails.aspx" />
			</BottomPanel>
		</obspl:HorizontalSplitter>
		</div>
		</form>
	</body>
</html>