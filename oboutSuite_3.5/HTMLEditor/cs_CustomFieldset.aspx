<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_CustomFieldset.aspx.cs" Inherits="HTMLEditor_cs_CustomFieldset" %>
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
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Custom <b>'Fieldset properties'</b> popup, toolbar button and context menu items</span>
    <br /><br />
    Custom button <img alt="" src="../App_Obout/HTMLEditor/customButtons/ed_InsertFieldset_n.gif" align="absmiddle" style="background-color:Blue;" />
    - insert the <b>'Fieldset'</b> DOM element.<br />
    You can use the context menu to edit the properties of existing Fieldset DOM element, also you can remove it.<br />
    See the implementation of the custom <b>button</b>, <b>popup</b> and <b>context menu item</b> in ASPX and code files.
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" >
            <Scripts>
                <%-- Ensure that ' Obout.Ajax.UI.HTMLEditor.Popups.OkCancelPopup' type is loaded for are custom button (see the bottom of the page) --%>
                <asp:ScriptReference  Assembly="Obout.Ajax.UI" Name="Obout.Ajax.UI.HTMLEditor.Popups.PopupsCommon.js" />
            </Scripts>
        </asp:ScriptManager>
        <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" >
            <preload>
                <obout:ColorPickerPopup ID="ColorPickerPopup1" runat="server">
                </obout:ColorPickerPopup>
                <obout:Icons ID="Icons1" runat="server" RelativeUrl="false">
                </obout:Icons>
                <obout:LinkProperties ID="LinkProperties1" runat="server">
                </obout:LinkProperties>
                <obout:SpecialCharacters ID="SpecialCharacters1" runat="server">
                </obout:SpecialCharacters>
            </preload>
            <demand>
                <obout:ImageBrowser ID="ImageBrowser1" runat="server" RelativeUrl="false">
                </obout:ImageBrowser>
            </demand>
        </obout:PopupHolder>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" Id="editor" Height="500px" Width="100%" PopupHolderID="popupHolder">
               </obout:Editor>
               <br />
               <asp:Button runat="server" Text="Submit content" ID="submit" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
<script type="text/JavaScript">

    // register class for the custom contextmenu item 'Remove Fieldset' (see the code file)

    Type.registerNamespace("CustomContextMenu");

    CustomContextMenu.RemoveFieldsetItem = function(element) {
        CustomContextMenu.RemoveFieldsetItem.initializeBase(this, [element]);
    }
    CustomContextMenu.RemoveFieldsetItem.prototype = {
        // override the base method - get element to delete
        getItemToDelete: function() {
            // range parent
            var parent = Obout.Ajax.UI.HTMLEditor.getSelParent(this.get_designPanel());

            if (parent.nodeType == 3) {
                parent = parent.parentNode;
            }

            // try to find FIELDSET element
            while (parent && parent.tagName && parent.tagName.toUpperCase() != "FIELDSET") {
                parent = parent.parentNode;
            }

            if (parent && parent.tagName && parent.tagName.toUpperCase() == "FIELDSET") {
                return parent; //found
            }
            return null; // not found - nothing to delete
        }
    }
    CustomContextMenu.RemoveFieldsetItem.registerClass("CustomContextMenu.RemoveFieldsetItem", Obout.Ajax.UI.HTMLEditor.ContextMenu.RemoveItem);

    // register class for the custom popup 'Fieldset properties' (see the code file)

    Type.registerNamespace("CustomPopup");

    CustomPopup.FieldsetProperties = function(element) {
        CustomPopup.FieldsetProperties.initializeBase(this, [element]);

        // private properties
        this._intable$delegate = Function.createDelegate(this, this._intable);
        this._fieldset = null;
        this._widthField = null;
        this._heightField = null;
        this._widthUnit = "px";
        this._heightUnit = "px";

        this._widthUnitToggle$delegate = Function.createDelegate(this, this._widthUnitToggle);
        this._heightUnitToggle$delegate = Function.createDelegate(this, this._heightUnitToggle);
    }

    CustomPopup.FieldsetProperties.prototype = {

        // override the base method
        callMethod: function(buttonElement, propertiesElement, initialElement) {
            var fieldset = (propertiesElement != null && typeof propertiesElement != "undefined") ? propertiesElement : null;

            if (fieldset != null) {
                this._edit = true;
                while (fieldset && fieldset.tagName.toUpperCase() != "FIELDSET") {
                    fieldset = fieldset.parentNode;
                }
                this._editFieldset(fieldset);
            } else {
                this._edit = false;
                if (!this._createFieldset()) return false;
            }

            if (!CustomPopup.FieldsetProperties.callBaseMethod(this, "callMethod", [buttonElement, propertiesElement])) return false;
            return true;
        },

        // override the base method (called before the popup opened)
        preOpen: function(contentWindow) {
            this._preparePopup(contentWindow);
        },

        // override the base method (called on 'OK' clicked)
        ok: function(contentWindow) {
            this._fieldsetElementChanged();

            if (Obout.Ajax.UI.HTMLEditor.isIE) {
                var editor = this.get_designPanel();
                var fieldset = this._fieldset;

                if ((fieldset.style.width && fieldset.style.width.length > 0) || (fieldset.style.height && fieldset.style.height.length > 0)) {
                    try {
                        var rng = editor._doc.body.createControlRange();
                        rng.add(fieldset);
                        rng.select();
                    } catch (e) { }
                } else {
                    var dummy = editor._doc.createTextNode("");
                    fieldset.appendChild(dummy);
                    Obout.Ajax.UI.HTMLEditor._setCursor(dummy, editor);
                }
                editor.get_editPanel().updateToolbar();
            }

            this._removeEvents(); // dispose event handlers
            if (this._edit) {
                this._edit_callback(true); // finish 'edit'
            } else {
                this._create_callback(true); // finish 'create'
            }
        },

        // override the base method (called on popup canceled)
        cancel: function(contentWindow) {
            this._removeEvents();
            if (this._edit) {
                this._edit_callback(false);
            } else {
                this._create_callback(false);
            }
        },

        // dispose event handlers
        _removeEvents: function() {
            var popup = this;
            var keyevent = (Obout.Ajax.UI.HTMLEditor.isIE || Obout.Ajax.UI.HTMLEditor.isSafari) ? "keydown" : "keypress";

            var widthField = this._widthField;
            if (widthField != null) {
                setTimeout(function() {
                    Obout.Ajax.UI.HTMLEditor._removeEvent(widthField, keyevent, popup._intable$delegate);
                }, 0);
            }

            var heightField = this._heightField;
            if (heightField != null) {
                setTimeout(function() {
                    Obout.Ajax.UI.HTMLEditor._removeEvent(heightField, keyevent, popup._intable$delegate);
                }, 0);
            }

            var widthUnitToggleHandler = this._widthUnitToggleHandler;
            if (widthUnitToggleHandler != null) {
                widthUnitToggleHandler.remove_toggleUnit(this._widthUnitToggle$delegate);
            }

            var heightUnitToggleHandler = this._heightUnitToggleHandler;
            if (heightUnitToggleHandler != null) {
                heightUnitToggleHandler.remove_toggleUnit(this._heightUnitToggle$delegate);
            }

            var paddingField = this._paddingField;
            if (paddingField != null) {
                setTimeout(function() {
                    Obout.Ajax.UI.HTMLEditor._removeEvent(paddingField, keyevent, popup._intable$delegate);
                }, 0);
            }

            var marginField = this._marginField;
            if (marginField != null) {
                setTimeout(function() {
                    Obout.Ajax.UI.HTMLEditor._removeEvent(marginField, keyevent, popup._intable$delegate);
                }, 0);
            }
        },

        // insert a new Fieldset
        _createFieldset: function() {
            var editor = this.get_designPanel();
            var doc = editor._doc;

            editor._saveContent();

            var place = editor._getSafePlace(); // safe place for inserting
            if (!place) {
                editor._undo(false);
                editor.__stack.pop();
                return false;
            }
            var parent = place.parentNode;

            var sel = editor._getSelection();
            var range = editor._createRange(sel);

            var _fieldset = doc.createElement("div");
            _fieldset.innerHTML = "<fieldset style='width:300px; height:50px;'><legend>title</legend>text</fieldset>";
            var fieldset = _fieldset.firstChild;
            this._fieldset = fieldset;
            parent.insertBefore(fieldset, place);
            parent.removeChild(place)
            return true;
        },

        // Edit existing Fieldset
        _editFieldset: function(fieldset) {
            var editor = this.get_designPanel();

            this._fieldset = fieldset;
            editor._saveContent();
        },

        // prepare the popup
        _preparePopup: function(contentWindow) {
        
            // set some private properties and initiate event handlers

            var keyevent = (Obout.Ajax.UI.HTMLEditor.isIE || Obout.Ajax.UI.HTMLEditor.isSafari) ? "keydown" : "keypress";
            var temp;

            var widthField = contentWindow.popupMediator.getField("width");
            if (widthField != null) {
                temp = parseInt(this._fieldset.style.width);
                this._widthUnit = this._fieldset.style.width.toString().indexOf("%") >= 0 ? "%" : "px";
                widthField.value = isNaN(temp) ? "" : temp;
                Obout.Ajax.UI.HTMLEditor._addEvent(widthField, keyevent, this._intable$delegate);
            }
            this._widthField = widthField;

            var heightField = contentWindow.popupMediator.getField("height");
            if (heightField != null) {
                temp = parseInt(this._fieldset.style.height);
                this._heightUnit = this._fieldset.style.height.toString().indexOf("%") >= 0 ? "%" : "px";
                heightField.value = isNaN(temp) ? "" : temp;
                Obout.Ajax.UI.HTMLEditor._addEvent(heightField, keyevent, this._intable$delegate);
            }
            this._heightField = heightField;

            var widthUnitToggleHandler = contentWindow.popupMediator.getHandler("widthUnitToggle");
            if (widthUnitToggleHandler != null) {
                widthUnitToggleHandler.add_toggleUnit(this._widthUnitToggle$delegate);
                widthUnitToggleHandler.set_unit(this._widthUnit);
            }
            this._widthUnitToggleHandler = widthUnitToggleHandler;

            var heightUnitToggleHandler = contentWindow.popupMediator.getHandler("heightUnitToggle");
            if (heightUnitToggleHandler != null) {
                heightUnitToggleHandler.add_toggleUnit(this._heightUnitToggle$delegate);
                heightUnitToggleHandler.set_unit(this._heightUnit);
            }
            this._heightUnitToggleHandler = heightUnitToggleHandler;

            var paddingField = contentWindow.popupMediator.getField("padding");
            if (paddingField != null) {
                temp = parseInt(this._fieldset.style.padding);
                paddingField.value = isNaN(temp) ? "" : temp;
                Obout.Ajax.UI.HTMLEditor._addEvent(paddingField, keyevent, this._intable$delegate);
            }
            this._paddingField = paddingField;

            var marginField = contentWindow.popupMediator.getField("margin");
            if (marginField != null) {
                temp = parseInt(this._fieldset.style.margin);
                marginField.value = isNaN(temp) ? "" : temp;
                Obout.Ajax.UI.HTMLEditor._addEvent(marginField, keyevent, this._intable$delegate);
            }
            this._marginField = marginField;
        },

        // The handler is called on the Width 'px/%' toggle
        _widthUnitToggle: function(sender, args) {
            this._widthUnit = args.get_unit();
            var popup = this;
            setTimeout(function() { popup._fieldsetElementChanged(); }, 0);
        },

        // The handler is called on the Height 'px/%' toggle
        _heightUnitToggle: function(sender, args) {
            this._heightUnit = args.get_unit();
            var popup = this;
            setTimeout(function() { popup._fieldsetElementChanged(); }, 0);
        },

        // check for numeric and edit character codes
        _intable: function(ev) {
            var element = (ev.srcElement) ? ev.srcElement : ev.target;

            var good = false;
            var code = ev.keyCode;

            if (!Obout.Ajax.UI.HTMLEditor.isIE && !Obout.Ajax.UI.HTMLEditor.isOpera && !Obout.Ajax.UI.HTMLEditor.isSafari) code = ev.charCode;

            if (((code >= 48) && (code <= 57)) || code == 0) good = true;
            if (Obout.Ajax.UI.HTMLEditor.isIE || Obout.Ajax.UI.HTMLEditor.isOpera || Obout.Ajax.UI.HTMLEditor.isSafari) {
                if (code == 8 || code == 46 || (code >= 35 && code <= 40)) good = true;
            }
            if (Obout.Ajax.UI.HTMLEditor.isIE) {
                if (code >= 96 && code <= 105) good = true;
            }

            if (Obout.Ajax.UI.HTMLEditor.isSafari) {
                if (code == 8 || code == 63234 || code == 63235 || code == 63272) good = true;
            }

            if (!good) {
                if (Obout.Ajax.UI.HTMLEditor.isIE) ev.returnValue = false;
                else ev.preventDefault();
            }

            if (good) {
                var popup = this;
                if ((this._widthField != null && this._widthField.id == element.id) ||
                (this._heightField != null && this._heightField.id == element.id) ||
                (this._paddingField != null && this._paddingField.id == element.id) ||
                (this._marginField != null && this._marginField.id == element.id)
            ) {
                    setTimeout(function() { popup._fieldsetElementChanged(); }, 0);
                }
            }

            return good;
        },

        // force the DOM element appearance change
        _fieldsetElementChanged: function() {
            var width = (this._widthField != null) ? this._widthField.value : null;
            var height = (this._heightField != null) ? this._heightField.value : null;
            var temp;
            if (width != null) {
                temp = this.getInt(this._widthField);
                if (this._widthUnit == "%" && temp > 100) {
                    this._widthField.value = width = 100;
                }
                this._fieldset.style.width = width + (width.toString().length > 0 ? this._widthUnit : "");
            }
            if (height != null) {
                temp = this.getInt(this._heightField);
                if (this._heightUnit == "%" && temp > 100) {
                    this._heightField.value = height = 100;
                }
                this._fieldset.style.height = height + (height.toString().length > 0 ? this._heightUnit : "");
            }
            if (this._paddingField != null) {
                this._fieldset.style.padding = this._paddingField.value + (this._paddingField.value.toString().length > 0 ? "px" : "");
            }
            if (this._marginField != null) {
                this._fieldset.style.margin = this._marginField.value + (this._marginField.value.toString().length > 0 ? "px" : "");
            }
        },

        // common metthod
        getInt: function(input) {
            var result = parseInt(input.value);
            if (isNaN(result)) {
                result = 0;
            }
            return result;
        },


        // on 'edit' finished
        _edit_callback: function(ok) {
            var editor = this.get_designPanel();
            try {
                if (!ok) {
                    editor._undo(false);
                } else {
                    editor.onContentChanged();
                    editor.focusEditor();
                }
            } catch (ex) { }
            return true;
        },

        // override the base method - validates the popup's fields - always returns 'true' here
        okCheck: function(contentWindow) {
            return true;
        },

        // on 'create' finished
        _create_callback: function(ok) {
            var editor = this.get_designPanel();
            try {
                if (ok) {
                    setTimeout(function() { editor.get_editPanel().updateToolbar(); editor.onContentChanged(); }, 0);
                } else {
                    editor._undo(false);
                    editor.__stack.pop();
                }
            } catch (e) { }
            return true;
        }
    }

    CustomPopup.FieldsetProperties.registerClass("CustomPopup.FieldsetProperties", Obout.Ajax.UI.HTMLEditor.Popups.OkCancelPopup);
</script>
</html>