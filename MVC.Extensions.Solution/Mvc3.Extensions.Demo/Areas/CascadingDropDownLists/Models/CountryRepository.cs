using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Models
{ 
    public class CountryRepository : ICountryRepository
    {
        AtlasContext context = new AtlasContext();

        public IQueryable<Country> All
        {
            get { return context.Countries; }
        }

        public IQueryable<Country> AllIncluding(params Expression<Func<Country, object>>[] includeProperties)
        {
            IQueryable<Country> query = context.Countries;
            foreach (var includeProperty in includeProperties) {
                query = query.Include(includeProperty);
            }
            return query;
        }

        public Country Find(int id)
        {
            return context.Countries.Find(id);
        }

        public void InsertOrUpdate(Country country)
        {
            if (country.Id == default(int)) {
                // New entity
                context.Countries.Add(country);
            } else {
                // Existing entity
                context.Entry(country).State = EntityState.Modified;
            }
        }

        public void Delete(int id)
        {
            var country = context.Countries.Find(id);
            context.Countries.Remove(country);
        }

        public void Save()
        {
            context.SaveChanges();
        }
    }

    public interface ICountryRepository
    {
        IQueryable<Country> All { get; }
        IQueryable<Country> AllIncluding(params Expression<Func<Country, object>>[] includeProperties);
        Country Find(int id);
        void InsertOrUpdate(Country country);
        void Delete(int id);
        void Save();
    }
}