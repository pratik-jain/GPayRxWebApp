using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using GooglePayRxWebApp.BoundedContext.SqlContext;
namespace GooglePayRxWebApp.Models.Main
{
    [Table("vAllTransactions",Schema="dbo")]
    public partial class vAllTransaction
    {

        public long SenderId { get; set; }


        public long ReciverId { get; set; }


        public double Amount { get; set; }


        public long TransactionId { get; set; }


        public System.DateTime SendDate { get; set; }


        public byte TransactionStatus { get; set; }


        public long UPIId { get; set; }


        public string Remarks { get; set; }


        public string MobileNumber { get; set; }


        public string UserName { get; set; }


        public long GPayUserId { get; set; }


        public vAllTransaction()
        {
        }
	}
}