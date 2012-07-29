using System.Collections.Generic;

namespace TreeViewTest.Models
{
    public class Atlas
    {
        public int? SelectedContinentId { get; set; }
        public int? SelectedCountryId { get; set; }

        public IEnumerable<Continent> Continents { get; set; }
        public IEnumerable<Country> Countries { get; set; }
        public IEnumerable<City> Cities { get; set; }
    }
}