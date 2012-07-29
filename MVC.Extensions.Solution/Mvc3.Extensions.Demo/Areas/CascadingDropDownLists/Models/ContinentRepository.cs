using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace Mvc3.Extensions.Demo.Areas.CascadingDropDownLists.Models
{ 
    public class ContinentRepository : IContinentRepository
    {
        AtlasContext context = new AtlasContext();

        public IQueryable<Continent> All
        {
            get { return context.Continents; }
        }

        public IQueryable<Continent> AllIncluding(params Expression<Func<Continent, object>>[] includeProperties)
        {
            IQueryable<Continent> query = context.Continents;
            foreach (var includeProperty in includeProperties) {
                query = query.Include(includeProperty);
            }
            return query;
        }

        public Continent Find(int id)
        {
            return context.Continents.Find(id);
        }

        public void InsertOrUpdate(Continent continent)
        {
            if (continent.Id == default(int)) {
                // New entity
                context.Continents.Add(continent);
            } else {
                // Existing entity
                context.Entry(continent).State = EntityState.Modified;
            }
        }

        public void Delete(int id)
        {
            var continent = context.Continents.Find(id);
            context.Continents.Remove(continent);
        }

        public void Save()
        {
            context.SaveChanges();
        }
    }

    public interface IContinentRepository
    {
        IQueryable<Continent> All { get; }
        IQueryable<Continent> AllIncluding(params Expression<Func<Continent, object>>[] includeProperties);
        Continent Find(int id);
        void InsertOrUpdate(Continent continent);
        void Delete(int id);
        void Save();
    }
}