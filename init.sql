-- Table Utilisateur
INSERT INTO Utilisateur (nom, email, mot_de_passe, role) VALUES
('Ali Bennis', 'ali.bennis@example.com', SHA2('123', 256), 'ADMINISTRATEUR');

-- Table Client
INSERT INTO Client (nom, email, mot_de_passe, role, adresse, telephone) VALUES
('Omar El Madani', 'omar.elmadani@example.com', 'SHA2('123', 256)', 'CLIENT', 'Martil Al Bayt Al Atiq', '0612345678'),
('Sara El Amrani', 'sara.amrani@example.com', 'SHA2('123', 256)', 'CLIENT', 'Bd Anfa, Casablanca', '0623456789'),
('Khalid El Fassi', 'khalid.fassi@example.com', 'SHA2('123', 256)', 'CLIENT', 'Derb Omar, Casablanca', '0634567890'),
('Yasmine Mouline', 'yasmine.mouline@example.com', 'SHA2('123', 256)', 'CLIENT', 'Hay Riad, Rabat', '0645678901'),
('Hamid Zemmouri', 'hamid.zemmouri@example.com', 'SHA2('123', 256)', 'CLIENT', 'Route de Meknès, Fès', '0656789012'),
('Nora El Baz', 'nora.baz@example.com', 'SHA2('123', 256)', 'CLIENT', 'Avenue Mohammed V, Agadir', '0667890123'),
('Mehdi Darif', 'mehdi.darif@example.com', 'SHA2('123', 256)', 'CLIENT', 'Rue Oujda, Tanger', '0678901234'),
('Fatima Zahra', 'fatima.zahra@example.com', 'SHA2('123', 256)', 'CLIENT', 'Place Djemaa El Fna, Marrakech', '0689012345'),
('Aziz Naciri', 'aziz.naciri@example.com', 'SHA2('123', 256)', 'CLIENT', 'Quartier Palmier, Casablanca', '0690123456'),
('Leila El Madi', 'leila.madi@example.com', 'SHA2('123', 256)', 'CLIENT', 'Boulevard Hassan II, Rabat', '0701234567');

-- Table Livreur
INSERT INTO Livreur (nom, email, mot_de_passe, role, localisation, etat) VALUES
('Omar Karimi', 'omar.karimi@example.com', 'SHA2('123', 256)', 'LIVREUR', 'Bd Al Qods, Casablanca', 'DISPONIBLE'),
('Salma Lahlou', 'salma.lahlou@example.com', 'SHA2('123', 256)', 'LIVREUR', 'Hay Salam, Agadir', 'DISPONIBLE'),
('Amine Jebli', 'amine.jebli@example.com', 'SHA2('123', 256)', 'LIVREUR', 'Avenue Mohammed V, Marrakech', 'DISPONIBLE'),
('Karima Fakhri', 'karima.fakhri@example.com', 'SHA2('123', 256)', 'LIVREUR', 'Rue des Far, Fès', 'DISPONIBLE'),
('Hicham Kabbaj', 'hicham.kabbaj@example.com', 'SHA2('123', 256)', 'LIVREUR', 'Boulevard Zerktouni, Casablanca', 'DISPONIBLE'),
('Latifa Tazi', 'latifa.tazi@example.com', 'SHA2('123', 256)', 'LIVREUR', 'Quartier Hassan, Rabat', 'DISPONIBLE'),
('Rachid Maftoul', 'rachid.maftoul@example.com', 'SHA2('123', 256)', 'LIVREUR', 'Boulevard Ghandi, Casablanca', 'DISPONIBLE'),
('Zineb El Alami', 'zineb.elalami@example.com', 'SHA2('123', 256)', 'LIVREUR', 'Avenue de la Liberté, Tanger', 'DISPONIBLE'),
('Ahmed El Mansouri', 'ahmed.mansouri@example.com', 'SHA2('123', 256)', 'LIVREUR', 'Place El Massira, Laâyoune', 'DISPONIBLE'),
('Fatima Bouzid', 'fatima.bouzid@example.com', 'SHA2('123', 256)', 'LIVREUR', 'Rue de Fès, Oujda', 'DISPONIBLE');

-- Table Commande
INSERT INTO Commande (adresse_livraison, statut, date_commande, livreur_id, client_id, produits) VALUES
('Avenue Hassan II, Rabat', 'En attente', '2024-11-02 00:00:00', NULL, (SELECT id FROM Client WHERE nom = 'Omar El Madani'), 'Livre, Stylo'),
('Bd Mohammed V, Casablanca', 'En cours', '2024-11-01 00:00:00', (SELECT id FROM Livreur WHERE nom = 'Salma Lahlou'), (SELECT id FROM Client WHERE nom = 'Sara El Amrani'), 'Ordinateur, Clavier'),
('Rue Marrakech, Fès', 'Livrée', '2024-10-31 00:00:00', (SELECT id FROM Livreur WHERE nom = 'Amine Jebli'), (SELECT id FROM Client WHERE nom = 'Khalid El Fassi'), 'Téléphone, Chargeur');
