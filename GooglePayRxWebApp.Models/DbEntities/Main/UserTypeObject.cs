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
    [Table("UserTypeObjects",Schema="dbo")]
    public partial class UserTypeObject
    {
		#region UserTypeId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion UserTypeId Annotations

        public byte UserTypeId { get; set; }

		#region UserTypeName Annotations

        [Required]
        [MaxLength(20)]
		#endregion UserTypeName Annotations

        public string UserTypeName { get; set; }

		#region GpayUsers Annotations

        [InverseProperty("UserTypeObject")]
		#endregion GpayUsers Annotations

        public virtual ICollection<GpayUser> GpayUsers { get; set; }


        public UserTypeObject()
        {
			GpayUsers = new HashSet<GpayUser>();
        }
	}
}