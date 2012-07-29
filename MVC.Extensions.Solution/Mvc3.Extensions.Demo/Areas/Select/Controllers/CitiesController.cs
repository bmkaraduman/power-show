using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Models;

namespace Mvc3.Extensions.Demo.Areas.Select.Controllers
{
    public partial class CitiesController : Controller
    {
        private IList<Continent> _continents;
        private IList<Country> _countries;

        public CitiesController( )
        {
            this._continents = new List<Continent>
            {
                new Continent{Id = 1, Name = "Africa"},
                new Continent{Id = 2, Name = "Europe"}
                
            };

            this._countries = new List<Country>
            {
                new Country{Id = 1, Name = "Algeria", ContinentId= 1},
                new Country{Id = 2, Name = "Egipt", ContinentId= 1},
                new Country{Id = 3, Name = "France", ContinentId= 2},
                new Country{Id = 4, Name = "Romania", ContinentId= 2}
            };
        }

        //ViewBag.ContinentsList = new SelectList( this._continents, "Id", "Name" );

        [HttpGet]
        public virtual ActionResult Create( )
        {
            IDictionary<string , IEnumerable<SelectListItem>> countriesByContinent = new Dictionary<string , IEnumerable<SelectListItem>>( );

            foreach ( var continent in this._continents )
            {
                var countryList = new List<SelectListItem>( );

                foreach ( var country in this._countries.Where( c => c.ContinentId == continent.Id ) )
                {
                    countryList.Add( new SelectListItem { Value = country.Id.ToString( ) , Text = country.Name } );
                }

                countriesByContinent.Add( continent.Name , countryList );
            }

            ViewBag.CountriesList = countriesByContinent;

            return View( MVC.Select.Cities.Views.Create );
        }

        [HttpPost]
        public virtual ActionResult Create( City newCity )
        {
            TempData[ "info" ] = string.Format(
                    "There's no database behind this page but I've received from you: {0} and {1}" ,
                    newCity.Name ,
                    this._countries.Where( c => c.Id == newCity.CountryId ).SingleOrDefault( ).Name
                );

            IDictionary<string , IEnumerable<SelectListItem>> countriesByContinent = new Dictionary<string , IEnumerable<SelectListItem>>( );

            foreach ( var continent in this._continents )
            {
                var countryList = new List<SelectListItem>( );

                foreach ( var country in this._countries.Where( c => c.ContinentId == continent.Id ) )
                {
                    countryList.Add( new SelectListItem { Value = country.Id.ToString( ) , Text = country.Name } );
                }

                countriesByContinent.Add( continent.Name , countryList );
            }

            ViewBag.CountriesList = countriesByContinent;

            return View( MVC.Select.Cities.Views.Create );
        }
    }
}
