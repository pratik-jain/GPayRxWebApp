using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayRxWebApp.Domain.RewardModule;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayRxWebApp.Api.Controllers.RewardModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class RewardsController : BaseDomainController<Reward, Reward>

    {
        public RewardsController(IRewardDomain domain):base(domain) {}

    }
}
