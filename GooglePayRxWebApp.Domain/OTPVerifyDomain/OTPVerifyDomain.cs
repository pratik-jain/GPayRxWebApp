using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayRxWebApp.UnitOfWork.Main;
using GooglePayRxWebApp.Models.Main;

namespace GooglePayRxWebApp.Domain.OTPVerifyModule
{
    public class OTPVerifyDomain : IOTPVerifyDomain
    {
        public OTPVerifyDomain(IOTPUow uow) {
            this.Uow = uow;
        }

        public Task<object> GetAsync(OTP parameters)
        {
            throw new NotImplementedException();
        }

        public async Task<object> GetBy(OTP parameters)
        {

            var isOtpIdTrue = await Uow.Repository<OTP>().SingleOrDefaultAsync(t => t.OTPId == parameters.OTPId && t.OTPNumber == parameters.OTPNumber);
            if(isOtpIdTrue != null)
            {
                return await Task.FromResult("True");
            }
            else
            {
                return await Task.FromResult("False");
            }
            
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

    public interface IOTPVerifyDomain : ICoreDomain<OTP,OTP> { }
}
