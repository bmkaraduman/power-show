namespace SavingsAnalysis.Web.ViewModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Web.Mvc;

    public class NightWatchmanAnalysisResultsViewModel : NightWatchmanInputParameterViewModel
    {
        public NightWatchmanAnalysisResultsViewModel()
        {
            // Creating dummy data for now
            this.NWStartDate = new DateTime(2012, 05, 01);
            this.PassengerCars = 1234567;
            this.Period = 30;
            this.PotentialYearlyCO2Savings = 123456;
            this.PotentialYearlyKwhSavings = 234567;
            this.PowerStateOff = 345678;
            this.PowerStateOn = 456789;
            this.ShowCars = 7;
            this.ShowNuclear = 4;
            this.ShowStars = 3;
            this.ShowTrees = "4.5";
            this.ShowZ = 5;
            this.YearlyCostSavings = 345678;
        }

        [Display(Name = "Number Of Desktops")]
        public int NumberOfDesktops { get; set; }

        [Display(Name = "Number Of Laptops")]
        public int NumberOfLaptops { get; set; }

        [Display(Name = "Number Of Machines ON on Weekdays")]
        public int NumberOfMachineOnWeekDays { get; set; }

        [Display(Name = "Number Of Machines ON on Weekends")]
        public int NumberOfMachineOnWeekEnds { get; set; }

        [Display(Name = "Period")]
        public int Period { get; set; }

        [Display(Name = "Passenger Cars")]
        public int PassengerCars { get; set; }

        [Display(Name = "Potential Yearly CO2 Savings")]
        public int PotentialYearlyCO2Savings { get; set; }

        [Display(Name = "Potential Yearly Kwh Savings")]
        public int PotentialYearlyKwhSavings { get; set; }

        [Display(Name = "Power State Off")]
        public int PowerStateOff { get; set; }

        [Display(Name = "Power State On")]
        public int PowerStateOn { get; set; }

        [Display(Name = "Show Cars")]
        public int ShowCars { get; set; }

        [Display(Name = "Show Nuclear")]
        public int ShowNuclear { get; set; }

        [Display(Name = "Show Stars")]
        public int ShowStars { get; set; }

        [Display(Name = "Show Trees")]
        public string ShowTrees { get; set; }

        [Display(Name = "Show Z")]
        public int ShowZ { get; set; }

        [Display(Name = "Start Date")]
        public DateTime NWStartDate { get; set; }

        [Display(Name = "YearlyCostSavings")]
        public int YearlyCostSavings { get; set; }

        public SelectList ShowCarOptions()
        {
            var options = new Dictionary<string, int>
                {
                    { "1 Car", 1 },
                    { "2 Cars", 2 },
                    { "3 Cars", 3 },
                    { "4 Cars", 4 },
                    { "5 Cars", 5 },
                    { "6 Cars", 6 },
                    { "7 Cars", 7 },
                    { "8 Cars", 8 },
                    { "9 Cars", 9 }
                };
            return new SelectList(options, "Value", "Key");
        }

        public SelectList ShowNuclearOptions()
        {
            var options = new Dictionary<string, int>
                {
                    { "0 Nuclear Spinning things", 0 },
                    { "1 Nuclear Spinning thing",  1 },
                    { "2 Nuclear Spinning things", 2 },
                    { "3 Nuclear Spinning things", 3 },
                    { "4 Nuclear Spinning things", 4 },
                    { "5 Nuclear Spinning things", 5 } 
                };
            return new SelectList(options, "Value", "Key");
        }

        public SelectList ShowStarsOptions()
        {
            var options = new Dictionary<string, int>
                {
                    { "0 Stars", 0 },
                    { "1 Star",  1 },
                    { "2 Stars", 2 },
                    { "3 Stars", 3 },
                    { "4 Stars", 4 },
                    { "5 Stars", 5 } 
                };
            return new SelectList(options, "Value", "Key");
        }
        
        public SelectList ShowTreesOptions()
        {
            var options = new Dictionary<string, string>
                {
                    { "1/2 Tree", "0.5" },
                    { "1 Tree", "1.0" },
                    { "1 1/2 Trees", "1.5" },
                    { "2 Trees", "2.0" },
                    { "2 1/2 Trees", "2.5" },
                    { "3 Trees", "3.0" },
                    { "3 1/2 Trees", "3.5" },
                    { "4 Trees", "4.0" },
                    { "4 1/2 Trees", "4.5" },
                    { "5 Trees", "5.0" } 
                };
            return new SelectList(options, "Value", "Key");
        }

        public SelectList ShowZOptions()
        {
            var options = new Dictionary<string, string>
                {
                    { "1 Z", "1" },
                    { "2 Zs", "2" },
                    { "3 Zs", "3" },
                    { "4 Zs", "4" },
                    { "5 Zs", "5" } 
                };
            return new SelectList(options, "Value", "Key");
        }
    }
}