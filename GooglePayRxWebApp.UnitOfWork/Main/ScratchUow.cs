using RxWeb.Core.Data;
using GooglePayRxWebApp.BoundedContext.Main;

namespace GooglePayRxWebApp.UnitOfWork.Main
{
    public class ScratchUow : BaseUow, IScratchUow
    {
        public ScratchUow(IScratchContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IScratchUow : ICoreUnitOfWork { }
}


