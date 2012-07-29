// -----------------------------------------------------------------------
// <copyright file="SCCMQueries.cs" company="1E">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace SavingsAnalysis.Plugin.Shopping
{
    using System.Collections.Generic;

    public struct SCCMQuery
    {
        public string Name;
        public string SelectionQuery;
    }


    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public static class SCCMQueries
    {

        public static List<SCCMQuery> Queries()
        {
            var queries = new List<SCCMQuery>()
                {
                    new SCCMQuery() { Name = "Statmsgattributes", SelectionQuery = "select TOP 100 * from v_statmsgattributes" },
                    new SCCMQuery() { Name = "Advertisement", SelectionQuery = "select  TOP 100 * from v_Advertisement" },
                    new SCCMQuery() { Name = "Statusmessages", SelectionQuery = "select TOP 100 * from vstatusmessages" },
                };

            return queries;
        }
    }
}
