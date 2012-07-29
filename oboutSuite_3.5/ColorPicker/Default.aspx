<%@ Page UICulture="auto" Language="C#" %>
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
    <title>obout ASP.NET ColorPicker examples</title>
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
        <span style="font-weight:bold;">Obout.Ajax.UI.ColorPicker examples</span> 
        <br />
        <br />
        Select the examples you want to see:&#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(0)" value="cs" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(0)">C#</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(1)" value="vb" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(1)">VB.NET</span> &#160;&#160;&#160;
        <br /><br />
        <b>Path to folder with Editor examples: </b><asp:Label runat="server" ID="lblPath"></asp:Label>
        <br /><br />
        <table style="margin-top:0px;padding-top:0px;">
            <tr>
                <td style="margin-top:0px;padding-top:0px;">
                   <table style="margin-top:0px;padding-top:0px;">
                       <tr>
                          <td valign="top" style="margin-top:0px;padding-top:0px;">
                              <table style="margin-top:0px;padding-top:0px;">
                                 <tr>
                                     <td class="link"><a href=""><b>TextBox</b> with <b>ColorPickerExtender</b></a></td>
                                     <td class="fname">cs_BaseSample.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">ColorPicker popup positioning</a></td>
                                     <td class="fname">cs_Position.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">'One touch' Color Picker with image button</a></td>
                                     <td class="fname">cs_WithImage.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Custom colors</a></td>
                                     <td class="fname">cs_CustomColors.aspx</td>
                                 </tr>

                                 <tr>
                                     <td class="link"><a href="">Custom colors only</a></td>
                                     <td class="fname">cs_CustomColorsOnly.aspx</td>
                                 </tr>
                              <tr>
                              <td class="header" colspan="2"><b>Integration</b></td>
                              </tr>

                                 <tr>
                                     <td class="link"><a href="">Inside obout <b>Grid</b></a></td>
                                     <td class="fname">cs_InGrid.aspx</td>
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
