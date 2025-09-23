public class AccountTriggerHandler6
{
	public static void createConOnInsert(List<Account> accList)
	{
		List<Contact> con=new List<Contact>();
		Set<Id> accSet=new Set<Id>();
		for(Account acc: accList)
		{
			if(acc.Number_of_Locations__c!=null)
			{
				accSet.add(acc.Id);
			}
		}
		for(Account acc:[Select Id,Name,Number_of_Locations__c from Account where Id IN :accSet])
		{
			
			for(Integer n=0;n<acc.Number_of_Locations__c;n++)
			{
				Contact c=new Contact();
				c.LastName=acc.Name+n;
				c.AccountId=acc.Id;
				con.add(c);
			}
		}
		if(!con.isEmpty())
		{
			insert con;
		}
	}
	
	public static void createConOnUpdate(List<Account> accList,Map<Id,Account> accMap)
	{
		List<Contact> con=new List<Contact>();
		Set<Id> accSet=new Set<Id>();
		Map<Id,List<Contact>> contactsMap=new Map<Id,List<Contact>();
		for(Contact c:[Select Id, LastName,AccountId from Contact where AccountId IN :accList])
		{
			if(contactsMap.containsKey(c.AccountId)
			{
				
			}
		}
		for(Account acc: accList)
		{
			if(acc.Number_of_Locations__c!=null && acc.Number_of_Locations__c!=accMap.get(acc.Id).Number_of_Locations__c)
			{
				accSet.add(acc.Id);
			}
		}
		for(Account acc:[Select Id,Name,Number_of_Locations__c from Account where Id IN :accSet])
		{
			Integer oldValue=accMap.get(acc.Id).Number_of_Locations__c;
			Integer newValue=acc.Number_of_Locations__c;
			Integer biggerValue=0;
			Integer num=0;
			if(oldValue>newValue)
			{
				num=oldValue - newValue;
				Integer numOfCon=oldValue;
				for(Integer n=newValue-1;n<num;n++)
				{
					Contact c=new Contact();
					c.LastName=acc.Name+numOfCon;
					c.AccountId=acc.Id;
					con.add(c);
					numOfCon++;
				}
			}
			else if(newValue>oldValue)
			{
				num=newValue - oldValue;
				Integer numOfCon=newValue;
				for(Integer n=0;n<num;n++)
				{
					Contact c=new Contact();
					c.LastName=acc.Name+numOfCon;
					c.AccountId=acc.Id;
					con.add(c);
					numOfCon++;
				}
			}
			
			
		}
		if(!con.isEmpty())
		{
			insert con;
		}
	}
}


7
5