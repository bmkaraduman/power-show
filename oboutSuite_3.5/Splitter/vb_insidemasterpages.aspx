<%@ Page Language="vb" MasterPageFile="vb_MasterPage.master" Title="Untitled Page" %>
<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<script language="vb" runat="server">
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)

		sp1DVF.CookieDays = 0
		sp1DVF.StyleFolder = "styles/default"
		sp1DVF.LeftPanel.WidthMin = 100
		sp1DVF.LeftPanel.WidthMax = 400
		sp1DVF.LeftPanel.Header.Height = 50
		sp1DVF.LeftPanel.Footer.Height = 50
		sp1DVF.RightPanel.Header.Height = 50
		sp1DVF.RightPanel.Footer.Height = 50
		
	End Sub
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <obspl:Splitter id="sp1DVF" runat="server">
		<LeftPanel>
			<Header>
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
			<Footer>
				<div style="width:100%;height:100%;" class="text">
					<br />
					optional left footer
				</div>
			</Footer>
		</LeftPanel>
		<RightPanel>
			<Header>
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
			<Footer>
				<div style="width:100%;height:100%;" class="text">
					<br />
					optional right footer
				</div>
			</Footer>
		</RightPanel>
	</obspl:Splitter>
</asp:Content>

