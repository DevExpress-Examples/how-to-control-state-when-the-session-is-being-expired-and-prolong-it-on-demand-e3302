﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register src="TimeoutControl.ascx" tagname="TimeoutControl" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">     
        <p>
            A timeout warning popup will be shown every <%= Session.Timeout - 1 %> min.
        </p>   
        <uc1:TimeoutControl ID="TimeoutControl1" runat="server"  />        
    </form>
</body>
</html>
