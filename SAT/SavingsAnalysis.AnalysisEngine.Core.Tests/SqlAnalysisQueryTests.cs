using NUnit.Framework;

namespace SavingsAnalysis.AnalysisEngine.Core.Tests
{
   [TestFixture]
    public class SqlAnalysisQueryTests
    {
        [Test]
        public void SqlAnalysisQueryConstructedWithSingleStatisticInitializesCorrectly()
        {
            const string StatName = "CustomerCount";
            const string ColumnName = "c";

            var q = new SqlAnalysisQuery("SELECT a, b, c FROM MyData", StatName, ColumnName);

            Assert.AreEqual(1, q.StatisticNamesToColumnsMap.Count);
            Assert.IsTrue(q.StatisticNamesToColumnsMap.ContainsKey(StatName));

            var col = q.StatisticNamesToColumnsMap[StatName];

            Assert.AreEqual(ColumnName, col);
        }
    }
}
