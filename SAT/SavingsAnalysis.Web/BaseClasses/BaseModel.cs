namespace SavingsAnalysis.Web.BaseClasses
{
    public class BaseModel
    {
        public static EnvironmentSettings ApplicationSettings
        {
            get
            {
                return EnvironmentSettings.GetInstance();
            }
        }
    }
}