using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_aspnet_populate_runtime : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        Poll1.Items.Add(new PollItem("C#"));
        Poll1.Items.Add(new PollItem("Java"));
        Poll1.Items.Add(new PollItem("JavaScript"));
        Poll1.Items.Add(new PollItem("Perl"));
        Poll1.Items.Add(new PollItem("PHP"));
        Poll1.Items.Add(new PollItem("Ruby"));
        Poll1.Items.Add(new PollItem("VB"));
    }
}