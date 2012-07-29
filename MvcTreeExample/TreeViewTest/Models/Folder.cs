using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TreeViewTest.Models
{
    public class Folder
    {
        public Folder()
        {
            this.Subfolders = new List<Folder>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public IList<Folder> Subfolders { get; private set; }
        public bool IsLeaf
        {
            get
            {
                return this.Subfolders.Count == 0;
            }
        }
    }
}