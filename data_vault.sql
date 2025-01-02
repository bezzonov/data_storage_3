CREATE TABLE Hub_Participants (
    participant_id SERIAL PRIMARY KEY,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE Hub_Events (
    event_id SERIAL PRIMARY KEY,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE Link_Participant_Event (
    participant_id INT REFERENCES Hub_Participants(participant_id),
    event_id INT REFERENCES Hub_Events(event_id),
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (participant_id, event_id)
);

CREATE TABLE Sat_Participants (
    participant_id INT REFERENCES Hub_Participants(participant_id),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Sat_Events (
    event_id INT REFERENCES Hub_Events(event_id),
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Sat_Feedback (
    feedback_id SERIAL PRIMARY KEY,
    participant_id INT REFERENCES Hub_Participants(participant_id),
    event_id INT REFERENCES Hub_Events(event_id),
    feedback_text TEXT NOT NULL,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
