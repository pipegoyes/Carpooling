<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Carpooling.WebForm1" %>

<%@ Register Assembly="Gaia.WebWidgets" Namespace="Gaia.WebWidgets" TagPrefix="gaia" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>    
    <script type="text/javascript" src="/Scripts/jquery-1.4.1.min.js"></script>
    
    <style type="text/css">
         .file_input_textbox
        {
	        float: left;
        }

        .file_input_div
        {
	        position: relative; 
	        width: 96px; 
	        height: 30px;
            background-color: red;
	        overflow: hidden;
        }

        .file_input_button
        {
	        width: 98px; 
	        position: absolute; 
	        top: 0px;
            right: 0;
	        background-color: #33BB00;
	        color: #FFFFFF;
	        border-style: solid;
            z-index: 0;
            cursor: pointer;
        }

        .file_input_hidden
        {
	        font-size: 45px; 
	        position: absolute; 
	        right: 0px; 
	        top: 0px; 
	        opacity: 1; 
	
	        filter: alpha(opacity=1); 
	        -ms-filter: "alpha(opacity=1)"; 
	        -khtml-opacity: 0; 
	        -moz-opacity: 0;            
        }       


    </style>

</head>
<body>    
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>        
    <div>

 
        

<%--<input type="text" id="fileName" class="file_input_textbox" readonly="readonly">--%>
 
<div class="file_input_div">
    
  
  <asp:AsyncFileUpload ID="AsyncFileUpload1" runat="server" style="height: 30px; cursor: pointer; position: absolute; top:0; right: 0; opacity: 0; z-index:9;"  ThrobberID="Image1"/>
    <input type="button" value="Search files" class="file_input_button" />
  <%--<input type="file" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value;" />--%>
    
    
</div>        
        <asp:Image ID="Image1" runat="server" ImageUrl="/Resources/uploading.gif"/>
        
        
        
        


    </div>
    </form>
</body>
</html>
