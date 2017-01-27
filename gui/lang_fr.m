function list = lang_fr()
% LANG FR
% French language strings.
%
% Author: Pablo Pizarro @ppizarror.com, 2017.
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

% Constant import
constants;

% Create a list of data
list = cell(lang_entries, 1);

% --------------------------------------------------------------------
list{1} = 'Ajouter nouvelle ligne';
list{2} = 'Supprimer la ligne';
list{3} = 'Erreur: Impossible de supprimer la ligne.';
list{4} = 'Importation d''une table d''estimation initiale';
list{5} = 'Veuillez sélectionner un fichier Excel';
list{6} = 'Info: Importation Excel annulée par l''utilisateur.';
list{7} = 'Erreur: fichier non valide doit exister seulement 4 colonnes (il a trouvé %d).';
list{8} = 'Chargement en cours ...';
list{9} = 'Erreur: La dernière valeur de H doit être vide ou ne peut pas être un chiffre (il a trouvé %s).';
list{10} = 'Info: Importer à partir d''Excel réussie.';
list{11} = 'Fichier';
list{12} = 'Nouveau...';
list{13} = 'Charge';
list{14} = 'Effacer la table initiale';
list{15} = 'Estimation initiale';
list{16} = 'Édition';
list{17} = 'Aider';
list{18} = 'Voir manuel';
list{19} = 'À propos de';
list{20} = 'Garder';
list{21} = 'Enregistrer sous...';
list{22} = 'Sortir';
list{23} = 'Erreur';
list{24} = 'Une erreur du chargement du fichier a eu lieu, vérifiez que possède les privilèges d''administrateur du conseil d''administration ou le fichier est pas corrompu.';
list{25} = 'Erreur: Impossible de charger le fichier.';
list{26} = 'Info: La table de prévision initiale a été correctement nettoyée.';
list{27} = 'Auteur: Pablo Pizarro @ ppizarror.com, 2017.';
list{28} = 'Merci à: Felipe Ochoa.';
list{29} = 'Code Matlab pour inverser la vitesse de phase de l''onde Raylegh. initialement construit à partir de bibliothèques mat_inverse et mat_disperse.';
list{30} = 'Website: https://github.com/ppizarror/mat_inverse_v2';
list{31} = 'Fichier de dispersion (Vr vs f)';
list{32} = 'Ouvrir (Excel)';
list{33} = 'Info: l''importation des données de la courbe de dispersion Excel est annulée par l''utilisateur.';
list{34} = 'Erreur: Le fichier de dispersion doit avoir seulement 2 colonnes (fréquence et vitesse de phase).';
list{35} = 'Info: Courbe de dispersion chargée avec succès.';
list{36} = 'grandir le plan';
list{37} = 'Fréquence $(Hz)$';
list{38} = 'Courbe expérimentale de dispersion';
list{39} = 'Vitesse de phase $(%s)$';
list{40} = 'Unités';
list{41} = 'Version du logiciel: %s';
list{42} = 'Démarrer';
list{43} = 'Voir parcelles';
list{44} = 'Exporter les résultats';
list{45} = 'Paramètres d''inversion';
list{46} = 'Erreur: Le paramètre %s ne peut pas être vide.';
list{47} = 'Erreur: Le paramètre %s doit être un nombre.';
list{48} = 'Info: Starting inversion ...';
list{49} = 'Info: Validation de l''entrée.';
list{50} = 'Erreur: la courbe de dispersion n''a pas encore été chargée, ne peut pas continuer.';
list{51} = 'Erreur: la table de prévision initiale n''est pas valide, ne peut pas continuer.';
list{52} = 'Erreur: Les deuxième, troisième et quatrième colonnes de la table de prévision initiale doivent avoir la même taille.';
list{53} = 'Erreur: ';
list{54} = 'Info: ';
list{55} = 'Erreur: la table de prévision initiale est vide.';
list{56} = 'Erreur: la table de prévision initiale ne peut avoir qu''une ligne.';
list{57} = 'En traitement ...';
list{58} = 'Itération %d/%d';
list{59} = 'Info: Processus terminé avec succès, temps d''exécution: %.1fs.';
list{60} = 'Une exception s''est produite lors de l''exécution de mat_inverse';
list{61} = 'Erreur fatale!';
list{62} = 'Attente';
list{63} = 'Processus achevé';
list{64} = 'Le processus d''inversion a été mené à bien.';
list{65} = 'Erreur: Solution non résolue!';
list{66} = 'Dispersion Calculée v/s Courbe Expérimentale';
list{67} = 'Courbe expérimentale de dispersion';
list{68} = 'Courbe de dispersion inverse';
list{69} = 'Profil de vitesse de vague de cisaillement';
list{70} = 'Vélocité de la vague de cisaillement $V_s$ $(%s)$';
list{71} = 'Profondeur $(%s)$';
list{72} = 'Valeur inverse';
list{73} = 'Créez-vous un nouveau projet?';
list{74} = 'Oui';
list{75} = 'Non';
list{76} = 'Créer un nouveau projet';
list{77} = 'Enregistrer le projet en tant que';
list{78} = 'Projet mat_inverse (*.invprj)';
list{79} = 'Erreur: Le projet n''a pas été enregistré.';
list{80} = 'Choisir le nom et l''emplacement du disque du nouveau projet';
list{81} = 'Sélectionner le fichier projet à charger';
list{82} = 'Charger le projet';
list{83} = 'Erreur: le projet n''a pas été chargé';
list{84} = 'Info: Une exception s''est produite lors du chargement du projet.';
list{85} = 'Fichiers Excel (*.xlsx, *.xls)';
list{86} = 'Chargement du projet...';
list{87} = 'Info: Le projet a été chargé avec succès.';
list{88} = 'Info: Une exception s''est produite lors de l''enregistrement du projet.';
list{89} = 'Info: Projet enregistré avec succès.';
list{90} = '%s - Mat inverse v2';
list{91} = 'projet1';
list{92} = 'Temps d''exécution total: %.1fs';
list{93} = 'Fichier de dispersion ''%s'' introuvable';
list{94} = 'Info: Projet chargé, erreurs: %d.';
list{95} = 'Voulez-vous fermer?';
list{96} = 'Graphiques générant...';
list{97} = 'Info: Graphics créées correctement.';
list{98} = 'Erreur: Une exception s''est produite lors de la génération de la courbe de dispersion expérimentale.';
list{99} = 'Erreur: Une exception s''est produite lors de la génération du profil de vitesse de cisaillement.';
list{100} = 'Voulez-vous nettoyer la table initiale?';
list{101} = 'Table propre';
list{102} = 'La variation de la courbe de dispersion selon itérations';
list{103} = 'Erreur: Une erreur est survenue lors de la génération de la courbe de dispersion en fonction des itérations.';
list{104} = 'Itération %d';
list{105} = 'Exporter des résultats...';
list{106} = 'Fichier Excel (*.xls)';
list{107} = 'Exporter le projet comme';
list{108} = 'Erreur: Les résultats ne sont pas exportés.';
list{109} = 'Info: Une exception est survenue lors de l''exportation des résultats.';
list{110} = 'H';
list{111} = 'VR';
list{112} = 'VS';
list{113} = 'VP';
list{114} = 'FREQ';
list{115} = 'RHO';
list{116} = 'ITÉRATION';
list{117} = 'Info: Résultats exportés avec succès.';
list{118} = 'l''importation de fichiers';
list{119} = 'Importer le fichier de dispersion';
list{120} = 'Paramètres d''inversion Clean';
list{121} = '';
list{122} = '';
list{123} = '';
list{124} = '';
list{125} = '';
list{126} = '';
list{127} = '';
list{128} = '';
list{129} = '';
list{130} = '';
% --------------------------------------------------------------------

end