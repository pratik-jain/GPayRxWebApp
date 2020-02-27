import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vAllTransactionBase {

//#region transactionId Prop
        @gridColumn({visible: true, columnIndex:4, allowSorting: true, headerKey: 'transactionId', keyColumn: false})
        transactionId : any;
//#endregion transactionId Prop


//#region senderId Prop
        @gridColumn({visible: true, columnIndex:5, allowSorting: true, headerKey: 'senderId', keyColumn: false})
        senderId : any;
//#endregion senderId Prop


//#region reciverId Prop
        @gridColumn({visible: true, columnIndex:7, allowSorting: true, headerKey: 'reciverId', keyColumn: false})
        reciverId : any;
//#endregion reciverId Prop


//#region amount Prop
        @gridColumn({visible: true, columnIndex:6, allowSorting: true, headerKey: 'amount', keyColumn: false})
        amount : any;
//#endregion amount Prop


//#region uPIId Prop
        @gridColumn({visible: true, columnIndex:10, allowSorting: true, headerKey: 'uPIId', keyColumn: false})
        uPIId : any;
//#endregion uPIId Prop


//#region remarks Prop
        @gridColumn({visible: true, columnIndex:11, allowSorting: true, headerKey: 'remarks', keyColumn: false})
        remarks : string;
//#endregion remarks Prop


//#region transactionStatus Prop
        @gridColumn({visible: true, columnIndex:9, allowSorting: true, headerKey: 'transactionStatus', keyColumn: false})
        transactionStatus : any;
//#endregion transactionStatus Prop


//#region sendDate Prop
        @gridColumn({visible: true, columnIndex:8, allowSorting: true, headerKey: 'sendDate', keyColumn: false})
        sendDate : any;
//#endregion sendDate Prop


//#region mobileNumber Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'mobileNumber', keyColumn: false})
        mobileNumber : string;
//#endregion mobileNumber Prop


//#region userName Prop
        @gridColumn({visible: true, columnIndex:3, allowSorting: true, headerKey: 'userName', keyColumn: false})
        userName : string;
//#endregion userName Prop


//#region gPayUserId Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'gPayUserId', keyColumn: false})
        gPayUserId : any;
//#endregion gPayUserId Prop

}