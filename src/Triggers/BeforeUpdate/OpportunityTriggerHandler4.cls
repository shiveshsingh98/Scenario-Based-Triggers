public class OpportunityTriggerHandler4
{
	public static void checkStage(List<Opportunity> oppList, Map<Id,Opportunity> oppMap)
	{
		for(Opportunity opp:oppList)
		{
			if(opp.StageName!=oppMap.get(opp.Id).StageName && opp.StageName=='Closed Won')
			{
				opp.ClosedDate=Date.today();
				opp.Type='New Customer';
			}
		}
	}
}