<?php

require_once 'Framework/Modele.php';

/**
 * Fournit les services d'accès aux transactions 
 * 
 * @author André Pilon et Marwane Rezgui
 */
class Transaction extends Modele {

// Renvoie la liste de tous les transactions, triés par identifiant décroissant
    public function getTransactions() {
        $sql = 'select * from transactions'
                . ' order by ID desc';
        $transactions = $this->executerRequete($sql);
        return $transactions;
    }

// Renvoie la liste de tous les transactions, triés par identifiant décroissant
    public function setTransaction($transaction) {
        $sql = 'INSERT INTO transactions (Daate, Prix, utilisateur_id, retourInformation) VALUES(?, ?, ?, ?)';
        $result = $this->executerRequete($sql, [$transaction[Daate], $transaction[Prix], $transaction[utilisateur_id], $transaction[retourInformation]]);
        return $result;
    }

// Renvoie les informations sur un transaction
    function getTransaction($idTransaction) {
        $sql = 'select * from transactions'
                . ' where ID=?';
        $transaction = $this->executerRequete($sql, [$idTransaction]);
        if ($transaction->rowCount() == 1) {
            return $transaction->fetch();  // Accès à la première ligne de résultat
        } else {
            throw new Exception("Aucune transaction ne correspond à l'identifiant '$idTransaction'");
        }
    }
// Met à jour une transaction
    public function updateTransaction($transaction) {
        $sql = 'UPDATE transactions'
                . ' SET Daate = ?, Prix = ?, utilisateur_id = ?, retourInformation = ?'
                . ' WHERE id = ?';
        $result = $this->executerRequete($sql, [$transaction['Daate'], $transaction['Prix'], $transaction['utilisateur_id'], $transaction['retourInformation'],  $transaction['id']]);
        return $result;
    }
    
}