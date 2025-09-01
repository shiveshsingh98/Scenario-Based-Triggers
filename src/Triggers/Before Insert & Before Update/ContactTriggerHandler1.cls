public class ContactTriggerHandler1
{
	public static void checkEmailPhone(List<Contact> conlist)
	{
		for(Contact con:conList)
		{
			String errmsg='';
			if(String.isBlank(con.Phone))
			{
				errmsg+='Populate Phone to proceed. ';
			
			}
			if(String.isBlank(con.Email))
			{
				errmsg+='Populate Email to proceed. ';
			}
			if(!String.isBlank(errmsg))
			{
				con.addError(errmsg);
			}
			
		}
	}
}