using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using GooglePayRxWebApp.Models.Enums.Main;
using GooglePayRxWebApp.BoundedContext.SqlContext;
namespace GooglePayRxWebApp.Models.Main
{
    [Table("TransactionStatusObjects",Schema="dbo")]
    public partial class TransactionStatusObject
    {
		#region TransactionStatusId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion TransactionStatusId Annotations

        public byte TransactionStatusId { get; set; }

		#region TransactionName Annotations

        [Required]
        [MaxLength(10)]
		#endregion TransactionName Annotations

        public string TransactionName { get; set; }

		#region Transactions Annotations

        [InverseProperty("TransactionStatusObject")]
		#endregion Transactions Annotations

        public virtual ICollection<Transaction> Transactions { get; set; }


        public TransactionStatusObject()
        {
			Transactions = new HashSet<Transaction>();
        }
	}
}