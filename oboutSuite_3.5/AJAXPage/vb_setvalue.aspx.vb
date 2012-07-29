public class vb_setvalue 
	Inherits OboutInc.oboutAJAXPage

	public sub ServerSetValueText() 
		' this will set the value of element with id "textElement" to a custom value
		' just to show that it works with input elements (textboxes)
		SetValue("textElement", "someCustomValue")
	end sub
	
	public sub ServerSetValueSelect() 
		' this will set the value of element with id "selectElement" to a custom value
		' just to show that it works with dropdown elements (comboboxes)
		SetValue("selectElement", "3")
	end sub
	
	public sub ServerSetValueTextarea() 
		' this will set the value of element with id "textareaElement" to a custom value
		' just to show that it works with textareas
		SetValue("textareaElement", "some custom text")
	end sub
end class