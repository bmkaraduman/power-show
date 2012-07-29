using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TreeViewTest.Models
{
    public class Continent
    {
        #region Primitive Properties
        public int Id { get; set; }
        public string Name { get; set; }
        #endregion

        #region Navigation Properties
        public virtual ICollection<Country> Countries { get; set; }
        #endregion
    }
}