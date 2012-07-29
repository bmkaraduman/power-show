<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<%@ Page Language="C#" Src="cs_fromxml.aspx.cs" Inherits="cs_fromxml" %>
<%@ Register TagPrefix="tcm" Namespace="OboutInc.TextMenu" Assembly="obout_TextMenu" %>

<html>
<head>
	<title>Example Page - Load from XML</title>
	
	<!--// Only needed for this page's formatting //-->
	<style>
		body {font-family: Verdana; font-size: XX-Small; margin: 0px; padding: 20px}
		.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray;}
	</style>
</head>
<body>
	<div class="title">Load from XML example</div>
	<br /><br />
	<a class="examples" href="Default.aspx?type=CSHARP">« Back to examples</a>
	<br /><br /><br />
	Check for "TextMenuXML.xml".<br /><br />
	<!--// The head of the menus //-->
	<asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
		
</body>
</html>