-- Vaccine Database Schema

-- Vaccine Coverage Table
CREATE TABLE vaccine_coverage (
  study_id            INT AUTO_INCREMENT PRIMARY KEY,
  estimate_percentage FLOAT NOT NULL,
  sample_size         INT NOT NULL,
  state_id            INT NOT NULL,
  year_id             INT NOT NULL,
  vaccine_id          INT NOT NULL,
  age_id              INT NOT NULL,
  race_eth_id         INT NOT NULL
);
-- States Table
CREATE TABLE states (
  state_id   INT AUTO_INCREMENT PRIMARY KEY,
  state_name VARCHAR(255) NOT NULL
);

-- Survey Year Table
CREATE TABLE survey_year (
  survey_year_id INT AUTO_INCREMENT PRIMARY KEY,
  survey_year    INT NOT NULL
);

-- Vaccine Table
CREATE TABLE vaccine (
  vaccine_id   INT AUTO_INCREMENT PRIMARY KEY,
  vaccine_name VARCHAR(255) NOT NULL
);

-- Age Table
CREATE TABLE age (
  age_id     INT AUTO_INCREMENT PRIMARY KEY,
  age_group  VARCHAR(255) NOT NULL
);

-- Race/Ethnicity Table
CREATE TABLE race_ethnicity (
  race_eth_id    INT AUTO_INCREMENT PRIMARY KEY,
  race_ethnicity VARCHAR(255) NOT NULL
);
