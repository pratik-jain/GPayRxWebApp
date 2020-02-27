using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayRxWebApp.Domain.UpiModule;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayRxWebApp.Api.Controllers.UpiModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class UpisController : BaseDomainController<Upi, Upi>

    {
        public UpisController(IUpiDomain domain):base(domain) {}

    }
}
