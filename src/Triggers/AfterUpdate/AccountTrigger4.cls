/*
Accenture Trigger Interview Question –
Business Use Case: Let’s say a sales rep is working on an account and marks the “Close_all_Opps__c” field as true. Without this trigger, they would have to manually go through each open opportunity for that account and close them as won, which can be time-consuming and prone to errors. With this trigger in place, the opportunities will be automatically closed as won if they meet the criteria specified in the code.
*/
Trigger AccountTrigger4 on Account(After Update)
{
	if(Trigger.isAfter && Trigger.isUpdate)
	{
		AccountTriggerHandler4.changeStage(Trigger.new,Trigger.oldMap);
	}
}