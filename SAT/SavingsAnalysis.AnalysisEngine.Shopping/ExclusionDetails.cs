namespace SavingsAnalysis.AnalysisEngine.Shopping
{
    public class ExclusionDetails
    {
        public ExclusionDetails(string name, string attributeValue, bool excluded)
        {
            Name = name;
            AttributeValue = attributeValue;
            Excluded = excluded;
        }

        public string AttributeValue { get; private set; }

        public string Name { get; private set; }

        public bool Excluded { get; private set; }
    }
}
