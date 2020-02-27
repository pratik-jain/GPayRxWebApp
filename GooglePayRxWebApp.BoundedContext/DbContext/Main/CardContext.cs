using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using GooglePayRxWebApp.BoundedContext.SqlContext;
using GooglePayRxWebApp.Models.Main;
using GooglePayRxWebApp.Models;
using GooglePayRxWebApp.BoundedContext.Singleton;
using RxWeb.Core.Data;
using RxWeb.Core.Data.Models;
using RxWeb.Core.Data.BoundedContext;

namespace GooglePayRxWebApp.BoundedContext.Main
{
    public class CardContext : BaseBoundedContext, ICardContext
    {
        public CardContext(MainSqlDbContext sqlDbContext,  IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor,ITenantDbConnectionInfo tenantDbConnection): base(sqlDbContext, databaseConfig.Value, contextAccessor,tenantDbConnection){ }

        #region DbSets

        public DbSet<Card> Cards { get; set; }
        #endregion DbSets

    }


    public interface ICardContext : IDbContext
    {
    }
}

