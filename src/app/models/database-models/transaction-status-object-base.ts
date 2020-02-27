import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class TransactionStatusObjectBase {

//#region transactionStatusId Prop
        @prop()
        transactionStatusId : any;
//#endregion transactionStatusId Prop


//#region transactionName Prop
        @required()
        @maxLength({value:10})
        transactionName : string;
//#endregion transactionName Prop



}