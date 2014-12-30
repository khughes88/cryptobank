require 'sinatra'

set  :port, 8080
 


get '/mobile' do
 erb :mobile
end

__END__

@@mobile

<html>
 <head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.0/jquery.mobile-1.4.0.min.css" />
<link rel="stylesheet" href="http://demos.jquerymobile.com/1.4.0/theme-classic/theme-classic.css" />
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

    
<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>

  
 </head>
 <body>
    

    
<div data-role="page" id="pageone" data-theme="a">
 <script type="text/javascript">


    
   

</script>      

<script type="text/javascript">
$(document).on('pageinit', '#pageone', function () {
alert("init");
   
$.when(
   $.getScript("qr/grid.js"),
   $.getScript("qr/version.js"),
   $.getScript("qr/detector.js"),
   $.getScript("qr/formatinf.js"),
   $.getScript("qr/errorlevel.js"),
   $.getScript("qr/bitmat.js"),
   $.getScript("qr/datablock.js"),
   $.getScript("qr/bmparser.js"),
   $.getScript("qr/datamask.js"),
   $.getScript("qr/rsdecoder.js"),
   $.getScript("qr/gf256poly.js"),
   $.getScript("qr/gf256.js"),
   $.getScript("qr/decoder.js"),
   $.getScript("qr/qrcode.js"),
   $.getScript("qr/findpat.js"),
   $.getScript("qr/alignpat.js"),
   $.getScript("qr/databr.js"),
    $.Deferred(function( deferred ){
        $( deferred.resolve );
    })
).done(function(){
alert('loaded');
  var capture = null;
var image = null;

 /**
 * Show camera
 */
 function getImage()
 {
 capture = navigator.device.capture;
 capture.captureImage(getImageSuccess, getImageFailure);
 }

 function getImageFailure(error){
 alert('Something went wrong...');
 }

 function getImageSuccess(img){
 alert('gotImage');
 image = img;
 decodeImage();
 }
function alertDecodeResult(result){
 alert(result);
 }

 function decodeImage(){
 imagePath = image[0]['fullPath']
 qrcode.callback = alertDecodeResult;
 qrcode.decode(imagePath);
 }


});   
   
   
   

   

   
   
});     

</script>   
  
  
  <div data-role="header" data-theme="a">
    <h1>Insert Page Title Here</h1>
  </div>

	
<button onclick="getImage()">Scan It</button>
<canvas id="qr-canvas" width="640" height="480"></canvas>
  <div data-role="main" class="ui-content" data-theme="a">
    <p>Insert Content Here</p>
      <input type="file" accept="image/*;capture=camera">
  </div>
  <button class="ui-btn ui-corner-all" data-theme="a">Submit</button>
  <div data-role="footer" data-theme="a">
    <h1>Insert Footer Text Here</h1>
  </div>
</div> 
    
    
  
    

      
    
 </body>
</html>