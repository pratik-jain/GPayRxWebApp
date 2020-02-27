using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayRxWebApp.UnitOfWork.Main;
using GooglePayRxWebApp.Models.Main;

namespace GooglePayRxWebApp.Domain.UpiModule
{
    public class UpiDomain : IUpiDomain
    {
        public UpiDomain(IUpiUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(Upi parameters)
        {
            // throw new NotImplementedException();
            return await Uow.Repository<Upi>().AllAsync();
        }

        public Task<object> GetBy(Upi parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Upi entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Upi entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(Upi entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Upi entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Upi parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Upi parameters)
        {
            throw new NotImplementedException();
        }

        public IUpiUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IUpiDomain : ICoreDomain<Upi, Upi> { }
}
