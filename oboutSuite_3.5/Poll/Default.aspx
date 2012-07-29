<%@ Page Title="" Language="C#" MasterPageFile="Poll.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Poll_Default" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <input id="ExamplesType" type="hidden" runat="server" />

    <div class="tdText" id="MainContainer">
        
        <a href="../Default.aspx" id="BackLink">&#171; Back to Suite Examples</a>
        
        <br /><br /><br />
        
        <span style="font-weight:bold;">Obout.Ajax.UI.Poll examples</span>
        
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

        <a href="http://www.obout.com/Obout.Ajax.UI">Obout.Ajax.UI home</a>
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