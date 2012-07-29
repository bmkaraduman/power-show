using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Mvc2.Extensions.Demo.Areas.Select.Models;

namespace Mvc2.Extensions.Demo.Areas.Select.Controllers
{
    public class CitiesController : Controller
    {
        private IList<Continent> _continents;
        private IList<Country> _countries;

        public CitiesController( )
        {
            this._continents = new List<Continent>
            {
                new Continent{ContinentId = 1, Name = "Africa"},
                new Continent{ContinentId = 2, Name = "Europe"}
                
            };

            this._countries = new List<Country>
            {
                new Country{CountryId = 1, Name = "Algeria", ContinentId= 1},
                new Country{CountryId = 2, Name = "Egipt", ContinentId= 1},
                new Country{CountryId = 3, Name = "France", ContinentId= 2},
                new Country{CountryId = 4, Name = "Romania", ContinentId= 2}
            };
        }

        //ViewBag.ContinentsList = new SelectList( this._continents, "Id", "Name" );

        [HttpGet]
        public ActionResult Create( )
        {
            IDictionary<string , IEnumerable<SelectListItem>> countriesByContinent = new Dictionary<string, IEnumerable<SelectListItem>>( );

            foreach ( var continent in this._continents )
            {
                var countryList = new List<SelectListItem>( );

                foreach ( var country in this._countries.Where( c => c.ContinentId == continent.ContinentId ) )
                {
                    countryList.Add( new SelectListItem { Value = country.CountryId.ToString( ), Text = country.Name } );
                }

                countriesByContinent.Add( continent.Name, countryList );
            }

            ViewData[ "countriesList" ] = countriesByContinent;

            return View( );
        }

        [HttpPost]
        public ActionResult Create( City newCity )
        {
            TempData[ "info" ] = string.Format(
                    "There's no database behind this page but I've received from you: {0} and {1}",
                    newCity.Name,
                    this._countries.Where( c => c.CountryId == newCity.CountryId ).SingleOrDefault( ).Name
                );

            IDictionary<string , IEnumerable<SelectListItem>> countriesByContinent = new Dictionary<string, IEnumerable<SelectListItem>>( );

            foreach ( var continent in this._continents )
            {
                var countryList = new List<SelectListItem>( );

                foreach ( var country in this._countries.Where( c => c.ContinentId == continent.ContinentId ) )
                {
                    countryList.Add( new SelectListItem { Value = country.CountryId.ToString( ), Text = country.Name } );
                }

                countriesByContinent.Add( continent.Name, countryList );
            }

            ViewData[ "countriesList" ] = countriesByContinent;

            return View( );
        }

        [HttpGet]
        public ActionResult GetCountries( [Bind( Prefix = "Id" )]int continentId )
        {
            return Json( this._countries.Where( c => c.ContinentId == continentId ), JsonRequestBehavior.AllowGet );
        }
    }
}
