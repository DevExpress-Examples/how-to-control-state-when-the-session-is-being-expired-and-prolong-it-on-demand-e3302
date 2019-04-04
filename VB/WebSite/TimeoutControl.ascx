<%@ Control Language="vb" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<script runat="server">

	Public TimeOutUrl As String = ""

	Public ReadOnly Property PopupShowDelay() As Integer
		Get
			Return 60000 * (Session.Timeout - 1)
		End Get
	End Property

	Protected ReadOnly Property QuotedTimeOutUrl() As String
		Get
			Return """"c + ResolveClientUrl(TimeOutUrl).Replace("""", "\""") & """"c
		End Get
	End Property

</script>

<script type="text/javascript">

	window.SessionTimeout = (function() {
		var _timeLeft, _popupTimer, _countDownTimer;

		var stopTimers = function() {
			window.clearTimeout(_popupTimer);
			window.clearTimeout(_countDownTimer);
		};

		var updateCountDown = function() {
			var min = Math.floor(_timeLeft / 60);
			var sec = _timeLeft % 60;
			if(sec < 10)
				sec = "0" + sec;

			document.getElementById("CountDownHolder").innerHTML = min + ":" + sec;

			if(_timeLeft > 0) {
				_timeLeft--;
				_countDownTimer = window.setTimeout(updateCountDown, 1000);
			} else  {
				document.location = <%=QuotedTimeOutUrl%>;
			}            
		};

		var showPopup = function() {
			_timeLeft = 60;
			updateCountDown();
			ClientTimeoutPopup.Show();
		};

		var schedulePopup = function() {       
			stopTimers();
			_popupTimer = window.setTimeout(showPopup, <%=PopupShowDelay%>);
		};

		var sendKeepAlive = function() {
			stopTimers();
			ClientTimeoutPopup.Hide();
			ClientKeepAliveHelper.PerformCallback();
		};

		return {
			schedulePopup: schedulePopup,
			sendKeepAlive: sendKeepAlive
		};

	})();    

</script>

<dx:ASPxPopupControl runat="server" ID="TimeoutPopup" ClientInstanceName="ClientTimeoutPopup"
	CloseAction="None" HeaderText="Session Expiring" Modal="True" PopupHorizontalAlign="WindowCenter"
	PopupVerticalAlign="WindowCenter" ShowCloseButton="False" Width="250px" ShowFooter="true" AllowDragging="true">
	<ContentCollection>
		<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
			Your session is about to expire!
			<br /><br />
			<span id="CountDownHolder"></span>
			<br /><br />
			Click OK to continue your session.
		</dx:PopupControlContentControl>
	</ContentCollection>
	<FooterTemplate>
		<dx:ASPxButton runat="server" ID="OkButton" Text="OK" AutoPostBack="false">
			<ClientSideEvents Click="SessionTimeout.sendKeepAlive" />
		</dx:ASPxButton>
	</FooterTemplate>
	<FooterStyle>
		<Paddings Padding="5" />
	</FooterStyle>
</dx:ASPxPopupControl>

<dx:ASPxGlobalEvents runat="server" ID="GlobalEvents">
	<ClientSideEvents ControlsInitialized="SessionTimeout.schedulePopup" />
</dx:ASPxGlobalEvents>

<dx:ASPxCallback runat="server" ID="KeepAliveHelper" ClientInstanceName="ClientKeepAliveHelper">
</dx:ASPxCallback>