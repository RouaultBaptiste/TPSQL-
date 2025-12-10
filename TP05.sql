-- TP05 – Mise à jour de données
-- Baptiste Rouault

-- On désactive le mode safe update pour pouvoir modifier les données
SET SQL_SAFE_UPDATES = 0;

-- a) Mettre en minuscules la désignation de l'article dont l'id = 2
UPDATE ARTICLE
SET DESIGNATION = LOWER(DESIGNATION)
WHERE ID = 2;

-- b) Mettre en majuscules les désignations des articles dont le prix > 10€
UPDATE ARTICLE
SET DESIGNATION = UPPER(DESIGNATION)
WHERE PRIX > 10;

-- c) Baisser de 10% le prix des articles jamais commandés
-- On utilise ROUND pour éviter les warnings
UPDATE ARTICLE
SET PRIX = ROUND(PRIX * 0.90, 2)
WHERE ID NOT IN (
    SELECT ID_ART FROM COMPO
);

-- d) Doubler les quantités des articles commandés à Française d'Imports (ID_FOU = 1)
UPDATE COMPO C
JOIN BON B ON C.ID_BON = B.ID
SET C.QTE = C.QTE * 2
WHERE B.ID_FOU = 1;

-- e) Enlever le texte entre parenthèses dans les désignations
UPDATE ARTICLE
SET DESIGNATION = SUBSTRING(DESIGNATION, 1, POSITION('(' IN DESIGNATION) - 1)
WHERE POSITION('(' IN DESIGNATION) > 0;
