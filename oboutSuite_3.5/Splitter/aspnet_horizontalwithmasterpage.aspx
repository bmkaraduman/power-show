<%@ Register TagPrefix="spl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Page Language="C#" MasterPageFile="MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <spl:HorizontalSplitter CookieDays="0" id="sp1DVF" runat="server" StyleFolder="styles/default">
		<TopPanel HeightMin="100" HeightMax="400" >
			<Header Height="50">
				<div style="width:100%;height:100%;" >
					<br />
					
				</div>
			</Header>
			<Content>
				<div style="width:100%;height:100%;" >
					<br />
					<br />
					<br />
					top content
				</div>
			</Content>
		</TopPanel>
		<BottomPanel>
			<Content>
				<div style="width:100%;height:100%;" >
					<br />
					<br />
					<br />
					bottom content
				</div>
			</Content>
		</BottomPanel>
	</spl:HorizontalSplitter>
</asp:Content>
