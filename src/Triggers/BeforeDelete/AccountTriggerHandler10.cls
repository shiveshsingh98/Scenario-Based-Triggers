public class AccountTriggerHandler10
{
	public static void preventAccountDelete(List<Account> accList)
	{
		Set<Id> accSet=new Set<Id>();
		Set<Id> accWithContactSet=new Set<Id>();
		for(Account acc:accList)
		{
			accSet.add(acc.Id);
		}
		for(Contact con:[Select Id,AccountId from Contact where AccountId IN :accSet])
		{
			if(!accWithContactSet.contains(con.AccountId))
			{
				accWithContactSet.add(con.AccountId);
			}
			
		}
		for(Account acc:accList)
		{
			if(accWithContactSet.contains(acc.Id))
			{
				acc.addError('Account Cannot be deleted as it has related contact');
			}
		}
	}
}