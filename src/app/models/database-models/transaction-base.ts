import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class TransactionBase {

//#region transactionId Prop
        @prop()
        transactionId : any;
//#endregion transactionId Prop


//#region senderId Prop
        @required()
        senderId : any;
//#endregion senderId Prop


//#region reciverId Prop
        @required()
        reciverId : any;
//#endregion reciverId Prop


//#region amount Prop
        @required()
        amount : any;
//#endregion amount Prop


//#region sendDate Prop
        @required()
        sendDate : Date;
//#endregion sendDate Prop


//#region transactionStatus Prop
        @required()
        transactionStatus : any;
//#endregion transactionStatus Prop


//#region uPIId Prop
        @required()
        uPIId : any;
//#endregion uPIId Prop


//#region remarks Prop
        @required()
        remarks : string;
//#endregion remarks Prop









}