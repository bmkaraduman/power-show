namespace TreeViewTest.Models
{
    public class City
    {
        #region Primitive Properties
        public int Id { get; set; }
        public string Name { get; set; }
        public long Population { get; set; }
        public int CountryId { get; set; }
        #endregion

        #region Navigation Properties
        public virtual Country Country { get; set; }
        #endregion
    }
}