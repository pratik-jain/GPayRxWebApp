using RxWeb.Core.Data;
using GooglePayRxWebApp.BoundedContext.Main;

namespace GooglePayRxWebApp.UnitOfWork.Main
{
    public class OTPUow : BaseUow, IOTPUow
    {
        public OTPUow(IOTPContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IOTPUow : ICoreUnitOfWork { }
}


