drop table if exists subjects CASCADE;

CREATE TABLE subjects
(
subjectid text NOT NULL,
subject VARCHAR(50)
);

COPY subjects FROM 'C:\Users\Public\Documents\subjects.csv' DELIMITER ',' CSV HEADER;

select * from "subjects";