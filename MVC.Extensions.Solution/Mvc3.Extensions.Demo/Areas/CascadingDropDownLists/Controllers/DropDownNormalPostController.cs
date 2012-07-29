using System.Linq;
using System.Web.Mvc;
using Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Models;

namespace Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Controllers
{
    public partial class DropDownNormalPostController : Controller
    {
        private readonly IContinentRepository _continentRepository;

        // If you are using Dependency Injection, you can delete the following constructor
        public DropDownNormalPostController( ) : this( new ContinentRepository( ) ) { }

        public DropDownNormalPostController( IContinentRepository continentRepository )
        {
            this._continentRepository = continentRepository;
        }

        public virtual ViewResult Index( )
        {
            var atlas = new Atlas( );
            atlas.Continents = this._continentRepository.All;

            return View( atlas );
        }

        [HttpPost]
        public virtual ActionResult SelectContinent( int? selectedContinentId )
        {
            var countries = selectedContinentId.HasValue
                ? this._continentRepository.Find( selectedContinentId.Value ).Countries
                : null;

            Atlas atlas = new Atlas
            {
                SelectedContinentId = selectedContinentId ,
                Continents = this._continentRepository.All ,
                Countries = countries
            };

            return View( MVC.CascadingDropDownLists.DropDownNormalPost.Views.Index , atlas );
        }

        [HttpPost]
        public virtual ActionResult SelectCountry( int? selectedContinentId , int? selectedCountryId )
        {
            var selectedContinent = selectedContinentId.HasValue
                ? this._continentRepository.Find( selectedContinentId.Value )
                : null;

            var countries = ( selectedContinent != null )
                ? selectedContinent.Countries
                : null;

            var cities = ( countries != null && selectedCountryId.HasValue )
                ? countries.Where( c => c.Id == selectedCountryId.Value ).SingleOrDefault( ).Cities
                : null;

            Atlas atlas = new Atlas
            {
                SelectedContinentId = selectedContinentId ,
                SelectedCountryId = selectedCountryId ,
                Continents = this._continentRepository.All ,
                Countries = countries ,
                Cities = cities
            };

            return View( MVC.CascadingDropDownLists.DropDownNormalPost.Views.Index , atlas );
        }
    }
}

