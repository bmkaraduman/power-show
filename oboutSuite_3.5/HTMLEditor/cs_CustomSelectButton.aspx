<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_CustomSelectButton.aspx.cs" Inherits="HTMLEditor_cs_CustomSelectButton" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor.ContextMenu"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    TagPrefix="obout"
    Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" %>
<%@ Register
    TagPrefix="custom"
    Namespace="CustomToolbarButton" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.HTMLEditor.Popups" tagprefix="obout" %>
<%@ Register namespace="CustomPopups" tagprefix="custom" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>Editor Sample</title>
    <style type="text/css">
            a {
                   font-size:10pt;font-family:Tahoma
            }
            a:hover {
                   color:crimson;
            }
            .tdText {
                    font:11px Verdana;
                    color:#333333;
            }
    </style>
</head>
<body  style="font:12px Verdana; overflow:hidden;" scroll="no">
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Custom <b>'Select'</b> buttons - <b>Google AJAX Language API</b> implementation</span>
    <br /><br />
    This example shows how to translate either the whole content or a selection of text inside the Editor's content area using the <a href="http://code.google.com/apis/ajaxlanguage/documentation/">Google AJAX Language API</a>.
    <br/>
    See the implementation of the custom 'select' buttons in the ASPX and code files.
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" >
        </asp:ScriptManager>
        <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" >
            <preload>
                <obout:ColorPickerPopup runat="server">
                </obout:ColorPickerPopup>
                <obout:Icons ID="Icons1" runat="server" RelativeUrl="false">
                </obout:Icons>
                <obout:LinkProperties runat="server">
                </obout:LinkProperties>
                <obout:SpecialCharacters runat="server">
                </obout:SpecialCharacters>
            </preload>
            <demand>
                <obout:ImageBrowser runat="server" RelativeUrl="false">
                </obout:ImageBrowser>
            </demand>
        </obout:PopupHolder>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" Id="editor" Height="500px" Width="100%" PopupHolderID="popupHolder">
                    <TopToolbar Appearance="Lite" />
               </obout:Editor>
               <br />
               <asp:Button runat="server" Text="Submit content" ID="submit" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
<script type="text/JavaScript">
    // the source language for translation - 'auto' by default
    var sourceLanguage = "";

    Type.registerNamespace("CustomButton");

    // register class for the custom 'Select' button 'TranslateTo' (see the code file)

    CustomButton.TranslateTo = function (element) {
        CustomButton.TranslateTo.initializeBase(this, [element]);
    }
    CustomButton.TranslateTo.prototype = {

        // override the base method - just for the 'select' DOM element reset to the default (for FireFox)
        initialize: function () {
            CustomButton.TranslateTo.callBaseMethod(this, "initialize");
            var selectObject = this.get_select();
            selectObject.selectedIndex = 0;
        },

        // override the base method - is called when the option of the 'select' DOM element is changed
        callMethod: function (selectObject) {
            // check the base method
            if (!CustomButton.TranslateTo.callBaseMethod(this, "callMethod")) return false;

            var editor = this.get_designPanel();

            var language = selectObject.options.item(selectObject.selectedIndex).value;
            if (language == "") return;

            // get 'dirty' text nodes
            var dirtyNodes = editor._getTextNodeCollection(!editor.TextSelected());
            // for 'good' text nodes
            var nodes = [];
            // temporary DIV
            var temp = editor.get_doc().createElement("div");
            for (var i = 0; i < dirtyNodes.length; i++) {
                temp.innerHTML = dirtyNodes[i].data;

                if (temp.innerHTML.replace(/\&nbsp;/g, "").replace(/\s/g, "").length > 0) {
                    nodes.push(dirtyNodes[i]);
                }
            }
            delete temp;

            // for the translation results processing
            window.editorForGoogleTranslation = editor;
            window.nodesForGoogleTranslation = nodes;
            window.selectObjectForGoogleTranslation = selectObject;
            // for 'undo'
            editor.SaveContent();

            // prepare service elements for the Google's translation tool
            var sectionElement = $get("google_sectional_element");
            if (sectionElement) {
                sectionElement.parentNode.removeChild(sectionElement);
            }
            sectionElement = document.createElement("div");
            sectionElement.id = "google_sectional_element";
            sectionElement.style.display = "none";
            document.body.insertBefore(sectionElement, document.body.firstChild);

            var transControl = $get("goog-trans-control");
            if (transControl) {
                transControl.parentNode.removeChild(transControl);
            }
            var section = $get("goog-trans-section");
            if (section) {
                section.parentNode.removeChild(section);
            }

            section = document.createElement("div");
            section.id = "goog-trans-section";
            section.className = "goog-trans-section";
            section.style.display = "none";
            // set the source language (if selected)
            if (sourceLanguage.length > 0) {
                section.setAttribute("lang", sourceLanguage);
            }
            document.body.insertBefore(section, sectionElement.nextSibling);

            transControl = document.createElement("div");
            transControl.id = "goog-trans-control";
            transControl.className = "goog-trans-control";
            section.appendChild(transControl);

            var div = document.createElement("div");
            section.appendChild(div);

            // fill the DIV to be translated
            // for each text node
            for (var i = 0; i < nodes.length; i++) {
                // create <P> and add it to the DIV
                var p = document.createElement("p");
                p.innerHTML = nodes[i].data;
                div.appendChild(p);
            }

            // load and run the Google's script
            _loadJs((window.location.protocol == 'https:' ? 'https://' : 'http://') + "translate.google.com/translate_a/element.js?cb=googleSectionalElementInit&ug=section&hl=" + language);
            //this.get_editPanel().updateToolbar();
        },

        // we can override the base method
        checkState: function () {
            // but nothing to do here :-)
            return CustomButton.TranslateTo.callBaseMethod(this, "checkState");
        }
    }
    CustomButton.TranslateTo.registerClass("CustomButton.TranslateTo", Obout.Ajax.UI.HTMLEditor.ToolbarButton.DesignModeSelectButton);

    CustomButton.TranslateFrom = function (element) {
        CustomButton.TranslateFrom.initializeBase(this, [element]);
    }
    CustomButton.TranslateFrom.prototype = {

        // override the base method - just for the 'select' DOM element reset to the default (for FireFox)
        initialize: function () {
            CustomButton.TranslateFrom.callBaseMethod(this, "initialize");
            var selectObject = this.get_select();
            selectObject.selectedIndex = 0;
        },

        // override the base method - is called when the option of the 'select' DOM element is changed
        callMethod: function (selectObject) {
            // check the base method
            if (!CustomButton.TranslateFrom.callBaseMethod(this, "callMethod")) return false;

            // change the source language for translation
            sourceLanguage = selectObject.options.item(selectObject.selectedIndex).value;
        }
    }
    CustomButton.TranslateFrom.registerClass("CustomButton.TranslateFrom", Obout.Ajax.UI.HTMLEditor.ToolbarButton.DesignModeSelectButton);

    // method called by the Google's loaded script
    function googleSectionalElementInit() {
        // initialize the Google's translation tool
        new google.translate.SectionalElement({
            sectionalNodeClassName: 'goog-trans-section',
            controlNodeClassName: 'goog-trans-control',
            background: ''
        }, 'google_sectional_element');
        // with some delay
        setTimeout(function () {
            // find the <A> element for the translation start (inside the Translation Control)
            var p3 = $get("goog-trans-control").firstChild.firstChild.firstChild;
            // sectional element
            var section = $get('google_sectional_element');
            // function to wait till the translation tool is loaded
            function testLoaded() {
                // test whether it is loaded
                if (section.innerHTML.length == 0) {
                    // not yet, wait a bit
                    setTimeout(testLoaded, 10);
                    return;
                }
                // save the Translation Control content
                var prevCont = p3.innerHTML;
                // to count how many times the Translation Control changed its content while translation processing
                var chCounter = 0;
                // emulate the Translation Control click
                if (p3.click) {
                    p3.click();
                } else {
                    var ev = null;
                    try {
                        // try to create 'Events'
                        ev = document.createEvent("Events");
                    }
                    catch (ex) {
                        // try to create 'UIEvents'
                        ev = document.createEvent("UIEvents");
                    }
                    finally {
                        // init the event
                        ev.initEvent('click', true, true);

                        //initialize parameters of the event
                        ev.view = window;
                        ev.altKey = false;
                        ev.ctrlKey = false;
                        ev.shiftKey = false;
                        ev.metaKey = false;
                    }

                    // dispatch the event
                    if (ev) p3.dispatchEvent(ev);
                }

                // function to wait till translation complete
                function testTranslated() {
                    // if Translation Control's content was not changed, then wait a bit again
                    if (p3.innerHTML == prevCont) {
                        setTimeout(testTranslated, 10);
                        return;
                    }
                    // if Translation Control's content was changed but the first time only, then wait a little again
                    if (++chCounter == 1) {
                        // save the current content
                        prevCont = p3.innerHTML;
                        setTimeout(testTranslated, 10);
                        return;
                    }
                    // translation complete
                    // DIV with the translation result
                    var tempDiv = $get("goog-trans-section").childNodes.item(1);
                    // array of results
                    var values = [];
                    for (var i = 0; i < tempDiv.childNodes.length; i++) {
                        var item = tempDiv.childNodes.item(i);
                        var plainText = "";
                        // get the inner text
                        if (typeof item.innerText != "undefined") { // IE
                            plainText = item.innerText;
                        } else if (typeof item.textContent != "undefined") { // other browsers
                            plainText = item.textContent;
                        }
                        values.push(plainText);
                    }
                    // replace all text nodes with their translation results
                    for (var i = 0; i < window.nodesForGoogleTranslation.length; i++) {
                        if (i >= values.length) break;
                        var insert = values[i];
                        var node = window.nodesForGoogleTranslation[i];
                        var parent = node.parentNode;
                        parent.insertBefore(window.editorForGoogleTranslation.get_doc().createTextNode(insert), node);
                        parent.removeChild(node);
                    }
                    window.selectObjectForGoogleTranslation.selectedIndex = 0;
                    window.editorForGoogleTranslation.get_editPanel().updateToolbar();
                }
                // wait till translation complete
                testTranslated();
            }
            // wait till the translation tool is loaded
            testLoaded();
        }, 0);
    }
    // load script file
    function _loadJs(src) {
        var head = document.getElementsByTagName("head")[0] || document.documentElement;
        var scriptElement = document.getElementById("_loadScript");
        // remove the old one if it is present
        if (scriptElement != null) {
            var next = scriptElement.nextSibling;
            scriptElement.parentNode.removeChild(scriptElement);
            // remove all other scripts and CSS links added by Google dynamically
            while (next) {
                var curr = next;
                next = next.nextSibling;
                curr.parentNode.removeChild(curr);
            }
        }
        // create script element
        scriptElement = document.createElement("script");
        scriptElement.type = "text/javascript";
        scriptElement.charset = "UTF-8";
        scriptElement.src = src;
        scriptElement.id = "_loadScript";
        // add it to the header
        head.appendChild(scriptElement);
    }
</script>
</html>