#region Namespace
using Microsoft.Extensions.DependencyInjection;
using GooglePayRxWebApp.Infrastructure.Security;
using RxWeb.Core.Data;
using RxWeb.Core.Security;
using RxWeb.Core.Annotations;
using RxWeb.Core;
using GooglePayRxWebApp.UnitOfWork.DbEntityAudit;
using GooglePayRxWebApp.BoundedContext.Main;
using GooglePayRxWebApp.UnitOfWork.Main;
using GooglePayRxWebApp.Domain.GpayUserModule;
            using GooglePayRxWebApp.Domain.GpayLoginModule;
            using GooglePayRxWebApp.Domain.OTPModule;
            
            using GooglePayRxWebApp.Domain.TransactionModule;
            using GooglePayRxWebApp.Domain.RewardModule;
            using GooglePayRxWebApp.Domain.scratchModule;
            using GooglePayRxWebApp.Domain.OTPVerifyModule;
            using GooglePayRxWebApp.Domain.UpiModule;
            #endregion Namespace

  
namespace GooglePayRxWebApp.Api.Bootstrap
{
    public static class ScopedExtension
    {

        public static void AddScopedService(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddScoped<IRepositoryProvider, RepositoryProvider>();
            serviceCollection.AddScoped<ITokenAuthorizer, TokenAuthorizer>();
            serviceCollection.AddScoped<IModelValidation, ModelValidation>();
            serviceCollection.AddScoped<IAuditLog, AuditLog>();
            serviceCollection.AddScoped<IApplicationTokenProvider, ApplicationTokenProvider>();
            serviceCollection.AddScoped(typeof(IDbContextManager<>), typeof(DbContextManager<>));

            #region ContextService

            serviceCollection.AddScoped<ILoginContext, LoginContext>();
            serviceCollection.AddScoped<ILoginUow, LoginUow>();
                        serviceCollection.AddScoped<IGpayUserContext, GpayUserContext>();
            serviceCollection.AddScoped<IGpayUserUow, GpayUserUow>();
                        serviceCollection.AddScoped<IOTPContext, OTPContext>();
            serviceCollection.AddScoped<IOTPUow, OTPUow>();
                        serviceCollection.AddScoped<ITransactionContext, TransactionContext>();
            serviceCollection.AddScoped<ITransactionUow, TransactionUow>();
                        serviceCollection.AddScoped<IRewardContext, RewardContext>();
            serviceCollection.AddScoped<IRewardUow, RewardUow>();
                        serviceCollection.AddScoped<IScratchContext, ScratchContext>();
            serviceCollection.AddScoped<IScratchUow, ScratchUow>();
            serviceCollection.AddScoped<IUpiUow,UpiUow>();
                                    
                        serviceCollection.AddScoped<IUpiContext, UpiContext>();
            serviceCollection.AddScoped<IUpiUow, UpiUow>();
                        serviceCollection.AddScoped<IHistoryContext, HistoryContext>();
            serviceCollection.AddScoped<IHistoryUow, HistoryUow>();
                        serviceCollection.AddScoped<ICardContext, CardContext>();
            serviceCollection.AddScoped<ICardUow, CardUow>();
                        serviceCollection.AddScoped<IBankContext, BankContext>();
            serviceCollection.AddScoped<IBankUow, BankUow>();
            #endregion ContextService













            #region DomainService

            
            serviceCollection.AddScoped<IGpayUserDomain, GpayUserDomain>();
            
            serviceCollection.AddScoped<IGpayLoginDomain, GpayLoginDomain>();
            
            serviceCollection.AddScoped<IOTPDomain, OTPDomain>();
            
            
            
            serviceCollection.AddScoped<ITransactionDomain, TransactionDomain>();
            
            serviceCollection.AddScoped<IRewardDomain, RewardDomain>();
            
            serviceCollection.AddScoped<IRewardDomain, RewardDomain>();
            
            serviceCollection.AddScoped<IScratchDomain, ScratchDomain>();
            
            serviceCollection.AddScoped<IScratchDomain, ScratchDomain>();
            
            serviceCollection.AddScoped<IOTPVerifyDomain, OTPVerifyDomain>();
            serviceCollection.AddScoped<IUpiDomain, UpiDomain>();
            #endregion DomainService










        }
    }
}




