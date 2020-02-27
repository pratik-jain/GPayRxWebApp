using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayRxWebApp.Domain.GpayLoginModule;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayRxWebApp.Api.Controllers.GpayLoginModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class GpayLoginController : BaseDomainController<GpayUser,GpayUser>

    {
        public GpayLoginController(IGpayLoginDomain domain):base(domain) {}

    }
}
