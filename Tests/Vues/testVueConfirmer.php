<?php

require_once 'Vue/Vue.php';
$place = [
        'id' => '999',
        'Adresse' => 'adresse test',
        'Description' => 'description test',
        'auteur' => 'auteur Test',
		'transaction_id' => '111',
    ];
$vue = new Vue('Confirmer');
$vue->generer(['place' => $place]);

