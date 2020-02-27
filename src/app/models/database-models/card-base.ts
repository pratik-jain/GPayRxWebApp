import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class CardBase {

//#region cardId Prop
        @prop()
        cardId : any;
//#endregion cardId Prop


//#region cardNumber Prop
        @required()
        cardNumber : any;
//#endregion cardNumber Prop


//#region nameOnCard Prop
        @required()
        @maxLength({value:20})
        nameOnCard : string;
//#endregion nameOnCard Prop


//#region expiryDate Prop
        @required()
        @maxLength({value:5})
        expiryDate : string;
//#endregion expiryDate Prop


//#region cVV Prop
        @required()
        @maxLength({value:3})
        cVV : string;
//#endregion cVV Prop


//#region bankDetailId Prop
        @required()
        bankDetailId : any;
//#endregion bankDetailId Prop



}