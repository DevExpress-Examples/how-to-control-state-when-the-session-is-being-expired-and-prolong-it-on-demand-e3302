<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
* [TimeoutControl.ascx](./CS/WebSite/TimeoutControl.ascx) (VB: [TimeoutControl.ascx](./VB/WebSite/TimeoutControl.ascx))
* [TimeOutPage.aspx](./CS/WebSite/TimeOutPage.aspx) (VB: [TimeOutPage.aspx](./VB/WebSite/TimeOutPage.aspx))
<!-- default file list end -->
# How to control state when the Session is being expired and prolong it on demand


<p>This example illustrates how to create a timeout control for web sites (similar to what banks and other financial institutions have) that will display a modal popup dialog displaying the time remaining before a session is timed out and redirected to a page explaining what happened:<br />
<a href="http://community.devexpress.com/blogs/aspnet/archive/2011/06/15/asp-net-how-to-show-a-popup-warning-before-session-timeout.aspx"><u>ASP.NET WebForms Blog Post</u></a><br />
<a href="http://community.devexpress.com/blogs/aspnet/archive/2011/07/11/asp-net-mvc-how-to-show-a-popup-warning-before-session-timeout-aspnetmvc.aspx"><u>ASP.NET MVC Blog Post</u></a></p><p>This example contains two solutions:<br />
The solution for v2010 vol 2.8+ versions - is an ASP.NET WebSite project.<br />
The solution for v2011 vol 1.12+ versions - is an ASP.NET WebApplication project.</p>


<h3>Description</h3>

<p>- The &quot;_popupTimer&quot; timer will be triggered when one minute remains before the Session expires, and displays the ASPxPopupControl with the countdown timer. The &quot;_countDownTimer&quot; timer is used for displaying the time before the Session expires.</p><p>- An end-user can click the &quot;OK&quot; button inside the ASPxPopupControl&#39;s Footer to prolong the Session by initiating a background callback, by using the &quot;KeepAliveHelper&quot; ASPxCallback control;</p><p>- If the Session expires (i.e. it has not been prolonged), the user is automatically redirected to the special page used for displaying what happened.</p>

<br/>


