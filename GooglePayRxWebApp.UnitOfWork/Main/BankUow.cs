using RxWeb.Core.Data;
using GooglePayRxWebApp.BoundedContext.Main;

namespace GooglePayRxWebApp.UnitOfWork.Main
{
    public class BankUow : BaseUow, IBankUow
    {
        public BankUow(IBankContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IBankUow : ICoreUnitOfWork { }
}


