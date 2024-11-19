<?php 
require_once("include/fonctions.php");
require_once("include/header.php");


if ($_SESSION['user_type'] !== "admin") {
    header("Location: http://localhost/siteweb/index.php");
}



$restos=getlistrestos();
?>
<div class="container">
<form action="include/menus.php" method="post" >
    <select class="form-select" name="restos">
        <option> selectionner le type</option>
    
    
        <?php foreach($restos as $resto): ?>

            <option value="<?= $resto["id_resto"] ?>"> <?= $resto["nom_resto"] ?> </option>


        <?php endforeach; ?>

    </select>

        <fieldset> 


    <label for="">Nom Entrée</label><br>
    <input name="nom_entree" type="text"><br>
    <label for="">Commentaire Entrée</label><br>
    <input name="commentaire_entree" type="text"><br>
    <label for="">Prix Entrée</label><br>
    <input name="prix_entree" type="number"><br>

    </fieldset>

    <fieldset> 

    <label for="">Nom Plats</label> <br>
    <input name="nom_plat" type="text">
    <br>
    <label for="">Commentaire Plats</label> <br>
    <input name="commentaire_plat" type="text">
    <br>
    <label for="">Prix Plats</label> <br>
    <input name="prix_plat" type="number">
    <br>

    </fieldset>

    <fieldset> 

    <label for="">Nom Desserts</label> <br>
    <input name="nom_dessert" type="text"><br>
    <label for="">Commentaire Desserts</label> <br>
    <input name="commentaire_dessert" type="text"><br>
    <label for="">Prix Desserts</label><br>
    <input name="prix_dessert" type="number"><br>

    </fieldset>


    <button type="submit" name="ajout_menus"class="btn btn-primary">Ajouter menus</button>
 
        </form>

