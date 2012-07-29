using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;
using System.Data;
using System.Data.OleDb;

public partial class ComboBox_aspnet_templates_item : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(325);
        ComboBox1.DataSourceID = "sds1"; 
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";

        ComboBox1.ItemTemplate = new ItemTemplate(IsPostBack);

        ComboBox1Container.Controls.Add(ComboBox1);
    }

    public class ItemTemplate : ITemplate
    {
        private bool isPostBack;

        public ItemTemplate(bool _isPostBack)
        {
            isPostBack = _isPostBack;
        }
        
        public void InstantiateIn(Control container)
        {
            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);
            
            templatePlaceHolder.DataBinding += new EventHandler(DataBindTemplate);
        }

        public void DataBindTemplate(object sender, EventArgs e)
        {
            PlaceHolder templatePlaceHolder = sender as PlaceHolder;
            ComboBoxItemTemlateContainer container = templatePlaceHolder.NamingContainer as ComboBoxItemTemlateContainer;
            ComboBoxItem item = (ComboBoxItem)container.Parent;

            Literal companyNameText = new Literal();
            if(!isPostBack)
            companyNameText.Text = "<span class=\"template-name\">" + DataBinder.Eval(item.DataItem, "CompanyName").ToString() + "</span>";

            Literal countryText1 = new Literal();
            if (!isPostBack)
            countryText1.Text = " / <span class=\"template-country\">" + DataBinder.Eval(item.DataItem, "Country").ToString() + " ";

            Image flag = new Image();
            if (!isPostBack)
            flag.ImageUrl = GetCountryFlag(DataBinder.Eval(item.DataItem, "Country").ToString());
            
            Literal countryText2 = new Literal();
            if (!isPostBack)
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

