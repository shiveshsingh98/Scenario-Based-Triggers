public class ContactTriggerHandler1
{
	public static void handleCount(List<Contact> conList)
	{
		List<Account> accList=new List<Account>();
		Set<Id> accId=new Set<Id>();
		Map<Id, Integer> conCount=new Map<Id,Integer>();
		for(Contact con:conList)
		{
			if(con.AccountId!=null)
			{
				accId.add(con.AccountId);
			}
		}
		for(AggregateResult ar:[Select Count(Id) cnt,AccountId from Contact where AccountId IN :accId GROUP BY AccountId])
		{
			conCount.put((Id)ar.get('AccountId'),(Integer)ar.get('cnt'));
		}
		for(Account acc:[Select Id, TotalContact__c from Account where Id IN :accId])
		{
			acc.TotalContact__c=conCount.get(acc.Id) ?? 0;
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
}