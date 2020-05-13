<?php
if (isset($_GET['test'])) {
    if ($_GET['test'] == 'modeleTransaction') {
        require 'Tests/Modeles/testTransaction.php';
    } else if ($_GET['test'] == 'modelePlace') {
        require 'Tests/Modeles/testPlace.php';
    } else if ($_GET['test'] == 'vueTransactions') {
        require 'Tests/Vues/testVueTransactions.php';
    } else if ($_GET['test'] == 'vueConfirmer') {
        require 'Tests/Vues/testVueConfirmer.php';
    } else if ($_GET['test'] == 'vueErreur') {
        require 'Tests/Vues/testVueErreur.php';
    } else {
        echo '<h3>Test inexistant!!!</h3>';
    }
}
?>
<h3>Tests de Modèles</h3>
<ul>
    <li>
        <a href="tests.php?test=modeleTransaction">Transaction</a>
    </li>
    <li>
        <a href="tests.php?test=modelePlace">Place</a>
    </li>
</ul>
<h3>Tests de Vues</h3>
<ul>
    <li>
        <a href="tests.php?test=vueTransactions">Transactions</a>
    </li>
    <li>
        <a href="tests.php?test=vueConfirmer">Confirmer</a>
    </li>
    <li>
        <a href="tests.php?test=vueErreur">Erreur</a>
    </li>
</ul>
