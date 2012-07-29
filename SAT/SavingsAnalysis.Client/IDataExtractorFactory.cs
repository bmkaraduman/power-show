using System.Collections.Generic;
using SavingsAnalysis.Client.Common;

namespace SavingsAnalysis.Client
{
    public interface IDataExtractorFactory
    {
        List<IDataExtractor> GetDataExtractors();
    }
}