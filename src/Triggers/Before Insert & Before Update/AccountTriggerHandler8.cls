public class AccountTriggerHandler8
{
	public static void syncAddress(List<Account> accList)
	{
		for(Account acc:accList)
		{
				acc.ShippingStreet=acc.BillingStreet;
				acc.ShippingCity=acc.BillingCity;
				acc.ShippingPostalCode=acc.BillingPostalCode;
				acc.ShippingState=acc.BillingState;
				acc.ShippingCountry=acc.BillingCountry;
		}
	}
	public static void syncAddressOnUpdate(List<Account> accList,Map<Id,Account> accOldMap)
	{
		for(Account acc:accList)
		{
			if(acc.BillingStreet!=accOldMap.get(acc.Id).BillingStreet ||
				acc.BillingCity!=accOldMap.get(acc.Id).BillingCity ||
				acc.BillingPostalCode!=accOldMap.get(acc.Id).BillingPostalCode ||
				acc.BillingState!=accOldMap.get(acc.Id).BillingState ||
				acc.BillingCountry!=accOldMap.get(acc.Id).BillingCountry )
			{
				acc.ShippingStreet=acc.BillingStreet;
				acc.ShippingCity=acc.BillingCity;
				acc.ShippingPostalCode=acc.BillingPostalCode;
				acc.ShippingState=acc.BillingState;
				acc.ShippingCountry=acc.BillingCountry;
			}
		}
	}
}