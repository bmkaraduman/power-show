using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using Obout.ListBox;
using System.Text;

public partial class ListBox_cs_integration_radiobtn : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(500);

        ListBox1.ItemTemplate = new ItemTemplate();

        ListBox1.Items.Add(new ListBoxItem());

        ListBox1Container.Controls.Add(ListBox1);
        
    }

    protected void Order(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ListBox1.SelectedText))
        {
            OrderDetails.Text = "<br /><br /><br /><b>The following control has been ordered:</b> " + ListBox1.SelectedText + "<br />";
        }
    }
   
    public class ItemTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {
            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);

            Literal divContainer = new Literal();
            divContainer.Text = "<div class=\"column\">";

            Literal divContainer2 = new Literal();
            divContainer2.Text = "<h4>ASP.NET Controls</h4><hr/>";

            Literal divContainer3 = new Literal();
            divContainer3.Text = "<span>";

            Obout.Interface.OboutRadioButton OboutRadioButton1 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton1.ID = "OboutRadioButton1";
            OboutRadioButton1.Text = "TreeView";
            OboutRadioButton1.GroupName = "Items";
            OboutRadioButton1.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer1 = new Literal();
            spacer1.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton2 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton2.ID = "OboutRadioButton2";
            OboutRadioButton2.Text = "Grid";
            OboutRadioButton2.GroupName = "Items";
            OboutRadioButton2.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer2 = new Literal();
            spacer2.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton3 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton3.ID = "OboutRadioButton10";
            OboutRadioButton3.Text = "HTML Editor";
            OboutRadioButton3.GroupName = "Items";
            OboutRadioButton3.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer3 = new Literal();
            spacer3.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton4 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton4.ID = "OboutRadioButton11";
            OboutRadioButton4.Text = "ComboBox";
            OboutRadioButton4.GroupName = "Items";
            OboutRadioButton4.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer4 = new Literal();
            spacer4.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton5 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton5.ID = "OboutRadioButton12";
            OboutRadioButton5.Text = "Scheduler";
            OboutRadioButton5.GroupName = "Items";
            OboutRadioButton5.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer5 = new Literal();
            spacer5.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton6 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton6.ID = "OboutRadioButton13";
            OboutRadioButton6.Text = "Window";
            OboutRadioButton6.GroupName = "Items";
            OboutRadioButton6.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal divContainer4 = new Literal();
            divContainer4.Text = "</span>";

            Literal divContainer5 = new Literal();
            divContainer5.Text = "</div>";

            Literal divContainer6 = new Literal();
            divContainer6.Text = "<div class=\"column\">";

            Literal divContainer7 = new Literal();
            divContainer7.Text = "<h4>ASP.NET MVC Controls</h4><hr/>";

            Literal divContainer8 = new Literal();
            divContainer8.Text = "<span>";

            Obout.Interface.OboutRadioButton OboutRadioButton7 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton7.ID = "OboutRadioButton3";
            OboutRadioButton7.Text = "Button";
            OboutRadioButton7.GroupName = "Items";
            OboutRadioButton7.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer6 = new Literal();
            spacer6.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton8 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton8.ID = "OboutRadioButton8";
            OboutRadioButton8.Text = "Checkbox";
            OboutRadioButton8.GroupName = "Items";
            OboutRadioButton8.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer7 = new Literal();
            spacer7.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton9 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton9.ID = "OboutRadioButton4";
            OboutRadioButton9.Text = "Dropdown List";
            OboutRadioButton9.GroupName = "Items";
            OboutRadioButton9.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer8 = new Literal();
            spacer8.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton10 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton10.ID = "OboutRadioButton7";
            OboutRadioButton10.Text = "Image Button";
            OboutRadioButton10.GroupName = "Items";
            OboutRadioButton10.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer9 = new Literal();
            spacer9.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton11 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton11.ID = "OboutRadioButton9";
            OboutRadioButton11.Text = "Radio Button";
            OboutRadioButton11.GroupName = "Items";
            OboutRadioButton11.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer10 = new Literal();
            spacer10.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton12 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton12.ID = "OboutRadioButton5";
            OboutRadioButton12.Text = "Textbox";
            OboutRadioButton12.GroupName = "Items";
            OboutRadioButton12.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer11 = new Literal();
            spacer11.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton13 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton13.ID = "OboutRadioButton6";
            OboutRadioButton13.Text = "Multiline Textbox";
            OboutRadioButton13.GroupName = "Items";
            OboutRadioButton13.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal divContainer9 = new Literal();
            divContainer9.Text = "</span>";

            Literal divContainer10 = new Literal();
            divContainer10.Text = "</div>";

            Literal divContainer11 = new Literal();
            divContainer11.Text = "<div class=\"column\">";

            Literal divContainer12 = new Literal();
            divContainer12.Text = "<h4>Miscellaneous</h4><hr/>";

            Literal divContainer13 = new Literal();
            divContainer13.Text = "<span>";

            Obout.Interface.OboutRadioButton OboutRadioButton14 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton14.ID = "OboutRadioButton14";
            OboutRadioButton14.Text = "TreeView for Classic ASP";
            OboutRadioButton14.GroupName = "Items";
            OboutRadioButton14.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";

            Literal spacer12 = new Literal();
            spacer12.Text = "<br />";

            Obout.Interface.OboutRadioButton OboutRadioButton15 = new Obout.Interface.OboutRadioButton();
            OboutRadioButton15.ID = "OboutRadioButton15";
            OboutRadioButton15.Text = "Site Monitoring";
            OboutRadioButton15.GroupName = "Items";
            OboutRadioButton15.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";


            Literal divContainer14 = new Literal();
            divContainer14.Text = "</span>";

            Literal divContainer15 = new Literal();
            divContainer15.Text = "</div>";

            templatePlaceHolder.Controls.Add(divContainer);
            templatePlaceHolder.Controls.Add(divContainer2);
            templatePlaceHolder.Controls.Add(divContainer3);
            templatePlaceHolder.Controls.Add(OboutRadioButton1);
            templatePlaceHolder.Controls.Add(spacer1);
            templatePlaceHolder.Controls.Add(OboutRadioButton2);
            templatePlaceHolder.Controls.Add(spacer2);
            templatePlaceHolder.Controls.Add(OboutRadioButton3);
            templatePlaceHolder.Controls.Add(spacer3);
            templatePlaceHolder.Controls.Add(OboutRadioButton4);
            templatePlaceHolder.Controls.Add(spacer4);
            templatePlaceHolder.Controls.Add(OboutRadioButton5);
            templatePlaceHolder.Controls.Add(spacer5);
            templatePlaceHolder.Controls.Add(OboutRadioButton6);
            templatePlaceHolder.Controls.Add(divContainer4);
            templatePlaceHolder.Controls.Add(divContainer5);
            templatePlaceHolder.Controls.Add(divContainer6);
            templatePlaceHolder.Controls.Add(divContainer7);
            templatePlaceHolder.Controls.Add(divContainer8);
            templatePlaceHolder.Controls.Add(OboutRadioButton7);
            templatePlaceHolder.Controls.Add(spacer6);
            templatePlaceHolder.Controls.Add(OboutRadioButton8);
            templatePlaceHolder.Controls.Add(spacer7);
            templatePlaceHolder.Controls.Add(OboutRadioButton9);
            templatePlaceHolder.Controls.Add(spacer8);
            templatePlaceHolder.Controls.Add(OboutRadioButton10);
            templatePlaceHolder.Controls.Add(spacer9);
            templatePlaceHolder.Controls.Add(OboutRadioButton11);
            templatePlaceHolder.Controls.Add(spacer10);
            templatePlaceHolder.Controls.Add(OboutRadioButton12);
            templatePlaceHolder.Controls.Add(spacer11);
            templatePlaceHolder.Controls.Add(OboutRadioButton13);
            templatePlaceHolder.Controls.Add(divContainer9);
            templatePlaceHolder.Controls.Add(divContainer10);
            templatePlaceHolder.Controls.Add(divContainer11);
            templatePlaceHolder.Controls.Add(divContainer12);
            templatePlaceHolder.Controls.Add(divContainer13);
            templatePlaceHolder.Controls.Add(OboutRadioButton14);
            templatePlaceHolder.Controls.Add(spacer12);
            templatePlaceHolder.Controls.Add(OboutRadioButton15);
            templatePlaceHolder.Controls.Add(divContainer14);
            templatePlaceHolder.Controls.Add(divContainer15);
        }
    }
}