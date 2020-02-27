import {UserBankDetailBase} from '../database-models/user-bank-detail-base';
import {GpayUserBase} from '../database-models/gpay-user-base';
import {BankBase} from '../database-models/bank-base';
import {CardBase} from '../database-models/card-base';
import {UpiBase} from '../database-models/upi-base';
//Generated Imports
export class UserBankDetail extends UserBankDetailBase 
{




//#region Generated Reference Properties
//#region gpayUser Prop
gpayUser : GpayUserBase;
//#endregion gpayUser Prop
//#region bank Prop
bank : BankBase;
//#endregion bank Prop
//#region cards Prop
cards : CardBase[];
//#endregion cards Prop
//#region upis Prop
upis : UpiBase[];
//#endregion upis Prop

//#endregion Generated Reference Properties




}