<?php

require_once 'Framework/Controleur.php';
require_once 'Modele/Transaction.php';
require_once 'Modele/Place.php';

class ControleurTransactions extends Controleur {

    private $transaction;
    private $place;

    public function __construct() {
        $this->transaction = new Transaction();
        $this->place = new Place();
    }

// Affiche la liste de tous les transactions du blog
    public function index() {
        $transactions = $this->transaction->getTransactions();
        $this->genererVue(['transactions' => $transactions]);
    }

// Affiche les détails sur un transaction
    public function lire() {
        $idTransaction = $this->requete->getParametreId("id");
        $transaction = $this->transaction->getTransaction($idTransaction);
        $erreur = $this->requete->getSession()->existeAttribut("erreur") ? $this->requete->getsession()->getAttribut("erreur") : '';
        $places = $this->place->getPlaces($idTransaction);
        $this->genererVue(['transaction' => $transaction, 'places' => $places, 'erreur' => $erreur]);
    }

    public function ajouter() {
        $this->genererVue();
    }

// Enregistre le nouvel transaction et retourne à la liste des transactions
    public function nouvelTransaction() {
        if ($this->requete->getSession()->getAttribut("env") == 'prod') {
            $this->requete->getSession()->setAttribut("message", "Ajouter une transaction n'est pas permis en démonstration");
        } else {
            $transaction['utilisateur_id'] = $this->requete->getParametreId('utilisateur_id');
            $transaction['Daate'] = $this->requete->getParametre('Daate');
            $transaction['Prix'] = $this->requete->getParametre('Prix');
            $transaction['retourInformation'] = $this->requete->getParametre('retourInformation');
            //$transaction['type'] = $this->requete->getParametre('type');
            $this->transaction->setTransaction($transaction);
        }
        $this->executerAction('index');
    }

// Modifier un transaction existant    
    public function modifier() {
        $id = $this->requete->getParametreId('id');
        $transaction = $this->transaction->getTransaction($id);
        $this->genererVue(['transaction' => $transaction]);
    }

// Enregistre l'transaction modifié et retourne à la liste des transactions
    public function miseAJour() {
        if ($this->requete->getSession()->getAttribut("env") == 'prod') {
            $this->requete->getSession()->setAttribut("message", "Modifier une transaction n'est pas permis en démonstration");
        } else {
            $transaction['id'] = $this->requete->getParametreId('id');
            $transaction['utilisateur_id'] = $this->requete->getParametreId('utilisateur_id');
            $transaction['Daate'] = $this->requete->getParametre('Daate');
            $transaction['Prix'] = $this->requete->getParametre('Prix');
            $transaction['retourInformation'] = $this->requete->getParametre('retourInformation');
            //$transaction['type'] = $this->requete->getParametre('type');
            $this->transaction->updateTransaction($transaction);
        }
        $this->executerAction('index');
    }

}
