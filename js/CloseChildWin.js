var intervalID1 = setInterval(function() { closeChildWin(); }, 10000); 

function closeChildWin()
{

	if ( window.opener && !window.opener.closed ) 
	{}
	else
	{	 window.close()	}

}