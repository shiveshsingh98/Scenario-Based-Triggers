/*
Trigger on Contact which will create Account records whenever contact is created without an Account.
*/
Trigger ContactTrigger on Contact(After Insert)
{
	if(Trigger.isAfter && Trigger.isInsert)
	{
		ContactTriggerHandler.createAccount(Trigger.new);	
	}
}