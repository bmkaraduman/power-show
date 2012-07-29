using System.Collections.Generic;
using System.Web.Mvc;
using Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Models;
using Mvc3.Extensions.Demo.Areas.Various.Models;

namespace Mvc3.Extensions.Demo.Areas.Various.Controllers
{
    public partial class TreeViewController : Controller
    {
        private readonly IContinentRepository _continentRepository;
        private readonly ICityRepository _cityRepository;

        // If you are using Dependency Injection, you can delete the following constructor
        public TreeViewController( ) : this( new ContinentRepository( ) , new CityRepository( ) ) { }

        public TreeViewController( IContinentRepository continentRepository , ICityRepository cityRepository )
        {
            this._continentRepository = continentRepository;
            this._cityRepository = cityRepository;
        }

        [HttpGet]
        public virtual ActionResult Index( )
        {
            return View( this.Atlas( ) );
        }

        [HttpGet]
        public virtual ActionResult GetCity( int cityId )
        {
            var city = this._cityRepository.Find( cityId );

            return Json(
                new { Name = city.Name , Population = city.Population } ,
                JsonRequestBehavior.AllowGet );
        }

        private IList<Folder> Atlas( )
        {
            IList<Folder> continents = new List<Folder>( );

            foreach ( var continent in this._continentRepository.All )
            {
                var continentFolder = new Folder
                {
                    Id = continent.Id ,
                    Name = continent.Name ,
                    Type = "continent"
                };

                foreach ( var country in continent.Countries )
                {
                    var countryFolder = new Folder
                    {
                        Id = country.Id ,
                        Name = country.Name ,
                        Type = "country"
                    };

                    foreach ( var city in country.Cities )
                    {
                        var cityFolder = new Folder
                        {
                            Id = city.Id ,
                            Name = city.Name ,
                            Type = "city"
                        };

                        countryFolder.Subfolders.Add( cityFolder );
                    }

                    continentFolder.Subfolders.Add( countryFolder );
                }

                continents.Add( continentFolder );
            }

            return continents;
        }
    }
}

