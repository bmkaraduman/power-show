<html>
	<head>
		<style>
			.link
			{
				text-decoration:underline;
				cursor:pointer;
			}
		</style>
	</head>
	<body>
		<div style="font:11px verdana; color: #333333; padding-left:20px; padding-top:20px;">
			<span style="color:crimson">In this splitter panel is loaded another page.<br />
			Access the Splitter client object from this panel.</span><br />
			<br />
			<a class="link" onclick="window.parent.Splitter1.loadPage('LeftContent', 'http://www.obout.com/')">Load www.obout.com</a>
			<br />
			<a class="link" onclick="window.parent.Splitter1.loadPage('LeftContent', 'http://www.msn.com/')">Load www.msn.com</a>
			<br /><br /><br />
			
		</div>
	</body>
</html>