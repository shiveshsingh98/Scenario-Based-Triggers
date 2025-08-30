public class ContactTriggerHandler
{
	private static Boolean flag=false;
	public static void createAccount(List<Contact> conList)
	{
		if(flag==false)
		{
			flag=true;
			List<Account> accList=new List<Account>();
			List<Contact> conwithoutAccList=new List<Contact>();
			for(Contact con:conList)
			{
				if(con.AccountId==null)
				{
					Account acc=new Account();
					acc.Name=con.LastName!=null?con.LastName:'New Account';
					acc.Phone=con.Phone;
					accList.add(acc);
					conwithoutAccList.add(con);
				}
			}
			if(!accList.isEmpty())
			{
				insert accList;
				List<Contact> contactList=new List<Contact>();
				for(Integer i=0;i<conwithoutAccList.size();i++)
				{
					Contact c=new Contact(Id=conwithoutAccList[i].Id);
					c.AccountId=accList[i].Id;
					contactList.add(c);
					
				}
				if(!contactList.isEmpty())
				{
					update contactList;
				}
			}
		}
	}
	
}