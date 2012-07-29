<%@ Page Language="C#" %>

<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Web.UI" %>

<script runat="server" language="C#">
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
                    lblPath.Text = "<b>Path to folder with TreeView examples: </b>" + oXMLReader.ReadString();
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
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>obout ASP.NET TreeView examples</title>
    <style type="text/css">
        td.link
        {
            padding-left: 30px;
            width: 250px;
        }
        td.header
        {
            padding-top: 20px;
            border-bottom: 1px solid #eeeeee;
            color: #555555;
        }
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        .option2
        {
            font: 11px Verdana;
            color: #0033cc;
            background-color: ____:#f6f9fc;
            padding-left: 4px;
            padding-right: 4px;
        }
        a
        {
            font: 11px Verdana;
            color: #315686;
            text-decoration: underline;
        }
        a:hover
        {
            color: crimson;
        }
    </style>

    <script type="text/javascript">
		function showexamples() {
			var exSelect = document.forms[0].exSelect;
			for(var i=0; i<exSelect.length; i++) {
				if(exSelect[i].checked == true) {
					document.getElementById(exSelect[i].value).style.display = "block";
				} else {
					document.getElementById(exSelect[i].value).style.display = "none";
				}
			}
		}
		function showExamplesFromSpan(index) {		   
		    document.forms[0].exSelect[index].checked = true;
		    showexamples(index);
		}
		window.onload = function() {
			var oExamplesType = document.getElementById("ExamplesType");
			if(oExamplesType.value == "ASPNET") {
				document.forms[0].exSelect[0].checked = true;
			} else if(oExamplesType.value == "CSHARP") {
				document.forms[0].exSelect[1].checked = true;
			} else if(oExamplesType.value == "VBNET") {
				document.forms[0].exSelect[2].checked = true;
			} else {
			    document.forms[0].exSelect[0].checked = true;
			}
			showexamples();
		}
    </script>

</head>
<body style="margin-left: 30px;">
    <form name="form1" id="form1" runat="server">
    <input id="ExamplesType" type="hidden" runat="server" />
    <span class="tdText"><a href="../Default.aspx">« Back to Suite Examples</a>
        <br />
        <br />
        <br />
        <span style="font-weight: bold;">Obout.Ajax.UI.TreeView examples</span>
        <br />
        <br />
        Select the examples you want to see:&#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(0)" value="divASPNET" class="tdText" /><span
            style="cursor: pointer" onclick="showExamplesFromSpan(0)">ASP.NET</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(1)" value="divCSharp" class="tdText" /><span
            style="cursor: pointer" onclick="showExamplesFromSpan(1)">C#</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(2)" value="divVBNET" class="tdText" /><span
            style="cursor: pointer" onclick="showExamplesFromSpan(2)">VB.NET</span> &#160;&#160;&#160;
        <br />
        <br />
        <asp:Label runat="server" ID="lblPath"></asp:Label>
        <br />
        <br />
        <div id="divASPNET">
            <table width="1024">
                <tr>
                    <td valign="top">
                        <table>
                            <tr>
                                <td class="header" colspan="2">
                                    <b>Performance</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_performance.aspx">Populate large nodes</a>
                                </td>
                                <td>
                                    aspnet_performance.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_loadondemand.aspx">Load on demand</a>
                                </td>
                                <td>
                                    aspnet_loadondemand.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="header" colspan="2">
                                    <b>Appearence</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_custom_images.aspx">Custom images</a>
                                </td>
                                <td>
                                    aspnet_custom_images.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_no_lines.aspx">No lines</a>
                                </td>
                                <td>
                                    aspnet_no_lines.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="header" colspan="2">
                                    <b>Styles</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_style_default.aspx">Default</a>
                                </td>
                                <td>
                                    aspnet_style_default.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_style_msdn.aspx">MSDN</a>
                                </td>
                                <td>
                                    aspnet_style_msdn.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_style_vista.aspx">Vista</a>
                                </td>
                                <td>
                                    aspnet_style_vista.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_treegrid.aspx">Tree Grid</a>
                                </td>
                                <td>
                                    aspnet_treegrid.aspx
                                </td>
                            </tr>
<!--
                            <tr>
                                <td class="link">
                                    <a href="aspnet_amazon.aspx">Amazon Demo</a>
                                </td>
                                <td>
                                    aspnet_amazon.aspx
                                </td>
                            </tr>
-->
                            <tr>
                                <td class="header" colspan="2">
                                    <b>Databinding</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_databind_linq.aspx">LINQ Datasource</a>
                                </td>
                                <td>
                                    aspnet_databind_linq.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_databind_obj.aspx">Object Datasource</a>
                                </td>
                                <td>
                                    aspnet_databind_obj.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_databind_sitemap.aspx">Sitemap Datasource</a>
                                </td>
                                <td>
                                    aspnet_databind_sitemap.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_databind_sql.aspx">SQL Datasource</a>
                                </td>
                                <td>
                                    aspnet_databind_sql.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_databind_xml.aspx">XML Datasource</a>
                                </td>
                                <td>
                                    aspnet_databind_xml.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="header" colspan="2">
                                    <b>Drag and drop</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_dragdrop_core.aspx">Core features</a>
                                </td>
                                <td>
                                    aspnet_dragdrop_core.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_dragdrop_betweenTrees.aspx">Between multiple trees</a>
                                </td>
                                <td>
                                    aspnet_dragdrop_betweenTrees.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_dragdrop_external.aspx">Node drop in external controls</a>
                                </td>
                                <td>
                                    aspnet_dragdrop_external.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_dragdrop_custom.aspx">Customize drag and drop</a>
                                </td>
                                <td>
                                    aspnet_dragdrop_custom.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="header" colspan="2">
                                    <b>Events</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_client_events.aspx">Client side events</a>
                                </td>
                                <td>
                                    aspnet_client_events.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_server_events.aspx">Server side events</a>
                                </td>
                                <td>
                                    aspnet_server_events.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="header" colspan="2">
                                    <b>Others</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_additionaldata.aspx">Additional data</a>
                                </td>
                                <td>
                                    aspnet_additionaldata.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_editingnode.aspx">Editing a node</a>
                                </td>
                                <td>
                                    aspnet_editingnode.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_expandmode.aspx">Modes of node expand</a>
                                </td>
                                <td>
                                    aspnet_expandmode.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_selectmode.aspx">Modes of node select</a>
                                </td>
                                <td>
                                    aspnet_selectmode.aspx
                                </td>
                            </tr>
                             <tr>
                                <td class="link">
                                    <a href="aspnet_rtl.aspx">Right To Left Support</a>
                                </td>
                                <td>
                                    aspnet_rtl.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_filebrowser.aspx">File Browser</a>
                                </td>
                                <td>
                                    aspnet_filebrowser.aspx
                                </td>
                            </tr>
                            <tr>
                                <td class="link">
                                    <a href="aspnet_multinodeselection.aspx">Multi-Node Selection</a>
                                </td>
                                <td>
                                    aspnet_multinodeselection.aspx
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divCSharp">
            <table>
                <tr>
                    <td class="header" colspan="2">
                        <b>Performance</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_performance.aspx">Populate large nodes</a>
                    </td>
                    <td>
                        cs_performance.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_loadondemand.aspx">Load on demand</a>
                    </td>
                    <td>
                        cs_loadondemand.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Appearence</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_custom_images.aspx">Custom images</a>
                    </td>
                    <td>
                        cs_custom_images.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_no_lines.aspx">No lines</a>
                    </td>
                    <td>
                        cs_no_lines.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Styles</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_style_default.aspx">Default</a>
                    </td>
                    <td>
                        cs_style_default.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_style_msdn.aspx">MSDN</a>
                    </td>
                    <td>
                        cs_style_msdn.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_style_vista.aspx">Vista</a>
                    </td>
                    <td>
                        cs_style_vista.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Databinding</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_databind_linq.aspx">LINQ Datasource</a>
                    </td>
                    <td>
                        cs_databind_linq.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_databind_obj.aspx">Object Datasource</a>
                    </td>
                    <td>
                        cs_databind_obj.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_databind_sitemap.aspx">Sitemap Datasource</a>
                    </td>
                    <td>
                        cs_databind_sitemap.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_databind_sql.aspx">SQL Datasource</a>
                    </td>
                    <td>
                        cs_databind_sql.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_databind_xml.aspx">XML Datasource</a>
                    </td>
                    <td>
                        cs_databind_xml.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Drag and drop</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_dragdrop_core.aspx">Core features</a>
                    </td>
                    <td>
                        cs_dragdrop_core.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_dragdrop_betweenTrees.aspx">Between multiple trees</a>
                    </td>
                    <td>
                        cs_dragdrop_betweenTrees.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_dragdrop_external.aspx">Node drop in external controls</a>
                    </td>
                    <td>
                        cs_dragdrop_external.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_dragdrop_custom.aspx">Customize drag and drop</a>
                    </td>
                    <td>
                        cs_dragdrop_custom.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Events</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_client_events.aspx">Client side events</a>
                    </td>
                    <td>
                        cs_client_events.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_server_events.aspx">Server side events</a>
                    </td>
                    <td>
                        cs_server_events.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Others</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_additionaldata.aspx">Additional data</a>
                    </td>
                    <td>
                        cs_additionaldata.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_editingnode.aspx">Editing a node</a>
                    </td>
                    <td>
                        cs_editingnode.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_expandmode.aspx">Modes of node expand</a>
                    </td>
                    <td>
                        cs_expandmode.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="cs_selectmode.aspx">Modes of node select</a>
                    </td>
                    <td>
                        cs_selectmode.aspx
                    </td>
                </tr>
            </table>
        </div>
        <div id="divVBNET">
            <table>
                <tr>
                    <td class="header" colspan="2">
                        <b>Performance</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_performance.aspx">Populate large nodes</a>
                    </td>
                    <td>
                        vb_performance.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_loadondemand.aspx">Load on demand</a>
                    </td>
                    <td>
                        vb_loadondemand.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Appearence</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_custom_images.aspx">Custom images</a>
                    </td>
                    <td>
                        vb_custom_images.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_no_lines.aspx">No lines</a>
                    </td>
                    <td>
                        vb_no_lines.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Styles</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_style_default.aspx">Default</a>
                    </td>
                    <td>
                        vb_style_default.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_style_msdn.aspx">MSDN</a>
                    </td>
                    <td>
                        vb_style_msdn.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_style_vista.aspx">Vista</a>
                    </td>
                    <td>
                        vb_style_vista.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Databinding</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_databind_linq.aspx">LINQ Datasource</a>
                    </td>
                    <td>
                        vb_databind_linq.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_databind_obj.aspx">Object Datasource</a>
                    </td>
                    <td>
                        vb_databind_obj.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_databind_sitemap.aspx">Sitemap Datasource</a>
                    </td>
                    <td>
                        vb_databind_sitemap.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_databind_sql.aspx">SQL Datasource</a>
                    </td>
                    <td>
                        vb_databind_sql.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_databind_xml.aspx">XML Datasource</a>
                    </td>
                    <td>
                        vb_databind_xml.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Drag and drop</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_dragdrop_core.aspx">Core features</a>
                    </td>
                    <td>
                        vb_dragdrop_core.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_dragdrop_betweenTrees.aspx">Between multiple trees</a>
                    </td>
                    <td>
                        vb_dragdrop_betweenTrees.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_dragdrop_external.aspx">Node drop in external controls</a>
                    </td>
                    <td>
                        vb_dragdrop_external.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_dragdrop_custom.aspx">Customize drag and drop</a>
                    </td>
                    <td>
                        vb_dragdrop_custom.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Events</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_client_events.aspx">Client side events</a>
                    </td>
                    <td>
                        vb_client_events.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_server_events.aspx">Server side events</a>
                    </td>
                    <td>
                        vb_server_events.aspx
                    </td>
                </tr>
                <tr>
                    <td class="header" colspan="2">
                        <b>Others</b>
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_additionaldata.aspx">Additional data</a>
                    </td>
                    <td>
                        vb_additionaldata.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_editingnode.aspx">Editing a node</a>
                    </td>
                    <td>
                        vb_editingnode.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_expandmode.aspx">Modes of node expand</a>
                    </td>
                    <td>
                        vb_expandmode.aspx
                    </td>
                </tr>
                <tr>
                    <td class="link">
                        <a href="vb_selectmode.aspx">Modes of node select</a>
                    </td>
                    <td>
                        vb_selectmode.aspx
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <div class="tdText" style="width: 525px;">
        </div>
        <br />
        <br />
        <a href="http://www.obout.com/Obout.Ajax.UI">Obout.Ajax.UI home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a> </span>
    </form>
</body>
</html>
