using RxWeb.Core.Data;
using GooglePayRxWebApp.BoundedContext.Main;

namespace GooglePayRxWebApp.UnitOfWork.Main
{
    public class RewardUow : BaseUow, IRewardUow
    {
        public RewardUow(IRewardContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IRewardUow : ICoreUnitOfWork { }
}


