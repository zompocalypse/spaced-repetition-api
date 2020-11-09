BEGIN;

TRUNCATE
  "word",
  "language",
  "user";

INSERT INTO "user" ("id", "username", "name", "password")
VALUES
  (
    1,
    'admin',
    'Dunder Mifflin Admin',
    -- password = "pass"
    '$2a$10$fCWkaGbt7ZErxaxclioLteLUgg4Q3Rp09WW0s/wSLxDKYsaGYUpjG'
  );

INSERT INTO "language" ("id", "name", "user_id")
VALUES
  (1, 'Dutch', 1);

INSERT INTO "word" ("id", "language_id", "original", "translation", "next")
VALUES
  (1, 1, 'vandaag', 'today', 2),
  (2, 1, 'morgen', 'tomorrow', 3),
  (3, 1, 'gisteren', 'yesterday', 4),
  (4, 1, 'lachen', 'laugh', 5),
  (5, 1, 'huilen', 'cry', 6),
  (6, 1, 'klein', 'small', 7),
  (7, 1, 'groot', 'large', 8),
  (8, 1, 'mooi', 'beautiful', 9),
  (9, 1, 'lelijk', 'ugly', 10),
  (10, 1, 'moeilijk', 'difficult', 11),
  (11, 1, 'makkelijk', 'easy', 12),
  (12, 1, 'leraar', 'teacher', 13),
  (13, 1, 'leerling', 'student', null);

UPDATE "language" SET head = 1 WHERE id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT setval('word_id_seq', (SELECT MAX(id) from "word"));
SELECT setval('language_id_seq', (SELECT MAX(id) from "language"));
SELECT setval('user_id_seq', (SELECT MAX(id) from "user"));

COMMIT;
