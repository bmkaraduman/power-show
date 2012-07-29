using System.Linq;
using System.Web.Mvc;
using Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Models;

namespace Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Controllers
{
    public partial class DropDownAjaxPostController : Controller
    {
        private readonly IContinentRepository _continentRepository;

        // If you are using Dependency Injection, you can delete the following constructor
        public DropDownAjaxPostController( ) : this( new ContinentRepository( ) ) { }

        public DropDownAjaxPostController( IContinentRepository continentRepository )
        {
            this._continentRepository = continentRepository;
        }

        public virtual ActionResult Index( )
        {
            Atlas atlas = new Atlas( );
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

            if ( Request.IsAjaxRequest( ) )
            {
                return PartialView( MVC.CascadingDropDownLists.DropDownAjaxPost.Views._Countries , atlas );
            }
            else
            {
                return View( MVC.CascadingDropDownLists.DropDownAjaxPost.Views.Index , atlas );
            }
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

            if ( Request.IsAjaxRequest( ) )
            {
                return PartialView( MVC.CascadingDropDownLists.DropDownAjaxPost.Views._Cities , atlas );
            }
            else
            {
                return View( MVC.CascadingDropDownLists.DropDownAjaxPost.Views.Index , atlas );
            }
        }
    }
}

