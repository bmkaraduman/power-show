namespace SavingsAnalysis.Web.Models
{
    using global::SavingsAnalysis.AnalysisEngine.Core;

    using global::SavingsAnalysis.AnalysisEngine.NightWatchman;
    using global::SavingsAnalysis.Web.ViewModels;

    public class NightWatchmanAnalysisModel
    {
        #region Fields

        private readonly NightWatchmanAnalysis analysis;

        private readonly NightWatchmanInputParameterViewModel nightWatchmanInputModel;

        #endregion

        #region Constructors and Destructors

        public NightWatchmanAnalysisModel(
            NightWatchmanInputParameterViewModel nightWatchmanInputModel, CommonInputParameterViewModel common)
        {
            this.nightWatchmanInputModel = nightWatchmanInputModel;
            this.analysis = new NightWatchmanAnalysis
                {
                    ConnectionString =
                        Repository.BuildConnectionString(
                            EnvironmentSettings.GetInstance().DatabaseConnectionString, 
                            common.FileName.Replace(".zip", string.Empty))
                };
        }

        #endregion

        #region Methods

        internal NightWatchmanAnalysisResultsViewModel Build()
        {
            int startTimeInMinutes = 420;
            int endTimeInMinutes = 1140;
            string[] startTimeVal = this.nightWatchmanInputModel.StartTime.Split(':');
            int hourResult, minuteResult;
            if (int.TryParse(startTimeVal[0], out hourResult) && int.TryParse(startTimeVal[1], out minuteResult))
            {
                startTimeInMinutes = (hourResult * 60) + minuteResult;
            }

            string[] endTimeVal = this.nightWatchmanInputModel.EndTime.Split(':');

            if (int.TryParse(endTimeVal[0], out hourResult) && int.TryParse(endTimeVal[1], out minuteResult))
            {
                endTimeInMinutes = (hourResult * 60) + minuteResult;
            }

            var result = new NightWatchmanAnalysisResultsViewModel
                {
                    NumberOfDesktops = this.analysis.GetNumberOfDesktops(),
                    NumberOfLaptops = this.analysis.GetNumberOfLaptops(),
                    NumberOfMachineOnWeekDays =
                        this.analysis.GetMachinesOnForWeekdays(startTimeInMinutes, endTimeInMinutes),
                    NumberOfMachineOnWeekEnds =
                        this.analysis.GetMachinesOnForWeekends(startTimeInMinutes, endTimeInMinutes),
                    StartTime = this.nightWatchmanInputModel.StartTime,
                    EndTime = this.nightWatchmanInputModel.EndTime
                };

            return result;
        }

        #endregion
    }
}