using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using GooglePayRxWebApp.BoundedContext.SqlContext;
namespace GooglePayRxWebApp.Models.Main
{
    [Table("vBankAccountInformation",Schema="dbo")]
    public partial class vBankAccountInformation
    {

        public string UserName { get; set; }


        public string MobileNumber { get; set; }


        public long UpiId { get; set; }


        public string UpiName { get; set; }


        public bool UpiPriority { get; set; }


        public short BankId { get; set; }


        public long AccountNumber { get; set; }


        public bool AddedStatus { get; set; }

		#region GPayUserId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion GPayUserId Annotations

        public int GPayUserId { get; set; }


        public vBankAccountInformation()
        {
        }
	}
}