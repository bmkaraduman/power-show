<%@ Page Language="C#" AutoEventWireup="true"%>
<%@ Import Namespace="System.Xml" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" Language="C#">
        void Page_load(object sender, EventArgs e)
        {
                try
                {
                        XmlTextReader oXMLReader = null;
                        oXMLReader = new XmlTextReader(Server.MapPath("examples.xml"));
                        while (oXMLReader.Read())
                        {
                                if (oXMLReader.NodeType == XmlNodeType.Element && oXMLReader.Name == "path")
                                {
                                        lblPath.Text = "<b>Path to folder with examples: </b>" + oXMLReader.ReadString();
                                }
                        }
                }
                catch
                {
                }
        }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>obout Suite examples</title>
    <style type="text/css">
                td.link{
                        padding-left:30px;
                        width:250px;                    
                }
                
                td.header {
                        padding-top:20px;
                        border-bottom:1px solid #eeeeee;
                        color:#555555;
                }
                
                .tdText {
                        font:11px Verdana;
                        color:#333333;
                }
                .tdHeader {
                        -x-system-font:none;
                        font-family:'Trebuchet MS',Arial,Helvetica,Sans-serif;
                        font-size:24px;
                        font-size-adjust:none;
                        font-stretch:normal;
                        font-style:normal;
                        font-variant:normal;
                        font-weight:normal;
                        line-height:normal;
                        margin:0;
                        padding:0;
                }
                .option2{
                        font:11px Verdana;
                        color:#0033cc;
                        background-color___:#f6f9fc;
                        padding-left:4px;
                        padding-right:4px;
                }
                a {
                        font:11px Verdana;
                        color:#315686;
                        text-decoration:underline;
                }

                a:hover {
                        color:crimson;
                }
                
                .product
                {
                    background-image: url(Resources/products.png);
                    width:20px; 
                    height: 20px;
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span class="tdText"><b>obout Suite - Examples for .NET 3.5 / 4.0</b></span>
         <br /><br />
        <span class="tdText">
        <asp:Label runat="server" ID="lblPath"></asp:Label>        
        <br /> 
        <br /><br />
        </span>

            <h2 class="tdHeader">Controls</h2>	<br /><br />
              <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="top" width="300px">
                    <span style="font:13px Verdana; color:#415686; font-weight:bold;">Obout.Ajax.UI</span>
                    <div style="padding-left:15px; padding-top:5px;">
                        <table>
                           <tr>     
                                <td width="10px">                
                                    <div class="product" style="background-position: 0px -20px;"></div>
                                 </td>
                                 <td>   
                                    <a href="ColorPicker/Default.aspx">Color Picker</a>
                                 </td>
                           </tr>
                           <tr>     
                                <td width="10px"> 
                                    <div class="product" style="background-position: 0px -40px;"></div>
                                </td>
                                <td> 
                                    <a href="HTMLEditor/Default.aspx">HTML Editor controls</a>
                                </td>
                           </tr>  
                           <tr>     
                                <td width="10px"> 
                                    <div class="product" style="background-position: -20px -80px;"></div>
                                </td>
                                <td> 
                                    <a href="SpellChecker/Default.aspx">Spell Checker</a>
                                </td>
                           </tr> 
                           <tr>     
                                <td width="10px"> 
                                    <div class="product" style="background-position: -60px -100px;"></div>
                                </td>
                                <td> 
                                    <a href="TreeView/Default.aspx">TreeView</a>
                                </td>
                           </tr>     
                           <tr>     
                                <td width="10px"> 
                                    <div class="product" style="background-position: -20px -40px;"></div>
                                </td>
                                <td> 
                                    <a href="FileUpload/Default.aspx">File Upload</a>
                                </td>
                           </tr>
                           <tr>     
                                <td width="10px"> 
                                    <div class="product" style="background-position: 0px -120px;"></div>
                                </td>
                                <td> 
                                    <a href="Poll/Default.aspx">Poll</a>
                                </td>
                           </tr>
                           <tr>     
                                <td width="10px"> 
                                    <div class="product" style="background-position: -20px -120px;"></div>
                                </td>
                                <td> 
                                    <a href="Captcha/Default.aspx">Captcha</a>
                                </td>
                           </tr>
                        </table>
                    </div>
                    <br />
                      <table>    
                        <tr>     
                            <td width="10px">                
                                <div class="product" style="background-position: 0px 0px;"></div>
                            </td>
                            <td>
                                <a href="AjaxPage/Default.aspx">AJAX Page</a>
                            </td>
                       </tr>
                       <tr>     
                            <td width="10px">                
                                <div class="product" style="background-position: -60px 0px;"></div>
                            </td>
                            <td>
                                <a href="Calendar/Default.aspx">Calendar</a>
                            </td>
                       </tr>
                       <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: -20px -20px;"></div>
                            </td>
                             <td> 
                                <a href="ComboBox/Default.aspx">ComboBox</a>
                             </td>
                       </tr>
                       <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: -80px -20px;"></div>
                            </td>
                            <td> 
                                <a href="EasyMenu/Default.aspx">Easy Menu</a>
                            </td>
                       </tr> 
                       <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: -40px -40px;"></div>
                            </td>
                            <td> 
                                <a href="Flyout/Default.aspx">Flyout</a>
                            </td>
                       </tr>  
                       <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: -60px -40px;"></div>
                            </td>
                            <td> 
                                <a href="Grid/Default.aspx">Grid</a>
                            </td>
                       </tr>  
                   </table>
                </td>
                <td valign="top" width="300px">
                  <table>
                       <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: -80px 0px;"></div>
                            </td>
                            <td> 
                                <a href="Interface/Default.aspx">Interface Controls</a>
                            </td>
                       </tr> 
                       <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: -20px -60px;"></div>
                            </td>
                            <td> 
                                <a href="ListBox/Default.aspx">ListBox</a>
                            </td>
                       </tr>                          
                       <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: -80px -60px;"></div>
                            </td>
                            <td> 
                                <a href="Show/Default.aspx">Show</a>
                            </td>
                       </tr>     
                       <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: 0px -80px;"></div>
                            </td>
                            <td> 
                                <a href="SlideMenu/Default.aspx">Slide Menu</a>
                            </td>
                       </tr> 
                       <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: -40px -80px;"></div>
                            </td>
                            <td> 
                                <a href="Splitter/Default.aspx">Splitter</a>
                            </td>
                       </tr>
                        <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: 0px -100px;"></div>
                            </td>
                            <td> 
                                <a href="SuperForm/Default.aspx">Super Form</a>
                            </td>
                       </tr>       
                        <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: -20px -100px;"></div>
                            </td>
                            <td> 
                                <a href="TextMenu/Default.aspx">Text Menu</a>
                            </td>
                       </tr>     
                       <%-- <tr>     
                            <td width="10px"> 
                                <img src="Resources/products/treedb.gif" border="0" alt="" />
                            </td>
                            <td> 
                                <a href="TreeDB/Default.aspx">TreeDB</a>
                            </td>
                       </tr>   --%>
                       <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: -80px -100px;"></div>
                            </td>
                            <td> 
                                <a href="Window/Default.aspx">Window</a>
                            </td>
                       </tr>       
                       <tr>     
                            <td width="10px"> 
                                <div class="product" style="background-position: -80px -40px;"></div>
                            </td>
                            <td> 
                                <a href="ImageZoom/Default.aspx">Image Zoom</a>
                            </td>
                       </tr>   
                  </table> 
                </td>
            </tr>
        </table>
    </div>
    <br /><br /><br />
    <a href="http://www.obout.com">obout home</a>&#160;&#160;&#160;
    <a href="http://www.obout.com/inc/support.aspx">obout Support</a>
    </form>
</body>
</html>
