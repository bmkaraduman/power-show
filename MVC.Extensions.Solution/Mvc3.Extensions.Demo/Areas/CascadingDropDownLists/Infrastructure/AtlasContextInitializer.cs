using System.Collections.ObjectModel;
using System.Data.Entity;
using Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Models;

namespace Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Infrastructure
{
    public class AtlasContextInitializer : DropCreateDatabaseIfModelChanges<AtlasContext>
    {
        protected override void Seed( AtlasContext context )
        {
            //Add continents
            var asia = new Continent { Name = "Asia" };
            var africa = new Continent { Name = "Africa" };
            var northAmerica = new Continent { Name = "North America" };
            var southAmerica = new Continent { Name = "South America" };
            var antarctica = new Continent { Name = "Antarctica" };
            var europe = new Continent { Name = "Europe" };
            var oceania = new Continent { Name = "Oceania" };

            //Add countries
            //Asia
            asia.Countries = new Collection<Country>
    {
        new Country{Name = "People's Republic of China", Population = 1357022986},
        new Country{Name = "India", Population =  1131043000},
        new Country{Name = "Indonesia", Population =  231627000},
        new Country{Name = "Pakistan", Population =  161998000},
        new Country{Name = "Bangladesh", Population =  158665000}
    };

            //Africa
            africa.Countries = new Collection<Country>
    {
        new Country{Name = "Nigeria", Population = 154729000},
        new Country{Name = "Ethiopia", Population =  85237338 },
        new Country{Name = "Egypt", Population =  80335036},
        new Country{Name = "Democratic Republic of the Congo", Population =  63655000},
        new Country{Name = "South Africa", Population =  47432000}
    };

            //North America
            northAmerica.Countries = new Collection<Country>
    {
        new Country{Name = "United States", Population = 314659000},
        new Country{Name = "Mexico", Population = 112322757},
        new Country{Name = "Canada", Population = 33573000},
        new Country{Name = "Guatemala", Population = 14027000},
        new Country{Name = "Cuba", Population = 11204000}
    };

            //South America
            southAmerica.Countries = new Collection<Country>
    {
        new Country{Name = "Brazil", Population = 191241714},
        new Country{Name = "Colombia", Population = 45928970},
        new Country{Name = "Argentina", Population = 40482000},
        new Country{Name = "Peru", Population = 29132013},
        new Country{Name = "Venezuela", Population = 26814843}
    };

            //Europe
            europe.Countries = new Collection<Country>
    {
        new Country{Name = "Russia", Population = 142200000}, 
        new Country{Name = "Germany", Population = 83251851},
        new Country{Name = "Turkey", Population =  71517100},
        new Country{Name = "United Kingdom", Population =  61100835},
        new Country{Name = "France", Population = 59765983},
        new Country{Name = "Italy", Population =  58751711},
        new Country{Name = "Ukraine", Population = 48396470},
        new Country{Name = "Spain", Population = 45061274},
        new Country{Name = "Poland", Population = 38625478}
    };

            var romania = new Country { Name = "Romania" , Population = 21698181 };
            europe.Countries.Add( romania );

            //Oceania
            oceania.Countries = new Collection<Country>
    {
        new Country{Name = "Australia", Population = 22028000},
        new Country{Name = "Papua New Guinea", Population = 5712033},
        new Country{Name = "New Zealand", Population = 4108037},
        new Country{Name = "Fiji", Population = 856346},
        new Country{Name = "Samoa", Population = 179000}
    };

            //Add cities
            romania.Cities = new Collection<City>
    {
        new City {Name = "Bucharest", Population = 1926334},
        new City {Name = "Iaşi", Population = 320888},
        new City {Name = "Cluj-Napoca", Population = 317953},
        new City {Name = "Timişoara", Population = 317660},
        new City {Name = "Constanţa", Population = 310471},
        new City {Name = "Craiova", Population = 302601},
        new City {Name = "Galaţi", Population = 298861},
        new City {Name = "Braşov", Population = 284596}, 
        new City {Name = "Ploieşti", Population = 232527}, 
        new City {Name = "Brăila", Population = 216292}
    };

            //Add to context
            context.Continents.Add( asia );
            context.Continents.Add( africa );
            context.Continents.Add( northAmerica );
            context.Continents.Add( southAmerica );
            context.Continents.Add( antarctica );
            context.Continents.Add( europe );
            context.Continents.Add( oceania );

            context.SaveChanges( );
        }
    }
}