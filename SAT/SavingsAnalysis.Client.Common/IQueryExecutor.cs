using System.Collections.Generic;

namespace SavingsAnalysis.Client.Common
{
    using System.Data;
    using System.Data.SqlClient;

    public interface IQueryExecutor
    {
        DataTable ExecuteQuery(string query, string dataTableName, SqlParameter[] parameters);

        IEnumerable<DataTable> ExecuteQueryEnumerator(string query, string dataTableName,SqlParameter[] parameters);
    }
}
