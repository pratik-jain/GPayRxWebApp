import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class UserBankDetailBase {

//#region bankDetailId Prop
        @prop()
        bankDetailId : any;
//#endregion bankDetailId Prop


//#region bankId Prop
        @required()
        bankId : any;
//#endregion bankId Prop


//#region accountNumber Prop
        @required()
        accountNumber : any;
//#endregion accountNumber Prop


//#region balance Prop
        @required()
        balance : any;
//#endregion balance Prop


//#region gPayUserId Prop
        @required()
        gPayUserId : any;
//#endregion gPayUserId Prop


//#region addedStatus Prop
        @required()
        addedStatus : boolean;
//#endregion addedStatus Prop









}