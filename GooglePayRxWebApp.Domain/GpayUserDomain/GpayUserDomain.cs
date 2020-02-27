using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayRxWebApp.UnitOfWork.Main;
using GooglePayRxWebApp.Models.Main;

namespace GooglePayRxWebApp.Domain.GpayUserModule
{
    public class GpayUserDomain : IGpayUserDomain
    {
        private bool flag = true;
        public GpayUserDomain(IGpayUserUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(GpayUser parameters)
        {
            return await Uow.Repository<GpayUser>().AllAsync();
         //   throw new NotImplementedException();
        }

        public async Task<object> GetBy(GpayUser parameters)
        {
            //checking the mobile number availbale in DB or not
            var isAvailable = await Uow.Repository<GpayUser>().SingleOrDefaultAsync(t => t.MobileNumber == parameters.MobileNumber);
            if (isAvailable == null)
            {
                flag = false;
                //generating OTP
                //Random random = new Random();
                //int randomNumber = random.Next(1000, 9999);
                
                await Uow.RegisterNewAsync(parameters);
                return await Task.FromResult("otp genrated");

            }
            else
            {
                flag = true;
                return await Task.FromResult("Available");
            }
            // throw new NotImplementedException();
        }


        public HashSet<string> AddValidation(GpayUser entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(GpayUser entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(GpayUser entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(GpayUser entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(GpayUser parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(GpayUser parameters)
        {
            throw new NotImplementedException();
        }

        public IGpayUserUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IGpayUserDomain : ICoreDomain<GpayUser,GpayUser> { }
}
