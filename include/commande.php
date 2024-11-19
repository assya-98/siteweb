<?php

require_once "connectdb.php";

if(isset ($_POST["commander"])){
    $numero=$_POST["numero"];
    $adresse=$_POST["adresse"];
    $total = $_POST["total"];

    $numero_commande=date("YmdHis");
    

    //etablir la connexion avec la bd
    $bd = connectdb();
    $request = $bd->prepare("INSERT INTO `commandes`(`numero_commande`, `date_commande`, `adresse_livraison`, `statut_commande`, `total_commande`, `numéro_client`) VALUES (?,NOW(),?,?,?,?)");
    $request->execute(array($numero_commande, $adresse, "En cours", $total, $numero));

    echo '<p> Votre commande a ete passée avec succes! <a href="http://localhost/siteweb/index.php">retour vers la page principale</a> </p>' ;
}