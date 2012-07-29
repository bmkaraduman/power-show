using System.Linq;
using System.Web.Mvc;
using Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Models;

namespace Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Controllers
{
    public partial class DropDownjQueryAjaxPostController : Controller
    {
        private readonly IContinentRepository _continentRepository;
        private readonly ICountryRepository _countryRepository;
        private readonly ICityRepository _cityRepository;

        // If you are using Dependency Injection, you can delete the following constructor
        public DropDownjQueryAjaxPostController( )
            : this( new ContinentRepository( ) , new CountryRepository( ) , new CityRepository( ) ) { }

        public DropDownjQueryAjaxPostController(
            IContinentRepository continentRepository ,
            ICountryRepository countryRepository ,
            ICityRepository cityRepository )
        {
            this._continentRepository = continentRepository;
            this._countryRepository = countryRepository;
            this._cityRepository = cityRepository;
        }

        public virtual ViewResult Index( )
        {
            return View( );
        }


        public virtual ViewResult jQueryTemplates( )
        {
            return View( MVC.CascadingDropDownLists.DropDownjQueryAjaxPost.Views.jQueryTemplates );
        }

        public virtual ViewResult KnockOutJs( )
        {
            return View( MVC.CascadingDropDownLists.DropDownjQueryAjaxPost.Views.KnockoutJs );
        }

        public virtual ViewResult CascadePlugin( )
        {
            return View( MVC.CascadingDropDownLists.DropDownjQueryAjaxPost.Views.CascadePlugin );
        }

        [HttpGet]
        public virtual ActionResult GetContinents( )
        {
            var continents = 
                (
                    from continent in this._continentRepository.All
                    select new
                    {
                        Id = continent.Id ,
                        Name = continent.Name
                    }
                ).ToList( );

            return Json( continents , JsonRequestBehavior.AllowGet );
        }

        [HttpGet]
        public virtual ActionResult GetCountries( int continentId )
        {
            var countries = 
                (
                    from country in this._countryRepository.All
                    where country.ContinentId == continentId
                    select new
                    {
                        Id = country.Id ,
                        Name = country.Name ,
                        Population = country.Population ,
                        ContinentId = country.ContinentId
                    }
                ).ToList( );

            return Json( countries , JsonRequestBehavior.AllowGet );
        }

        [HttpGet]
        public virtual ActionResult GetCities( int countryId )
        {
            var cities =
                (
                    from city in this._cityRepository.All
                    where city.CountryId == countryId
                    select new
                    {
                        Id = city.Id ,
                        Name = city.Name ,
                        Population = city.Population ,
                        CountryId = city.CountryId
                    }
                ).ToList( );


            return Json( cities , JsonRequestBehavior.AllowGet );
        }
    }
}
