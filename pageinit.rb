<script type="text/javascript">
$(document).on('pageinit', '#pageone', function () {

   
$.when(
   $.getScript("../workspace/qr/grid.js"),
   $.getScript("../workspace/qr/version.js"),
   $.getScript("../workspace/qr/detector.js"),
   $.getScript("../workspace/qr/formatinf.js"),
   $.getScript("../workspace/qr/errorlevel.js"),
   $.getScript("../workspace/qr/bitmat.js"),
   $.getScript("../workspace/qr/datablock.js"),
   $.getScript("../workspace/qr/bmparser.js"),
   $.getScript("../workspace/qr/datamask.js"),
   $.getScript("../workspace/qr/rsdecoder.js"),
   $.getScript("../workspace/qr/gf256poly.js"),
   $.getScript("../workspace/qr/gf256.js"),
   $.getScript("../workspace/qr/decoder.js"),
   $.getScript("../workspace/qr/qrcode.js"),
   $.getScript("../workspace/qr/findpat.js"),
   $.getScript("../workspace/qr/alignpat.js"),
   $.getScript("../workspace/qr/databr.js"),
    $.Deferred(function( deferred ){
        $( deferred.resolve );
    })
).done(function(){

var gCtx = null;
	var gCanvas = null;

	var imageData = null;
	var ii=0;
	var jj=0;
	var c=0;
	
	
function dragenter(e) {
  e.stopPropagation();
  e.preventDefault();
}

function dragover(e) {
  e.stopPropagation();
  e.preventDefault();
}
function drop(e) {
  e.stopPropagation();
  e.preventDefault();

  var dt = e.dataTransfer;
  var files = dt.files;

  handleFiles(files);
}

function handleFiles(f)
{
	var o=[];
	for(var i =0;i<f.length;i++)
	{
	  var reader = new FileReader();

      reader.onload = (function(theFile) {
        return function(e) {
          qrcode.decode(e.target.result);
        };
      })(f[i]);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f[i]);	}
}
	
function read(a)
{
	alert(a);
}	
	
function load()
{
	initCanvas(640,480);
	qrcode.callback = read;
	qrcode.decode("meqrthumb.png");
}

function initCanvas(ww,hh)
	{
		gCanvas = document.getElementById("qr-canvas");
		gCanvas.addEventListener("dragenter", dragenter, false);  
		gCanvas.addEventListener("dragover", dragover, false);  
		gCanvas.addEventListener("drop", drop, false);
		var w = ww;
		var h = hh;
		gCanvas.style.width = w + "px";
		gCanvas.style.height = h + "px";
		gCanvas.width = w;
		gCanvas.height = h;
		gCtx = gCanvas.getContext("2d");
		gCtx.clearRect(0, 0, w, h);
		imageData = gCtx.getImageData( 0,0,320,240);
	}

	function passLine(stringPixels) { 
		//a = (intVal >> 24) & 0xff;

		var coll = stringPixels.split("-");
	
		for(var i=0;i<320;i++) { 
			var intVal = parseInt(coll[i]);
			r = (intVal >> 16) & 0xff;
			g = (intVal >> 8) & 0xff;
			b = (intVal ) & 0xff;
			imageData.data[c+0]=r;
			imageData.data[c+1]=g;
			imageData.data[c+2]=b;
			imageData.data[c+3]=255;
			c+=4;
		} 

		if(c>=320*240*4) { 
			c=0;
      			gCtx.putImageData(imageData, 0,0);
		} 
 	} 

        function captureToCanvas() {
		flash = document.getElementById("embedflash");
		flash.ccCapture();
		qrcode.decode();
        }    
load();
</script>   