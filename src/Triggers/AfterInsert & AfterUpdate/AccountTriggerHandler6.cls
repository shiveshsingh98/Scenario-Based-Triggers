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
		for(Account acc: accList)
		{
			if(acc.Number_of_Locations__c!=null && acc.Number_of_Locations__c!=accMap.get(acc.Id).Number_of_Locations__c)
			{
				accSet.add(acc.Id);
			}
		}
		for(Account acc:[Select Id,Name,Number_of_Locations__c from Account where Id IN :accSet])
		{
			Integer num=accMap.get(acc.Id).Number_of_Locations__c - acc.Number_of_Locations__c;
			Integer numOfCon=accMap.get(acc.Id).Number_of_Locations__c;
			for(Integer n=0;n<acc.num;n++)
			{
				Contact c=new Contact();
				c.LastName=acc.Name+numOfCon;
				c.AccountId=acc.Id;
				con.add(c);
				numOfCon++;
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