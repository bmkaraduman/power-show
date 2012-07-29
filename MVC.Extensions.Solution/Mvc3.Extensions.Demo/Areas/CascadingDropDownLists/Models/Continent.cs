using System.Collections.Generic;

namespace Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Models
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