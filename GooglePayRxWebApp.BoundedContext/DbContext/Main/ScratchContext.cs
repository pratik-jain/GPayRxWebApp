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
    public class ScratchContext : BaseBoundedContext, IScratchContext
    {
        public ScratchContext(MainSqlDbContext sqlDbContext,  IOptions<DatabaseConfig> databaseConfig, IHttpContextAccessor contextAccessor,ITenantDbConnectionInfo tenantDbConnection): base(sqlDbContext, databaseConfig.Value, contextAccessor,tenantDbConnection){ }

            #region DbSets
        public DbSet<Transaction> Transactions { get; set; }
        public DbSet<UserBankDetail> UserBankDetails { get; set; }
        public DbSet<Reward> Rewards { get; set; }
            #endregion DbSets

    }


    public interface IScratchContext : IDbContext
    {
    }
}

