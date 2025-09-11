public class AccountTriggerHandler4
{
	public static void changeStage(List<Account> accList, Map<Id,Account> accMap)
	{
		List<Opportunity> oppList=new List<Opportunity>();
		Set<Id> accSet=new Set<Id>();
		for(Account acc:accList)
		{
			if(acc.Close_all_Opps__c!=accMap.get(acc.Id).Close_all_Opps__c && acc.Close_all_Opps__c)
			{
				accSet.add(acc.Id);
			}
		}
		for(Opportunity opp:[Select Id, StageName,AccountId from Opportunity where AccountId IN :accSet AND IsClosed=false])
		{
			opp.StageName='Closed Won';
			oppList.add(opp);
		}
		if(!oppList.isEmpty())
		{
			update oppList;
		}
	}
}