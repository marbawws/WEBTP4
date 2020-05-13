<?php $this->titre = 'Le Blogue de Marwane Rezgui'; ?>

<a href="Transactions/ajouter">
    <h2 class="titreTransaction">Ajouter une transaction</h2>
</a>
<?php foreach ($transactions as $transaction):
    ?>

    <article>
        <header>
            <a href="Transactions/lire/<?= $this->nettoyer($transaction['id']) ?>">
                <h1 class="titreTransaction"><?= $this->nettoyer($transaction['Daate']) ?></h1>
            </a>
            <time><?= $this->nettoyer($transaction['Daate']) ?></time>, par utilisateur #<?= $this->nettoyer($transaction['utilisateur_id']) ?>
        </header>
        <p><?= $this->nettoyer($transaction['Prix']) ?><br/>
            <em><?= $this->nettoyer($transaction['retourInformation']) ?></em>
            <a href="Transactions/modifier/<?= $this->nettoyer($transaction['id']) ?>"> [modifier la transaction]</a>
        </p>
    </article>
    <hr />
<?php endforeach; ?>    
