function lhide()
{
    document.all.dvunhide.style.display="block";
    document.all.dvhide.style.display="none";
     try
    {
        callHide();
    }
    catch(hideexception)
    {
        
    }
}
    
function lunhide()
{
    document.all.dvhide.style.display="block";
    document.all.dvunhide.style.display="none";
     try
    {
        callUHide();
    }
    catch(unhideexception)
    {
    }
}
