namespace SavingsAnalysis.Web.Core
{
    using System;

    // TODO: Is this class necessary? Can't we just use System.IO.FileInfo instances?
    public class FileManager : IComparable<FileManager>
    {
        public string FileName { get; set; }

        public DateTimeOffset FileCreatedDate { get; set; }

        public int CompareTo(FileManager other)
        {
            return other.FileCreatedDate.CompareTo(this.FileCreatedDate);
        }

        public int CompareTo(FileManager compareFrom, FileManager compateTo)
        {
            return compareFrom.FileCreatedDate.CompareTo(compateTo.FileCreatedDate);
        }
    }
}