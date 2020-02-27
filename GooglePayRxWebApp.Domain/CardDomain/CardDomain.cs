using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using GooglePayRxWebApp.UnitOfWork.Main;
using GooglePayRxWebApp.Models.Main;

namespace GooglePayRxWebApp.Domain.CardModule
{
    public class CardDomain : ICardDomain
    {
        public CardDomain(ICardUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(Card parameters)
        {
            var card = await Uow.Repository<Card>().SingleOrDefaultAsync(t => t.CardNumber == parameters.CardNumber && t.CVV == parameters.CVV && t.NameOnCard == parameters.NameOnCard && t.ExpiryDate == parameters.ExpiryDate);
            if (card != null)
            {
                return Task.FromResult("Suceess");
            }
            else
                return Task.FromResult(" Faileddddddddd");


        }

        public Task<object> GetBy(Card parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Card entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Card entity)
        {

            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(Card entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Card entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Card parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Card parameters)
        {
            throw new NotImplementedException();
        }

        public ICardUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface ICardDomain : ICoreDomain<Card, Card> { }
}
