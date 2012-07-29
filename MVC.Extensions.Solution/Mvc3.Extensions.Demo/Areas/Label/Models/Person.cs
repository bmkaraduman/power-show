using System.ComponentModel.DataAnnotations;

namespace Mvc3.Extensions.Demo.Areas.Label.Models
{
    public class Person
    {
        public string Prefix { get; set; }
        [Required( ErrorMessage = "The first name is required" )]
        public string FirstName { get; set; }
        [Required( ErrorMessage = "The middle name is required" )]
        public string MiddleName { get; set; }
        [Required( ErrorMessage = "The last name is required" )]
        public string LastName { get; set; }
        public string PrefferedName { get; set; }
        public string Suffix { get; set; }
        public bool Sex { get; set; }
    }

    public class PersonViewModel : Person
    {
        [Required( ErrorMessage = "The first name is required" )]
        public string SomeOtherInfo { get; set; }
    }
}
