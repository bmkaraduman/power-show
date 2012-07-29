<%@ Page Language="C#" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<!--
        Basic example
-->

<html>
	<head>
        <title>Microsoft QuickLinks</title>
 		    <style type="text/css">
			    body {
				    font:11px Verdana;
				    color:#333333;
			    }
			    a {
				    font:11px Verdana;
				    color:#315686;
				    text-decoration:underline;
			    }
			    a:hover {
				    color:crimson;
			    }
		    </style>          
	    <style>
        .QuickLinksFlyoutPopup
        {
            background-color:white;
            border: solid 1px silver;
            padding:10px;

        }
        h4
        {
            font-style:bold;
            color:darkblue;
            font-family:Verdana;
            font-size:8pt;
            height:5px;
            
        }
        
        
        .listitem
        { font-family:Verdana;font-size:8pt;color:black; text-decoration:none;}
        a.listitem:visited{ font-family:Verdana;font-size:8pt;color:black;text-decoration:none;}
        a.listitem:hover{ font-family:Verdana;font-size:8pt;color:black;text-decoration:none;}   
            
        a.mlink:link{ font-family:Tahoma;font-size:8pt;color:white; text-decoration:none;}
        a.mlink:visited{ font-family:Tahoma;font-size:8pt;color:white; text-decoration:none;}
        a.mlink:hover{ font-family:Tahoma;font-size:8pt;color:white; text-decoration:none;}        
        
        
        .mHoverin
        {
            background-color: green;
            border:solid 1px blue;
        }
        
        .mHoverout
        {
            background-color:none;
            border:none;
        }
                
        
        .list
        {
            width:160px;
            padding-left:10px;
        }
        .QuickLinksFlyoutPopupHr
        {
            background-color:#D6E3EF;
            width:5px;
        }     
      .QuickLinksFlyoutStaticLink_msdn
      {
        border:solid 1px;
      }   
      .QuickLinksFlyoutStaticLink_msdn
      {
         font-family:Tahoma;
         font-size:8pt;
         color:white;
         cursor:hand;
         width:90px;
         height:auto;
      }          
    </style>        
	</head>
	
	
	<body>
        <a href="Default.aspx?div=aspnet">« Back to examples</a>
        
	<table style="width:100%;" cellpadding=0 cellspacing=0>
	    <tr>
	        <td>&nbsp;</td>
	        <td style="width:100px;background-color:#3165CE">&nbsp;</td>
	        
	        <td align="center" style="width:100px;height:25px;background-color:#3165CE">
	           <div id="microsoft_link" class="QuickLinksFlyoutStaticLink_msdn"> 
	            <a href="javascript:void()"class="mlink" >Microsoft.com&nbsp;<img class="QuickLinksPopArrow" src="images/popdownarrow-msdn-right.gif" alt="Dropdown arrow" style="height:4px;width:7px;border-width:0px;" /></a>
	           </div>
	        </td>
	    </tr>
	    
	</table>
	
    <obout:Flyout runat="server" ID="microsoft_flyout" Opacity="85"  AttachTo="microsoft_link" Position="BOTTOM_CENTER" Align="RIGHT">
      <div class="QuickLinksFlyoutPopup">
			
			    <table>
			        <tr>
			            <td valign="top"><h4>Product Families</h4><div class="list"><div class="listitem"><a href="http://www.obout.com">Office</a></div><div class="listitem"><a href="http://www.obout.com">Windows</a></div><div class="listitem"><a href="http://www.obout.com">Windows Server System</a></div><div class="listitem"><a href="http://www.obout.com">Windows Mobile</a></div><div class="listitem"><a href="http://www.obout.com">Developer Tools</a></div><div class="listitem"><a href="http://www.obout.com">Business Solutions</a></div><div class="listitem"><a href="http://www.obout.com">Games &amp; Xbox</a></div><div class="listitem"><a href="http://www.obout.com">MSN</a></div></div></td>
			            <td valign="top"><h4>Resources</h4><div class="list"><div class="listitem"><a href="http://www.obout.com">Microsoft Update</a></div><div class="listitem"><a href="http://www.obout.com">Office Update</a></div><div class="listitem"><a href="http://www.obout.com">Download Center</a></div><div class="listitem"><a href="http://www.obout.com">Help &amp; Support</a></div><div class="listitem"><a href="http://www.obout.com">Security</a></div><div class="listitem"><a href="http://www.obout.com">Volume Licensing</a></div></div><h4>About Microsoft</h4><div class="list"><div class="listitem"><a href="http://www.obout.com">Company Information</a></div><div class="listitem"><a href="http://www.obout.com">Investor Relations</a></div><div class="listitem"><a href="http://www.obout.com">PressPass for journalists</a></div></div></td>
			            <td valign="top"><h4>Popular Places</h4><div class="list"><div class="listitem"><a href="http://www.obout.com">MSDN (Developers)</a></div><div class="listitem"><a href="http://www.obout.com">TechNet (IT Pros)</a></div><div class="listitem"><a href="http://www.obout.com">Microsoft At Home</a></div><div class="listitem"><a href="http://www.obout.com">Microsoft At Work</a></div><div class="listitem"><a href="http://www.obout.com">Business &amp; Industry</a></div><div class="listitem"><a href="http://www.obout.com">Microsoft partners</a></div><div class="listitem"><a href="http://www.obout.com">Microsoft hardware</a></div><div class="listitem"><a href="http://www.obout.com">Product catalog</a></div><div class="listitem"><a href="http://www.obout.com">Mactopia</a></div><div class="listitem"><a href="http://www.obout.com">Microsoft.com site map</a></div></div></td>
			       </tr>
			       
			       <tr><td colspan="10" class="QuickLinksFlyoutPopupHr" /></tr>
			       
			       <tr>
			                <td valign="top"><h4>Popular Searches</h4><div class="list"><div class="listitem"><a href="http://www.obout.com">Templates</a></div><div class="listitem"><a href="http://www.obout.com">ActiveSync</a></div><div class="listitem"><a href="http://www.obout.com">Clip art</a></div></div></td>
			                <td valign="top"><h4>Popular Downloads</h4><div class="list"><div class="listitem"><a href="http://www.obout.com">Windows Defender Beta 2</a></div><div class="listitem"><a href="http://www.obout.com">DirectX End-User Runtime</a></div><div class="listitem"><a href="http://www.obout.com">More popular downloads</a></div></div></td>
			       </tr>
			       
			   </table>
	  </div>
    </obout:Flyout>		
        
        
	</body>
</html>
