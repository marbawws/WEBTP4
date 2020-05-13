<?php $this->titre = "Le Blogue de Marwane Rezgui - Places" ?>

<header>
    <h1 id="titreReponses">Places Blogue de Marwane Rezgui :</h1>
</header>
<?php
foreach ($places as $place):
    ?>
    <?php if ($place['efface'] == '0') : ?>
        <p><a href="Places/confirmer/<?= $this->nettoyer($place['id']) ?>" >
                [Effacer]</a>
            <?= $this->nettoyer($place['auteur']) ?> dit :<br/>
            <strong><?= $this->nettoyer($place['Adresse']) ?></strong><br/>
            <?= $this->nettoyer($place['Description']) ?>
            <a href="Transactions/lire/<?= $this->nettoyer($place['transaction_id']) ?>" >
                [Voir la transaction]</a>
        </p>
    <?php else : ?>
        <p class="efface"><a href="Places/retablir/<?= $this->nettoyer($place['id']) ?>" >
                [Rétablir]</a>
             Place par <?= $this->nettoyer($place['auteur']) ?> effacé! ?>)
        </p>
    <?php endif; ?>
<?php endforeach; ?>