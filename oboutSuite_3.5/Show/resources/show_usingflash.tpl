<style>
	.title
	{
		font-family:Verdana;
		font-size:18px;
	}
</style>
<table class="panelTable">
	<tr>
		<td align="center">
			<span class="title">{ItemName}</span>
		</td>
	<tr>
		<td valign="top" align="center">
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="200" height="150" align="middle">
				<param name="wmode" value="opaque">
				<param name="menu" value="false">
				<param name="allowScriptAccess" value="sameDomain" />
				<param name="movie" value="{ItemFlashMovie}" />
				<param name="quality" value="high" />
				<param name="bgcolor" value="#ffffff" />
				<embed src="{ItemFlashMovie}" width="200" height="150"  wmode="opaque" menu="false" quality="high" bgcolor="#ffffff" name="snow_final" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
		</td>
	</tr>
</table>