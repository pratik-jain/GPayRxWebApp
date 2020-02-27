using RxWeb.Core.Data;
using GooglePayRxWebApp.BoundedContext.Main;

namespace GooglePayRxWebApp.UnitOfWork.Main
{
    public class GpayUserUow : BaseUow, IGpayUserUow
    {
        public GpayUserUow(IGpayUserContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IGpayUserUow : ICoreUnitOfWork { }
}


