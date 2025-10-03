public class OpportunityTriggerHandler5
{
	public static void createTaskOnOppInsert(List<Opportunity> oppList)
	{
		List<Task> taskList=new List<Task>();
		for(Opportunity opp:oppList)
		{
			if(opp.Amount>10000)
			{
				Task t=new Task();
				t.whatId=opp.Id;
				t.Subject='Follow up on new high-value opportunity';
				t.Priority='High';
				t.Status='Not Started';
				t.DueDate=Date.TODAY().addDays(1);
				taskList.add(t);
			}
		}
		if(!taskList.isEmpty())
		{
			insert taskList;
		}
	}
	public static void createTaskOnOppUpdate(List<Opportunity> oppList, Map<Id,Opportunity> oppOldMap)
	{
		List<Task> taskList=new List<Task>();
		for(Opportunity opp:oppList)
		{
			if(opp.Amount!=oppOldMap.get(opp.Id).Amount && opp.Amount>10000)
			{
				Task t=new Task();
				t.whatId=opp.Id;
				t.Subject='Re-check updated high-value opportunity';
				t.Priority='High';
				t.Status='Not Started';
				t.DueDate=Date.TODAY().addDays(1);
				taskList.add(t);
			}
		}
		if(!taskList.isEmpty())
		{
			insert taskList;
		}
	}
}