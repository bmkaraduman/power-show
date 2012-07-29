<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
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
    <obout:Tree ID="ObClassicTree" CssClass="msdn" runat="server">
        <Nodes>
            <obout:Node Text="Welcome to the MSDN Library" ExpandMode="ServerSideCallback">
                <obout:Node Text="How to Use the MSDN Library Table of Contents" />
            </obout:Node>
            <obout:Node Text="Development tools and languages" ExpandMode="ServerSideCallback">
                <obout:Node Text="Visual Studio 2005" ExpandMode="ServerSideCallback">
                    <obout:Node Text="Product Documentation" />
                    <obout:Node Text="Technical Articles" ExpandMode="ServerSideCallback">
                        <obout:Node Text="Visual Basic" />
                        <obout:Node Text="Visual C++" />
                        <obout:Node Text="C#" />
                        <obout:Node Text="Visual Studio" />
                    </obout:Node>
                </obout:Node>
                <obout:Node Text="Visual Studio .NET" ExpandMode="ServerSideCallback">
                    <obout:Node Text="Introducing Visual Studio .NET" />
                    <obout:Node Text="Getting Assistance" />
                    <obout:Node Text="Samples and Walkthroughs" />
                    <obout:Node Text="Developing with Visual Studio .NET" />
                    <obout:Node Text="Visual Basic and Visual C#" />
                    <obout:Node Text="Visual J#" />
                    <obout:Node Text="Visual C++" />
                    <obout:Node Text="JScript" />
                    <obout:Node Text="Articles and Columns" />
                    <obout:Node Text="Book Excerpts" />
                    <obout:Node Text="Periodicals" />
                </obout:Node>
                <obout:Node Text=".NET Framework SDK (see .NET Development)" />
                <obout:Node Text="Visual Studio 6.0" ExpandMode="ServerSideCallback">
                    <obout:Node Text="Visual Basic 6.0" />
                    <obout:Node Text="Visual Basic for Applications" />
                    <obout:Node Text="Visual C and C++ 6.0" />
                    <obout:Node Text="Visual InterDev 6.0" />
                    <obout:Node Text="Visual J++ 6.0" />
                    <obout:Node Text="Visual SourceSafe 6.0" />
                    <obout:Node Text="Visual Studio 6.0" />
                </obout:Node>
                <obout:Node Text="Visual FoxPro" ExpandMode="ServerSideCallback">
                    <obout:Node Text="Visual FoxPro 9.0" />
                    <obout:Node Text="Visual FoxPro 8.0" />
                    <obout:Node Text="Visual FoxPro 7.0" />
                    <obout:Node Text="Visual FoxPro 6.0" />
                    <obout:Node Text="Visual FoxPro Periodicals" />
                </obout:Node>
            </obout:Node>
            <obout:Node Text="Mobile and Embedded Development" ExpandMode="ServerSideCallback">
                <obout:Node Text=".NET Compact Framework" ExpandMode="ServerSideCallback">
                    <obout:Node Text="Product Documentation" />
                    <obout:Node Text="Technical Articles" />
                    <obout:Node Text="How-To Articles" />
                </obout:Node>
                <obout:Node Text="Embedded Operating System Development" ExpandMode="ServerSideCallback">
                    <obout:Node Text="Windows CE" />
                    <obout:Node Text="Windows XP Embedded" />
                    <obout:Node Text="Windows NT Embedded" />
                    <obout:Node Text="Server Appliance Kit" />
                    <obout:Node Text="Columns" />
                    <obout:Node Text="Downloads" />
                </obout:Node>
                <obout:Node Text="Mobile Web Development" ExpandMode="ServerSideCallback">
                    <obout:Node Text="Documentation" />
                    <obout:Node Text="Technical Articles" />
                    <obout:Node Text="Downloads" />
                </obout:Node>
                <obout:Node Text="Windows Mobile" ExpandMode="ServerSideCallback">
                    <obout:Node Text="Getting Started" />
                    <obout:Node Text="Product Documentation" />
                    <obout:Node Text="Technical Articles" />
                    <obout:Node Text="Book Excerpts" />
                    <obout:Node Text="Columns" />
                    <obout:Node Text="Windows Mobile 2003 second Edition" />
                    <obout:Node Text="Windows Mobile 2003" />
                    <obout:Node Text="Pocket PC and Smartphone 2002" />
                    <obout:Node Text="Pocket PC 2000" />
                </obout:Node>
                <obout:Node Text="Windows Automotive" ExpandMode="ServerSideCallback">
                    <obout:Node Text="Windows Automotive 4.2" ExpandMode="ServerSideCallback">
                        <obout:Node Text="Welcome to Windows Automotive" />
                        <obout:Node Text="Using Windows Automotive" />
                    </obout:Node>
                </obout:Node>
                <obout:Node Text="Code Samples" />
            </obout:Node>
        </Nodes>
    </obout:Tree>
    </form>
</body>
</html>
