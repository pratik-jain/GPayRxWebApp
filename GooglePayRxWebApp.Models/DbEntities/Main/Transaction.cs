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
    [Table("Transactions",Schema="dbo")]
    public partial class Transaction
    {
		#region TransactionId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion TransactionId Annotations

        public long TransactionId { get; set; }

		#region SenderId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("GpayUsers","dbo","","SenderId")]
		#endregion SenderId Annotations

        public int SenderId { get; set; }

		#region ReciverId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("GpayUsers","dbo","","ReciverId")]
		#endregion ReciverId Annotations

        public int ReciverId { get; set; }

		#region Amount Annotations

        [Required]
		#endregion Amount Annotations

        public double Amount { get; set; }

		#region SendDate Annotations

        [Required]
		#endregion SendDate Annotations

        public System.DateTime SendDate { get; set; }

		#region TransactionStatus Annotations

        [Required]
        [RelationshipTableAttribue("TransactionStatusObjects","dbo","","TransactionStatus")]
		#endregion TransactionStatus Annotations

        public byte TransactionStatus { get; set; }

		#region UPIId Annotations

        [Required]
        [RelationshipTableAttribue("Upis","dbo","","UPIId")]
		#endregion UPIId Annotations

        public long UPIId { get; set; }

		#region Remarks Annotations

        [Required]
		#endregion Remarks Annotations

        public string Remarks { get; set; }

		#region GpayUser Annotations

        [ForeignKey(nameof(SenderId))]
        [InverseProperty(nameof(GooglePayRxWebApp.Models.Main.GpayUser.Transactions))]
		#endregion GpayUser Annotations

        public virtual GpayUser GpayUser { get; set; }

		#region GpayUser1 Annotations

        [ForeignKey(nameof(ReciverId))]
        [InverseProperty(nameof(GooglePayRxWebApp.Models.Main.GpayUser.Transactions1))]
		#endregion GpayUser1 Annotations

        public virtual GpayUser GpayUser1 { get; set; }

		#region TransactionStatusObject Annotations

        [ForeignKey(nameof(TransactionStatus))]
        [InverseProperty(nameof(GooglePayRxWebApp.Models.Main.TransactionStatusObject.Transactions))]
		#endregion TransactionStatusObject Annotations

        public virtual TransactionStatusObject TransactionStatusObject { get; set; }

		#region Upi Annotations

        [ForeignKey(nameof(UPIId))]
        [InverseProperty(nameof(GooglePayRxWebApp.Models.Main.Upi.Transactions))]
		#endregion Upi Annotations

        public virtual Upi Upi { get; set; }


        public Transaction()
        {
        }
	}
}