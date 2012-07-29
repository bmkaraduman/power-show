using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;
using System.Data;
using System.Data.OleDb;

public partial class ListBox_cs_templates_item : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(325);
        ListBox1.FolderStyle = "styles/premiere_blue";
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "CustomerID";

        ListBox1.ItemTemplate = new ItemTemplate();

        ListBox1Container.Controls.Add(ListBox1);
       
    }

    protected string GetCountryFlag(string countryName)
    {
        switch (countryName)
        {
            case "UK":
                countryName = "England";
                break;
        }
        
        return "resources/Images/flags/flag_" + countryName.ToLower() + ".png";
    }

    public class ItemTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {
            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);
            templatePlaceHolder.DataBinding += new EventHandler(DataBindTemplate);
        }

        public void DataBindTemplate(object sender, EventArgs e)
        {
            PlaceHolder templatePlaceHolder = sender as PlaceHolder;
            ListBoxItemTemlateContainer container = templatePlaceHolder.NamingContainer as ListBoxItemTemlateContainer;
            ListBoxItem item = (ListBoxItem)container.Parent;

            Literal companyNameText = new Literal();
            companyNameText.Text = "<span class=\"template-name\">" + DataBinder.Eval(item.DataItem, "CompanyName").ToString() + "</span>";

            Literal countryText1 = new Literal();
            countryText1.Text = " / <span class=\"template-country\">" + DataBinder.Eval(item.DataItem, "Country").ToString() + " ";

            Image flag = new Image();
            flag.ImageUrl = GetCountryFlag(DataBinder.Eval(item.DataItem, "Country").ToString());

            Literal countryText2 = new Literal();
            countryText2.Text = "</span>";

            templatePlaceHolder.Controls.Add(companyNameText);
            templatePlaceHolder.Controls.Add(countryText1);
            templatePlaceHolder.Controls.Add(flag);
            templatePlaceHolder.Controls.Add(countryText2);
        }

        protected string GetCountryFlag(string countryName)
        {
            switch (countryName)
            {
                case "UK":
                    countryName = "England";
                    break;
            }

            return "resources/Images/flags/flag_" + countryName.ToLower() + ".png";
        }
    }
   
}
