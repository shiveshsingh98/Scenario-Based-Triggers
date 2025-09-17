public class LeadTriggerHandler
{
	public static void checkEmailInsert(List<Lead> leadList)
	{
		Set<String> lSet=new Set<String>();
		for(Lead l:leadList)
		{
			if(l.Email!=null)
			{
				lSet.add(l.Email.trim().toLowerCase());
			}
		}
		if(lSet.isEmpty())return;
		Map<String,Decimal> emailMap=new Map<String,Decimal>();
		for(AggregateResult ar:[Select Count(Id) cnt,Email from Lead where Email In :lset GROUP BY Email])
		{
			emailMap.put((String)ar.get('Email').trim().toLowerCase(),(Decimal)ar.get('cnt'));
		}
		for(Lead l:[Select Id,Email from Lead where Email IN :lSet])
		{
			if(emailMap.get(l.Email.trim().toLowerCase())>0)
			{
				l.addError('Duplicate Email Found!');
			}
			
		}
	}
	
	public static void checkEmailUpdate(List<Lead> leadList,Map<Id,Lead> leadMap)
	{
		Set<String> lSet=new Set<String>();
		for(Lead l:leadList)
		{
			if(l.Email!=null && l.Email!=leadMap.get(l.Id).Email)
			{
				lSet.add(l.Email.trim().toLowerCase());
			}
		}
		if(lSet.isEmpty())return;
		Map<String,Decimal> emailMap=new Map<String,Decimal>();
		for(AggregateResult ar:[Select Count(Id) cnt,Email from Lead where Email In :lset GROUP BY Email])
		{
			emailMap.put((String)ar.get('Email').trim().toLowerCase(),(Decimal)ar.get('cnt'));
		}
		for(Lead l:[Select Id,Email from Lead where Email IN :lSet])
		{
			if(emailMap.get(l.Email.trim().toLowerCase())>1)
			{
				l.addError('Duplicate Email Found!');
			}
			
		}
	}
}