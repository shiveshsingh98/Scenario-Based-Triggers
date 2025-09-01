/*
Create a Trigger on Contact Object, To make the Email and Phone field mandatory upon creating or updating a contact record.
*/

Trigger ContactTrigger1 on Contact(Before Insert, Before Update)
{
	if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
	{
		ContactTriggerHandler1.checkEmailPhone(Trigger.new);
	}
}