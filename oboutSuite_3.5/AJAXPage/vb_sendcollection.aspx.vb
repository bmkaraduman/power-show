public class vb_sendcollection 
	inherits OboutInc.oboutAJAXPage

	public sub SendCollection(byval myCollectionParam as string) 
		
		dim myCollection() as string = myCollectionParam.Split("|")
		
		dim myCollectionString as string = string.Empty
		dim i as Int32
		for i = 0 to myCollection.Length - 1 Step 1
			myCollectionString = myCollectionString + IIf(myCollectionString = string.Empty, myCollection(i), ", " + myCollection(i))
		next 
		
		ShowAlert("The collection items are: " + myCollectionString)
	end sub
end class