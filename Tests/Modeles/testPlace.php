<?php

require_once 'Modele/Place.php';

$tstPlace = new Place;
$places = $tstPlace->getPlaces(1);
echo '<h3>Test getPlaces : </h3>';
var_dump($places->rowCount());

$place = $tstPlace->getPlace(6);
echo '<h3>Test getPlace : </h3>';
var_dump($place);