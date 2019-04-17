using System;
using System.ComponentModel.DataAnnotations;

namespace GymConferaturAPI.Models
{
    public class Features
    {
        [Required]
        public int Feature_ID { get; set; }

        [Required]
        public int Gym_ID { get; set; }

        [Required]
        public Decimal Price { get; set; }

        [Required]
        public int Locations { get; set; }

        [Required]
        public String Personal_Training { get; set; }

        public Double Member_Count { get; set; }

        public Boolean Merchandise { get; set; }

        public Boolean Parking { get; set; }

        public String Amenities { get; set; }

        public Boolean Recreation { get; set; }

        public Boolean Pool { get; set; }

        public Boolean Spin_Studio { get; set; }
        public Boolean Cardio_Room { get; set; }

        public Boolean Working_Hours { get; set; }
        public Boolean Weekend_Meetup { get; set; }
        public Boolean Created_Date { get; set; }
        public Boolean Updated_Date { get; set; }


    }
}
