using System;
using System.ComponentModel.DataAnnotations;
using Dapper.Contrib.Extensions;

    namespace GymConferaturAPI.Models
    {
    public class Gym
    {
        [Required]
        public int Gym_ID {get; set;}

        [Required]
        public int Gym_Number {get; set;}

        [Required]
        public int Owner_ID {get; set;}

        [Required]
        [StringLength(50, MinimumLength=3)]
        public String Gym_Name {get; set;}

        [Required]
        [StringLength(50, MinimumLength=3)]
        public String Gym_Address {get; set;}

        [Required]
        [StringLength(30, MinimumLength=3)]
        public String Gym_City {get; set;}

        [Required]
        [StringLength(30, MinimumLength=3)]
        public String Gym_State {get; set;}

        [Required]
        [StringLength(50, MinimumLength=3)]
        public String Gym_Country {get; set;}

        [Required]
        [StringLength(15, MinimumLength=3)]
        public String Gym_Zipcode {get; set;}

        public DateTime? Created_Date {get; set;}
        public DateTime Updated_Date {get; set;}
    }
    }
