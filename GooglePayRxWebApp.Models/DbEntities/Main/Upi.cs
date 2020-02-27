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
    [Table("Upis",Schema="dbo")]
    public partial class Upi
    {
		#region UpiId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion UpiId Annotations

        public long UpiId { get; set; }

		#region UpiName Annotations

        [Required]
        [MaxLength(50)]
		#endregion UpiName Annotations

        public string UpiName { get; set; }

		#region UpiPin Annotations

        [Required]
        [MaxLength(20)]
		#endregion UpiPin Annotations

        public string UpiPin { get; set; }

		#region BankDetailId Annotations

        [Required]
        [RelationshipTableAttribue("UserBankDetails","dbo","","BankDetailId")]
		#endregion BankDetailId Annotations

        public long BankDetailId { get; set; }

		#region UpiPriority Annotations

        [Required]
		#endregion UpiPriority Annotations

        public bool UpiPriority { get; set; }

		#region UserBankDetail Annotations

        [ForeignKey(nameof(BankDetailId))]
        [InverseProperty(nameof(GooglePayRxWebApp.Models.Main.UserBankDetail.Upis))]
		#endregion UserBankDetail Annotations

        public virtual UserBankDetail UserBankDetail { get; set; }

		#region Transactions Annotations

        [InverseProperty("Upi")]
		#endregion Transactions Annotations

        public virtual ICollection<Transaction> Transactions { get; set; }


        public Upi()
        {
			Transactions = new HashSet<Transaction>();
        }
	}
}