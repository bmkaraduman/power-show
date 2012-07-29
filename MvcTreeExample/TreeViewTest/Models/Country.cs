using System.Collections.Generic;

namespace TreeViewTest.Models
{
    public class Country
    {
        #region Primitive Properties
        public int Id { get; set; }
        public string Name { get; set; }
        public long Population { get; set; }
        public int ContinentId { get; set; }
        #endregion

        #region Navigation Properties
        public virtual Continent Continent { get; set; }
        public virtual ICollection<City> Cities { get; set; }
        #endregion
    }
}