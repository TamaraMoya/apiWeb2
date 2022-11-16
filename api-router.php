<?php
require_once './libs/Router.php';
require_once './app/controladores/controladorApi_perfumes.php';

$router = new Router();

$router->addRoute('perfumes', 'GET', 'ControladorApiPerfumes', 'traerPerfumes');
$router->addRoute('perfumes/:ID', 'GET', 'ControladorApiPerfumes', 'traerPerfume');
$router->addRoute('perfumes/:ID', 'DELETE', 'ControladorApiPerfumes', 'eliminarPerfume');
$router->addRoute('perfumes', 'POST', 'ControladorApiPerfumes', 'agregarPerfume');
$router->addRoute('perfumes/:ID', 'PUT', 'ControladorApiPerfumes', 'modificarPerfume'); 


$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);