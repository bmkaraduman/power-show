<%@ Page Title="" Language="C#" MasterPageFile="Grid.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Grid_Default" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <input id="ExamplesType" type="hidden" runat="server" />

    <div class="tdText" id="MainContainer">
        
        <a href="../Default.aspx" id="BackLink">&#171; Back to Suite Examples</a>
        
        <br /><br /><br />
        
        <span style="font-weight:bold;">obout ASP.NET Grid examples</span> (version 7.0.9, released on February 20, 2012)
        
        <br /><br />
        
        <table>
            <tr>
                <td valign="middle">Select the examples you want to see:&#160;&#160;&#160;</td>
                <td valign="middle">
                    <obout:OboutRadioButton runat="server" ID="RbtnAspNet" Text="ASP.NET" GroupName="SamplesType" Checked="true">
                        <ClientSideEvents OnCheckedChanged="reloadSamples" />
                    </obout:OboutRadioButton>
                    &#160;&#160;&#160;
                    <obout:OboutRadioButton runat="server" ID="RbtnCSharp" Text="C#" GroupName="SamplesType">
                        <ClientSideEvents OnCheckedChanged="reloadSamples" />
                    </obout:OboutRadioButton>
                    &#160;&#160;&#160;
                    <obout:OboutRadioButton runat="server" ID="RbtnVbNet" Text="VB.NET" GroupName="SamplesType">
                        <ClientSideEvents OnCheckedChanged="reloadSamples" />
                    </obout:OboutRadioButton>
                </td>
            </tr>
        </table>                
        
        <br /><br />
        
        <asp:Label runat="server" ID="lblPath"></asp:Label>

        <br />

        <div style="float: left;">
            <asp:Literal runat="server" ID="MainCategories" />
        </div>
        <div style="float: left;padding-left: 50px; width: 500px;" id="SamplesContent"></div>
        <div style="clear: both;">&#160;</div>
                
        <br /><br /><br />

        <div class="tdText" style="width: 525px;">
			<b>Important (before running the examples)</b>:<br />
            You have to give "write" rights to the <b>ASP.NET Machine Account</b> user for the <br />
            Northwind.mdb database. (This Access database is located in the <b>App_Data</b> folder.)<br /><br />
            To do this, right-click on the Northwind.mdb file, select Properties and click the<br />
            Security tab. If the ASP.NET Machine Account isn't displayed in the users list,<br />
            you have to add it manually:<br /><br />
            - click Add->Advanced->Find now and from the list with all the possible users,<br />
            select the ASP.NET Machine Account user and then assign to it the "Write" right.<br /><br /><br />
            Make sure the <b>Internet Guest Account</b> has the same rights.
            <br /><br />
            If you still can't update the database, try to give the same rights to the <b>Service</b> account.
            <br /><br />
            Also, make sure that the Northwind.mdb is not marked as Read-Only <br />
            <br /><br />
            If you don't follow these steps, you'll get an exception when trying to update the database:<br />
            <i>Operation must use an updateable query.</i>
        </div>

        <br /><br />

        <a href="http://www.obout.com/grid">obout ASP.NET Grid home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>
    </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        var lastCategory = null;
        function loadSamples(categoryName) {            
            lastCategory = categoryName;
            var samplesType = 'aspnet_';

            if (RbtnCSharp.checked()) {
                samplesType = 'cs_';
            } else if (RbtnVbNet.checked()) {
                samplesType = 'vb_';
            }

            ob_post.AddParam('categoryName', categoryName);
            ob_post.AddParam('type', samplesType);
            ob_post.post(null, 'LoadSamples', displaySamples);
        }

        function displaySamples(response) {
            document.getElementById('SamplesContent').innerHTML = response;
            document.getElementById('MainContainer').scrollIntoView(true);
        }

        function reloadSamples() {
            if (lastCategory != null) {
                loadSamples(lastCategory);
            }
        }

        function loadInitialSamples(type, categoryName) {
            loadSamples(categoryName);
        }
    </script>
    <style type="text/css">
        a.header {
			color:#555555;
			padding-top: 5px;
			background-image: url(resources/images/plusik.gif);
			background-position: 0px 3px;
			background-repeat: no-repeat;
			padding-left: 18px;
			cursor: pointer;
			font-size: 11px;
			/*font-weight: bold;*/
		}
		
		.headerNumber {
		    color: #DC143C;
		}
		
		.new-sample
		{
		    color: #DC143C;
		}
		
		div.header {
			border-bottom:1px solid #eeeeee;
			color:#555555;
		}
		
		.sub-header
		{
		    border-bottom:1px solid #eeeeee;
			color:#555555;
			margin-top: 25px;
		}
		
		
		.link
		{
		    float: left;
		    width: 250px;
		    margin-top: 7px;
		}
		
		.link-file
		{
		    float: left;
		    width: 250px;
		    margin-top: 7px;
		}
		
		.link-clear
		{
		    clear: both;
		}
    </style>
</asp:Content>