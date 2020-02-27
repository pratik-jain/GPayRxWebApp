using RxWeb.Core.Data;
using GooglePayRxWebApp.BoundedContext.Main;

namespace GooglePayRxWebApp.UnitOfWork.Main
{
    public class TransactionUow : BaseUow, ITransactionUow
    {
        public TransactionUow(ITransactionContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface ITransactionUow : ICoreUnitOfWork { }
}


