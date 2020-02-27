using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using GooglePayRxWebApp.BoundedContext.SqlContext;
namespace GooglePayRxWebApp.Models.Log
{
    [Table("AuditRequests", Schema = "dbo")]
    public partial class AuditRequest
    {
        #region AuditRequestId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
        #endregion AuditRequestId Annotations

        public int AuditRequestId { get; set; }

        #region TraceIdentifier Annotations

        [Required]
        [MaxLength(50)]
        #endregion TraceIdentifier Annotations

        public string TraceIdentifier { get; set; }

        #region KeyId Annotations

        [Range(1, int.MaxValue)]
        [Required]
        #endregion KeyId Annotations

        public int KeyId { get; set; }


        public Nullable<int> CompositeKeyId { get; set; }

        #region AuditRecords Annotations

        [InverseProperty("AuditRequest")]
        #endregion AuditRecords Annotations

        public virtual ICollection<AuditRecord> AuditRecords { get; set; }


        public AuditRequest()
        {
            AuditRecords = new HashSet<AuditRecord>();
        }
    }
}