using Microsoft.Extensions.DependencyInjection;
using GooglePayRxWebApp.Infrastructure.Singleton;
using GooglePayRxWebApp.BoundedContext.Singleton;
using RxWeb.Core.Data;

namespace GooglePayRxWebApp.Api.Bootstrap
{
    public static class Singleton
    {
        public static void AddSingletonService(this IServiceCollection serviceCollection)
        {
            #region Singleton
            serviceCollection.AddSingleton<ITenantDbConnectionInfo, TenantDbConnectionInfo>();
            serviceCollection.AddSingleton(typeof(UserAccessConfigInfo));
            #endregion Singleton
        }

    }
}




