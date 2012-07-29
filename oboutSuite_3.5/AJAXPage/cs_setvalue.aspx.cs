public class cs_setvalue : OboutInc.oboutAJAXPage
{
	public void ServerSetValueText() {
		// this will set the value of element with id "textElement" to a custom value
		// just to show that it works with input elements (textboxes)
		SetValue("textElement", "someCustomValue");
	}
	
	public void ServerSetValueSelect() {
		// this will set the value of element with id "selectElement" to a custom value
		// just to show that it works with dropdown elements (comboboxes)
		SetValue("selectElement", "3");
	}
	
	public void ServerSetValueTextarea() {
		// this will set the value of element with id "textareaElement" to a custom value
		// just to show that it works with textareas
		SetValue("textareaElement", "some custom text");
	}
}