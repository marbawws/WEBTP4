<?php

require_once 'Framework/Controleur.php';
require_once 'Modele/Place.php';

class ControleurPlaces extends Controleur {

    private $place;

    public function __construct() {
        $this->place = new Place();
    }

// L'action index n'est pas utilisée mais pourrait ressembler à ceci 
// en ajoutant la fonctionnalité de faire afficher tous les places
    public function index() {
        $places = $this->place->getPlaces();
        $this->genererVue(['places' => $places]);
    }

// Ajoute un place à un transaction
    public function ajouter() {
        $place['transaction_id'] = $this->requete->getParametreId("transaction_id");
        $place['auteur'] = $this->requete->getParametre('auteur');
        $validation_courriel = filter_var($place['auteur'], FILTER_VALIDATE_EMAIL);
        if ($validation_courriel) {
            if ($this->requete->getSession()->getAttribut("env") == 'prod') {
                $this->requete->getSession()->setAttribut("message", "Ajouter une place n'est pas permis en démonstration");
            } else {
                $place['Adresse'] = $this->requete->getParametre('Adresse');
                $place['Description'] = $this->requete->getParametre('Description');
                // Ajuster la valeur de la case à cocher
               // $place['prive'] = $this->requete->existeParametre('prive') ? 1 : 0;
                // Ajouter le place à l'aide du modèle
                $this->place->setPlace($place);
            }
            // Éliminer un code d'erreur éventuel
            if ($this->requete->getSession()->existeAttribut('erreur')) {
                $this->requete->getsession()->setAttribut('erreur', '');
            }

            //Recharger la page pour mettre à jour la liste des places associés
            $this->rediriger('Transactions', 'lire/' . $place['transaction_id']);
        } else {
            //Recharger la page avec une erreur près du courriel
            $this->requete->getSession()->setAttribut('erreur', 'courriel');
            $this->rediriger('Transactions', 'lire/' . $place['transaction_id']);
        }
    }

// Confirmer la suppression d'un place
    public function confirmer() {
        $id = $this->requete->getParametreId("id");
        // Lire le place à l'aide du modèle
        $place = $this->place->getPlace($id);
        $this->genererVue(['place' => $place]);
    }

// Supprimer un place
    public function supprimer() {
        $id = $this->requete->getParametreId("id");
        // Lire le place afin d'obtenir le id de l'transaction associé
        $place = $this->place->getPlace($id);
        // Supprimer le place à l'aide du modèle
        $this->place->deletePlace($id);
        //Recharger la page pour mettre à jour la liste des places associés
        $this->rediriger('Transactions', 'lire/' . $place['transaction_id']);
    }

    // Rétablir un place
    public function retablir() {
        $id = $this->requete->getParametreId("id");
        // Lire le place afin d'obtenir le id de l'transaction associé
        $place = $this->place->getPlace($id);
        // Supprimer le place à l'aide du modèle
        $this->place->restorePlace($id);
        //Recharger la page pour mettre à jour la liste des places associés
        $this->rediriger('Transactions', 'lire/' . $place['transaction_id']);
    }

}
