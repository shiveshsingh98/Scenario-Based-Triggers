/*
When a user tries to insert a new Contact, if the parent Account already has more than 5 Contacts, prevent the insert and show an error message:
“An Account cannot have more than 5 Contacts.”
*/

Trigger ContactTrigger3 on Contact(before Insert)
{
	if(Trigger.isBefore && Trigger.isInsert)
	{
		ContactTriggerHandler3.PreventContactCreation(Trigger.new);
	}
}