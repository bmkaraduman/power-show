using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_columns_states : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
    private Obout.ListBox.ListBox ListBox2;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(550);

        ListBox1.CssSettings.ItemsContainer += "ob_iLboIC long-states";

        ListBox1Container.Controls.Add(ListBox1);

        ListBox2 = new Obout.ListBox.ListBox();
        ListBox2.ID = "ListBox2";
        ListBox2.Width = Unit.Pixel(335);
        ListBox2.CssSettings.ItemsContainer += "ob_iLboIC short-states";

        ListBox2Container.Controls.Add(ListBox2);

        String[] arrStates = {"Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", 			
								"Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",			
								"Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan",			
								"Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",			
								"New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma",			
								"Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas",			
								"Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"};

        // creating an array with all the states - short names
        String[] arrShortStates = {"AL", "AK", "AZ", "AR", "CA", "CO", "CT", 			
								"DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA",			
								"KS", "KY", "LA", "ME", "MD", "MA", "MI",			
								"MN", "MS", "MO", "MT", "NE", "NV", "NH",			
								"NJ", "NM", "NY", "NC", "ND", "OH", "OK",			
								"OR", "PA", "RI", "SC", "SD", "TN", "TX",			
								"UT", "VT", "VA", "WA", "WV", "WI", "WY"};

        int i;

        // looping through the full names array and adding each state to the first combobox
        for (i = 0; i < arrStates.Length; i++)
        {
            ListBox1.Items.Add(new ListBoxItem(arrStates[i]));
        }

        // looping through the short names array and adding each state to the second combobox
        for (i = 0; i < arrShortStates.Length; i++)
        {
            ListBox2.Items.Add(new ListBoxItem(arrShortStates[i]));
        }
        
        
    }
}
