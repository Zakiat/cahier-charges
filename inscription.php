<?php

$nom = $_POST['name'];
$prenom = $_POST['prenom'];
$user = $_POST['login'];
$mail = $_POST['mail'];
$number = $_POST['number'];
$adress = $_POST['adress'];
$city = $_POST['city'];
$zip = $POST['zip'];

if($password != $confirmpassword){
 echo "mots de passe différents"
}

$hash = password_hash($password, PASSWORD_DEFAULT);

try{
    include_once('db.php');
    $connexion = new PDO('mysql:host='. $db_url . ';dbname=' . $db_name, $db_user, $db_pass);
    $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $rqt = "SELECT * FROM utilisateurs WHERE pseudo=:pseudo OR email=:email"
    $requetePreparee = $connexion->prepare($rqt);
    $requetePreparee->bindParam(':pseudo', $pseudo);
    $requetePreparee->bindParam(':email', $email);
    $requetePreparee->execute();

    if($requetePreparee->fetch() != false){

    }
    $rqt = "INSERT INTO adherents(adherentsID, prenom, nom, pseudo, password, email, numero, adresse1, codepostal, ville, dateadhesion) VALUES (:adherentsID, :prenom, :nom, :pseudo, :password, :email, :numero, :adresse1, :codepostal, :ville, :dateadhesion)";
    $requetePreparee->bindParam(':pseudo', $pseudo);
    $requetePreparee->bindParam(':email', $email);
    $requetePreparee->bindParam(':password', $hash);
    $requetePreparee->execute();

    $nbLignesModifiee = $requetePreparee->rowCount();
    if($nbLignesModifiee !=1){
        echo "Problème lors de l'enregistrement"
        exit;
    }else{
        echo "$pseudo tu es enregistré"
    }
} catch(Exception $e){ //on attrape une exception c'est qu'il y a un pb
    //on affiche le message d'erreur et on quitte
    echo $e->getMessage(); // :warning: :attention: :achtung: on ne fait pas sur du coup en production
}

if($password == $confirmpassword){

include("db.php");

$connexion = new PDO($dburl, $dbuser, $dbpass);
$connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$rqt = "INSERT INTO adherents(AdherentID, Prenom, Nom, Pseudo, Password, Email, Numero, Adresse1, CodePostal, Ville, DateAdhesion) VALUES (:numero, :prenom, :name, :login, :mail,:pass, datenow())";

}

if($password != $confirmpassword){
    http_response_code(401);
        echo(json_encode([
            'status' => 'error', 
            'message' => 'Les mots de passe ne sont pas identiques', 
            ]));
}