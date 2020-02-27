using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayRxWebApp.Domain.GpayUserModule;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayRxWebApp.Api.Controllers.GpayUserModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class GpayUsersController : BaseDomainController<GpayUser,GpayUser>

    {
        public GpayUsersController(IGpayUserDomain domain):base(domain) {}

    }
}
