<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<c:url var="res" value="/resources/"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LetterPop</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  </head>
  <body>
<!--     <h1>I wanna make a 'paper' on my website.</h1> -->
	
    <script src="${res }js/three.js"></script>
    <script type="text/javascript">
    	var scene = new THREE.Scene();
    	var camera = new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000);
    	
    	var renderer = new THREE.WebGLRenderer();
    	renderer.setSize(window.innerWidth, window.innerHeight);
    	document.body.appendChild(renderer.domElement);
    	
    	window.addEventListener('resize', function(){
    		var width = window.innerWidth;
    		var height = window.innerHeight;
    		renderer.setSize(width, height);
    		camera.aspect = width/height;
    		camera.updateProjectionMatrix();
    	});
    	
    	// create the shape
    	var geometry = new THREE.BoxGeometry(1,1,1);
    	
    	// create a material, colour or image texture
    	var material = new THREE.MeshBasicMaterial({color: 0xFFFFFF, wireframe: true});
    	var cube = new THREE.Mesh(geometry, material);
    	scene.add(cube);
    	
    	camera.position.z = 3;
    	// logic
    	var update = function(){
    		cube.rotation.x += 0.01;
    		cube.rotation.y += 0.005;
    	};
    	
    	// draw Scene
    	var render = function(){
    		renderer.render(scene, camera);
    	};
    	
    	// run loop(update, render... repeat)
    	var Loop = function(){
    		requestAnimationFrame(Loop);
    		
    		update();
    		render();
    	};
    	
    	Loop();
    </script>
  </body>
</html>