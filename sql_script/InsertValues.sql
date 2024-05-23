-- Inserting values into the Role table
INSERT INTO Role (roleName, createdBy, updatedBy)
VALUES ('Admin', 'System', 'System'),
       ('User', 'System', 'System');

-- Inserting values into the FootballClub table
INSERT INTO FootballClub (clubName, img, createdBy, updatedBy)
VALUES ('Manchester United', 'manchester_united.jpg', 'System', 'System'),
       ('Real Madrid', 'real_madrid.jpg', 'System', 'System'),
       ('FC Barcelona', 'fc_barcelona.jpg', 'System', 'System');

-- Inserting values into the MatchStatus table
INSERT INTO MatchStatus (statusName, createdBy, updatedBy)
VALUES ('Scheduled', 'System', 'System'),
       ('Ongoing', 'System', 'System'),
       ('Completed', 'System', 'System');

-- Inserting values into the MatchType table
INSERT INTO MatchType ([name], createdBy, updatedBy)
VALUES ('Friendly', 'System', 'System'),
       ('League', 'System', 'System'),
       ('Cup', 'System', 'System');

-- Inserting values into the Season table
INSERT INTO Season (seasonName, startDate, endDate, createdBy, updatedBy)
VALUES ('2024/2025', '2024-08-01', '2025-05-30', 'System', 'System');

-- Inserting values into the Stand table
INSERT INTO Stand (standName, price, quantity, createdBy, updatedBy)
VALUES ('VIP', 100.00, 100, 'System', 'System'),
       ('Regular', 50.00, 200, 'System', 'System');

-- Inserting values into the User table
INSERT INTO [User] (roleId, userName, [password], email, phoneNumber, avatar, [name], createdBy, updatedBy)
VALUES (1, 'admin', 'adminpassword', 'admin@example.com', '123456789', 'admin_avatar.jpg', 'Admin User', 'System', 'System'),
       (2, 'user1', 'user1password', 'user1@example.com', '987654321', 'user1_avatar.jpg', 'Regular User', 'System', 'System');

-- Inserting values into the Match table
INSERT INTO Match (team1, team2, seasonId, stadiumImg, [time], statusId, matchTypeId, createdBy, updatedBy)
VALUES (1, 2, 1, 'stadium_image.jpg', '2024-09-15 18:00:00', 1, 2, 'System', 'System'),
       (2, 3, 1, 'stadium_image.jpg', '2024-10-20 15:30:00', 1, 2, 'System', 'System');

-- Inserting values into the MatchStand table
INSERT INTO MatchStand (matchId, standId, [availability], createdBy, updatedBy)
VALUES (1, 1, 50, 'System', 'System'),
       (1, 2, 100, 'System', 'System'),
       (2, 1, 75, 'System', 'System'),
       (2, 2, 150, 'System', 'System');

-- Inserting values into the HistoryPurchasedTicket table
INSERT INTO HistoryPurchasedTicket (matchStandId, qrCode, price, number, [status], createdBy, updatedBy)
VALUES (1, 'QR123456', 100.00, 2, 'Valid', 'System', 'System'),
       (2, 'QR789012', 50.00, 4, 'Valid', 'System', 'System');

-- Inserting values into the Payment table
INSERT INTO Payment (userId, ticketId, price, date)
VALUES (2, 1, 100.00, '2024-09-14 12:00:00'),
       (2, 2, 200.00, '2024-10-19 10:30:00');

-- Inserting values into the News table
INSERT INTO News (userId, title, content, postTime, createdBy, updatedBy)
VALUES (1, 'Exciting Match Ahead!', 'Dont miss the upcoming match between Manchester United and Real Madrid!', '2024-09-10 09:00:00', 'System', 'System'),
       (2, 'Latest Transfer News', 'FC Barcelona signs a promising young talent. Read more here!', '2024-10-15 11:45:00', 'System', 'System');