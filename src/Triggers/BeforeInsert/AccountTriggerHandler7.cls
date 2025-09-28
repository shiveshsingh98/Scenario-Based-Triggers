public class AccountTriggerHandler7
{
	public static void checkDuplicate(List<Account> accList)
	{
		List<String> accName=new List<String>();
		for(Account acc:accList)
		{
			accName.add(acc.Name);
		}
		Map<String,List<Id>> accNameMap=new Map<String,List<Id>>();
		for(Account acc:[Select Id, Name from Account where Name IN :accName])
		{
			if(accNameMap.containsKey(acc.Name))
			{
				accNameMap.get(acc.Name).add(acc.Id);
			}
			else
			{
				accNameMap.put(acc.Name,new List<Id>{acc.Id});
			}
		}
		for(Account acc:accList)
		{
			if(accNameMap.containsKey(acc.Name))
			{
				acc.addError('Account already present with this name');
			}
		}
	}
}