<?php $this->titre = "Le Blogue de Marwane Rezgui - " . $this->nettoyer($transaction['Daate']); ?>

<header>
    <h1 id="titreReponses">Modifier un transaction de l'utilisateur 1 :</h1>
</header>
<form action="Transactions/miseAJour" method="post">
    <h2>Modifier un transaction</h2>
    <p>
        <label for="Daate">Date</label> : <input type="date" name="Daate" id="Daate" value="<?= $this->nettoyer($transaction['Daate']) ?>" /> <br />
        <label for="Prix">Prix</label> :  <input type="number" name="Prix" id="Prix" value="<?= $this->nettoyer($transaction['Prix']) ?>" /><br />
        <label for="retourInformation">retour d'information</label> :  <textarea name="retourInformation" id="retourInformation" ><?= $this->nettoyer($transaction['retourInformation']) ?></textarea><br />
        <input type="hidden" name="utilisateur_id" value="1" /><br />
        <input type="hidden" name="id" value="<?= $this->nettoyer($transaction['id']) ?>" /><br />
        <input type="submit" value="Modifier" />
    </p>
</form>


