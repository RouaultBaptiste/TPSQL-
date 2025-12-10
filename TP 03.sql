-- a. Listez toutes les données concernant les articles
SELECT * FROM `article`;
-- b. Listez uniquement les références et désignations des articles de plus de 2 euros
SELECT ref from article where prix > 2;
-- c. En utilisant les opérateurs de comparaison, listez tous les articles dont le prix est compris entre 2 et 6.25 euros
SELECT * from article where prix >= 2 AND prix <= 6.25;
-- d. En utilisant l'opérateur BETWEEN, listez tous les articles dont le prix est compris entre 2 et 6.25 euros
SELECT * from article where prix BETWEEN 2 and 6.25;
-- e. Listez tous les articles, dans l'ordre des prix descendants, et dont le prix n'est pas compris entre 2 et 6.25 euros et dont le fournisseur est Française d'Imports.
select * from
 (select a.*, f.nom as fid from article  as a inner join fournisseur as f on f.id = a.id_fou 
 where nom = "Française d'imports") as t where prix NOT BETWEEN 2 and 6.25 order by prix desc;
-- f. En utilisant un opérateur logique, listez tous les articles dont les fournisseurs sont la Française d'imports ou Dubois et Fils
select * from 
(select a.*, f.nom as fid from article  as a inner join fournisseur as f on f.id = a.id_fou 
where nom = "Française d'imports" or nom ="Dubois & Fils") as t;
-- g. En utilisant l'opérateur IN, réalisez la même requête que précédemment
select * from 
(select a.*, f.nom as fid from article  as a inner join fournisseur as f on f.id = a.id_fou 
where nom IN ("Française d'imports","Dubois & Fils")) as t;
-- h. En utilisant les opérateurs NOT et IN, listez tous les articles dont les fournisseurs ne sont ni Française d'Imports, ni Dubois et Fils.
select * from 
(select a.*, f.nom as fid from article  as a inner join fournisseur as f on f.id = a.id_fou 
where nom NOT IN ("Française d'imports","Dubois & Fils")) as t;
-- i. Listez tous les bons de commande dont la date de commande est entre le 01/02/2019 et le 30/04/2019.
SELECT *
FROM `bon`
WHERE date_cmde BETWEEN '2019-02-01' AND '2019-04-30';