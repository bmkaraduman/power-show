<%@ Register TagPrefix="spl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Control Language="C#" AutoEventWireup="true" %>
<spl:Splitter CookieDays="0" id="spl1" runat="server" StyleFolder="styles/default">
	<LeftPanel WidthDefault="300">
		<Header Height="150">
			<div style="width:100%;height:100%;" class="text">
				<br />
				<br />
				<br />
				<br />
				<div style="font-weight:bold;padding-left:10px;">Splitter control inside a User Control</div>
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