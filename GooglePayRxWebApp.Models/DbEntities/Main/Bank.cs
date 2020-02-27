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
    [Table("Banks",Schema="dbo")]
    public partial class Bank
    {
		#region BankId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion BankId Annotations

        public short BankId { get; set; }

		#region BankName Annotations

        [Required]
        [MaxLength(50)]
		#endregion BankName Annotations

        public string BankName { get; set; }

		#region IFSCcode Annotations

        [Required]
        [MaxLength(30)]
		#endregion IFSCcode Annotations

        public string IFSCcode { get; set; }

		#region UserBankDetails Annotations

        [InverseProperty("Bank")]
		#endregion UserBankDetails Annotations

        public virtual ICollection<UserBankDetail> UserBankDetails { get; set; }


        public Bank()
        {
			UserBankDetails = new HashSet<UserBankDetail>();
        }
	}
}