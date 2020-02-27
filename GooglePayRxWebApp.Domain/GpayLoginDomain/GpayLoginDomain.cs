using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayRxWebApp.UnitOfWork.Main;
using GooglePayRxWebApp.Models.Main;

namespace GooglePayRxWebApp.Domain.GpayLoginModule
{
    public class GpayLoginDomain : IGpayLoginDomain
    {
        public GpayLoginDomain(IGpayUserUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(GpayUser parameters)
        {
            var login = await Uow.Repository<GpayUser>().SingleOrDefaultAsync(t => t.MobileNumber == parameters.MobileNumber && t.Password == parameters.Password);
            if (login != null)
            {
                return await Task.FromResult("Success");
            }
            else
            {
                return await Task.FromResult("Failed");
            }
            //throw new NotImplementedException();
        }

        public Task<object> GetBy(GpayUser parameters)
        {
            throw new NotImplementedException();
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

    public interface IGpayLoginDomain : ICoreDomain<GpayUser,GpayUser> { }
}
