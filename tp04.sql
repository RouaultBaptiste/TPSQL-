-- TP04 – Requêtes avancées
-- Baptiste Rouault

-- a) Afficher tous les articles triés par désignation (ordre alphabétique)
SELECT *
FROM ARTICLE
ORDER BY DESIGNATION ASC;

-- b) Afficher les articles du prix le plus cher au moins cher
SELECT *
FROM ARTICLE
ORDER BY PRIX DESC;

-- c) Afficher les articles qui contiennent "boulon" et trier par prix croissant
SELECT *
FROM ARTICLE
WHERE DESIGNATION LIKE '%boulon%'
ORDER BY PRIX ASC;

-- d) Afficher les articles qui contiennent le mot "sachet"
SELECT *
FROM ARTICLE
WHERE DESIGNATION LIKE '%sachet%';

-- e) Même chose mais sans tenir compte des majuscules/minuscules
SELECT *
FROM ARTICLE
WHERE LOWER(DESIGNATION) LIKE '%sachet%';

-- f) Afficher les articles avec leur fournisseur, triés par nom du fournisseur,
-- puis par prix décroissant
SELECT A.*, F.NOM
FROM ARTICLE A
JOIN FOURNISSEUR F ON A.ID_FOU = F.ID
ORDER BY F.NOM ASC, A.PRIX DESC;

-- g) Afficher uniquement les articles du fournisseur "Dubois & Fils"
SELECT A.*
FROM ARTICLE A
JOIN FOURNISSEUR F ON A.ID_FOU = F.ID
WHERE F.NOM = 'Dubois & Fils';

-- h) Calculer la moyenne des prix des articles de "Dubois & Fils"
SELECT AVG(A.PRIX) AS moyenne_prix
FROM ARTICLE A
JOIN FOURNISSEUR F ON A.ID_FOU = F.ID
WHERE F.NOM = 'Dubois & Fils';

-- i) Calculer la moyenne des prix des articles par fournisseur
SELECT F.NOM, AVG(A.PRIX) AS moyenne_prix
FROM ARTICLE A
JOIN FOURNISSEUR F ON A.ID_FOU = F.ID
GROUP BY F.NOM;

-- j) Afficher les bons entre le 01/03/2019 et le 05/04/2019 à 12h00
SELECT *
FROM BON
WHERE DATE_CMDE BETWEEN '2019-03-01' AND '2019-04-05 12:00:00';

-- k) Afficher les bons qui contiennent des articles "boulon"
SELECT DISTINCT B.*
FROM BON B
JOIN COMPO C ON B.ID = C.ID_BON
JOIN ARTICLE A ON C.ID_ART = A.ID
WHERE A.DESIGNATION LIKE '%boulon%';

-- l) Même chose mais afficher aussi le fournisseur du bon
SELECT DISTINCT B.NUMERO, F.NOM
FROM BON B
JOIN FOURNISSEUR F ON B.ID_FOU = F.ID
JOIN COMPO C ON B.ID = C.ID_BON
JOIN ARTICLE A ON C.ID_ART = A.ID
WHERE A.DESIGNATION LIKE '%boulon%';

-- m) Calculer le prix total de chaque bon de commande
SELECT B.ID, B.NUMERO,
       SUM(C.QTE * A.PRIX) AS total_bon
FROM BON B
JOIN COMPO C ON B.ID = C.ID_BON
JOIN ARTICLE A ON C.ID_ART = A.ID
GROUP BY B.ID, B.NUMERO;

-- n) Afficher le nombre total d'articles dans chaque bon
SELECT B.ID, B.NUMERO,
       SUM(C.QTE) AS total_articles
FROM BON B
JOIN COMPO C ON B.ID = C.ID_BON
GROUP BY B.ID, B.NUMERO;

-- o) Afficher les bons qui contiennent plus de 25 articles
SELECT B.ID, B.NUMERO,
       SUM(C.QTE) AS total_articles
FROM BON B
JOIN COMPO C ON B.ID = C.ID_BON
GROUP BY B.ID, B.NUMERO
HAVING SUM(C.QTE) > 25;

-- p) Calculer le coût total des commandes du mois d'avril
SELECT SUM(C.QTE * A.PRIX) AS total_avril
FROM BON B
JOIN COMPO C ON B.ID = C.ID_BON
JOIN ARTICLE A ON C.ID_ART = A.ID
WHERE MONTH(B.DATE_CMDE) = 4;
