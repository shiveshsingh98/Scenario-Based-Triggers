/*
whenever the Account is created with Industry as Banking then create a contact for Account,Contact Lastname as Account name and contact phone as account phone.
*/

Trigger AccountTrigger4 on Account(After Insert)
{
	if(Trigger.isInsert && Trigger.isAfter)
	{
		AccountTriggerHandler4.createCon(Trigger.new);
	}
}