import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vBankAccountInformationBase {

//#region bankId Prop
        @gridColumn({visible: true, columnIndex:5, allowSorting: true, headerKey: 'bankId', keyColumn: false})
        bankId : any;
//#endregion bankId Prop


//#region userName Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'userName', keyColumn: false})
        userName : string;
//#endregion userName Prop


//#region mobileNumber Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'mobileNumber', keyColumn: false})
        mobileNumber : string;
//#endregion mobileNumber Prop


//#region accountNumber Prop
        @gridColumn({visible: true, columnIndex:6, allowSorting: true, headerKey: 'accountNumber', keyColumn: false})
        accountNumber : any;
//#endregion accountNumber Prop


//#region upiId Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'upiId', keyColumn: false})
        upiId : any;
//#endregion upiId Prop


//#region upiName Prop
        @gridColumn({visible: true, columnIndex:3, allowSorting: true, headerKey: 'upiName', keyColumn: false})
        upiName : string;
//#endregion upiName Prop


//#region upiPriority Prop
        @gridColumn({visible: true, columnIndex:4, allowSorting: true, headerKey: 'upiPriority', keyColumn: false})
        upiPriority : boolean;
//#endregion upiPriority Prop


//#region addedStatus Prop
        @gridColumn({visible: true, columnIndex:7, allowSorting: true, headerKey: 'addedStatus', keyColumn: false})
        addedStatus : boolean;
//#endregion addedStatus Prop


//#region gPayUserId Prop
        @gridColumn({visible: true, columnIndex:8, allowSorting: true, headerKey: 'gPayUserId', keyColumn: true})
        gPayUserId : any;
//#endregion gPayUserId Prop

}