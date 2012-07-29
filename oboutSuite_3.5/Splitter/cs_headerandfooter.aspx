<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Page Language="C#" Inherits="cs_headerandfooter" Src="cs_headerandfooter.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head id="Head1" runat="server">
		<title>obout ASP.NET Splitter examples</title>
		<style type="text/css">
            .tdText {
                font:11px Verdana;
                color:#333333;
            }
      </style>
	</head>
    <body>
        <form id="Form1" runat="server">
            <br />
	        <span class="tdText"><b>ASP.NET Splitter - Optional Header and Footer</b></span>
    	
	        <br /><br />
            <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
            <br /><br />
		    <obspl:Splitter id="splDV" runat="server">
			    <LeftPanel>
				    <header>
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					    <br />
					    </div>
				    </header>
				    <content>
					    <div class="tdText" style="padding-left:10px;padding-top:10px">
					    <br />
					    left content
					    </div>
				    </content>
				    <footer>
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					    <br />
					    <b>optional left footer</b>
					    </div>
				    </footer>
			    </LeftPanel>
			    <RightPanel>
				    <header>
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					    <br />
					    <b>optional right header</b>
					    </div>
				    </header>
				    <content>
					    <div class="tdText" style="padding-left:10px;padding-top:10px">
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
						    right panel content
						    <br />
						    <br />
    						
					    </div>
				    </content>
				    <footer>
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
						    <br />
						    <b>optional right footer</b>
					    </div>
				    </footer>
			    </RightPanel>
		    </obspl:Splitter>
		 </form>
	</body>
</html>