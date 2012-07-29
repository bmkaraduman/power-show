<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dialog Hello World</title>
	<style>
		body {font-family: Verdana; font-size: XX-Small; margin: 0px; padding: 20px;}
		.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray;}
		.div {border: black 1px solid; width: 25px; height: 25px; align: middle; background-color: silver; cursor: default;}
	</style>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
                <center>
                    <input type="button" value="Open Window" onclick="myWindow.Open();" />
                </center>
	
	            

                                
                                
            <owd:Window runat="server"  Title="Easy Menu" ID="myWindow" Width="680" Height="480" Left="200" Top="100" VisibleOnLoad="true" StyleFolder="wdstyles/xpluna" ShowMaximizeButton="true">
	            <table style="width:100%;height:100%;">
	                <tr>
	                    <td style="width:100%; height:18px;" align="left">
	                            <oem:EasyMenu id="EasymenuMain" runat="server" ShowEvent="Always" StyleFolder="../EasyMenu/styles/windowsxp_Window"
		                            Position="Horizontal" CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" Width="120">
		                            <CSSClassesCollection>
			                            <oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" ComponentSubMenuCellOver="ParentItemSubMenuCellOver"
				                            ComponentContentCell="ParentItemContentCell" Component="ParentItem" ComponentSubMenuCell="ParentItemSubMenuCell"
				                            ComponentIconCellOver="ParentItemIconCellOver" ComponentIconCell="ParentItemIconCell"
				                            ComponentOver="ParentItemOver" ComponentContentCellOver="ParentItemContentCellOver"></oem:CSSClasses>
		                            </CSSClassesCollection>		                            
		                            <Components>
			                            <oem:MenuItem InnerHtml="&nbsp;&nbsp;File" ID="file"></oem:MenuItem>
			                            <oem:MenuItem InnerHtml="&nbsp;&nbsp;Edit" ID="edit"></oem:MenuItem>
			                            <oem:MenuItem InnerHtml="&nbsp;&nbsp;View" ID="view"></oem:MenuItem>
			                            <oem:MenuItem InnerHtml="&nbsp;&nbsp;Help&nbsp;" ID="help"></oem:MenuItem>
                            			
		                            </Components>
	                            </oem:EasyMenu>  	                    
	                    </td>	                    
	                </tr>
	                <tr>
	                    <td colspan="2" style="height:700px;background-color:White;" valign="top" align="center">
	                        <br /><br />
	                        <br /><br />
	                        <br /><br />
                            ...Content... 	                    
	                    </td>
	                </tr>
	            </table>
         
            
            </owd:Window>
            
            
                <oem:easymenu id="under_File" runat="server" StyleFolder="../EasyMenu/styles/windowsxp_Window" IconsFolder="icons" Width="140" UseIcons="true" AttachTo="file" ShowEvent="MouseOver" Align="Under">
	                <Components>
		                <oem:MenuItem InnerHtml="New" ID="new"></oem:MenuItem>
		                <oem:MenuItem InnerHtml="Open" ID="open"></oem:MenuItem>		                
		                <oem:MenuSeparator ID="menuSeparator2" InnerHtml="&amp;nbsp;"></oem:MenuSeparator>
		                <oem:MenuItem InnerHtml="Print" ID="add"></oem:MenuItem>		                
		                <oem:MenuItem InnerHtml="Close Window" ID="menuItem3" OnClientClick="myWindow.Close();"></oem:MenuItem>		                

	                </Components>
                </oem:easymenu>
                
                <oem:easymenu id="under_New" runat="server" StyleFolder="../EasyMenu/styles/windowsxp_Window" IconsFolder="icons" Width="140" UseIcons="true" AttachTo="new" ShowEvent="MouseOver" Align="Right" OffsetHorizontal="-2" OffsetVertical="-2">
	                <Components>
		                <oem:MenuItem InnerHtml="Project..." ID="npr"></oem:MenuItem>
		                <oem:MenuItem InnerHtml="Website..." ID="nws"></oem:MenuItem>
	                </Components>
                </oem:easymenu>                
                           
                <oem:easymenu id="under_Edit" runat="server" StyleFolder="../EasyMenu/styles/windowsxp_Window" IconsFolder="icons" Width="140" UseIcons="true" AttachTo="edit" ShowEvent="MouseOver" Align="Under">
	                <Components>
		                <oem:MenuItem InnerHtml="Undo" ID="undo"></oem:MenuItem>
		                <oem:MenuItem InnerHtml="Redo" ID="redo"></oem:MenuItem>		                
		                <oem:MenuSeparator ID="menuSeparator1" InnerHtml="&amp;nbsp;"></oem:MenuSeparator>
		                <oem:MenuItem InnerHtml="Cut" ID="cut"></oem:MenuItem>
		                <oem:MenuItem InnerHtml="Copy" ID="copy"></oem:MenuItem>	
		                <oem:MenuItem InnerHtml="Paste" ID="paste"></oem:MenuItem>		                
	                </Components>
                </oem:easymenu>  
                
                
                <oem:easymenu id="under_View" runat="server" StyleFolder="../EasyMenu/styles/windowsxp_Window" IconsFolder="icons" Width="140" UseIcons="true" AttachTo="view" ShowEvent="MouseOver" Align="Under">
	                <Components>
		                <oem:MenuItem InnerHtml="Full Screen" ID="fullscreen"></oem:MenuItem>
		                <oem:MenuItem InnerHtml="640x480" ID="normal"></oem:MenuItem>		                	                
	                </Components>
                </oem:easymenu>                                            
                           
        
</body>


</html>
<script>
    
    var old_onload = window.onload;
    window.onload = function (evt)
    {
        if (old_onload!=null) 
        old_onload();
        //alert(document.getElementById('EasyMenu1').style.zIndex);
        document.getElementById('under_File').style.zIndex=999999;
        document.getElementById('under_New').style.zIndex=999999;
        document.getElementById('under_Edit').style.zIndex=999999;
        document.getElementById('under_View').style.zIndex=999999;
        //alert(document.getElementById('EasyMenu1').style.zIndex);
    }
    
        document.getElementById('under_File').style.zIndex=999999;
        document.getElementById('under_New').style.zIndex=999999;
        document.getElementById('under_Edit').style.zIndex=999999;
        document.getElementById('under_View').style.zIndex=999999; 
    
</script>
