<?php

session_start ();

require_once "include/actions.php";

if ($_SESSION['user_type'] !== "admin") {
    header("Location: http://localhost/siteweb/index.php");
}

 $listmenus = getlist_menus();
echo "<pre>";
 print_r ($listmenus);
echo "<pre>";
 ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
<table>
    <thead>
        <tr>
            <th>
                Nom Dessert
            </th>
            <th>
                Nom de l'entrée
            </th>
            <th>
                Nom du Plat
            </th>
            <th>
                Nom du resto
            </th>
            <th>
                action
            </th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($listmenus["plat"] as $key => $list):?>
            <tr>
                <td>
                 <?= $listmenus["dessert"] [$key] ["nom_dessert"]?>
                </td>

                <td>
                 <?= $listmenus["plat"]  [$key] ["nom_plat"]?>
                </td>

                <td>
                 <?= $listmenus["entree"]  [$key] ["nom_entree"]?>
                </td>

                <td>
                 <?= $listmenus["plat"] [$key]  ["nom_resto"]?>
                </td>

                <td>
                    <a href="include/supmenus.php?id=<?= $listmenus["plat"]  [$key] ["id_resto"]?>"> Supprimer </a>
                </td>
            </tr>
        <?php endforeach;?>



    </tbody>
</table>

</body>
</html>