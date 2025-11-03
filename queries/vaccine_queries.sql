-- Which study had the smallest estimated vaccine coverage?
SELECT 
  study_id, 
  estimate_percentage AS Estimated_Vaccine_Coverage
FROM vaccine_coverage 
ORDER BY estimate_percentage ASC 
LIMIT 1;

-- For the study with the smallest estimated vaccine coverage, which state were the partcipants from, what race/ethnicity were they, and which vaccine did they receive? 
SELECT
  vc.study_id,
  vc.estimate_percentage AS estimated_vaccine_coverage,
  s.state_name,
  re.race_ethnicity,
  v.vaccine_name
FROM vaccine_coverage AS vc
JOIN states AS s
  ON s.state_id = vc.state_id
JOIN race_ethnicity AS re
  ON re.race_eth_id = vc.race_eth_id
JOIN vaccine AS v
  ON v.vaccine_id = vc.vaccine_id
WHERE vc.study_id = 184;

-- What is the average estimated vaccine coverage across all studies?
SELECT 
  AVG(estimate_percentage) AS average_estimated_vaccine_coverage
FROM 
  vaccine_coverage;

-- What are the average estimated vaccine coverage percentages by state?
SELECT
  s.state_name,
  AVG(vc.estimate_percentage) AS average_estimated_vaccine_coverage
FROM vaccine_coverage AS vc
JOIN states AS s
  ON s.state_id = vc.state_id
GROUP BY s.state_name
ORDER BY average_estimated_vaccine_coverage ASC, s.state_name ASC;

-- Which states have an average estimated vaccine coverage percentage that is lower than the overall average?
SELECT
  s.state_name,
  AVG(vc.estimate_percentage) AS average_estimated_vaccine_coverage
FROM vaccine_coverage AS vc
JOIN states AS s
  ON s.state_id = vc.state_id
GROUP BY s.state_name
HAVING AVG(vc.estimate_percentage) < 63.95
ORDER BY average_estimated_vaccine_coverage ASC, s.state_name ASC;

-- Which racial/ethnic group has the lowest average estimated vaccine coverage percentage?
SELECT
  re.race_ethnicity,
  AVG(vc.estimate_percentage) AS average_estimated_vaccine_coverage
FROM vaccine_coverage AS vc
JOIN race_ethnicity AS re
  ON re.race_eth_id = vc.race_eth_id
WHERE vc.race_eth_id IS NOT NULL
GROUP BY re.race_ethnicity
ORDER BY average_estimated_vaccine_coverage DESC, re.race_ethnicity ASC;

-- How many studies examined the influenza vaccine and the Tdap vaccine?
SELECT
  v.vaccine_name,
  COUNT(1) AS vaccine_count
FROM vaccine_coverage vc
JOIN vaccine v
  ON vc.vaccine_id = v.vaccine_id
GROUP BY v.vaccine_name;

-- How many times does each age group appear in the vaccine coverage table?
SELECT
  a.age_group,
  COUNT(1) AS Age_Group_Count
FROM vaccine_coverage vc
JOIN age a
  ON vc.age_id = a.age_id
WHERE vc.age_id IS NOT NULL
GROUP BY a.age_group;

-- How many times does each state appear in the vaccine coverage table?
SELECT
  s.state_name,
  COUNT(1)
FROM vaccine_coverage vc
JOIN states s
  ON vc.state_id = s.state_id
GROUP BY s.state_name;

-- How many times does each race/ethnicity appear in the vaccine coverage table?
SELECT
  re.race_ethnicity,
  COUNT(1)
FROM vaccine_coverage vc
JOIN race_ethnicity re
  ON vc.race_eth_id = re.race_eth_id
GROUP BY re.race_ethnicity;
