<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - MSDN Style</title>
    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
    </style>

    <script language="VB" runat="server"> 
       Private ObTree As Tree = Nothing
		Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

			ObTree = New Tree() With {.ID = "ObClassicTree", .CssClass = "msdn"}

			Dim nodeMSDN As New Node() With {.Text = "Welcome to the MSDN Library", .ExpandMode = NodeExpandMode.ServerSideCallback}

			ObTree.Nodes.Add(nodeMSDN)

			nodeMSDN.ChildNodes.Add(New Node("How to Use the MSDN Library Table of Contents"))

			Dim nodeTools As New Node() With {.Text = "Development tools and languages", .ExpandMode = NodeExpandMode.ServerSideCallback}
			ObTree.Nodes.Add(nodeTools)

			Dim nodeVS2005 As New Node() With {.Text = "Visual Studio 2005", .ExpandMode = NodeExpandMode.ServerSideCallback}
			nodeTools.ChildNodes.Add(nodeVS2005)

			nodeVS2005.ChildNodes.Add(New Node("Product Documentation"))

			Dim nodeTech As New Node() With {.Text = "Technical Articles", .ExpandMode = NodeExpandMode.ServerSideCallback}

			nodeVS2005.ChildNodes.Add(nodeTech)

			nodeTech.ChildNodes.Add(New Node("Visual Basic"))
			nodeTech.ChildNodes.Add(New Node("Visual C++"))
			nodeTech.ChildNodes.Add(New Node("C#"))
			nodeTech.ChildNodes.Add(New Node("Visual Studio"))

			Dim nodeNET As New Node() With {.Text = "Visual Studio .NET", .ExpandMode = NodeExpandMode.ServerSideCallback}
			nodeTools.ChildNodes.Add(nodeNET)

			nodeNET.ChildNodes.Add(New Node("Introducing Visual Studio .NET"))
			nodeNET.ChildNodes.Add(New Node("Getting Assistance"))
			nodeNET.ChildNodes.Add(New Node("Samples and Walkthroughs"))
			nodeNET.ChildNodes.Add(New Node("Developing with Visual Studio .NET"))
			nodeNET.ChildNodes.Add(New Node("Visual Basic and Visual C#"))
			nodeNET.ChildNodes.Add(New Node("Visual J#"))
			nodeNET.ChildNodes.Add(New Node("Visual C++"))
			nodeNET.ChildNodes.Add(New Node("JScript"))
			nodeNET.ChildNodes.Add(New Node("Articles and Columns"))
			nodeNET.ChildNodes.Add(New Node("Book Excerpts"))
			nodeNET.ChildNodes.Add(New Node("Periodicals"))

			nodeTools.ChildNodes.Add(New Node(".NET Framework SDK (see .NET Development)"))
        Dim nodeVS6 As New Node() With {.ExpandMode = NodeExpandMode.ServerSideCallback, .Text = "Visual Studio 6.0"}
			nodeTools.ChildNodes.Add(nodeVS6)

			nodeVS6.ChildNodes.Add(New Node("Visual Basic 6.0"))
			nodeVS6.ChildNodes.Add(New Node("Visual Basic for Applications"))
			nodeVS6.ChildNodes.Add(New Node("Visual C and C++ 6.0"))
			nodeVS6.ChildNodes.Add(New Node("Visual InterDev 6.0"))
			nodeVS6.ChildNodes.Add(New Node("Visual J++ 6.0"))
			nodeVS6.ChildNodes.Add(New Node("Visual SourceSafe 6.0"))
			nodeVS6.ChildNodes.Add(New Node("Visual Studio 6.0"))

			Dim nodeFox As New Node() With {.ExpandMode = NodeExpandMode.ServerSideCallback, .Text = "Visual FoxPro"}
			nodeTools.ChildNodes.Add(nodeFox)

			nodeFox.ChildNodes.Add(New Node("Visual FoxPro 9.0"))
			nodeFox.ChildNodes.Add(New Node("Visual FoxPro 8.0"))
			nodeFox.ChildNodes.Add(New Node("Visual FoxPro 7.0"))
			nodeFox.ChildNodes.Add(New Node("Visual FoxPro 6.0"))
			nodeFox.ChildNodes.Add(New Node("Visual FoxPro Periodicals"))

			Dim nodeMobile As New Node() With {.Text = "Mobile and Embedded Development", .ExpandMode = NodeExpandMode.ServerSideCallback}
			ObTree.Nodes.Add(nodeMobile)

			Dim nodeCompact As New Node() With {.Text = ".NET Compact Framework", .ExpandMode = NodeExpandMode.ServerSideCallback}

			nodeMobile.ChildNodes.Add(nodeCompact)
			nodeCompact.ChildNodes.Add(New Node("Product Documentation"))
			nodeCompact.ChildNodes.Add(New Node("Technical Articles"))
			nodeCompact.ChildNodes.Add(New Node("How-To Articles"))

			Dim nodeEmbed As New Node() With {.Text = "Embedded Operating System Development", .ExpandMode = NodeExpandMode.ServerSideCallback}

			nodeMobile.ChildNodes.Add(nodeEmbed)
			nodeEmbed.ChildNodes.Add(New Node("Windows CE"))
			nodeEmbed.ChildNodes.Add(New Node("Windows XP Embedded"))
			nodeEmbed.ChildNodes.Add(New Node("Windows NT Embedded"))
			nodeEmbed.ChildNodes.Add(New Node("Server Appliance Kit"))
			nodeEmbed.ChildNodes.Add(New Node("Columns"))
			nodeEmbed.ChildNodes.Add(New Node("Downloads"))

			Dim nodeMWeb As New Node() With {.Text = "Mobile Web Development", .ExpandMode = NodeExpandMode.ServerSideCallback}
         nodeMobile.ChildNodes.Add(nodeMWeb)
			nodeMWeb.ChildNodes.Add(New Node("Documentation"))
			nodeMWeb.ChildNodes.Add(New Node("Technical Articles"))
			nodeMWeb.ChildNodes.Add(New Node("Downloads"))

			Dim nodeWinMob As New Node() With {.Text = "Windows Mobile", .ExpandMode = NodeExpandMode.ServerSideCallback}

			nodeMobile.ChildNodes.Add(nodeWinMob)

			nodeWinMob.ChildNodes.Add(New Node("Getting Started"))
			nodeWinMob.ChildNodes.Add(New Node("Product Documentation"))
			nodeWinMob.ChildNodes.Add(New Node("Technical Articles"))
			nodeWinMob.ChildNodes.Add(New Node("Book Excerpts"))
			nodeWinMob.ChildNodes.Add(New Node("Columns"))
			nodeWinMob.ChildNodes.Add(New Node("Windows Mobile 2003 second Edition"))
			nodeWinMob.ChildNodes.Add(New Node("Windows Mobile 2003"))
			nodeWinMob.ChildNodes.Add(New Node("Pocket PC and Smartphone 2002"))
			nodeWinMob.ChildNodes.Add(New Node("Pocket PC 2000"))

			Dim nodeWinAuto As New Node() With {.Text = "Windows Automotive", .ExpandMode = NodeExpandMode.ServerSideCallback}

			nodeMobile.ChildNodes.Add(nodeWinAuto)

			Dim nodeAuto2 As New Node() With {.Text = "Windows Automotive 4.2", .ExpandMode = NodeExpandMode.ServerSideCallback}
			nodeWinAuto.ChildNodes.Add(nodeAuto2)

			nodeAuto2.ChildNodes.Add(New Node("Welcome to Windows Automotive"))
			nodeAuto2.ChildNodes.Add(New Node("Using Windows Automotive"))

			nodeMobile.ChildNodes.Add(New Node("Code Samples"))

			Me.TreePlaceHolder.Controls.Add(ObTree)		
		End Sub
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <br />
		<a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
		<br />
     <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <h2>
        ASP.NET TreeView - MSDN Style</h2>
    <table border="0">
        <tr>
            <td valign="top" class="h5" width="230px">
                Change style with one property
            </td>
            <td class="tdText" style="color: #0033cc;">
                OboutTree1.CssClass = "msdn"<br />
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
