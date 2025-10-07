# Salesforce Trigger Scenarios

This file contains a list of all trigger-based scenario questions I have practiced so far.  
Each scenario can be implemented with a Trigger and Handler class.  

---

## ✅ Completed / Documented Scenarios

1. **Opportunity → Account Revenue Sync**  
   - On Opportunity creation, if Amount is not null, add it to Account Annual Revenue.  
   - On Opportunity update, adjust Account Annual Revenue.  
   - On Opportunity deletion, update Account Annual Revenue.  

2. **Account → Contact Count**  
   - Trigger to calculate the total number of Contacts an Account has.  

3. **Opportunity Products → Account Product Count** (Cognizant Interview Question)  
   - Count the total number of products (Opportunity Line Items) linked to an Account.  
   - Store count in `Number_of_Products__c` on Account.  

4. **Employee Salaries → Tech Firm Insights**  
   - Track highest and lowest salaries for each `Tech_Firm__c`.  
   - Update `Max_Salary__c` and `Min_Salary__c` from related `Employee__c` records.  

5. **Account → Largest Opportunity**  
   - Track the largest Opportunity associated with each Account in field `maxOpp__c`.  

6. **Account → Auto Create Contacts**  
   - When `Number_of_Locations__c` is set, auto-create that many Contacts for the Account.  

7. **Account → Banking Contact Creation**  
   - On Account creation with Industry = Banking, auto-create a Contact.  
   - Contact Last Name = Account Name, Phone = Account Phone.  

8. **Contact → Auto Create Account**  
   - When a Contact is created without an Account, auto-create an Account and link it.  

9. **Employee Undelete**  
   - When an Employee record is undeleted, set `Active__c = True`.  

10. **Account Website → Contact Sync**  
    - When Account Website is updated, update Website field on all child Contacts.  

11. **Account → Close All Opportunities** (Accenture Interview Question)  
    - If `Close_all_Opps__c = True` on Account, close all related open Opportunities as Won.  

12. **Account Billing Address → Contact Billing Sync**  
    - Update Billing Address of all related Contacts when Account’s Billing Address is updated.  

13. **Account Description Logic**  
    - Set description on Account creation.  
    - Update description if Account Phone is updated.  
    - Prevent deletion if Account is Active.  

14. **Account → Rating Based on Industry**  
    - If Industry is Banking or Healthcare, set Rating = Hot.  

15. **Contact → Mandatory Fields**  
    - Email and Phone must be mandatory on Contact insert/update.  

16. **Lead → Unique Email**  
    - Ensure Email on Lead is unique across all Lead records.  

17. **Account → Multi-action Trigger**  
    - If Industry = Media, set Rating = Hot (Before Insert/Update).  
    - On Account creation, auto-create an Opportunity (After Insert).  

18. **Account Phone → Sync and Audit**  
    - If Phone is updated, append update message in Description.  
    - Also update related Opportunities with the new Phone.  

19. **Employee → Deletion Restriction & Count**  
    - Prevent deletion if `Active__c = True`.  
    - On deletion, update Left Employee Count on related Account.  

20. **Contact Industry Sync**  
    - On Contact insert, if related to Account, populate Contact.Industry__c from Account.Industry.  

21. **Lead Modification Restriction**  
    - Prevent editing of a Lead if it was created more than 8 days ago.  

22. **Opportunity Closed State Restriction**  
    - If Opportunity is Closed Won/Lost, only Owner, Manager, or System Admin can edit.  

23. **Opportunity Stage → Auto Update Fields**  
	- When an Opportunity's Stage is updated to "Closed Won", the system should automatically set the Close Date to the current date and update the Type field to "New Customer".  
	
24. **Contact – Populate Other Phone from Account**
	- When a Contact is inserted or updated, if the related Account has a Phone number, populate the Contact’s Other Phone field with the Account Phone.
	
24. **Account Duplicate Restriction**
	- If a user tries to create an Account with a Name that already exists, block the creation and show an error message.
	
25. **Sync Shipping Address**
	- Your Company wants to ensure that the shipping address of an Account record is always in sync with the billing address
	
26. **Prevent Account Deletion**
	- Prevent an account from deleting with Trigger, if it has 2 or more contacts.
	
27. **Update Opportunity City**
	- Write a trigger to update City field in all related Opportunity, when City field is updated in Account.
	
28. **Account Contact Phone Sync**
	- Suppose you are a sales manager for a company that sells products to other businesses. Your team uses Salesforce to manage customer accounts and   contacts, and you want to ensure that all contacts associated with a particular account have the same phone number as the account.
	
29. **Task creation on Opportunity Amount > 10000**
	- Write an Apex trigger on the Opportunity object that performs two different actions based on whether the record is inserted or updated. When a new Opportunity is inserted with an Amount greater than 10,000, the trigger should automatically create a Task with the subject “Follow up on new high-value opportunity,” priority set to High, status as Not Started, and the due date set to tomorrow. Additionally, when an existing Opportunity is updated and the Amount field is changed to a value greater than 10,000, another Task should be created with the subject “Re-check updated high-value opportunity,” along with the same values for priority, status, and due date.
	
30. **Account Type Update on more than 5 Opp**
	- When an Account has more than 5 closed won Opportunities, update its Type to “VIP Customer”.
	
31. **Sync Industry with Child Account**
	- When a child Account’s Industry changes, update the parent Account’s Industry to match the child’s new Industry.
	
32. **Account Sum of Opportunities**
	- Whenever an Opportunity is inserted,updated, or deleted,update the parent Account's custom field Total_Opportunity_Amount__c with the sum of all related Opportunities' Amounts.