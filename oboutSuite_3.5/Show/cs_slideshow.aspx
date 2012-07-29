<%@ Page Language="C#" Inherits="cs_slideshow" Src="cs_slideshow.aspx.cs" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		.panelTable
		{
			border:1px solid #cccccc;
			background-color:white;
			padding:7px;
			height:100%;
			width:100%;
			border-collapse: separate;
			border-spacing: expression(cellSpacing=0);
			border-spacing: 0px;
			border-padding: expression(cellPadding=0);
			border-padding: 0px;
		}
		.showContainer
		{
			padding:7px;
			width:370px;
			border:0px solid red;
		}
		.imageText
		{
			color:#CCCCCC;
			font-weight:bold;
			font-size:15px;
		}
		.title
		{
			font-size:24px;
			font-weight:bold;
			color:crimson;
		}
		.subtitle
		{
			color:crimson;
			font-size:18px;
			font-weight:bold;
			padding-top:20px;
		}
		.list ul li
		{
			font-size:14px;
			font-weight:bold;
		}
		
		.list ul ul li
		{
			font-size:14px;
			font-weight:normal;
		}
		body
		{
			font-family:Tahoma;
		}
		.examples
		{
			font-size:12px;
		}
		.tdText {
            font:11px Verdana;
            color:#333333;
        }
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Show - Slide show </span>
		    <br /><br />
		
	    <div class="showContainer">
	    <obshow:Show id="Show1" runat="server">
		    <Changer />
		    <Panels>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td align="center" style="vertical-align:middle">
							    <span class="title">Introduction to the .NET Framework</span>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td align="left" valign="top" class="tdText">
							    <span class="subtitle">Agenda</span>
							    <br />
							    <br />
							    <span class="list">
							    <ul>
								    <li>.NET Framework</li>
								    <ul>
									    <li>defined</li>
									    <li>architecture</li>
								    </ul>
								    <br />
								    <li>Key benefits with focus on...</li>
								    <ul>
									    <li>browser/based development (ASP.NET)</li>
									    <li>data access (ADO.NET)</li>
									    <li>client/server deployment</li>
									    <li>ability to implement web services</li>
								    </ul>
								    <br />
								    <li>Conclusion</li>
							    </ul>
							    </span>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td align="left" valign="top">
							    <span class="subtitle"></span>
						    </td>
					    </tr>
					    <tr>
						    <td align="center">
							    <img width="500px" src="images/slideshow/NETFramework2.png" />
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td align="left" valign="top">
							    <span class="subtitle">.NET Framework - Architecture</span>
						    </td>
					    </tr>
					    <tr>
						    <td align="center">
							    <img width="550px" src="images/slideshow/NETFramework3.png" />
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td align="left" valign="top">
							    <span class="subtitle">Key Benefits of the .NET Framework</span>
							    <br />
							    <br />
							    <span class="list">
							    <ul>
								    <li>ASP.NET</li>
								    <ul>
									    <li>simplify browser-based development</li>
								    </ul>
								    <br />
								    <li>ADO.NET</li>
								    <ul>
									    <li>a more powerful model for data access</li>
								    </ul>
								    <br />
								    <li>Deployment</li>
								    <ul>
									    <li>simpler, safer</li>
								    </ul>
								    <br />
								    <li>Class library</li>
								    <ul>
									    <li>common routines</li>
								    </ul>
								    <br />
								    <li>New languages</li>
								    <ul>
									    <li>VB.NET and C#</li>
								    </ul>
								    <br />
								    <li>Web services</li>
								    <ul>
									    <li>new approach to providing computing functionality over the Internet</li>
								    </ul>
							    </ul>
							    </span>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
		    </Panels>
	    </obshow:Show>	
	    </div>
    	
		    <br /><br /><br />
		    
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
        </form>
	</body>
</html>
	
