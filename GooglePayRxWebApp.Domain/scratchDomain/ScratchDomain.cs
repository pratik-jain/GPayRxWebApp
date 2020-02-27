using GooglePayRxWebApp.BoundedContext.SqlContext;
using GooglePayRxWebApp.Models.DbEntities.Main;
using GooglePayRxWebApp.UnitOfWork.Main;
using RxWeb.Core;
using RxWeb.Core.Data;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using GooglePayRxWebApp.Models.ViewModels;

namespace GooglePayRxWebApp.Domain.scratchModule
{
    public class ScratchDomain : IScratchDomain
    {
        public ScratchDomain(IScratchUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
            DbContextManager = dbContextManager;
        }

        public Task<object> GetAsync(Scratch parameters)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetBy(Scratch parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Scratch entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Scratch parameters)
        {
            await DbContextManager.BeginTransactionAsync();

            var spParameters = new SqlParameter[4];
            spParameters[0] = new SqlParameter() { ParameterName = "rewardAmount", Value = parameters.RewardAmount };
            spParameters[1] = new SqlParameter() { ParameterName = "recieverId", Value = parameters.RecieverId };
            spParameters[2] = new SqlParameter() { ParameterName = "sendDate", Value = parameters.sendDate };
            spParameters[3] = new SqlParameter() { ParameterName = "rewardId", Value = parameters.RewardId };

            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spRewards ", spParameters);
            try
            {
                await DbContextManager.CommitAsync();
            }
            catch (Exception e)
            {
                DbContextManager.RollbackTransaction();
            }

        }

        public HashSet<string> UpdateValidation(Scratch entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Scratch entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Scratch parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Scratch parameters)
        {
            throw new NotImplementedException();
        }

        public IScratchUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();

        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface IScratchDomain : ICoreDomain<Scratch,Scratch> { }
}
