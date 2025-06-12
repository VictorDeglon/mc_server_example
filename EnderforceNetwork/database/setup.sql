-- SQL setup for Enderforce Network permissions and WorldEdit
CREATE TABLE IF NOT EXISTS lp_users (
    uuid VARCHAR(36) NOT NULL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    primary_group VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS lp_groups (
    name VARCHAR(100) NOT NULL PRIMARY KEY,
    permissions TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS lp_tracks (
    name VARCHAR(100) NOT NULL PRIMARY KEY,
    groups TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS lp_actions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    time TIMESTAMP NOT NULL,
    actor VARCHAR(100) NOT NULL,
    action TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS worldedit_sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_uuid VARCHAR(36) NOT NULL,
    session_data BLOB
);

CREATE TABLE IF NOT EXISTS worldedit_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_uuid VARCHAR(36) NOT NULL,
    action TEXT NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
