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
    [Table("UserBankDetails",Schema="dbo")]
    public partial class UserBankDetail
    {
		#region BankDetailId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion BankDetailId Annotations

        public long BankDetailId { get; set; }

		#region BankId Annotations

        [Required]
        [RelationshipTableAttribue("Banks","dbo","","BankId")]
		#endregion BankId Annotations

        public short BankId { get; set; }

		#region AccountNumber Annotations

        [Required]
		#endregion AccountNumber Annotations

        public long AccountNumber { get; set; }

		#region Balance Annotations

        [Required]
		#endregion Balance Annotations

        public double Balance { get; set; }

		#region GPayUserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("GpayUsers","dbo","","GPayUserId")]
		#endregion GPayUserId Annotations

        public int GPayUserId { get; set; }

		#region AddedStatus Annotations

        [Required]
		#endregion AddedStatus Annotations

        public bool AddedStatus { get; set; }

		#region GpayUser Annotations

        [ForeignKey(nameof(GPayUserId))]
        [InverseProperty(nameof(GooglePayRxWebApp.Models.Main.GpayUser.UserBankDetails))]
		#endregion GpayUser Annotations

        public virtual GpayUser GpayUser { get; set; }

		#region Bank Annotations

        [ForeignKey(nameof(BankId))]
        [InverseProperty(nameof(GooglePayRxWebApp.Models.Main.Bank.UserBankDetails))]
		#endregion Bank Annotations

        public virtual Bank Bank { get; set; }

		#region Cards Annotations

        [InverseProperty("UserBankDetail")]
		#endregion Cards Annotations

        public virtual ICollection<Card> Cards { get; set; }

		#region Upis Annotations

        [InverseProperty("UserBankDetail")]
		#endregion Upis Annotations

        public virtual ICollection<Upi> Upis { get; set; }


        public UserBankDetail()
        {
			Cards = new HashSet<Card>();
			Upis = new HashSet<Upi>();
        }
	}
}