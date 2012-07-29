public class cs_sendcollection : OboutInc.oboutAJAXPage
{
	public void SendCollection(string myCollectionParam) {
		
		string[] myCollection = myCollectionParam.Split(new char[]{'|'});
		
		string myCollectionString = string.Empty;
		for (int i=0;i<myCollection.Length;i++)
		{
			myCollectionString += myCollectionString == string.Empty ? myCollection[i] : ", " + myCollection[i];
		}
		
		ShowAlert("The collection items are: " + myCollectionString);
	}
}