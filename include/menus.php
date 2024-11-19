<?php
session_start();

require_once("connectdb.php");

if (isset($_POST["ajout_menus"])) {
    
    $nom_entree= $_POST["nom_entree"];
    $commentaire_entree= $_POST["commentaire_entree"];
    $prix_entree= $_POST["prix_entree"];

    $nom_plat= $_POST["nom_plat"];
    $commentaire_plat= $_POST["commentaire_plat"];
    $prix_plat= $_POST["prix_plat"];

    $nom_dessert= $_POST["nom_dessert"];
    $commentaire_dessert= $_POST["commentaire_dessert"];
    $prix_dessert= $_POST["prix_dessert"];

    $id_resto = $_POST["restos"];

    $db = connectdb();
    $request1 = $db->prepare("insert into entree (nom_entree, commentaire, prix, id_resto) values(?,?,?,?) ");
    $request2 = $db->prepare("insert into plats (nom_plat, commentaire_plat, prix, id_resto) values(?,?,?,?) ");
    $request3 = $db->prepare("insert into desserts (nom_dessert, commentaire_dessert, prix, id_resto) values(?,?,?,?) ");

    $request1 -> execute(array($nom_entree, $commentaire_entree, $prix_entree, $id_resto));
    $request2 -> execute(array($nom_plat, $commentaire_plat, $prix_plat, $id_resto));
    $request3 -> execute(array($nom_dessert, $commentaire_dessert, $prix_dessert, $id_resto));

    


    
    
    header("Location: http://localhost/siteweb/");
}

if (isset($_GET["suprimer"])) {
    $db = connectdb();
    $request = $db->prepare("delete from menus where id = ?");
    $request->execute(array($_GET["suprimer"]));
    header("Location: http://localhost/siteweb/");
}

