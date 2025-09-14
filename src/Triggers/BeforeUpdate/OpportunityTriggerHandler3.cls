public class OpportunityTriggerHandler3
{
	public static void closeError(List<Opportunity> oppList,Map<Id,Opportunity> oppMap)
	{
		Set<Id> caseSet=new Set<Id>();
		for(Opportunity opp:oppList)
		{
			if(opp.CaseId!=null && opp.Stage!=oppMap.get(opp.Id).Stage &&( opp.Stage=='Closed Won' || opp.Stage=='Closed Lost' ))
			{
				caseSet.add(opp.CaseId);
			}
		}
		if(caseSet.isEmpty()) return;

		List<Id> cList=new List<Id>();
		for(Case c:[Select Id, Status from Case where Id IN :caseSet])
		{
			if(c.Status!='Closed')
			{
				cList.add(c.Id);
			}
		}
		for(Opportunity opp:[Select Id, Stage,CaseId from Opportunity where CaseId IN :cList])
		{
			opp.addError('Can't close the opp');
		}
	}
}