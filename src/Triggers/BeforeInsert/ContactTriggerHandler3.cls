Public class ContactTriggerHandler3
{
	public static void PreventContactCreation(List<Contact> conList)
	{
		Set<Id> accIds=new Set<Account>();
		for(Contact con:conList)
		{
			if(con.AccountId!=null)
			{
				accIds.add(con.AccountId);
			}
		}
		Map<Id,Integer> conCount=new Map<Id,Integer>();
		for(AggreagateResult ar:[Select Count(Id) cnt,AccountId from Contact where AccountId IN accIds GROUP BY AccountId])
		{
			conCount.put((Id)ar.get('AccountId'),(Integer)ar.get('cnt'));
		}
		for(Contact con : conList)
		{
			if(con.AccountId!=null && conCount.containsKey(con.AccountId) && conCount.get(con.AccountId)> 5)
			{
				con.addError('An Account cannot have more than 5 Contacts.');
			}
		}
		
	}
}