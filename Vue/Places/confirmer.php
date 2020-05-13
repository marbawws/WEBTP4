<?php $this->Adresse = "Supprimer - " . $this->nettoyer($place['Adresse']); ?>

<article>
    <header>
        <p><h1>
            Effacer?
        </h1>
		<?= $this->nettoyer($place['auteur']) ?> dit : <br/>
        <strong><?= $this->nettoyer($place['Adresse']) ?></strong><br/>
        <?= $this->nettoyer($place['Description']) ?>
        </p>
    </header>
</article>

<form action="Places/supprimer" method="post">
    <input type="hidden" name="id" value="<?= $this->nettoyer($place['id']) ?>" /><br />
    <input type="submit" value="Oui" />
</form>
<form action="Transactions/lire" method="post" >
    <input type="hidden" name="id" value="<?= $this->nettoyer($place['transaction_id']) ?>" />
    <input type="submit" value="Annuler" />
</form>


