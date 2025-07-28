public class OppRestrictionHandler
{
	public static void addRestriction(List<Opportunity> newOpList)
	{
		for(Opportunity opp:newOpList)
		{
			if(opp.StageName =='ClosedLost' || opp.StageName =='ClosedWon' )
			{
				Id userId=UserInfo.getUserId();
				if(opp.owner!=userId)
				{
					List<User> uId=[Select Id,manager,Profile.Name from user where Id= :opp.ownerId];
					if(userId!=uId[0].manager && uId[0].Profile.Name!='System Administator')
					{
							opp.addError('You cannot edit the record');
					}
				}
			]
		]
	}
}