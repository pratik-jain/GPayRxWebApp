using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayRxWebApp.UnitOfWork.Main;
using GooglePayRxWebApp.Models.Main;

namespace GooglePayRxWebApp.Domain.HistoryModule
{
    public class HistoryDomain : IHistoryDomain
    {
        public HistoryDomain(IHistoryUow uow) {
            this.Uow = uow;
        }

        public Task<object> GetAsync(vAllTransaction parameters)
        {
            var TransactionList = (object)this.Uow.Repository<vAllTransaction>().All();
            return Task.FromResult(TransactionList);
        }

        public async Task<object> GetBy(vAllTransaction parameters)
        {
            return await Uow.Repository<vAllTransaction>().FindByAsync(t => t.SenderId == parameters.SenderId);
        }
        

        public HashSet<string> AddValidation(vAllTransaction entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(vAllTransaction entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(vAllTransaction entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(vAllTransaction entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(vAllTransaction parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(vAllTransaction parameters)
        {
            throw new NotImplementedException();
        }

        public IHistoryUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IHistoryDomain : ICoreDomain<vAllTransaction, vAllTransaction> { }
}
