using System.Data.Entity;
using System.Data.Objects.DataClasses;
using System.Linq;

namespace Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Models
{
    public class AtlasContext : DbContext
    {
        public DbSet<Continent> Continents { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<City> Cities { get; set; }
    }

    public static class EntityFrameworkExtensions
    {
        public static void DeleteAll<TEntity>(
            this DbContext context ,
            EntityCollection<TEntity> collection )
            where TEntity : class, IEntityWithRelationships
        {
            if ( !collection.IsLoaded )
                collection.Load( );

            while ( collection.Any( ) )
            {
                var entity = collection.First( );
                context.Set<TEntity>( ).Remove( entity );
            }
        }
    }

}