DROP DATABASE IF EXISTS transport_incident;
CREATE DATABASE transport_incident;
USE transport_incident;

-- МАРШРУТ
CREATE TABLE route(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    route_number VARCHAR(40) NOT NULL,
    start_point VARCHAR(160) NOT NULL,
    endpoint VARCHAR(160) NOT NULL,
    importance_factor DOUBLE NOT NULL
);

-- ТРАНСПОРТНИЙ ЗАСІБ
CREATE TABLE vehicle(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    route_id BIGINT NOT NULL,
    board_number VARCHAR(40) NOT NULL,
    license_number VARCHAR(40) NOT NULL,
    FOREIGN KEY (route_id) REFERENCES route(id)
);

-- ІНЦИДЕНТ
CREATE TABLE incident(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id BIGINT NOT NULL,
    state VARCHAR(30) NOT NULL,
    f1 DOUBLE NOT NULL,
    f2 DOUBLE NOT NULL,
    f3 DOUBLE NOT NULL,
    risk_index DOUBLE NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);


-- Завдання реагування
CREATE TABLE response_task(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    incident_id BIGINT NOT NULL,
    description VARCHAR(500) NOT NULL,
    planned_date VARCHAR(10),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

-- ДОДАВАННЯ ПОЧАТКОВИХ ДАНИХ

-- МАРШРУТ
INSERT INTO route (route_number, start_point, endpoint, importance_factor) VALUES
(' №12', 'Інститу звязку', 'Левада', 1.2),
(' №2', 'Розсошинці', 'Північний', 1.5);

-- ТРАНСПОРТНИЙ ЗАСІБ
INSERT INTO vehicle (route_id, board_number, license_number) VALUES
(1, 'AB1234CD', 'BI4567AI'),
(2, 'AX9876CB', 'BI8899EE');

-- ІНЦИДЕНТ
INSERT INTO incident (vehicle_id, state, f1, f2, f3, risk_index) VALUES
(1, 'Затримка', 10.5, 2.0, 5.1, 0.75),
(2, 'Поломка', 45.0, 8.3, 12.0, 0.92);

-- ЗАВДАННЯ РЕАГУВАННЯ

INSERT INTO response_task (incident_id, description, planned_date) VALUES
(1, 'Направити резервний автобус на маршрут', '2026-06-07'),
(2, 'Евакуювати транспортний засіб у депо', '2026-06-07');
