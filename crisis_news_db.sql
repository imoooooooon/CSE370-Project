-- Crisis News Database for XAMPP / MySQL
-- Generated from the provided Mermaid ER diagram and uploaded EER diagram

DROP DATABASE IF EXISTS crisis_news_db;
CREATE DATABASE crisis_news_db;
USE crisis_news_db;

-- =========================
-- 1) TABLES
-- =========================

CREATE TABLE REGION (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    division_or_state VARCHAR(100)
);

CREATE TABLE NEWS_SOURCE (
    source_id INT AUTO_INCREMENT PRIMARY KEY,
    source_name VARCHAR(150) NOT NULL,
    source_url VARCHAR(255),
    rss_url VARCHAR(255),
    trust_weight DECIMAL(4,2),
    language VARCHAR(50),
    country VARCHAR(100)
);

CREATE TABLE `USER` (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    preferred_language VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    region_id INT,
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    is_live_location BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_user_region
        FOREIGN KEY (region_id) REFERENCES REGION(region_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE `EVENT` (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    canonical_title VARCHAR(200) NOT NULL,
    event_description TEXT,
    event_type VARCHAR(50) NOT NULL,
    region_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_event_region
        FOREIGN KEY (region_id) REFERENCES REGION(region_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE CRISIS_EVENT (
    event_id INT PRIMARY KEY,
    crisis_type VARCHAR(100) NOT NULL,
    severity_level VARCHAR(50) NOT NULL,
    CONSTRAINT fk_crisis_event
        FOREIGN KEY (event_id) REFERENCES `EVENT`(event_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE NORMAL_EVENT (
    event_id INT PRIMARY KEY,
    CONSTRAINT fk_normal_event
        FOREIGN KEY (event_id) REFERENCES `EVENT`(event_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE NEWS_ARTICLE (
    article_id INT AUTO_INCREMENT PRIMARY KEY,
    source_id INT NOT NULL,
    event_id INT NOT NULL,
    region_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    summary TEXT,
    translated_content TEXT,
    published_at DATETIME,
    language VARCHAR(50),
    image_url VARCHAR(255),
    article_url VARCHAR(255),
    credibility_score DECIMAL(5,2),
    category VARCHAR(100),
    CONSTRAINT fk_article_source
        FOREIGN KEY (source_id) REFERENCES NEWS_SOURCE(source_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_article_event
        FOREIGN KEY (event_id) REFERENCES `EVENT`(event_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_article_region
        FOREIGN KEY (region_id) REFERENCES REGION(region_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE USER_ACTIVITY (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    article_id INT NOT NULL,
    activity_type VARCHAR(50) NOT NULL,
    reading_time INT,
    activity_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_activity_user
        FOREIGN KEY (user_id) REFERENCES `USER`(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_activity_article
        FOREIGN KEY (article_id) REFERENCES NEWS_ARTICLE(article_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE TRENDING_RECORD (
    trending_id INT AUTO_INCREMENT PRIMARY KEY,
    article_id INT NOT NULL,
    score DECIMAL(8,2) NOT NULL,
    calculated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    time_window VARCHAR(50),
    CONSTRAINT fk_trending_article
        FOREIGN KEY (article_id) REFERENCES NEWS_ARTICLE(article_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE CRISIS_ALERT (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    region_id INT NOT NULL,
    alert_type VARCHAR(100) NOT NULL,
    severity VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_alert_event
        FOREIGN KEY (event_id) REFERENCES `EVENT`(event_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_alert_region
        FOREIGN KEY (region_id) REFERENCES REGION(region_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE SOURCE_CREDIBILITY_LOG (
    credibility_log_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    source_id INT NOT NULL,
    source_contribution_score DECIMAL(5,2) NOT NULL,
    recorded_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_credibility_event
        FOREIGN KEY (event_id) REFERENCES `EVENT`(event_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_credibility_source
        FOREIGN KEY (source_id) REFERENCES NEWS_SOURCE(source_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE BOOKMARK (
    user_id INT NOT NULL,
    article_id INT NOT NULL,
    PRIMARY KEY (user_id, article_id),
    CONSTRAINT fk_bookmark_user
        FOREIGN KEY (user_id) REFERENCES `USER`(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_bookmark_article
        FOREIGN KEY (article_id) REFERENCES NEWS_ARTICLE(article_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE USER_FOLLOWS_SOURCE (
    user_id INT NOT NULL,
    source_id INT NOT NULL,
    PRIMARY KEY (user_id, source_id),
    CONSTRAINT fk_follow_user
        FOREIGN KEY (user_id) REFERENCES `USER`(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_follow_source
        FOREIGN KEY (source_id) REFERENCES NEWS_SOURCE(source_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE ALERT_RECEIPT (
    user_id INT NOT NULL,
    alert_id INT NOT NULL,
    PRIMARY KEY (user_id, alert_id),
    CONSTRAINT fk_receipt_user
        FOREIGN KEY (user_id) REFERENCES `USER`(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_receipt_alert
        FOREIGN KEY (alert_id) REFERENCES CRISIS_ALERT(alert_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================
-- 2) INDEXES
-- =========================

CREATE INDEX idx_user_region ON `USER`(region_id);
CREATE INDEX idx_event_region ON `EVENT`(region_id);
CREATE INDEX idx_article_source ON NEWS_ARTICLE(source_id);
CREATE INDEX idx_article_event ON NEWS_ARTICLE(event_id);
CREATE INDEX idx_article_region ON NEWS_ARTICLE(region_id);
CREATE INDEX idx_activity_user ON USER_ACTIVITY(user_id);
CREATE INDEX idx_activity_article ON USER_ACTIVITY(article_id);
CREATE INDEX idx_alert_event ON CRISIS_ALERT(event_id);
CREATE INDEX idx_alert_region ON CRISIS_ALERT(region_id);

-- =========================
-- 3) DEMO DATA
-- =========================

INSERT INTO REGION (region_name, country, division_or_state) VALUES
('Dallas', 'USA', 'Texas'),
('Austin', 'USA', 'Texas'),
('Chittagong', 'Bangladesh', 'Chattogram'),
('Tokyo', 'Japan', 'Tokyo Prefecture');

INSERT INTO NEWS_SOURCE (source_name, source_url, rss_url, trust_weight, language, country) VALUES
('BBC News', 'https://www.bbc.com', 'https://feeds.bbci.co.uk/news/rss.xml', 9.50, 'English', 'UK'),
('CNN', 'https://www.cnn.com', 'http://rss.cnn.com/rss/edition.rss', 8.20, 'English', 'USA'),
('The Daily Star', 'https://www.thedailystar.net', 'https://www.thedailystar.net/rss.xml', 7.80, 'English', 'Bangladesh'),
('NHK World', 'https://www3.nhk.or.jp/nhkworld/', 'https://www3.nhk.or.jp/rss/news/cat0.xml', 8.90, 'Japanese', 'Japan');

INSERT INTO `USER`
(full_name, email, password_hash, preferred_language, region_id, latitude, longitude, is_live_location)
VALUES
('Alice Johnson', 'alice@example.com', 'hash_alice_123', 'English', 1, 32.7767000, -96.7970000, TRUE),
('Bob Smith', 'bob@example.com', 'hash_bob_123', 'English', 2, 30.2672000, -97.7431000, FALSE),
('Nusrat Rahman', 'nusrat@example.com', 'hash_nusrat_123', 'Bangla', 3, 22.3569000, 91.7832000, TRUE),
('Ken Watanabe', 'ken@example.com', 'hash_ken_123', 'Japanese', 4, 35.6762000, 139.6503000, FALSE);

INSERT INTO `EVENT` (canonical_title, event_description, event_type, region_id) VALUES
('Texas Flood Emergency', 'Heavy rainfall caused flash flooding across parts of Dallas.', 'crisis', 1),
('Austin Tech Expo 2025', 'Annual technology expo featuring startups and innovation.', 'normal', 2),
('Chittagong Cyclone Warning', 'Cyclone warning issued for coastal districts.', 'crisis', 3),
('Tokyo Cultural Parade', 'A public cultural parade held downtown.', 'normal', 4);

INSERT INTO CRISIS_EVENT (event_id, crisis_type, severity_level) VALUES
(1, 'Flood', 'High'),
(3, 'Cyclone', 'Critical');

INSERT INTO NORMAL_EVENT (event_id) VALUES
(2),
(4);

INSERT INTO NEWS_ARTICLE
(source_id, event_id, region_id, title, content, summary, translated_content, published_at, language, image_url, article_url, credibility_score, category)
VALUES
(1, 1, 1, 'Severe Flooding Hits Dallas',
 'Dallas is experiencing dangerous flooding after intense storms moved through the region.',
 'Flooding in Dallas has disrupted roads and neighborhoods.',
 'Inundaciones severas en Dallas tras fuertes tormentas.',
 '2025-04-10 08:30:00', 'English', 'https://example.com/flood1.jpg', 'https://example.com/article1', 9.10, 'Disaster'),

(2, 2, 2, 'Austin Tech Expo Opens This Week',
 'Thousands are expected to attend the Austin Tech Expo 2025.',
 'Austin prepares for one of the biggest tech events of the year.',
 'La expo tecnológica de Austin abre esta semana.',
 '2025-04-11 10:00:00', 'English', 'https://example.com/expo1.jpg', 'https://example.com/article2', 8.40, 'Technology'),

(3, 3, 3, 'Cyclone Warning for Chittagong Coast',
 'Authorities have warned residents to prepare for possible evacuation.',
 'Cyclone warning issued with possible landfall near Chittagong.',
 'চট্টগ্রাম উপকূলে ঘূর্ণিঝড়ের সতর্কতা জারি করা হয়েছে।',
 '2025-04-12 06:15:00', 'English', 'https://example.com/cyclone1.jpg', 'https://example.com/article3', 8.70, 'Weather'),

(4, 4, 4, 'Tokyo Parade Draws Large Crowds',
 'The annual cultural parade attracted visitors from across Japan.',
 'Tokyo cultural parade proceeds successfully.',
 '東京の文化パレードは多くの観客を集めました。',
 '2025-04-12 14:20:00', 'Japanese', 'https://example.com/parade1.jpg', 'https://example.com/article4', 8.90, 'Culture');

INSERT INTO USER_ACTIVITY (user_id, article_id, activity_type, reading_time, activity_time) VALUES
(1, 1, 'read', 180, '2025-04-10 09:00:00'),
(1, 2, 'share', 60, '2025-04-11 11:15:00'),
(2, 2, 'read', 240, '2025-04-11 10:30:00'),
(3, 3, 'read', 300, '2025-04-12 07:00:00'),
(4, 4, 'bookmark', 45, '2025-04-12 15:00:00');

INSERT INTO TRENDING_RECORD (article_id, score, calculated_at, time_window) VALUES
(1, 95.50, '2025-04-10 12:00:00', '24h'),
(2, 70.20, '2025-04-11 12:00:00', '24h'),
(3, 98.00, '2025-04-12 12:00:00', '24h'),
(4, 65.75, '2025-04-12 18:00:00', '24h');

INSERT INTO CRISIS_ALERT (event_id, region_id, alert_type, severity, created_at) VALUES
(1, 1, 'Flood Warning', 'High', '2025-04-10 08:45:00'),
(3, 3, 'Cyclone Evacuation Alert', 'Critical', '2025-04-12 06:30:00');

INSERT INTO SOURCE_CREDIBILITY_LOG (event_id, source_id, source_contribution_score, recorded_at) VALUES
(1, 1, 9.20, '2025-04-10 09:30:00'),
(1, 2, 8.70, '2025-04-10 10:00:00'),
(3, 3, 8.80, '2025-04-12 07:15:00'),
(3, 4, 9.10, '2025-04-12 08:00:00');

INSERT INTO BOOKMARK (user_id, article_id) VALUES
(1, 1),
(1, 3),
(2, 2),
(4, 4);

INSERT INTO USER_FOLLOWS_SOURCE (user_id, source_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO ALERT_RECEIPT (user_id, alert_id) VALUES
(1, 1),
(3, 2),
(4, 2);

-- =========================
-- 4) OPTIONAL TEST QUERIES
-- =========================
-- SHOW TABLES;
-- SELECT * FROM `USER`;
-- SELECT e.event_id, e.canonical_title, e.event_type, r.region_name, r.country
-- FROM `EVENT` e
-- JOIN REGION r ON e.region_id = r.region_id;
