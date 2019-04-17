using System;
using System.ComponentModel.DataAnnotations;

namespace GymConferaturAPI.Models
{
    public class Owner
    {
        [Required]
        public int Owner_ID {get; set;}

        [Required]
        public int Owner_Number {get; set;}

         [Required]
        public string Owner_Password_Hash {get; set;}

         [Required]
        public string Owner_Password_Salt {get; set;}

        [Required]
        [StringLength(50, MinimumLength=3)]
        public String Owner_Name {get; set;}

        [Required]
        [StringLength(50, MinimumLength=3)]
        public String Owner_Address {get; set;}

        [Required]
        [StringLength(30, MinimumLength=3)]
        public String Owner_City {get; set;}

        [Required]
        [StringLength(30, MinimumLength=3)]
        public String Owner_State {get; set;}

        [Required]
        [StringLength(50, MinimumLength=3)]
        public String Owner_Country {get; set;}

        [Required]
        [StringLength(15, MinimumLength=3)]
        public String Owner_Zipcode {get; set;}

        public DateTime? Created_Date {get; set;}
        public DateTime Updated_Date {get; set;}
    }
}
