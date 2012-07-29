<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Page Language="C#" %>

<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e)
    {

        Node rootNode = new Node() { Text = "Art", Expanded = true };
        ObTree.Nodes.Add(rootNode);

        rootNode.ChildNodes.Add(new Node() { Text = "$7 or Less" });
        rootNode.ChildNodes.Add(new Node() { Text = "16th to 19th Century" });
        rootNode.ChildNodes.Add(new Node() { Text = "19th and 20th Century" });
        rootNode.ChildNodes.Add(new Node() { Text = "Acrylic Painting" });
        rootNode.ChildNodes.Add(new Node() { Text = "Advertising and Display" });
        rootNode.ChildNodes.Add(new Node() { Text = "African" });
        rootNode.ChildNodes.Add(new Node() { Text = "African American Art" });
        rootNode.ChildNodes.Add(new Node() { Text = "Airbrush" });
        rootNode.ChildNodes.Add(new Node() { Text = "Anatomy and Figure Drawing" });
        rootNode.ChildNodes.Add(new Node() { Text = "Ancient and Classical " });
        rootNode.ChildNodes.Add(new Node() { Text = "Ancient and Prehistoric" });
        rootNode.ChildNodes.Add(new Node() { Text = "Ancient Egyptian" });
        rootNode.ChildNodes.Add(new Node() { Text = "Animal Drawing and Painting" });
        rootNode.ChildNodes.Add(new Node() { Text = "Anthologies" });
        rootNode.ChildNodes.Add(new Node() { Text = "Art Business Guides" });
        rootNode.ChildNodes.Add(new Node() { Text = "Art History Surveys " });
        rootNode.ChildNodes.Add(new Node() { Text = "Art Nouveau and Deco" });
        rootNode.ChildNodes.Add(new Node() { Text = "Artists" });
        rootNode.ChildNodes.Add(new Node() { Text = "Artists on Art" });
        rootNode.ChildNodes.Add(new Node() { Text = "Asia and Far East" });

        Node rootNode2 = new Node() { Text = "Audio Books", Expanded = true };
        ObTree.Nodes.Add(rootNode2);

        rootNode2.ChildNodes.Add(new Node() { Text = "General" });
        rootNode2.ChildNodes.Add(new Node() { Text = "$7 or Less" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Abuse" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Agriculture" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Anthologies" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Geology" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Horror" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Judaica" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Literature" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Biography" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Business" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Christianity" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Computers" });
        rootNode2.ChildNodes.Add(new Node() { Text = "Cooking and Food" });
    }
</script>
<html>
<head id="Head1" runat="server">
    <title>obout ASP.NET Splitter examples</title>
    <style type="text/css">
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        .title
        {
            font-size: 15px;
            color: blue;
            font-weight: bold;
        }
        .subtitle
        {
            font-size: 12px;
            color: blue;
            font-weight: bold;
        }
        .description
        {
            font-size: 12px;
        }
        .price
        {
            color: crimson;
            font-weight: bold;
        }
        .submit
        {
            height: 20px;
            background-color: gray;
            color: white;
            font-weight: bold;
        }
        .normal
        {
            font-size: 12px;
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <br />
    <span class="tdText"><b>ASP.NET Splitter - Remember Scroll</b></span>
    <br />
    <br />
    <a style="font-size: 10pt; font-family: Tahoma" href="Default.aspx?type=ASPNET">« Back
        to examples</a>
    <br />
    <br />
    <div style="width: 686px; height: 440px; border: 1px solid #ebe9ed">
        <obspl:Splitter RememberScrollPosition="true" StyleFolder="styles/default" ID="mySpl"
            runat="server" CookieDays="0">
            <LeftPanel WidthMin="100" WidthMax="400">
                <Header Height="60">
                    <div class="tdText" style="padding-left: 10px; padding-top: 10px; text-align: center;
                        background-color: #e0e6ed; height: 100%">
                        <br />
                        <b>Categories</b>
                    </div>
                </Header>
                <Content>
                    <div class="tdText" style="padding-left: 10px; padding-top: 10px">
                        <obout:Tree ID="ObTree" runat="server">
                        </obout:Tree>
                    </div>
                </Content>
            </LeftPanel>
            <RightPanel>
                <Header Height="80">
                    <div class="tdText" style="padding-left: 10px; padding-top: 10px; text-align: left;
                        background-color: #ebe9ed; height: 100%">
                        <br />
                        <b>Make a postback by adding a book to your shopping cart.
                            <br />
                            You may scroll down the panels to see the efect. </b>
                    </div>
                </Header>
                <Content>
                    <div style="width: 400px; padding-left: 15px;">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <span class="title">Featured Nonfiction </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td width="60px">
                                                <img width="60px" src="images/book2.jpg" />
                                            </td>
                                            <td class="normal" valign="top">
                                                <span class="subtitle">Assassination Vacation </span>
                                                <br />
                                                by Sarah Vowell
                                                <br />
                                                <b>Powells.com Staff Pick </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="normal">
                                                <span class="description">Leave it to Sarah Vowell to roam across America in search
                                                    of the motivations and culture of political murder. Obsessive, edifying, and, of
                                                    course, witty, Assassination Vacation is unlike any other historical tourism or
                                                    travel writing book you'll ever... </span><a href="#">(read more)</a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="normal">
                                    <br />
                                    <b>Your Price</b> <span class="price">$9.99</span>
                                    <br />
                                    (New Compact Disc)
                                    <br />
                                    <br />
                                    <input type="submit" value="add to cart" class="submit" />
                                </td>
                            </tr>
                        </table>
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <span class="title">Featured Humor</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td width="60px">
                                                <img width="60px" src="images/book1.jpg" />
                                            </td>
                                            <td class="normal" valign="top">
                                                <span class="subtitle">Drive-By Comedy CD </span>
                                                <br />
                                                by George Carlin
                                                <br />
                                                <b>Synopsis</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="normal">
                                                <span class="description">Perfect for traveling in the car, this CD offers quick wit
                                                    from David Brenner, George Carlin, Margaret Cho, Al Franken, Amy Sedaris, Paul Dinello
                                                    and Stephen Colbert.... </span><a href="#">(read more)</a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="normal">
                                    <br />
                                    <b>Your Price</b> <span class="price">$9.99</span>
                                    <br />
                                    (New Compact Disc)
                                    <br />
                                    <br />
                                    <input type="submit" value="add to cart" class="submit" />
                                </td>
                            </tr>
                        </table>
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <span class="title">Featured Fiction </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td width="60px">
                                                <img width="60px" src="images/book3.jpg" />
                                            </td>
                                            <td class="normal" valign="top">
                                                <span class="subtitle">The Da Vinci Code </span>
                                                <br />
                                                by Dan Brown
                                                <br />
                                                <b>Publisher Comments </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="normal">
                                                <span class="description">While in Paris on business, Harvard symbologist Robert Langdon
                                                    receives an urgent late-night phone call: the elderly curator of the Louvre has
                                                    been murdered inside the museum. Near the body, police have found a baffling cipher.
                                                    While working to solve the... </span><a href="#">(read more)</a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="normal">
                                    <br />
                                    <b>Your Price</b> <span class="price">$9.99</span>
                                    <br />
                                    (New Compact Disc)
                                    <br />
                                    <br />
                                    <input type="submit" value="add to cart" class="submit" />
                                </td>
                            </tr>
                        </table>
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <span class="title">Featured Nonfiction </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td width="60px">
                                                <img width="60px" src="images/book4.jpg" />
                                            </td>
                                            <td class="normal" valign="top">
                                                <span class="subtitle">Eats, Shoots and Leaves - Unabr CDs </span>
                                                <br />
                                                by Lynne Truss
                                                <br />
                                                <b>Synopsis </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="normal">
                                                <span class="description">We all know the basics of punctuation--or do we? In "Eats,
                                                    Shoots & Leaves," Truss dares to say, in her delightfully witty way, that it is
                                                    time to institute a zero tolerance approach to punctuation. Unabridged. 1 CD....
                                                </span><a href="#">(read more)</a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="normal">
                                    <br />
                                    <b>Your Price</b> <span class="price">$9.99</span>
                                    <br />
                                    (New Compact Disc)
                                    <br />
                                    <br />
                                    <input type="submit" value="add to cart" class="submit" />
                                </td>
                            </tr>
                        </table>
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <span class="title">Featured for Kids </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td width="60px">
                                                <img width="60px" src="images/book5.jpg" />
                                            </td>
                                            <td class="normal" valign="top">
                                                <span class="subtitle">Ella Enchanted Mti </span>
                                                <br />
                                                by Gail Carson Levine
                                                <br />
                                                <b>Publisher Comments </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="normal">
                                                <span class="description">That fool of a fairy Lucinda did not intend to lay a curse
                                                    on me. She meant to bestow a gift. When I cried inconsolably through my first hour
                                                    of life, my tears were her inspiration. Shaking her head sympathetically at Mother,
                                                    the fairy touched my nose... </span><a href="#">(read more)</a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="normal">
                                    <br />
                                    <b>Your Price</b> <span class="price">$9.99</span>
                                    <br />
                                    (New Compact Disc)
                                    <br />
                                    <br />
                                    <input type="submit" value="add to cart" class="submit" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </Content>
            </RightPanel>
        </obspl:Splitter>
    </div>
    </form>
</body>
</html>
