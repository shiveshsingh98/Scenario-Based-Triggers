public class LeadTriggerHandler
{
	public static void noModify(List<lead> leadList)
	{
		for(Lead l:leadList)
		{
			if(l.createdDate.date()<Date.Today.addDays(-8))
			{
				l.addError('Cannot edit Lead');
			}
		}
	}
}