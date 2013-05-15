<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testPage.aspx.cs" Inherits="testApplication1.testPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title></title>

    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>

    <link href="CSS/jquery.selectbox.css" rel="stylesheet" type="text/css" />

    <script src="Scripts/jquery.selectbox-0.2.js" type="text/javascript"></script>

    <script src="Scripts/jquery.selectbox-0.2.min.js" type="text/javascript"></script>

    <script src="Scripts/jquery-ui.js" type="text/javascript"></script>

    <link href="CSS/jquery-ui.css" rel="stylesheet" type="text/css" />

    <script src="Scripts/jQDateRangeSlider-withRuler-min.js" type="text/javascript"></script>

    <link href="CSS/iThing.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        $(function() {
            $("select").selectbox();
            $("#radio").buttonset();
            $("#btnSubmit").button();
            $("input:radio[name=radio]").click(function() {

                var radioSelected = $("#radio :radio:checked + label").text();
                //alert(radioSelected);

            });
            $("#btnSubmit").click(function() {
                var modelValue = $("#model_id option:selected").val();
                //alert(modelValue);
                //var prevDate = $("#dateSlider").dateRangeSlider("option", "bounds");
                var prevDate = $("#dateSlider").dateRangeSlider("bounds");
                //var prevDate = $("div.ui-rangeSlider-label ui-rangeSlider
                alert(prevDate.min.toString());


            });

            var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];
            $("#dateSlider").dateRangeSlider({
                bounds: { min: new Date(2012, 0, 1), max: new Date(2012, 11, 31, 12, 59, 59) },
                defaultValues: { min: new Date(2012, 1, 10), max: new Date(2012, 4, 22) },
                scales: [{
                    first: function(value) { return value; },
                    end: function(value) { return value; },
                    next: function(value) {
                        var next = new Date(value);
                        return new Date(next.setMonth(value.getMonth() + 1));
                    },
                    label: function(value) {
                        return months[value.getMonth()];
                    },
                    format: function(tickContainer, tickStart, tickEnd) {
                        tickContainer.addClass("myCustomClass");
                    }
}]
                });
            });
            
       
        
    </script>

    <style type="text/css">
        label
        {
            width: 200px;
        }
        #radio
        {
            background-color: #2d2d2d;
        }
    </style>
</head>
<body style="margin-left: auto; margin-right: auto; margin-top: 10%; width: 100%">
    <form id="form1" runat="server">
    <table width="100%">
        <tr>
            <td>
                <div id="radio" align="center">
                    <table>
                        <tr>
                            <td>
                                <input type="radio" id="radioScores" name="radio" /><label for="radioScores">Scores</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" id="radioAttrs" name="radio" checked="checked" /><label for="radioAttrs">Attributes</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" id="radioReasonCodes" name="radio" /><label for="radioReasonCodes">Reason
                                    Codes</label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td>
                <div width="50%" align="center">
                    <select name="selModel" id="model_id" tabindex="1">
                        <option value="">Model </option>
                        <option value="RiskView">Risk View</option>
                        <option value="FraudPoint">Fraud Point</option>
                        <option value="LeadIntegrity">Lead Integrity</option>
                    </select>
                    <select name="selVersion" id="version" tabindex="2">
                        <option value="">Version</option>
                        <option value="4.0">4.0</option>
                        <option value="3.0">3.0</option>
                    </select>
                    <select name="selMode" id="mode_id" tabindex="3">
                        <option value="">Mode</option>
                        <option value="XML">XML</option>
                        <option value="Batch">Batch</option>
                    </select>
                    <select name="selEnv" id="env_id" tabindex="4">
                        <option value="">Environment</option>
                        <option value="Cert">Cert</option>
                        <option value="Prod">Prod</option>
                    </select>
                    <select name="selRestriction" id="restriction_id" tabindex="5">
                        <option value="">Restriction</option>
                        <option value="FCRA">FCRA</option>
                        <option value="Non-FCRA">Non-FCRA</option>
                    </select>
                    <select name="selCustomer" id="customer_id" tabindex="6">
                        <option value="">Customer</option>
                        <option value="Generic">Generic</option>
                    </select>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="dateSlider" style="width: 50%; margin-top: 5%; margin-bottom:10%" align="center">
                </div>
            </td>
        </tr>
        <tr style="margin-top:15%">
            <td colspan="2">
            
                <asp:Button ID="btnSubmit" Text="Submit" runat="server" Width="50%" />
                
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
