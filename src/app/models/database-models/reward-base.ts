import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class RewardBase {

//#region rewardId Prop
        @prop()
        rewardId : any;
//#endregion rewardId Prop


//#region userId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userId : number;
//#endregion userId Prop


//#region amount Prop
        @prop()
        amount : any;
//#endregion amount Prop


//#region scratchStatus Prop
        @required()
        scratchStatus : boolean;
//#endregion scratchStatus Prop


//#region transactionAmount Prop
        @required()
        transactionAmount : any;
//#endregion transactionAmount Prop



}