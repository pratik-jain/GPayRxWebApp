using RxWeb.Core.Data;
using GooglePayRxWebApp.BoundedContext.Main;

namespace GooglePayRxWebApp.UnitOfWork.Main
{
    public class HistoryUow : BaseUow, IHistoryUow
    {
        public HistoryUow(IHistoryContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IHistoryUow : ICoreUnitOfWork { }
}


