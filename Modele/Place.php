<?php

require_once 'Framework/Modele.php';

/**
 * Fournit les services d'accès aux genres musicaux 
 * 
 * @author Baptiste Pesquet
 */
class Place extends Modele {

    // Renvoie la liste des places associés à un transaction
    public function getPlaces($idTransaction = NULL) {
        if ($idTransaction == NULL) {
            $sql = 'select * from places';
        } else {
            $sql = 'select * from places'
                    . ' where transaction_id = ?';
        }
        $places = $this->executerRequete($sql, [$idTransaction]);
        return $places;
    }

// Renvoie un place spécifique
    public function getPlace($id) {
        $sql = 'select * from places'
                . ' where id = ?';
        $place = $this->executerRequete($sql, [$id]);
        if ($place->rowCount() == 1) {
            return $place->fetch();  // Accès à la première ligne de résultat
        } else {
            throw new Exception("Aucun place ne correspond à l'identifiant '$id'");
        }
    }

// Supprime un place
    public function deletePlace($id) {
        $sql = 'UPDATE places'
                . ' SET efface = 1'
                . ' WHERE id = ?';
        $result = $this->executerRequete($sql, [$id]);
        return $result;
    }

    // Réactive un place
    public function restorePlace($id) {
        $sql = 'UPDATE places'
                . ' SET efface = 0'
                . ' WHERE id = ?';
        $result = $this->executerRequete($sql, [$id]);
        return $result;
    }

// Ajoute une place associés à une transaction
    public function setPlace($place) {
        $sql = 'INSERT INTO places (Adresse, Description, auteur, transaction_id) VALUES(?, ?, ?, ?)';
        $result = $this->executerRequete($sql, [$place['Adresse'], $place['Description'], $place['auteur'], $place['transaction_id']]);
        return $result;
    }

}
