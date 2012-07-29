<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Page Language="C#" Inherits="cs_multiplesplitters" Src="cs_multiplesplitters.aspx.cs" %>

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
	        <span class="tdText"><b>ASP.NET Splitter - Multiple Splitters</b></span>
    	
	        <br /><br />
            <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
            <br /><br />
		    <obspl:Splitter runat="server" id="spl1">
			    <LeftPanel>
				    <Content>
					    <div style="padding-left:10px;padding-top:10px;padding-right:10px;" class="tdText"> 
						    left content
					    </div>
				    </Content>
			    </LeftPanel>
			    <RightPanel>
				    <Content>
					    <obspl:HorizontalSplitter id="spl2" runat="server">
						    <TopPanel>
							    <Content>
								    <div style="padding-left:10px;padding-top:10px;padding-right:10px;" class="tdText"> 
									    top content
								    </div>
							    </Content>
						    </TopPanel>
						    <BottomPanel>
							    <content>
								    <div style="padding-left:10px;padding-top:10px;padding-right:10px;" class="tdText"> 
									    bottom content
								    </div>
							    </content>
						    </BottomPanel>
					    </obspl:HorizontalSplitter>
				    </Content>
			    </RightPanel>
		    </obspl:Splitter>
	    </form>
	</body>
</html>