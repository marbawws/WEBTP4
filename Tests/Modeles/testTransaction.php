<?php

require_once 'Modele/Transaction.php';

$tstTransaction = new Transaction;
$transactions = $tstTransaction->getTransactions();
echo '<h3>Test getTransactions : </h3>';
var_dump($transactions->rowCount());

echo '<h3>Test getTransaction : </h3>';
$transaction =  $tstTransaction->getTransaction(4);
var_dump($transaction);