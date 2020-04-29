# Application mobile pour "Applications mobiles complexes"

On devait développer une application comme projet pour valider cette matière. J'ai choisi d'utiliser la technologie "Flutter", un framework développé par google permettant de simplifier le développement d'applications mobile cross-plateformes.

## Tankopédia

Tankopédia est une application qui permet d'acheter des chars.

Ces chars sont chargées depuis l'API fournie gratuitement par le jeu "World of Tanks", développé par la société "War Gaming".

Lorsqu'on lance l'application, on peut directement choisir sa nation.

Ensuite la liste des chars de la nation s'affiche. On peut filtrer suivant le tier et le type de véhicule.
( /!\ Ces filtres ont une incidence sur le rafraichissement de la liste, celà peut buguer par moment)

On peut voir les détails d'un char de la liste en cliquant dessus, et ensuite l'ajouter au panier.

Sur la page principale, on peut ensuite aller dans le panier, en haut à droite. Ce panier affichera tous les chars sélectionnés.

Pour désélectionner un char, on clique sur le char, et on arrive sur la page de détails du char avec le bouton "supprimer le char".

Le char sera ensuite supprimer de la liste.

On peut confirmer le panier quand on est sur la page en haut à droite. On arrive sur une page de confirmation, si on valide, on vide le panier alors et on revient à l'accueil.
