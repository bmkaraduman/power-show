<%@ Page language="vb" Inherits="vb_callbackPanels2" Src="vb_callbackPanels2.aspx.vb" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<obout:CallbackPanel runat="server" ID="postbackPanel2">
	<content style="border: 1px solid gray; background-color: #EFEFEF;">
		<table width=100% height=100% cellpadding=0 cellspacing=0>
			<tr>
				<td align=center valign="middle" class="tdText">
					<style media="all">.something 
					{
						COLOR: blue;
					}
					</style>
					<script language="javascript">alert("this alert is from a script inside the panel");</script>
					<div class="something">text with css and js</div>
				</td>
			</tr>
		</table>
	</content>
</obout:CallbackPanel>