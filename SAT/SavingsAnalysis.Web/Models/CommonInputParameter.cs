using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SavingsAnalysis.Web.Models
{
    public class CommonInputParameter
    {

        [Required(ErrorMessage = "File name is missing")]
        [Display(Name = "File name")]
        public string FileName { get; set; }

        [Required(ErrorMessage = "Company name is missing")]
        [Display(Name = "Company name")]
        public string CompanyName { get; set; }

        public CommonInputParameter()
        {
            CompanyName = "My Company";
        }
    }
}