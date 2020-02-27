using RxWeb.Core.Data;
using GooglePayRxWebApp.BoundedContext.Main;

namespace GooglePayRxWebApp.UnitOfWork.Main
{
    public class CardUow : BaseUow, ICardUow
    {
        public CardUow(ICardContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface ICardUow : ICoreUnitOfWork { }
}


