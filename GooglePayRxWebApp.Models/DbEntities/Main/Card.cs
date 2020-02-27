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
    [Table("Cards",Schema="dbo")]
    public partial class Card
    {
		#region CardId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion CardId Annotations

        public long CardId { get; set; }

		#region CardNumber Annotations

        [Required]
		#endregion CardNumber Annotations

        public long CardNumber { get; set; }

		#region NameOnCard Annotations

        [Required]
        [MaxLength(20)]
		#endregion NameOnCard Annotations

        public string NameOnCard { get; set; }

		#region ExpiryDate Annotations

        [Required]
        [MaxLength(5)]
		#endregion ExpiryDate Annotations

        public string ExpiryDate { get; set; }

		#region CVV Annotations

        [Required]
        [MaxLength(3)]
		#endregion CVV Annotations

        public string CVV { get; set; }

		#region BankDetailId Annotations

        [Required]
        [RelationshipTableAttribue("UserBankDetails","dbo","","BankDetailId")]
		#endregion BankDetailId Annotations

        public long BankDetailId { get; set; }

		#region UserBankDetail Annotations

        [ForeignKey(nameof(BankDetailId))]
        [InverseProperty(nameof(GooglePayRxWebApp.Models.Main.UserBankDetail.Cards))]
		#endregion UserBankDetail Annotations

        public virtual UserBankDetail UserBankDetail { get; set; }


        public Card()
        {
        }
	}
}