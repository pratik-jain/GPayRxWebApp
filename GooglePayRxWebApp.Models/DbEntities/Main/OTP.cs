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
    [Table("OTPs",Schema="dbo")]
    public partial class OTP
    {
		#region OTPId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion OTPId Annotations

        public long OTPId { get; set; }

		#region OTPNumber Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion OTPNumber Annotations

        public int OTPNumber { get; set; }

		#region MobileNumber Annotations

        [Required]
        [MaxLength(50)]
		#endregion MobileNumber Annotations

        public string MobileNumber { get; set; }


        public OTP()
        {
        }
	}
}