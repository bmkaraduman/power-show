<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Mvc2.Extensions.Demo.Areas.Select.Models.City>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>
	DropdownList Extensions</h2>
<h3>
	<a href="http://weblogs.asp.net/raduenuca/archive/2011/02/26/asp-net-mvc-extending-the-dropdownlist-to-show-the-items-grouped-by-a-category.aspx">
		ASP.NET MVC – Extending the DropDownList to show the items grouped by a category </a>
</h3>
	<% if ( TempData[ "info" ] != null ) {%>
		<span style="font-weight: bold; color: Red;"><%: TempData["info"].ToString() %></span>
	<% } %>
	<% using (Html.BeginForm()) {%>
	<%: Html.ValidationSummary(true) %>
	<fieldset>
		<legend>Fields</legend>
		<div class="editor-label">
			<%: Html.LabelFor(model => model.Name) %>
		</div>
		<div class="editor-field">
			<%: Html.TextBoxFor(model => model.Name) %>
			<%: Html.ValidationMessageFor(model => model.Name) %>
		</div>
		<div class="editor-label">
			<%: Html.LabelFor(model => model.CountryId, "Country") %>
		</div>
		<div class="editor-field">
			<%: Html.DropDownListFor( model => model.CountryId, ViewData["countriesList"] as IDictionary<string, IEnumerable<SelectListItem>>, "[Please select a country]" ) %>
			<%: Html.ValidationMessageFor(model => model.CountryId) %>
		</div>
		<p>
			<input type="submit" value="Create" />
		</p>
	</fieldset>
	<% } %>
	<div>
		<%: Html.ActionLink("Back to List", "Index") %>
	</div>
</asp:Content>
