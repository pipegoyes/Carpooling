<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Carpooling.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>    


    <style>

    </style>
    
    <script src="/Scripts/jquery-1.8.2.min.js"></script>

    <script>     
        $(function () {
            $('#ddlMake').change(getModels);
            $('#ddlModel').attr('disabled', true);
            $('#ddlColour').attr('disabled', true);
        });
        
        function Prueba() {
            alert('Handler for .change() called.');
        };
        
        function getModels() {            
            var json = {};
            json.make = $('#ddlMake').val();

            $.ajax({
                type: "POST",
                url: "WebForm1.aspx/GetCarsByModel",
                data: JSON.stringify(json),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                beforeSend: function () {
                    $('#ddlModel').empty();
                    $('#ddlModel').append($('<option/>').attr('value', '').text('Loading Models...'));
                },
                success: function (results) {
                    $('#ddlModel').empty();
                    var models = results.d;
                    $('#ddlModel').attr('disabled', false).change(getColours);
                    $('#ddlModel').append($('<option/>').attr('value', '').text(' -- Select Model -- ')); 
                    $('#ddlColour').attr('disabled', true);
                    
                    for (var i = 0; i < models.length; i++) {
                        var val = models[i];
                        var text = models[i];
                        $('#ddlModel').append($('<option/>').attr('value', val).text(text));
                    }
                },
                error: function () {
                    alert("La busqueda no se pudo realzar");
                    return false;
                },
            });
        }
        
        function getColours() {
            $('#ddlColour').empty();
            
            $.ajax({
                type: "POST",
                url: "WebForm1.aspx/GetCarsByColour",
                data: "{make: '" + $('#ddlMake').val() + "', model: '" + $('#ddlModel').val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    var colours = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                    $('#ddlColour').attr('disabled', false).change(getCarListByColour);
                    $('#ddlColour').append(
                            $('<option/>')
                                .attr('value', '')
                                .text(' -- Select Colour -- '));

                    for (var i = 0; i < colours.length; i++) {
                        var val = colours[i];
                        var text = colours[i];
                        $('#ddlColour').append(
                            $('<option/>')
                                .attr('value', val)
                                .text(text));
                    }
                }
            });
        }
        
        function getCarListByColour() {
            $.ajax({
                type: "POST",
                url: "WebForm1.aspx/GetCarListByColour",
                data: "{make: '" + $('#ddlMake').val() + "', " +
                      "model: '" + $('#ddlModel').val() + "', " +
                      "colour: '" + $('#ddlColour').val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    var cars = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                    $('#output').empty();
                    for (var i = 0; i < cars.length; i++) {
                        $('#output').append('<p><strong>' + cars[i].Make + ' ' +
                                              cars[i].Model + '</strong><br /> Year: ' +
                                              cars[i].Year + '<br />Doors: ' +
                                              cars[i].Doors + '<br />Colour: ' +
                                              cars[i].Colour + '<br />Mileage: ' +
                                              cars[i].Mileage + '<br />Price: £' +
                                              cars[i].Price + '</p>');
                    }
                }
            });
        }


    </script>
</head>
<body>
    <form id="Form1" runat="server">
<div>
 <div>
   <p>
    <label>
      Please choose a Make:</label><br />
    <asp:DropDownList ID="ddlMake" runat="server" />
   </p>
 </div>
 <div>
  <p>
    <label>
      Please choose a Model:</label><br />
    <select id="ddlModel">
    </select></p>
 </div>
 <div>
  <p>
    <label>
      Please choose a Colour:</label><br />
    <select id="ddlColour">
    </select></p>
 </div>
 <div id="output"></div>

    <asp:Button ID="btnPublicar"  CssClass="rightPosition" OnClientClick="getModels();" Text="Publicar" runat="server"/>
</div>
    </form>
</body>
</html>
