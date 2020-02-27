using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayRxWebApp.Domain.scratchModule;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using GooglePayRxWebApp.Models.DbEntities.Main;
namespace GooglePayRxWebApp.Api.Controllers.scratchModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class ScratchController : BaseDomainController<Scratch,Scratch>

    {
        public ScratchController(IScratchDomain domain):base(domain) {}

    }
}
