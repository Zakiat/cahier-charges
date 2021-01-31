<?php


$login = $_POST['login'];
$password = $_POST['password'];


include('db.php');
try {

    $connexion = new PDO('mysql:host=' . $db_url .';dbname='. $db_name, $db_user, $db_pass);
    $connexion->setAttribut(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $rqt = "SELECT pseudo, password FROM adherents WHERE pseudo = :pseudo LIMIT 1";
    $requetePreparee = $connexionSQL->prepare($rqt);
    $requetePreparee->bindParam(':pseudo', $pseudo);
    $requetePreparee->execute();
    $resultat = $requetePreparee->fetch(PDO::FETCH_ASSOC);
} catch (Exception $e){
    echo $e->getMessage();
}

if(!empty($resultat['login']) && !empty($resultat['password'])){
    $hash = $resultat['password']; 
}

if(password_verify($password, $hash){
    session_start(); 
    $_SESSION['login'] = $pseudo;
    header('Location: membres.html');
}
?>