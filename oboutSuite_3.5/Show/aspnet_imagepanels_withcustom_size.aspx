<%@ Page Language="C#" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
			.showContainer
			{
				padding:7px;
				width:280px;
				height:180px;
				border:1px solid silver;
			}
			.tdText
			{
				font:11px Verdana;
			    color:#333333;
			}
		</style>
	</head>
	<body>
		 <form id="Form1" runat="server">
	
		     <span class="tdText"><b>ASP.NET Show - Image panels having custom size</b></span>
	         <br /><br /><br />
			default
			    <div class="showContainer">
				    <obshow:Show id="Show1" runat="server" 
					    Width="280" Height="180" ShowType="show" 
					    TransitionType="QuickScroll">
					    <Panels>
						    <obshow:Panel ImagePath="images/mixed/cosmic11.JPG" />
						    <obshow:Panel ImagePath="images/mixed/bridge2.jpg" />
						    <obshow:Panel ImagePath="images/mixed/fiat_logo.jpg" />
					    </Panels>
				    </obshow:Show>
			    </div>
			    <br /><br />
			    Custom sizes
			    <div class="showContainer">
				    <obshow:Show id="Show2" runat="server" 
					    Width="280" Height="180" ShowType="show" 
					    TransitionType="QuickScroll" >
					    <Panels>
						    <obshow:Panel ImagePath="images/mixed/cosmic11.JPG" ImageWidth="200px" ImageHeight="30px" />
						    <obshow:Panel ImagePath="images/mixed/bridge2.jpg" ImageWidth="80%" ImageHeight="80%" />
						    <obshow:Panel ImagePath="images/mixed/fiat_logo.jpg" ImageWidth="80px" ImageHeight="80px" />
					    </Panels>
				    </obshow:Show>
			    </div>
			 <br /><br /><br />
        		
	         <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
	</body>
</html>
	
