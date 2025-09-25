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
		List<Contact> conDelete=new List<Contact>();
		Set<Id> accSet=new Set<Id>();
		Map<Id,List<Contact>> contactsMap=new Map<Id,List<Contact>>();
		for(Contact c:[Select Id, LastName,AccountId from Contact where AccountId IN :accList])
		{
			if(!contactsMap.containsKey(c.AccountId))
			{
				contactsMap.put(c.AccountId,new List<Contact>());
			}
			contactsMap.get(c.AccountId).add(c);
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
			//need to Improve
			if(oldValue>newValue)
			{
				num=oldValue - newValue;
				Integer numOfCon=oldValue;
				for(Integer n=numOfCon-1;n>newValue;n--)
				{
					String lname=acc.Name+n;
					for(Contact c:contactsMap.get(acc.Id))
					{
						if(c.LastName==lname)
						{
							conDelete.add(c);
						}
					}
					numOfCon--;
				}
			}
			else if(newValue>oldValue)
			{
				num=newValue - oldValue;
				Integer numOfCon1=oldValue;
				for(Integer n=numOfCon1;n<newValue;n++)
				{
					Contact c=new Contact();
					c.LastName=acc.Name+numOfCon1;
					c.AccountId=acc.Id;
					con.add(c);
					numOfCon1++;
				}
			}
			
			
		}
		if(!con.isEmpty())
		{
			insert con;
		}
		if(!conDelete.isEmpty())
		{
			delete conDelete;
		}
	}
}