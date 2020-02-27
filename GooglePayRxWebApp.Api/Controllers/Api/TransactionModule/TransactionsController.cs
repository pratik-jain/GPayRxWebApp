using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayRxWebApp.Domain.TransactionModule;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayRxWebApp.Api.Controllers.TransactionModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class TransactionsController : BaseDomainController<Transaction,Transaction>

    {
        public TransactionsController(ITransactionDomain domain):base(domain) {}

    }
}
