public class OpportunityTriggerHandler8
{
	public static void modifyCloseDate(List<Opportunity> oppList,Map<Id,Opportunity> oppMap)
	{
		List<OpportunityLineItem> oppLI =new List<OpportunityLineItem>();
		Set<Id> oppSet=new Set<Id>();
		Map<Id,Date> oppCloseDate=new Map<Id,Date>();
		for(Opportunity opp:oppList)
		{
			if(opp.CloseDate!=oppMap.get(opp.Id).CloseDate)
			{
				oppSet.add(opp.Id);
				oppCloseDate.put(opp.Id,opp.CloseDate);
			}
		}
		for(OpportunityLineItem oli:[Select Id,OpportunityId ,CloseDate from OpportunityLineItem where OpportunityId IN :oppSet])
		{
			oli.CloseDate=oppCloseDate.get(oli.OpportunityId);
			oppLI.add(oli);
		}
		if(!oppLI.isEmpty())
		{
			update oppLI;
		}
	}
}