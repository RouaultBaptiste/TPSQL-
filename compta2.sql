-- TP03 - Requêtes basiques Baptiste Rouault exo 

-- a) Liste de tous les articles
SELECT * FROM ARTICLE;

-- b) Références + désignations des articles > 2 euros
SELECT REF, DESIGNATION
FROM ARTICLE
WHERE PRIX > 2;

-- c) Articles entre 2 et 6.25 (avec comparateurs)
SELECT *
FROM ARTICLE
WHERE PRIX >= 2 AND PRIX <= 6.25;

-- d) Articles entre 2 et 6.25 (BETWEEN)
SELECT *
FROM ARTICLE
WHERE PRIX BETWEEN 2 AND 6.25;

-- e) Articles dont le prix n'est pas entre 2 et 6.25,
-- fournisseur = Française d'Imports (ID=1), ordre décroissant
SELECT *
FROM ARTICLE
WHERE PRIX NOT BETWEEN 2 AND 6.25
  AND ID_FOU = 1
ORDER BY PRIX DESC;

-- f) Articles dont les fournisseurs sont Française d'Imports ou Dubois et Fils
SELECT *
FROM ARTICLE
WHERE ID_FOU = 1 OR ID_FOU = 3;

-- g) Même requête avec IN
SELECT *
FROM ARTICLE
WHERE ID_FOU IN (1, 3);

-- h) Articles dont les fournisseurs ne sont ni Française d’Imports ni Dubois et Fils
SELECT *
FROM ARTICLE
WHERE ID_FOU NOT IN (1, 3);

-- i) Bons de commande entre le 01/02/2019 et le 30/04/2019
SELECT *
FROM BON
WHERE DATE_CMDE BETWEEN '2019-02-01' AND '2019-04-30';
