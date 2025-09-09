/*
EveryTime an Account webseite is updated, update the website field on all its child Contacts.
*/
Trigger AccountTrigger3 on Account(After Update)
{
	if(Trigger.isAfter && Trigger.isUpdate)
	{
		AccountTriggerHandler3.updWebsite(Trigger.new,Trigger.oldMap);
	}
}