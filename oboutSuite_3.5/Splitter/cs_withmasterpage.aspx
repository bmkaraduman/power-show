<%@ Register TagPrefix="spl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Page Language="C#" MasterPageFile="MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <spl:Splitter CookieDays="0" id="sp1DVF" runat="server" StyleFolder="styles/default">
		<LeftPanel WidthMin="100" WidthMax="400" >
			<Header Height="50">
				<div style="width:100%;height:100%;" class="text">
					<br />
					
				</div>
			</Header>
			<Content>
				<div style="width:100%;height:100%;" class="textContent">
					<br />
					<br />
					<br />
					left content
				</div>
			</Content>
			<Footer Height="50">
				<div style="width:100%;height:100%;" class="text">
					<br />
					optional left footer
				</div>
			</Footer>
		</LeftPanel>
		<RightPanel>
			<Header Height="50">
				<div style="width:100%;height:100%;" class="text">
					<br />
					optional right header
				</div>
			</Header>
			<Content>
				<div style="width:100%;height:100%;" class="textContent">
					<br />
					<br />
					<br />
					right content
				</div>
			</Content>
			<Footer Height="50">
				<div style="width:100%;height:100%;" class="text">
					<br />
					optional right footer
				</div>
			</Footer>
		</RightPanel>
	</spl:Splitter>
</asp:Content>
