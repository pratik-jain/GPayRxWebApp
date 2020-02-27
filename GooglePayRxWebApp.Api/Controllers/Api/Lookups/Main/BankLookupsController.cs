using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayRxWebApp.UnitOfWork.Main;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayRxWebApp.Api.Controllers.BankModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class BankLookupsController : BaseLookupController

    {
        public BankLookupsController(IBankUow uow):base(uow) {}

        #region Lookups
        		[HttpGet("BankLookups")]
		public IQueryable<Bank> GetBankLookups()
		{
			return Uow.Repository<Bank>().Queryable();
		}
            #endregion Lookups

    }
}
