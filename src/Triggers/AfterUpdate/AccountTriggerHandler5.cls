public class AccountTriggerHandler5
{
	public static void updateBillingAdd(List<Account> accList,Map<Id,Account> accMap)
	{
		List<Contact> conList=new List<Contact>();
		Set<Id> accIds=new Set<Id>();
		for(Account acc:accList)
		{
			if(acc.BillingStreet !=accMap.get(acc.Id).BillingStreet || 
			acc.BillingCity    !=accMap.get(acc.Id).BillingCity    ||
			acc.BillingState   !=accMap.get(acc.Id).BillingState   ||
			acc.BillingPostalCode != accMap.get(acc.Id).BillingPostalCode ||
			acc.BillingCountry  !=accMap.get(acc.Id).BillingCountry )
			{
				accIds.add(acc.Id);
			}
		}
		for(Contact con : [Select Id,Account.BillingStreet, Account.BillingCity, Account.BillingState,
                   Account.BillingPostalCode, Account.BillingCountry,MailingCountry,MailingState,MailingPostalCode,
				   MailingCity,MailingStreet from Contact where AccountId IN :accIds])
		{
			con.MailingStreet=con.Account.BillingStreet;
			con.MailingCity=con.Account.BillingCity;
			con.MailingState=con.Account.BillingState;
			con.MailingCountry=con.Account.BillingCountry;
			con.MailingPostalCode=con.Account.BillingPostalCode;
			conList.add(con);
		}
		if(!conList.isEmpty())
		{
			update conList;
		}
	}
}