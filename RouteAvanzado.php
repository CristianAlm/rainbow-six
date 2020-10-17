<?php

    //require que tengo que cambiar
    
    require_once 'Controller/ciclistasController.php';
    //require_once 'Controller/loginController.php';
    require_once 'RouterClass.php';
    
    // CONSTANTES PARA RUTEO
    define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');
    


    $r = new Router();

    // rutas
    $r->addRoute("login", "GET", "ciclistasController", "Home");
    $r->addRoute("paraLogin", "GET", "ciclistasController", "manipularTabla");
    $r->addRoute("insert", "POST", "ciclistasController", "insertarCiclista");
    $r->addRoute("insert", "POST", "ciclistasController", "insertarEquipo");
    $r->addRoute("borrar/:ID", "GET", "ciclistasController", "deleteCiclista");
    $r->addRoute("editar/:ID", "GET", "ciclistasController", "editBase");
    $r->addRoute("paraEditar/:ID", "POST", "ciclistasController", "paraEditarCiclista");


    //$r->addRoute("login", "GET", "UserController", "Login");
    //$r->addRoute("logout", "GET", "UserController", "Logout");

    //$r->addRoute("verifyUser", "POST", "UserController", "VerifyUser");


    //Ruta por defecto.
    $r->setDefaultRoute("ciclistasController", "Home");

    //run
    $r->route($_GET['action'], $_SERVER['REQUEST_METHOD']); 
?>