<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>CTI Canarias</title>
<meta charset="utf-8"> <!-- ISO-8859-1 -->
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="icon" href="http://www.cticanarias.com/images/logo_cuadrado_nuevo.png">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	
    <!-- CSS content -->
<style>
	body, html {
	  height: 100%;
	  margin: 0;
	  font-family: Arial, Helvetica, sans-serif;
	}
	
	.p1{
		color: #88b3ba;
		text-shadow: -1px 0 #454545, 0 1px #454545, 1px 0 #454545, 0 -1px #454545;
	  	font-family: Helvetica;
		font-size:100px
		
	}
	
	.p2{
		font-family: Helvetica;
		font-size:50px;
		text-align: center;
	}
	
	h3 {
		text-align: center;
		font-weight:bold
	}
	
	.center {
	  display: block;
	  margin-left: auto;
	  margin-right: auto;
	  width: 50%;
	}
	
	* {
	  box-sizing: border-box;
	}

	.bg-image { 
	  /* The image used */
	  background-image: url("https://www.ideamotive.co/hubfs/photo-1454165804606-c3d57bc86b40.jpeg");
	  
	  /* Add the blur effect */
	  filter: blur(8px);
	  -webkit-filter: blur(8px);
	  
	  /* Full height */
	  height: 100%; 
	  
	  /* Center and scale the image nicely */
	  background-position: center;
	  background-repeat: no-repeat;
	  background-size: cover;
		}

	/* Position text in the middle of the page/image */
	.bg-text {
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0, 0.0); /* Black w/opacity/see-through */
	  color: white;
	  font-weight: bold;
	  /*border: 3px solid #f1f1f1;*/
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  z-index: 2;
	  width: 100%;
	  padding: 20px;
	  text-align: center;
		}
		
	 .bottom-img{
	 	  width:100%;
		  position: absolute;
		  top: 0;
		  left: 0;
		  bottom: 0;
		  right: 0;
		  width: auto; /* to keep proportions */
		  height: auto; /* to keep proportions */
		  max-width: 100%; /* not to stand out from div */
		  max-height: 100%; /* not to stand out from div */
		  margin: auto auto 0; /* position to bottom and center */
		}

	 #services{
	 		padding:80px 0;
	 }
	
	.service-img{
			width: 100px;
			margin-top: 20px;
	}
	
	
	
	 }
	 

}


</style>
</head>
<body>
<nav class="navbar">
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <!-- Para cargar colores <div class="navbar">-->
    <div class="navbar-header">
    <!-- Image and text -->
      <img src="http://www.cticanarias.com/images/logo_cuadrado_nuevo.png" width="30" height="30" class="d-inline-block align-top" alt="">
    <a class="navbar-brand" href="#">CTI Canarias</a>
    </div>
    <ul class="nav navbar-nav navbar-right">      
    
      <li><a href="#"><button class="btn"><i class="fa fa-home"></i></button></a></li>
      <li><a href="#">NOSOTROS</a></li>
      <li><a href="#">SERVICIOS</a></li>
      <li><a href="#">PROYECTOS</a></li>
      <li><a href="#">LOCALIZACIÓN</a></li>
      <li><a href="#"><button type="button" class="btn btn-primary">CONTÁCTANOS</button></a></li>
    </ul>
    </div>
</nav>

<div class="bg-image">
<img src="https://www.pngkey.com/png/full/516-5161226_social-media-management-management.png" class="bottom-img"  >
</div>

<div class="bg-text">
  <img src="http://www.cticanarias.com/images/logo_cuadrado_nuevo.png" width="150" height="150" >
  <p class="p1">CTI Canarias</p>
</div>

<!-- ------------Sobre nosotros -------------- -->

<section id="nosotros">
<p class="p2">SOBRE NOSOTROS</p>

<div class="container">
<div class="row">
	<div class="col-md-4 services">
	<p style="text-align:center;"><img src="https://upload.wikimedia.org/wikipedia/commons/6/6d/Windows_Settings_app_icon.png" class="service-img"></p>
	<h4><span class="glyphicon glyphicon-ok">Somos expertos en Desarrollo (Gestión Comercial, Gestión Contable, ...).</span></h4>
	</div>
	
	<div class="col-md-4 services">
	<p style="text-align:center;"><img src="https://upload.wikimedia.org/wikipedia/commons/6/6d/Windows_Settings_app_icon.png" class="service-img"></p>
	<h4><span class="glyphicon glyphicon-ok">Servicios informáticos integrales tanto a empresas como a particulares.</span></h4>
	</div>
	
	<div class="col-md-4 services">
	<p style="text-align:center;"><img src="https://upload.wikimedia.org/wikipedia/commons/6/6d/Windows_Settings_app_icon.png" class="service-img"></p>
	<h4><span style="font-family:verdana" class="glyphicon glyphicon-ok">Nos adaptamos a tus necesidades o las de tu negocio</span></h4>
	</div>
	</div>
	</div>
	
</section>

	<p class="p2">¿QUÉ HACEMOS?</p>
	

</body>
</html>

