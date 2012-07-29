namespace SavingsAnalysis.Web.Core.OpenXml
{
    using System.Drawing;
    using System.IO;
    using System.Linq;
    using DocumentFormat.OpenXml.Drawing;
    using DocumentFormat.OpenXml.Drawing.Wordprocessing;
    using DocumentFormat.OpenXml.Packaging;
    using DocumentFormat.OpenXml.Wordprocessing;

    internal class WordImageUpdateMananger
    {
        /// <summary>
        /// Contains the word processing document
        /// </summary>
        private WordprocessingDocument wordProcessingDocument;

        /// <summary>
        /// Contains the main document part
        /// </summary>
        private MainDocumentPart mainDocPart;

        /// <summary>
        /// Open an Word XML document 
        /// </summary>
        /// <param name="docname">name of the document to be opened</param>
        public void OpenTheDocuemnt(string docname)
        {
            // open the word docx
            wordProcessingDocument = WordprocessingDocument.Open(docname, true);

            // get the Main Document part
            mainDocPart = wordProcessingDocument.MainDocumentPart;
        }

        /// <summary>
        /// Updates the image in an image placeholder
        /// </summary>
        /// <param name="placeholderName">Image placeholder tag name</param>
        /// <param name="newImage">physical path to the new image file</param>
        public void UpdateImage(string placeholderName, string newImage)
        {
            // Get the id of the image placeholder
            string relId = GetImageRelID(placeholderName);

            // Get the Imagepart
            ImagePart imagePart = (ImagePart)mainDocPart.GetPartById(relId);

            // Read the new image file
            byte[] imageBytes = File.ReadAllBytes(newImage);

            // Create a writer to the imagepart
            BinaryWriter writer = new BinaryWriter(imagePart.GetStream());

            // Overwrite the current image in the docx file package
            writer.Write(imageBytes);

            // Close the imagepart
            writer.Close();
        }

        /// <summary>
        /// Resize the image in an image placeholder
        /// </summary>
        /// <param name="placeholderName">Image placeholder tag name</param>
        /// <param name="newImage">physical path to the new image file</param>
        public void ResizeImage(string placeholderName, string newImage)
        {
            // Get the id of the image placeholder
            string relID = GetImageRelID(placeholderName);

            // Load the new image into a bitmap object
            Bitmap bitmap = new Bitmap(newImage);
            Image img = bitmap;

            // Loop through all Drawing elements in the document
            foreach (Drawing d in this.mainDocPart.Document.Descendants<Drawing>().ToList())
            {
                // Loop through all the pictures (Blip) in the document
                foreach (Blip b in d.Descendants<Blip>().ToList())
                {
                    // Have we found the correct pciture?
                    if (b.Embed.ToString() == relID)
                    {
                        // Yes we have

                        // The size of the image placeholder is located in the EXTENT element
                        Extent e = d.Descendants<Extent>().FirstOrDefault();

                        // The document expects the size in EMU. 1 pixel = 9525 EMU
                        long imageWidthEMU = (long)(img.Width * 9525);
                        long imageHeightEMU = (long)(img.Height * 9525);

                        // change the size of the image placeholder
                        e.Cx = imageWidthEMU;
                        e.Cy = imageHeightEMU;

                        // The size of the image is located in the EXTENTS element
                        Extents e2 = d.Descendants<Extents>().FirstOrDefault();

                        // change the size of the image itself
                        e2.Cx = imageWidthEMU;
                        e2.Cy = imageHeightEMU;

                        // save the changes
                        mainDocPart.Document.Save();
                    }
                }
            }
        }

        /// <summary>
        /// Close the document
        /// </summary>
        public void CloseTheDocument()
        {
            wordProcessingDocument.Close();
        }

        /// <summary>
        /// Gets the id of the image
        /// </summary>
        /// <param name="imageTag">Name of the image tag</param>
        /// <returns>the image id</returns>
        private string GetImageRelID(string imageTag)
        {
            // loop through all sdtblock in the document
            foreach (SdtBlock s in mainDocPart.Document.Descendants<SdtBlock>().ToList())
            {
                // loop through all tags in the document within the sdtblocks
                foreach (Tag t in s.Descendants<Tag>().ToList())
                {
                    // Do we have the correct tag?
                    if (t.Val.ToString().ToUpper() == imageTag.ToUpper())
                    {
                        // Found the correct tag

                        // Get the BLIP for the image - there is only one image per placeholder so no need to loop through anything
                        Blip b = s.Descendants<Blip>().FirstOrDefault();

                        // return the image id tag
                        return b.Embed;
                    }
                }
            }

            // Nothing found so return an empty string
            return string.Empty;
        }
    }
}
