import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class BankBase {

//#region bankId Prop
        @prop()
        bankId : any;
//#endregion bankId Prop


//#region bankName Prop
        @required()
        @maxLength({value:50})
        bankName : string;
//#endregion bankName Prop


//#region iFSCcode Prop
        @required()
        @maxLength({value:30})
        iFSCcode : string;
//#endregion iFSCcode Prop



}