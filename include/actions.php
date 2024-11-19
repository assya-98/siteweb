<?php


require_once "connectdb.php";


function get_resto() {
    $db = connectdb();
    $request = $db -> prepare("select * from restos");
    $request -> execute();
    $restos = $request -> fetchAll();
    return $restos;
}

function get_menus($id_resto) {
    $db = connectdb();

    $get_dessert = $db -> prepare("select * from desserts where id_resto=?");
    $get_dessert -> execute(array($id_resto));
    $desserts = $get_dessert -> fetchAll();

    $get_entree = $db -> prepare("select * from entree where id_resto=?");
    $get_entree -> execute(array($id_resto));
    $entree = $get_entree -> fetchAll();

    $get_plat = $db -> prepare("select * from plats where id_resto=?");
    $get_plat -> execute(array($id_resto));
    $plats = $get_plat -> fetchAll();

    $menus = array(
        "entree" => $entree, 
        "plat" => $plats,
        "dessert" => $desserts
    );

    return $menus;




}

function getlist_menus() {
    $db = connectdb();

//     $get_dessert = $db -> prepare("SELECT 
//     restos.nom_resto AS nom_restaurant,
//     plats.nom_plat AS nom_plat,
//     desserts.nom_dessert AS nom_dessert,
//     entree.nom_entree AS nom_entree
// FROM 
//     restos
// JOIN 
//     plats ON restos.id_resto = plats.id_resto
// JOIN 
//     desserts ON restos.id_resto = desserts.id_resto
// JOIN 
//     entree ON restos.id_resto = entree.id_resto; ");
//     $get_dessert -> execute();
//     $menus = $get_dessert -> fetchAll();


    $get_dessert = $db -> prepare("select nom_dessert, desserts.id_resto, restos.id_resto, restos.nom_resto from desserts, restos where desserts.id_resto in (select id_resto from restos) ");
    $get_dessert -> execute();
    $desserts = $get_dessert -> fetchAll();

    $get_plat = $db -> prepare("select nom_plat, plats.id_resto, restos.id_resto, restos.nom_resto from plats, restos where plats.id_resto in (select id_resto from restos) ");
    $get_plat -> execute();
    $plat = $get_plat -> fetchAll();

    $get_entree = $db -> prepare("select nom_entree, entree.id_resto, restos.id_resto, restos.nom_resto from entree, restos where entree.id_resto in (select id_resto from restos) ");
    $get_entree -> execute();
    $entree = $get_entree -> fetchAll();

    $menus = array(
       "entree" => $entree, 
        "plat" => $plat,
        "dessert" => $desserts
    );

    return $menus;


    

}