<%@ Control Language="C#" ClassName="MyCaptchaWithIncrease" AutoEventWireup="true" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Captcha" Assembly="Obout.Ajax.UI" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script runat="server" language="c#">
    // default captcha image size
    protected int minWidth = 200;
    protected int minHeight = 40;
    // increased captcha image size
    protected int maxWidth = 400;
    protected int maxHeight = 80;
    // button images names
    protected string plusImage = "Plus";
    protected string minusImage = "Minus";
    // button images titles
    protected string plusImageTitle = "Increase the captcha image";
    protected string minusImageTitle = "Decrease the captcha image";
    /// <summary>
    /// inner captcha image
    /// </summary>
    protected myCaptchaImage InnerCaptchaImage = null;
    /// <summary>
    /// on page init
    /// </summary>
    protected void Page_Init(object sender, EventArgs e)
    {
        // trick with OboutTextBox in ASCX control
        CaptchaInputField.ID = this.ID + "_" + CaptchaInputField.ID;
        CaptchaValidator.ControlToValidate = CaptchaInputField.ID;
    }
    /// <summary>
    /// Add captcha image to the page
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {
        InnerCaptchaImage = new myCaptchaImage();
        // set its properties
        InnerCaptchaImage.TextLength = 5;
        InnerCaptchaImage.BackColor = System.Drawing.Color.WhiteSmoke;
        InnerCaptchaImage.TextBrush = BrushType.Horizontal;
        InnerCaptchaImage.BackBrush = BrushType.Solid;
        InnerCaptchaImage.BrushFillerColor = System.Drawing.Color.WhiteSmoke;
        InnerCaptchaImage.BackgroundNoise = NoiseLevel.High;
        InnerCaptchaImage.LineNoise = NoiseLevel.High;
        InnerCaptchaImage.FontFamily = "Georgia";
        InnerCaptchaImage.FontWarpLevel = NoiseLevel.None;
        InnerCaptchaImage.ID = "InnerCaptchaImage";
        InnerCaptchaImage.Width = new Unit(minWidth, UnitType.Pixel);
        InnerCaptchaImage.Height = new Unit(minHeight, UnitType.Pixel);
        CaptchaImagePlace.Controls.Add(InnerCaptchaImage);
    }
    /// <summary>
    /// Some things before the control render 
    /// </summary>
    protected void Page_PreRender(object sender, EventArgs e)
    {
        // clear the input field
        CaptchaInputField.Text = "";
        // set 'onclick' of the "Generate a new image" button
        GenerateNew.Attributes["onclick"] =
            "$find('" + InnerCaptchaImage.ClientID + "').getNewImage();";
        // we need to add some client-side functionality when a new image was generated
        InnerCaptchaImage.OnClientImageChanged = ClientID + "_onImageChanged";

        // we need to add a custom client-side method to the CaptchaImage component
        ScriptManager.RegisterStartupScript(this, this.GetType(),
            "UpdateCaptchaImage_" + InnerCaptchaImage.ClientID,
            "(function(){"+
                // function to run on page load
               "function l(){"+
                   // set the flag: whether to increase on "Change size" button click
                   ClientID + "_whetherIncrease = " + (InnerCaptchaImage.Height.Value == minHeight).ToString().ToLower() + ";" +
                   // get the CaptchaImage client-side component
                   "var captcha = $find('" + InnerCaptchaImage.ClientID + "');" +
                   // add custom method to be called on "Change size" button click
                   "captcha._my_increase = " + ClientID + "_my_increase;" +
                   // don't run it again
                   "Sys.Application.remove_load(l);"+
               "}"+
               // run the function above on page load
               "Sys.Application.add_load(l);"+
            "})();", true);

        // set 'onclick' of the "Change Size" button
        ChangeSize.Attributes["onclick"] =
            "$find('" + InnerCaptchaImage.ClientID + "')._my_increase();";
        
        // set the 'change size' button's properties
        ChangeSize.ImageUrl = "~/Captcha/UserControls/" + ((InnerCaptchaImage.Height.Value == minHeight) ? plusImage : minusImage) + ".gif";
        ChangeSize.Attributes.Add("Title", (InnerCaptchaImage.Height.Value == minHeight) ? plusImageTitle : minusImageTitle);
    }
    /// <summary>
    /// Validation group
    /// </summary>
    public string ValidationGroup
	{
        get { return CaptchaValidator.ValidationGroup; }
        set { CaptchaValidator.ValidationGroup = value; }
	}
    /// <summary>
    /// Whether to enable client-side validation
    /// </summary>
    public bool EnableClientScript
    {
        get { return CaptchaValidator.EnableClientScript; }
        set { CaptchaValidator.EnableClientScript = value; }
    }
    /// <summary>
    /// Inner CaptchaImage control
    /// </summary>
    public CaptchaImage CaptchaImage
    {
        get { return InnerCaptchaImage; }
    }

    /// <summary>
    /// Our Captcha Image - we can change the image size on postback
    /// </summary>
    protected class myCaptchaImage : CaptchaImage
    {
        /// <summary>
        /// Loads the client state data
        /// </summary>
        /// <param name="clientState"></param>
        protected override void LoadClientState(string clientState)
        {
            // call base method
            base.LoadClientState(clientState);
            // deserialize client state
            Dictionary<string, object> state = (Dictionary<string, object>)new JavaScriptSerializer().DeserializeObject(clientState);
            // Width and Height can be changed in client-side
            Width = new Unit((int)state["Width"]);
            Height = new Unit((int)state["Height"]);
        }
    }
</script>
<style type="text/css">
    #<%= MainTable.ClientID %> {
        border:1px solid gray;
        background-color: WhiteSmoke;
        border-radius: 5px;  
        -moz-border-radius: 5px;  
        -webkit-border-radius: 5px;
    }
</style>
<script type="text/javascript">
// when a new image was generated
function <%= ClientID %>_onImageChanged(sender, args) {
    // clear the textbox - restore its watermark
    <%= CaptchaInputField.ID %>.value(<%= CaptchaInputField.ID %>.WatermarkText);
    
    if(sender._customSetChangeButton) {
        // set the "Change size" button image's properties
        var img = $get("<%= ChangeSize.ClientID %>");
        img.src = img.src.replace(<%= ClientID %>_whetherIncrease?"<%= plusImage %>":"<%= minusImage %>", <%= ClientID %>_whetherIncrease?"<%= minusImage %>":"<%= plusImage %>");
        img.title = <%= ClientID %>_whetherIncrease?"<%= minusImageTitle %>":"<%= plusImageTitle %>";
        // reverse the flag: whether to increase
        <%= ClientID %>_whetherIncrease = !<%= ClientID %>_whetherIncrease;
        // reset flag: whether to change the "Change size" button image's properties on when new captcha image loaded
        sender._customSetChangeButton = false;
    }
}

// whether to increase flag 
var <%= ClientID %>_whetherIncrease = false;

function <%= ClientID %>_my_increase(increase) {
    // hidden input with component's state
    var clientStateField = this.get_clientStateField();
    // get the state as object
    var clientState = Sys.Serialization.JavaScriptSerializer.deserialize(clientStateField.value);

    // change the state's fields
    clientState.Width = <%= ClientID %>_whetherIncrease?<%= maxWidth.ToString() %>:<%= minWidth.ToString() %>;
    clientState.Height = <%= ClientID %>_whetherIncrease?<%= maxHeight.ToString() %>:<%= minHeight.ToString() %>;

    // serialize and save the modified state object
    clientStateField.value = Sys.Serialization.JavaScriptSerializer.serialize(clientState);

    // set flag: whether to change the "Change size" button image's properties on when new captcha image loaded
    this._customSetChangeButton = true;

    // generate a new image for the captcha
    this.getNewImage();
}
</script>
<table runat="server" id="MainTable">
    <tr>
        <td valign="middle" runat="server" id="CaptchaImagePlace"></td>
        <td valign="middle">
                <asp:Image runat="server" alt="" title="Generate a new image" ID="GenerateNew"
                    ImageUrl="~/Captcha/UserControls/Refresh.gif" style="cursor: pointer" />
        </td>
    </tr>
    <tr>
        <td align="left">
            <obout:OboutTextBox runat="server" ID="CaptchaInputField"
                WatermarkText="Type the code from the image" Width="200"
                FolderStyle="~/interface/styles/black_glass/OboutTextBox" />
        </td>
        <td valign="middle">
                <asp:Image runat="server" alt="" ID="ChangeSize" style="cursor: pointer" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="left">
            <obout:CaptchaValidator runat="server" CaptchaImageID="InnerCaptchaImage"
                ErrorMessage="The code you entered is not valid." ID="CaptchaValidator"
                ControlToValidate="CaptchaInputField" Display="Dynamic" />
        </td>
    </tr>
</table>