<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Page Language="vb" Inherits="collapseexpandpanel" Src="vb_collapseexpandpanel.aspx.vb" %>

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
		<span class="tdText"><b>ASP.NET Splitter - Collapse/Expand Panel </b></span>
	    <br /><br />
	         <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
	        <br /><br />
		    <table width="100%" style="border:1px solid gray">
			    <tr>
				    <td>
					    <a href="javascript:splDV.CollapsePanel('left')" style="cursor:pointer">Collapse the left panel</a> 
					    <br />
					    <a href="javascript:splDV.ExpandPanel('left')" style="cursor:pointer">Expand the left panel</a>
				    </td>
				    <td width="50%">
					    <a href="javascript:splDV.CollapsePanel('right')" style="cursor:pointer">Collapse the right panel</a>
					    <br />
					    <a href="javascript:splDV.ExpandPanel('right')" style="cursor:pointer">Expand the right panel</a>
				    </td>
			    </tr>
		    </table>
		    <obspl:Splitter id="splDV" runat="server">
			    <LeftPanel>
				    <header height="50">
					    <div style="width:100%;height:100%;text-align:center">
					    <br />
					    </div>
				    </header>
				    <content>
					    <div class="tdText" style="padding-left:10px;padding-top:10px">
					    <br />
						    left panel content
					    </div>
				    </content>
			    </LeftPanel>
			    <RightPanel>
				    <content>
					    <div class="tdText" style="padding-left:10px;padding-top:10px">
					    <br />
						    right panel content
					    </div>
				    </content>
			    </RightPanel>
		    </obspl:Splitter>
		 </form>
	</body>
</html>