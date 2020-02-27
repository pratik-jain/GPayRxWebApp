import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class UserTypeObjectBase {

//#region userTypeId Prop
        @prop()
        userTypeId : any;
//#endregion userTypeId Prop


//#region userTypeName Prop
        @required()
        @maxLength({value:20})
        userTypeName : string;
//#endregion userTypeName Prop



}