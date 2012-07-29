<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uName"] != null)
        {
            Easymenu4.AttachTo = string.Empty;
            Easymenu5.AttachTo = "item5";

        }
        else
        {
            Easymenu5.AttachTo = string.Empty;
            Easymenu4.AttachTo = "item5";
        }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["uName"] = txtUname.Text;
    }
</script>

<html>
<head>
	<title>obout ASP.NET Easy Menu examples</title>

	<!--// Only needed for this page's formatting //-->
	<style type="text/css">
			
			.tdText {
                font:11px Verdana;
                color:#333333;
            }

            #content {
                position:inherit !important;
	        }
		
		    .ulEM{
		        padding:0 !important;
		        list-style-image:none !important;
                list-style-position:outside !important;
                list-style-type:none !important;
		    }

		    .liEM{
		        background-image:none !important;
		        padding:0 !important;
		        list-style-image:none !important;
                list-style-position:outside !important;
                list-style-type:none !important;
                position:relative !important;
                display:block !important;
                margin:0px !important;
                vertical-align:middle !important;
                
		    }
		
			.liDiv{
		    color:#000000;
            font-family:"Segoe UI",Arial,sans-serif;
            font-size:12px;
            font-size-adjust:none;
            font-style:normal;
            font-variant:normal;
            font-weight:normal;
            text-decoration:none;
            padding-right:5px;
            padding-left:1px !important;
             height:30px;
             vertical-align:top;
        }
		
		ul.ulEM il:hover{
		background-color:#B2D065;
		}
		
        .liDivSuite{
        padding-right:4px;
        }
        .liDivSuite img{
        vertical-align:middle;
        border:0;
        }
        
        .liDiv img{
        vertical-align:top;
        border:0;
        }
        
        .liDiv a{
        vertical-align:top !important;
        padding-top:7px;
        padding-left:4px;
        display:block;
        height:27px;
        }
        
        .liDiv a:hover
        {
        vertical-align:top !important;
        background-color:#B2D065;
        color:#ffffff;
        padding-left:4px;
        display:block;
        height:27px;
        padding-top:7px;
        padding-left:4px;
        }
	    
	    .login{
	    background-color:Gray;
	    border-style:groove !important;
	    border-width:2px !important;
	    border-color:#eeeeee !important;
    
	    width:50px !important;
	    height:20px !important;
	    color:#ffffff !important;
	    font-size:medium !important;
	    padding:2px;
	    }
	    
	    li.menuHead{
	        color:#FF3300;
            font-family:"Segoe UI",Arial,sans-serif";
            font-size:13px;
            font-weight:normal;
            padding-top:6px !important;
            padding-left:10px !important;
            padding-bottom:4px !important;
            height:15px;
            white-space:nowrap;
	    }
	    
		
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <span class="tdText"><b>ASP.NET Easy Menu - Sample for custome content</b></span>
	    <br /><br />	
		<br /><br /> 
	
	    <!--// The head of the menus //-->
    	
	    <oem:EasyMenu id="EasymenuMain" runat="server" ShowEvent="Always" StyleFolder="styles/CustomeStyle"
				    Position="Horizontal" CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" Width="530">
				    <CSSClassesCollection>
					    <oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" ComponentSubMenuCellOver="ParentItemSubMenuCellOver"
						    ComponentContentCell="ParentItemContentCell" Component="ParentItem" ComponentSubMenuCell="ParentItemSubMenuCell"
						    ComponentIconCellOver="ParentItemIconCellOver" ComponentIconCell="ParentItemIconCell"
						    ComponentOver="ParentItemOver" ComponentContentCellOver="ParentItemContentCellOver"></oem:CSSClasses>
					    <oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver"
						    ComponentContentCell="ParentSeparatorContentCell" Component="ParentSeparator"
						    ComponentSubMenuCell="ParentSeparatorSubMenuCell" ComponentIconCellOver="ParentSeparatorIconCellOver"
						    ComponentIconCell="ParentSeparatorIconCell" ComponentOver="ParentSeparatorOver"
						    ComponentContentCellOver="ParentSeparatorContentCellOver"></oem:CSSClasses>
				    </CSSClassesCollection>
				    <Components>
			    <oem:MenuItem InnerHtml="ASP.NET Controls" ID="item1">
                    </oem:MenuItem>
			    <oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator1"></oem:MenuSeparator>
			    <oem:MenuItem InnerHtml="ASP.NET MVC Controls" ID="item2"></oem:MenuItem>
			    <oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator2"></oem:MenuSeparator>
			    <oem:MenuItem InnerHtml="Utilities" ID="item3"></oem:MenuItem>
			    <oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator3"></oem:MenuSeparator>
			    <oem:MenuItem InnerHtml="Support" ID="item4" Url="http://www.obout.com/inc/support.aspx"></oem:MenuItem>
			    <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator1"></oem:MenuSeparator>
			    <oem:MenuItem InnerHtml="Download" ID="item5"></oem:MenuItem>
		    </Components>
			    </oem:EasyMenu>		
	    <oem:EasyMenu id="Easymenu1" runat="server" ShowEvent="MouseOver" AttachTo="item1" Align="Under" Width="" StyleFolder="styles/CustomeStyle" ExpandStyle="Slide">
		    <Components>
			    <oem:MenuItem InnerHtml="" ID="menuItem11">             
                    
                    <div>
                        <table style="vertical-align: top" width="485px" cellpadding="5" cellspacing="5">
                            <tr>
                                <td valign="top">
                                    <ul class="ulEM">
                                        <li class="liEM menuHead">Navigation Controls</li>
                                        <li class="liEM">
                                            <div class="liDiv">
                                                <a href="http://www.obout.com/em">
                                                    <img src="../Resources/products/easymenu.gif" alt="" />
                                                    ASP.NET Easy Menu</a>
                                            </div>
                                        </li>
                                        <li class="liEM">
                                            <div class="liDiv">
                                                <a href="http://www.obout.com/t2">
                                                    <img src="../Resources/products/treeview.gif" alt="" />
                                                    ASP.NET TreeView</a>
                                            </div>
                                        </li>
                                        <li class="liEM">
                                            <div class="liDiv">
                                                <a href="http://www.obout.com/tm">
                                                    <img src="../Resources/products/textmenu.gif" alt="" />
                                                    ASP.NET TextMenu</a>
                                            </div>
                                        </li>
                                        <li class="liEM">
                                            <div class="liDiv">
                                                <a href="http://www.obout.com/sm3">
                                                    <img src="../Resources/products/slidemenu.gif" alt="" />
                                                    ASP.NET Slide Menu</a>
                                            </div>
                                        </li>
                                        </ul>
                                </td>
                                <td valign="top">
                                    <ul class="ulEM">
                                        <li  class="liEM menuHead">DataBound Controls </li>
                                        <li class="liEM">
                                            <div class="liDiv">
                                                <a href="http://www.obout.com/grid">
                                                    <img src="../Resources/products/grid.gif" alt=""  />
                                                    ASP.NET Grid </a>
                                            </div>
                                        </li>
                                        <li class="liEM">
                                            <div class="liDiv">
                                                <a href="http://www.obout.com/combobox">
                                                    <img src="../Resources/products/combobox.gif" alt=""  />
                                                    ASP.NET Combobox </a>
                                            </div>
                                        </li>
                                        <li class="liEM menuHead">HTML Editor </li>
                                        <li class="liEM">
                                            <div class="liDiv">
                                                <a href="http://www.obout.com/editor_new">
                                                    <img src="../Resources/products/editor.gif" alt=""  />
                                                    ASP.NET Editor </a>
                                            </div>
                                        </li>
                                    </ul>
                                </td>
                                <td valign="top">
                                    <ul class="ulEM">
                                        <li class="liEM menuHead">Other Controls</li>
                                        <li class="liEM">
                                            <div class="liDiv">
                                                <a href="http://www.obout.com/Scheduler">
                                                    <img src="../Resources/products/scheduler.gif" alt=""  />
                                                    ASP.NET Scheduler </a>
                                            </div>
                                        </li>
                                        <li class="liEM">
                                            <div class="liDiv">
                                                <a href="http://www.obout.com/splitter">
                                                    <img src="../Resources/products/splitter.gif" alt=""  />
                                                    ASP.NET Splitter </a>
                                            </div>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                        
                    </div>
                    
            </oem:MenuItem>
		    </Components>
	    </oem:EasyMenu>
	    <oem:EasyMenu id="Easymenu2" runat="server" ShowEvent="MouseOver" AttachTo="item2" Align="Under" OffsetVertical="-2" Width="" StyleFolder="styles/CustomeStyle" >
            <Components>
                <oem:MenuItem InnerHtml="" ID="menuItem21">
                    <div>
                        <oem:MenuItem InnerHtml="" ID="menuItem2">
                    <div>
                        <ul class="ulEM">
                            <li class="liEM">
                                <div class="liDiv">
                                    <a href="#">
                                        <img src="../Resources/products/button.gif" alt=""  />
                                        obout MVC Button</a>
                                </div>
                            </li>
                            <li class="liEM">
                                <div class="liDiv">
                                    <a href="#">
                                        <img src="../Resources/products/textbox.gif" alt=""  />
                                        obout MVC Textbox </a>
                                </div>
                            </li>
                            <li class="liEM">
                                <div class="liDiv">
                                    <a href="#">
                                        <img src="../Resources/products/radiobutton.gif" alt=""  />
                                        obout MVC Radio Button </a>
                                </div>
                            </li>
                            <li class="liEM">
                                <div class="liDiv">
                                    <a href="#">
                                        <img src="../Resources/products/checkbox.gif" alt=""  />
                                        obout MVC Checkbox </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </oem:MenuItem>
                    </div>
                </oem:MenuItem>
            </Components>
	    </oem:EasyMenu>
	    <oem:EasyMenu id="Easymenu3" runat="server" ShowEvent="MouseOver" AttachTo="item3" Align="Under" OffsetVertical="-2" Width="" StyleFolder="styles/CustomeStyle">
		    <Components>
                <oem:MenuItem InnerHtml="" ID="menuItem31">
                    <div>
                        <ul class="ulEM">
                            <li class="liEM">
                                <div class="liDivSuite">
                                    <a href="http://www.obout.com/sitemonitoring">
                                        <img src="../Resources/products/product.png" style="width:60px;" alt="Site Monitoring" />
                                        obout Site Monitoring</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </oem:MenuItem>
		    </Components>
	    </oem:EasyMenu>
	    <oem:EasyMenu id="Easymenu4" runat="server"  AttachTo="item5" ShowEvent="MouseOver" Align="Under" Width="" StyleFolder="styles/CustomeStyle">
		    <Components>
                <oem:MenuItem InnerHtml="" ID="menuItem1" AutoHideMenu="false"><br />
                &nbsp;&nbsp; Please login to download oboutSuite:<br />
                    <table style="padding-left:4px">
                        <tr>
                            <td>User name:
                            </td>
                            <td>
                                <asp:TextBox ID="txtUname" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Password:
                            </td>
                            <td>
                                <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr><td colspan="2" style="text-align:center"><br />
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="login"> Login </asp:LinkButton>
                           <br /> </td></tr>
                    </table><br />
                </oem:MenuItem>
		    </Components>
	    </oem:EasyMenu>
	    <oem:EasyMenu ID="Easymenu5" runat="server" ShowEvent="MouseOver" Align="Under" Width="" StyleFolder="styles/CustomeStyle" OffsetHorizontal="-270" >
	    <Components>
	    <oem:MenuItem InnerHtml="" ID="menuItem51" AutoHideMenu="false" ><div>
            <ul class="ulEM">
                <li class="liEM">
                    <div class="liDivSuite">
                        <table cellspacing="9px">
                            <tr>
                                <td>
                                    <a href="/inc/suite_download/default.aspx">
                                        <img src="/img/none.gif" class="load" /></a> <a href="/inc/suite_download/default.aspx" class="nul">
                                            <span style="color: rgb(53, 150, 0); font-size: 16px; line-height: 12px;">DOWNLOAD</span></a>
                                </td>
                                <td>
                                    oboutSuite.exe (12mb)<br />
                                    <br />
                                    This is a self-extracting archive.<br />
                                    It includes all controls and hundreds <br />of examples in C# and VB.NET
                                </td>
                            </tr>
                        </table>               
                    </div>
                </li>
                <li></li>
            </ul>
                      </div>      
	    </oem:MenuItem>
	    </Components>
	    </oem:EasyMenu>
	    
	    <br /><br /><br /><br /><br />
	    
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
	
        </form>
    </body>
</html>