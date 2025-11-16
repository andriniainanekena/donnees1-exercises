SELECT id, first_name, last_name
FROM employee
WHERE team_id IS NULL;

SELECT e.id, e.first_name, e.last_name
FROM employee e
LEFT JOIN leave_request l ON e.id = l.employee_id
WHERE l.id IS NULL;

SELECT 
    l.id AS leave_id,
    l.start_date,
    l.end_date,
    e.first_name,
    e.last_name,
    t.name AS team_name
FROM leave_request l
JOIN employee e ON l.employee_id = e.id
LEFT JOIN team t ON e.team_id = t.id
ORDER BY l.start_date;

SELECT contract_type, COUNT(*) AS nb_employees
FROM employee
GROUP BY contract_type
ORDER BY nb_employees DESC;

SELECT COUNT(*) AS employees_on_leave
FROM leave_request
WHERE CURRENT_DATE BETWEEN start_date AND end_date;

SELECT 
    e.id,
    e.first_name,
    e.last_name,
    t.name AS team_name
FROM employee e
JOIN leave_request l ON e.id = l.employee_id
LEFT JOIN team t ON e.team_id = t.id
WHERE CURRENT_DATE BETWEEN l.start_date AND l.end_date
ORDER BY e.id;
