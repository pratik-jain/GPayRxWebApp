import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class UpiBase {

//#region upiId Prop
        @prop()
        upiId : any;
//#endregion upiId Prop


//#region upiName Prop
        @required()
        @maxLength({value:50})
        upiName : string;
//#endregion upiName Prop


//#region upiPin Prop
        @required()
        @maxLength({value:20})
        upiPin : string;
//#endregion upiPin Prop


//#region bankDetailId Prop
        @required()
        bankDetailId : any;
//#endregion bankDetailId Prop


//#region upiPriority Prop
        @required()
        upiPriority : boolean;
//#endregion upiPriority Prop





}