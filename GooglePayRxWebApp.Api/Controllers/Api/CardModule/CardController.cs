using Microsoft.AspNetCore.Mvc;
using System.Linq;
using GooglePayRxWebApp.Domain.CardModule;
using GooglePayRxWebApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace GooglePayRxWebApp.Api.Controllers.CardModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class CardController : BaseDomainController<Card,Card>

    {
        public CardController(ICardDomain domain):base(domain) {}

    }
}
