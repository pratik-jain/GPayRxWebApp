using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayRxWebApp.Domain.HistoryModule;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayRxWebApp.Api.Controllers.HistoryModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class HistoryController : BaseDomainController<vAllTransaction, vAllTransaction>

    {
        public HistoryController(IHistoryDomain domain):base(domain) {}

    }
}
