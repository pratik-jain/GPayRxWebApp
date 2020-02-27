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
    [Table("GpayUsers",Schema="dbo")]
    public partial class GpayUser
    {
		#region GPayUserId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion GPayUserId Annotations

        public long GPayUserId { get; set; }

		#region MobileNumber Annotations

        [Required]
        [MaxLength(50)]
		#endregion MobileNumber Annotations

        public string MobileNumber { get; set; }

		#region UserName Annotations

        [Required]
        [MaxLength(50)]
		#endregion UserName Annotations

        public string UserName { get; set; }

		#region Password Annotations

        [Required]
        [MaxLength(50)]
		#endregion Password Annotations

        public string Password { get; set; }

		#region UserTypeId Annotations

        [Required]
        [RelationshipTableAttribue("UserTypeObjects","dbo","","UserTypeId")]
		#endregion UserTypeId Annotations

        public byte UserTypeId { get; set; }

		#region EmailId Annotations

        [Required]
        [MaxLength(50)]
		#endregion EmailId Annotations

        public string EmailId { get; set; }

		#region UserTypeObject Annotations

        [ForeignKey(nameof(UserTypeId))]
        [InverseProperty(nameof(GooglePayRxWebApp.Models.Main.UserTypeObject.GpayUsers))]
		#endregion UserTypeObject Annotations

        public virtual UserTypeObject UserTypeObject { get; set; }

		#region Transactions Annotations

        [InverseProperty("GpayUser")]
		#endregion Transactions Annotations

        public virtual ICollection<Transaction> Transactions { get; set; }

		#region Transactions1 Annotations

        [InverseProperty("GpayUser1")]
		#endregion Transactions1 Annotations

        public virtual ICollection<Transaction> Transactions1 { get; set; }

		#region UserBankDetails Annotations

        [InverseProperty("GpayUser")]
		#endregion UserBankDetails Annotations

        public virtual ICollection<UserBankDetail> UserBankDetails { get; set; }

		#region Rewards Annotations

        [InverseProperty("GpayUser")]
		#endregion Rewards Annotations

        public virtual ICollection<Reward> Rewards { get; set; }


        public GpayUser()
        {
			Transactions = new HashSet<Transaction>();
			Transactions1 = new HashSet<Transaction>();
			UserBankDetails = new HashSet<UserBankDetail>();
			Rewards = new HashSet<Reward>();
        }
	}
}