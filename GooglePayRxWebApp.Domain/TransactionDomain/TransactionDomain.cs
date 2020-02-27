using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayRxWebApp.UnitOfWork.Main;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.Data;
using GooglePayRxWebApp.BoundedContext.SqlContext;
using Microsoft.Data.SqlClient;
using GooglePayRxWebApp.Models.ViewModels;

namespace GooglePayRxWebApp.Domain.TransactionModule
{
    public class TransactionDomain : ITransactionDomain
    {
        public TransactionDomain(ITransactionUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
            DbContextManager = dbContextManager;
        }

        public Task<object> GetAsync(Transaction parameters)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetBy(Transaction parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Transaction entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Transaction parameters)
        {
            await DbContextManager.BeginTransactionAsync();

            var spParameters = new SqlParameter[7];
            spParameters[0] = new SqlParameter() { ParameterName = "amount", Value = parameters.Amount };
            spParameters[1] = new SqlParameter() { ParameterName = "senderId", Value = parameters.SenderId };
            spParameters[2] = new SqlParameter() { ParameterName = "recieverId", Value = parameters.ReciverId };
            spParameters[3] = new SqlParameter() { ParameterName = "sendDate", Value = parameters.SendDate };
            spParameters[4] = new SqlParameter() { ParameterName = "transactionStatus", Value = parameters.TransactionStatus };
            spParameters[5] = new SqlParameter() { ParameterName = "remark", Value = parameters.Remarks };
            spParameters[6] = new SqlParameter() { ParameterName = "upiId", Value = parameters.UPIId };
            //  spParameters[7] = new SqlParameter() { ParameterName = "Flag", Value = "@flag" };
            //  spParameters[7].Direction = System.Data.ParameterDirection.Output;

            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spTransactions ", spParameters);
            try
            {
                await DbContextManager.CommitAsync();
            }
            catch (Exception e)
            {
                DbContextManager.RollbackTransaction();
            }
        }

        public HashSet<string> UpdateValidation(Transaction entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Transaction entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Transaction parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Transaction parameters)
        {
            throw new NotImplementedException();
        }

        public ITransactionUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface ITransactionDomain : ICoreDomain<Transaction, Transaction> { }
}
