CREATE DATABASE doingsdone
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;

USE doingsdone;

CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(320) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at  TIMESTAMP DEFAULT NOW()  NOT NULL,
  updated_at TIMESTAMP DEFAULT NOW()  ON UPDATE NOW() NOT NULL
);

CREATE TABLE projects (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  user_id INT unsigned NOT NULL,
  created_at  TIMESTAMP DEFAULT NOW()  NOT NULL,
  updated_at TIMESTAMP DEFAULT NOW()  ON UPDATE NOW() NOT NULL,
  CONSTRAINT fk_project_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE tasks (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  status TINYINT(1) DEFAULT 0 NOT NULL,
  title VARCHAR(255) NOT NULL,
  file_path VARCHAR(255) NULL,
  deadline_date TIMESTAMP NULL,
  user_id INT unsigned NOT NULL,
  created_at  TIMESTAMP DEFAULT NOW()  NOT NULL,
  updated_at TIMESTAMP DEFAULT NOW()  ON UPDATE NOW() NOT NULL,
  CONSTRAINT fk_task_user FOREIGN KEY (user_id) REFERENCES users(id),
  project_id INT unsigned NOT NULL,
  CONSTRAINT fk_task_project FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE INDEX u_name on users (name);
CREATE INDEX pr_title on projects (title);
CREATE INDEX t_title ON tasks (title);