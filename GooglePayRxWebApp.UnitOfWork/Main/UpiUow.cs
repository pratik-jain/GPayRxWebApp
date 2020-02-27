using RxWeb.Core.Data;
using GooglePayRxWebApp.BoundedContext.Main;

namespace GooglePayRxWebApp.UnitOfWork.Main
{
    public class UpiUow : BaseUow, IUpiUow
    {
        public UpiUow(IUpiContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IUpiUow : ICoreUnitOfWork { }
}


