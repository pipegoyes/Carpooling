<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Carpooling.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>    
    <link href="Styles/fineuploader.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.8.2.min.js"></script> 
    <script src="Scripts/jquery.fineuploader/jquery.fineuploader-3.0.js"></script>
    
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.1.1/css/bootstrap.min.css" rel="stylesheet">

<style>
      /* Fine Uploader
      -------------------------------------------------- */
      .qq-upload-list {
          display: none;

        text-align: left;
      }
 
      /* For the bootstrapped demos */
      li.alert-success {
          display: none;
        background-color: #DFF0D8;
      }
 
      li.alert-error {
          display: none;
        background-color: #F2DEDE;
      }
 
      .alert-error .qq-upload-failed-text {
        display: /*inline*/ none;
      }
    </style>
    

    <script>     
        
    $(document).ready(function () {
            
            $('#fine-uploader').fineUploader({
                request: {
                    endpoint: 'FilesUploader.html'
                },
                text: {
                    uploadButton: 'Seleccionar'
                },
                multiple: false,
                acceptFiles: 'image/*',
                validation: {
                    allowedExtensions: ['jpeg', 'jpg', 'png', 'gif'],
                    sizeLimit: 102400000 // 50 kB = 50 * 1024 bytes
                },
                debug: true
            });
        

            $('#bootstrapped-fine-uploader').fineUploader({
                request: {
                    endpoint: 'FilesUploader.html'
                },
                text: {
                    uploadButton: '<i class="icon-upload icon-white"></i> Test me now and upload a file'
                },
                template: '<div class="qq-uploader span12">' +
                            '<pre class="qq-upload-drop-area span12"><span>{dragZoneText}</span></pre>' +
                            '<div class="qq-upload-button btn btn-success" style="width: auto;">{uploadButtonText}</div>' +
                            '<ul class="qq-upload-list" style="margin-top: 10px; text-align: center;"></ul>' +
                          '</div>',
                classes: {
                    success: 'alert alert-success',
                    fail: 'alert alert-error'
                },
                debug: true
            });
        });
        

    </script>
</head>
<body>
    <form id="Form1" runat="server">    
    <div>

            <div id="bootstrapped-fine-uploader"></div>    
        
                    <br/>

            <div id="fine-uploader"></div>    

        
        
    </div>
    </form>
</body>
</html>
