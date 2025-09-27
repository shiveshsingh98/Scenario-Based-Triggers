/*
when a new contact is created for a existing account then set contact otherphone as account phone.
*/
Trigger ContactTrigger2 on Contact(Before Insert)
{
	if(Trigger.isBefore && Trigger.isInsert)
	{
		ContactTriggerHandler2.populateOtherPhone(Trigger.new);
	}
}
