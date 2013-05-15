<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="sampleWebApp1._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
  <meta charset="utf-8" />
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>
</head>
<body>
    <form id="form1" runat="server">
  
        
    <div id="tabs">
  <ul>
    <li><a href="#tabs-1">Scores</a></li>
    <li><a href="#tabs-2">Attributes</a></li>
    <li><a href="#tabs-3">Reason codes</a></li>
  </ul>
  <asp:Label runat="server" ID="lblValue"></asp:Label>
  <div id="tabs-1">
   
  </div>
  <div id="tabs-2">
    
  </div>
  <div id="tabs-3">
   
  </div>
    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" UseSubmitBehavior="true" OnClick="btnSubmit" OnClientClick="javascript:getTabValue();" />
  
    </form>
</body>
</html>
