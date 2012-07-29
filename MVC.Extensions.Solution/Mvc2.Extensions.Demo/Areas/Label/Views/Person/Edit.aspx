<%@  Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Mvc2.Extensions.Demo.Areas.Label.Models.Person>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Person
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>
    Label Extensions</h2>
<h3>
    <a href="http://weblogs.asp.net/raduenuca/archive/2011/02/17/asp-net-mvc-display-visual-hints-for-the-required-fields-in-your-model.aspx">
        ASP.NET MVC – Display visual hints for the required fields in your model </a>
</h3>
<% Html.EnableClientValidation(); %>
<% using ( Html.BeginForm( "Edit" , "Person" ) ) 
{%>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Fields</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Prefix, "self") %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Prefix) %>
            <%: Html.ValidationMessageFor(model => model.Prefix) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.FirstName, "self") %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.FirstName) %>
            <%: Html.ValidationMessageFor(model => model.FirstName) %>
        </div>
        <div id="divRequired">
            <div class="editor-label">
                <%: Html.LabelFor( model => model.MiddleName , "#divRequired" , "field-required3" )%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.MiddleName) %>
                <%: Html.ValidationMessageFor(model => model.MiddleName) %>
            </div>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.LastName, "self", "field-required2") %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.LastName) %>
            <%: Html.ValidationMessageFor(model => model.LastName) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.PrefferedName) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.PrefferedName) %>
            <%: Html.ValidationMessageFor(model => model.PrefferedName) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Suffix) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Suffix) %>
            <%: Html.ValidationMessageFor(model => model.Suffix) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor( model => model.Sex , "self" )%>
        </div>
        <div class="editor-field">
            <%: Html.CheckBoxFor(model => model.Sex) %>
            <%: Html.ValidationMessageFor(model => model.Sex) %>
        </div>
        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>


<% } %>
</asp:Content>
