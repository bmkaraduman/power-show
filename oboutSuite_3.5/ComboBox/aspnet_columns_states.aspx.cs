using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_aspnet_columns_states : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
