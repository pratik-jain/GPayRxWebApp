import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class GpayUserBase {

//#region gPayUserId Prop
        @prop()
        gPayUserId : number;
//#endregion gPayUserId Prop


//#region mobileNumber Prop
        @required()
        @maxLength({value:50})
        mobileNumber : string;
//#endregion mobileNumber Prop


//#region userName Prop
        @required()
        @maxLength({value:50})
        userName : string;
//#endregion userName Prop


//#region password Prop
        @required()
        @maxLength({value:50})
        password : string;
//#endregion password Prop


//#region userTypeId Prop
        @required()
        userTypeId : any;
//#endregion userTypeId Prop


//#region emailId Prop
        @required()
        @maxLength({value:50})
        emailId : string;
//#endregion emailId Prop











}