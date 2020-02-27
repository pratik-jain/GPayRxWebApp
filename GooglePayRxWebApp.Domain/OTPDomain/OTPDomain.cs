using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayRxWebApp.UnitOfWork.Main;
using GooglePayRxWebApp.Models.Main;

namespace GooglePayRxWebApp.Domain.OTPModule
{
    public class OTPDomain : IOTPDomain
    {
        public OTPDomain(IOTPUow uow) {
            this.Uow = uow;
        }

        public Task<object> GetAsync(OTP parameters)
        {
            throw new NotImplementedException();
        }

        public async Task<object> GetBy(OTP parameters)
        {
            Random random = new Random();
            int randomNumber = random.Next(1000, 9999);
            parameters.OTPNumber = randomNumber;
            await Uow.RegisterNewAsync(parameters);
            await Uow.CommitAsync();            
            return await Task.FromResult(parameters.OTPId);
            //throw new NotImplementedException();
        }

        public HashSet<string> AddValidation(OTP entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(OTP entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(OTP entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(OTP entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(OTP parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(OTP parameters)
        {
            throw new NotImplementedException();
        }

        public IOTPUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IOTPDomain : ICoreDomain<OTP,OTP> { }
}
