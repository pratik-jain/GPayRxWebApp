using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayRxWebApp.UnitOfWork.Main;
using GooglePayRxWebApp.Models.Main;

namespace GooglePayRxWebApp.Domain.RewardModule
{
    public class RewardDomain : IRewardDomain
    {
        public RewardDomain(IRewardUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(Reward parameters)
        {
            return await Uow.Repository<Reward>().FindByAsync(t => t.UserId == parameters.UserId);
            //throw new NotImplementedException();
        }

        public Task<object> GetBy(Reward parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Reward entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Reward entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(Reward entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Reward entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Reward parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Reward parameters)
        {
            throw new NotImplementedException();
        }

        public IRewardUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IRewardDomain : ICoreDomain<Reward, Reward> { }
}
