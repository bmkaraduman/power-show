using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_columns_states : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    private ComboBox ComboBox2;

  protected void Page_Load(object sender, EventArgs e)
    {
      
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(150);
        ComboBox1.MenuWidth = Unit.Pixel(550);
        ComboBox1.EmptyText = "Select a state ...";

        ComboBox1.CssSettings.ItemsContainer = "ob_iCboIC long-states";

        ComboBox1Container.Controls.Add(ComboBox1);


        ComboBox2 = new ComboBox();
        ComboBox2.ID = "ComboBox2";
        ComboBox2.Width = Unit.Pixel(150);
        ComboBox2.MenuWidth = Unit.Pixel(335);
        ComboBox2.EmptyText = "Select a state ...";

        ComboBox2.CssSettings.ItemsContainer = "ob_iCboIC short-states";

        ComboBox2Container.Controls.Add(ComboBox2);


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
            ComboBox1.Items.Add(new ComboBoxItem(arrStates[i]));
        }

        // looping through the short names array and adding each state to the second combobox
        for (i = 0; i < arrShortStates.Length; i++)
        {
            ComboBox2.Items.Add(new ComboBoxItem(arrShortStates[i]));
        }
    }
}
