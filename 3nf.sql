CREATE TABLE Participants (
    participant_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL
);
CREATE TABLE Schedule (
    schedule_id SERIAL PRIMARY KEY,
    event_id INT REFERENCES Events(event_id),
    event_date DATE NOT NULL
);
CREATE TABLE Feedback (
    feedback_id SERIAL PRIMARY KEY,
    participant_id INT REFERENCES Participants(participant_id),
    event_id INT REFERENCES Events(event_id),
    feedback_text TEXT NOT NULL
);
