using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayRxWebApp.Domain.OTPModule;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayRxWebApp.Api.Controllers.OTPModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class OTPsController : BaseDomainController<OTP,OTP>

    {
        public OTPsController(IOTPDomain domain):base(domain) {}

    }
}
