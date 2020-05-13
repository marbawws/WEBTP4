<?php

require_once 'Vue/Vue.php';
$transactions = [
    [
        'id' => '991',
        'Daate' => '2020-05-06',
        'Prix' => '98',
        'utilisateur_id' => '111',
        'retourInformation' => 'test 1',
    ],
    [
        'id' => '992',
        'Daate' => '2020-05-06',
        'Prix' => '99',
        'utilisateur_id' => '111',
        'retourInformation' => 'test 2',
    ]
];
$vue = new Vue('Transactions');
$vue->generer(['transactions' => $transactions]);

