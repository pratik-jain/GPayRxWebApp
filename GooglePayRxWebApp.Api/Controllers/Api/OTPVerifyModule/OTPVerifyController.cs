using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayRxWebApp.Domain.OTPVerifyModule;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayRxWebApp.Api.Controllers.OTPVerifyModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class OTPVerifyController : BaseDomainController<OTP, OTP>

    {
        public OTPVerifyController(IOTPVerifyDomain domain):base(domain) {}

    }
}
