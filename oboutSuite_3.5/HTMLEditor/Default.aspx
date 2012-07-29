<%@ Page Language="C#" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Web.UI" %>

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
                        lblPath.Text =  oXMLReader.ReadString();
                    }
                }
                oXMLReader.Close();
            }
            catch
            {
            }    
            
            if (Request.QueryString["type"] != null)
            {
                    ExamplesType.Value = Request.QueryString["type"].ToString();
            }
        }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>obout ASP.NET HTML Editor examples</title>
    <style type="text/css">
                td.link{
                        padding-left:30px;
                        width:250px;                    
                }
                
                td.fname{
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
                        color:#DC143C;
                }
        </style>
        <script type="text/javascript">

                var examplesFolder = "<%= lblPath.Text.Replace("\\","\\\\") %>";

                function showexamples() {
                        var exSelect = document.forms[0].exSelect;
                        var prefix = "cs";

                        for(var i=0; i<exSelect.length; i++)
                        {
                           if(exSelect[i].checked == true)
                           {
                               prefix = exSelect[i].value;
                               break;
                           }
                        }

                        var elements = document.getElementsByTagName("TD");

                        for(var i=0; i<elements.length; i++)
                        {
                          var td = elements[i];

                          if(td.className=="fname")
                          {
                            td.innerHTML = td.innerHTML.replace(/^(\S\S)/,prefix);

                            var a = null;
                            var prev = td.parentNode.cells.item(0);

                            for(var j=0; j<prev.childNodes.length; j++)
                              if(prev.childNodes.item(j).tagName && prev.childNodes.item(j).tagName != "undefined" && prev.childNodes.item(j).tagName.toUpperCase()=="A")
                              {
                               a = prev.childNodes.item(j);
                               break
                              }

                            if(a != null) a.href = td.innerHTML; 
                          }
                        }
                }
                function showExamplesFromSpan(index) {             
                    document.forms[0].exSelect[index].checked = true;
                    showexamples();
                }
                window.onload = function() {
                        var oExamplesType = document.getElementById("ExamplesType");
                        if(oExamplesType.value == "CSHARP") {
                                document.forms[0].exSelect[0].checked = true;
                        } else if(oExamplesType.value == "VBNET") {
                                document.forms[0].exSelect[1].checked = true;
                        } else {
                            document.forms[0].exSelect[0].checked = true;
                        }
                        showexamples();
                }
        </script>
</head>
<body style="margin-left:30px;">
    <form id="form1" runat="server">
        
        <input id="ExamplesType" type="hidden" runat="server" />
        
    <div class="tdText">
        <a href="../Default.aspx">« Back to Suite Examples</a>
        <br /><br /><br />
        <span style="font-weight:bold;">Obout.Ajax.UI.HTMLEditor controls examples</span> 
        <br />
        <br />
        Select the examples you want to see:&#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(0)" value="cs" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(0)">C#</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(1)" value="vb" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(1)">VB.NET</span> &#160;&#160;&#160;
        <br /><br />
        <b>Path to folder with the examples: </b><asp:Label runat="server" ID="lblPath"></asp:Label>
        <br /><br />
        <table style="margin-top:0px;padding-top:0px;">
            <tr>
                <td style="margin-top:0px;padding-top:0px;">
                   <table style="margin-top:0px;padding-top:0px;">
                       <tr>
                          <td valign="top" style="margin-top:0px;padding-top:0px;">
                              <table style="margin-top:0px;padding-top:0px;">
                              <tr>
                              <td class="header" colspan="2" style="margin-top:0px;padding-top:0px;"><b>Appearance</b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr><b>Editor</b> control with full buttons set</nobr></a></td>
                                     <td class="fname">cs_BaseSample.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr><b>Editor</b> control with preview on load</nobr></a></td>
                                     <td class="fname">cs_InitialPreview.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr>Two <b>EditPanel</b> controls</nobr></a></td>
                                     <td class="fname">cs_TwoEditPanels.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr><b>Editor</b> control with <b>'Full screen'</b> enabled</nobr></a></td>
                                     <td class="fname">cs_FullScreenEnabled.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr><b>Editor</b> control with <b>'Quick Formatting'</b> panel</nobr></a></td>
                                     <td class="fname">cs_QuickFormatting.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr>Show/hide toolbar</nobr></a></td>
                                     <td class="fname">cs_ShowHideToolbar.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr>Content counters</nobr></a></td>
                                     <td class="fname">cs_ContentCounters.aspx</td>
                                 </tr>

                              <tr>
                              <td class="header" colspan="2"><b>Localization</b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr><b>UI</b> Language auto detection</nobr></a></td>
                                     <td class="fname">cs_UIAutoDetection.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr>Russian langauage</nobr></a></td>
                                     <td class="fname">cs_Russian.aspx</td>
                                 </tr>

                              <tr>
                              <td class="header" colspan="2"><b>ASP.NET Validation</b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr>Two <b>Editor</b>s with <b>RequiredFieldValidator</b></nobr></a></td>
                                     <td class="fname">cs_TwoEditors.aspx</td>
                                 </tr>

                              <tr>
                              <td class="header" colspan="2"><b>Server events handling</b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr><b>ContentChanged</b> event handling</nobr></a></td>
                                     <td class="fname">cs_ContentChanged.aspx</td>
                                 </tr>

                              <tr>
                              <td class="header" colspan="2"><b>Client-side API</b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href=""><nobr>Full screen expanded <b>Editor</b> control</nobr></a></td>
                                     <td class="fname">cs_FullScreen.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Check the length of the content</a></td>
                                     <td class="fname">cs_CheckContentLength.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Surround selected content with HTML text</a></td>
                                     <td class="fname">cs_SurroundHTML.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Hide/show button in toolbar</a></td>
                                     <td class="fname">cs_HideShowButtons.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Access to the toolbar buttons' functionality</a></td>
                                     <td class="fname">cs_buttons_access.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Set cursor to the specified word</a></td>
                                     <td class="fname">cs_moveToWord.aspx</td>
                                 </tr>

                              <tr>
                              <td class="header" colspan="2"><b>Content</b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href="">Import <b>MS Word</b> documents</a></td>
                                     <td class="fname">cs_importMsWord.aspx</td>

                                 <tr>
                                     <td class="link"><a href="">Documents generator</a></td>
                                     <td class="fname">cs_WeddingFill.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Autosave</a></td>
                                     <td class="fname">cs_AutoSave.aspx</td>
                                 </tr>

                              <tr>
                              <td class="header" colspan="2"><b>Database use</b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href="">Content editing and saving</a></td>
                                     <td class="fname">cs_database_using.aspx</td>
                                 </tr>

                              </table>
                          </td>
                          
                          <td style="margin-top:0px;padding-top:0px;width:50px;">&#160;</td>
                          
                          <td valign="top" style="margin-top:0px;padding-top:0px;">
                              <table style="margin-top:0px;padding-top:0px;">                                          
                              <tr>
                              <td class="header" colspan="2" style="margin-top:0px;padding-top:0px;"><b>Fully customizable interface</b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href="">Custom button defined in <b>App_Code</b></a></td>
                                     <td class="fname">cs_CustomButtons.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Custom <b>Editor</b> control (<b>App_Code</b>)</a></td>
                                     <td class="fname">cs_CustomButtonsAnotherMethod.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Customized <b>ColorPicker</b> using</a></td>
                                     <td class="fname">cs_CustomizedColorPicker.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Customized <b>'Image properties'</b> popup</a></td>
                                     <td class="fname">cs_CuttedImageProperties.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Custom <b>'Fieldset properties'</b> popup, toolbar button and context menu items</a></td>
                                     <td class="fname">cs_CustomFieldset.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Custom <b>'Select'</b> buttons - <b>Google AJAX Language API</b> implementation</a></td>
                                     <td class="fname">cs_CustomSelectButton.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><b>Image Gallery</b> in <b>database</b></a></td>
                                     <td class="fname">cs_DatabaseImageGallery.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Custom <b>Images Browser</b> in a <b>Window</b></a></td>
                                     <td class="fname">cs_CustomImagesBrowser.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><b>Editor</b> from the <b>obout Forum</b></a></td>
                                     <td class="fname">cs_OboutForum.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Images and documents uploading with immediate inserting</a></td>
                                     <td class="fname">cs_ImmediateImageAndDocumentInsert.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Images uploading to database with immediate inserting</a></td>
                                     <td class="fname">cs_ImmediateImageInsertToDb.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Custom dropdown button - Quick Formatting emulating</a></td>
                                     <td class="fname">cs_CustomDropDown.aspx</td>
                                 </tr>

                              <tr>
                              <td class="header" colspan="2"><b>Integration with <span style="color:Blue;">MS ASP.NET Ajax Control Toolkit</span></b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href=""><b>Editor</b> controls in <b>TabContainer</b></a></td>
                                     <td class="fname">cs_Tabs.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><b>Editor</b> control with <b>ModalPopupExtender</b></a></td>
                                     <td class="fname">cs_ModalPopup.aspx</td>
                                 </tr>

                              <tr>
                              <td class="header" colspan="2"><b>Integration with <span style="color:Blue;">ASP.NET Controls</span></b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href=""><b>Editor</b> control in <b>MultuView</b></a></td>
                                     <td class="fname">cs_MultiView.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><b>Editor</b> control in <b>Wizard</b></a></td>
                                     <td class="fname">cs_Wizard.aspx</td>
                                 </tr>

                              <tr>
                              <td class="header" colspan="2"><b>Integration with <span style="color:Blue;">obout Controls</span></b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href=""><b>Editor</b> inside the <b>Flyout</b> control</a></td>
                                     <td class="fname">cs_oboutFlyout.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><b>Editor</b> inside the <b>Window</b> control</a></td>
                                     <td class="fname">cs_oboutWindow.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><b>Toolbar</b> inside the <b>Window</b> control</a></td>
                                     <td class="fname">cs_oboutWindowToolbar.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href=""><b>Editor</b> in edit template of the <b>Grid</b> control</a></td>
                                     <td class="fname">cs_oboutGrid.aspx</td>
                                 </tr>

                              </table>
                          </td>
                       </tr>
                   </table>
                </td>
            </tr>
            <tr>
                <td>
                    <hr />
                    <p class="tdText" style="margin-top:0px;padding-top:0px;">
                        <b>Important (before running the examples)</b>:<br /><br />
                        You have to give "write" permissions to the <b>ASP.NET Machine Account</b> user for the 
                        <b>db.mdb</b> database. (This Access database is located in the <b>App_Data</b> folder.)<br/>
                        To do this, right-click on the db.mdb file, select Properties and click the
                        Security tab. If the ASP.NET Machine Account isn't displayed in the users list,
                        you have to add it manually:<br />
                        - click Add->Advanced->Find now and from the list with all the possible users,
                        select the ASP.NET Machine Account user and then assign to it the "Write" right.<br />
                        Make sure the <b>Internet Guest Account</b> has the same rights.
                        If you still can't update the database, try to give the same rights to the <b>Service</b> account.
                        <br />
                        Also, make sure that the db.mdb is not marked as Read-Only
                        <br />
                        If you don't follow these steps, you'll get an exception when trying to update the database in the <b>'Database use'</b> examples:
                        <i>Operation must use an updateable query.</i>
                        <br />
                     </p>
                </td>
            </tr>
        </table>
        <br />
        <a href="http://www.obout.com/Obout.Ajax.UI">Obout.Ajax.UI home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>
       </div>                             
    </form>
</body>
</html>
