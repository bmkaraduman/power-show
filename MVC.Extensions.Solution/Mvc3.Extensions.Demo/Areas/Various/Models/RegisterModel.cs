using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace Mvc3.Extensions.Demo.Areas.Various.Models
{
public class RegisterModel
{
    [Required( ErrorMessage = "You must specify a username." )]
    [Display(
        Name = "User name" ,
        Description = "Choose something unique so others will know which contributions are yours."
    )]
    public string UserName { get; set; }

    [Required( ErrorMessage = "You must specify an email address." )]
    [DataType( DataType.EmailAddress )]
    [Display(
        Name = "Email address" ,
        Description = "Your email will not be public. It is required to verify your registration and for " +
                        "password retrieval, important notifications, etc."
    )]
    public string Email { get; set; }

    [Required( ErrorMessage = "You must specify a password." )]
    [StringLength( 64 ,
        ErrorMessage = "You must specify a password of {2} or more characters." ,
        MinimumLength = 7 )]
    [DataType( DataType.Password )]
    [Display( Name = "Password" , Description = "Passwords must be at least 7 characters long." )]
    public string Password { get; set; }

    [DataType( DataType.Password )]
    [Display(
        Name = "Confirm password" ,
        Description = "Please reenter your password and ensure that it matches the one above."
    )]
    [Compare( "Password" , ErrorMessage = "The Password and Confirmation Password must match" )]
    public string ConfirmPassword { get; set; }
}
}