-- ------------------------------------------------ --
-- Script SQL para experimentações com comandos SQL --
-- ------------------------------------------------ --

-- Apaga todas as tabelas do banco de dados
-- ATENÇÃO! Só use isso no banco de dados de desenvolvimento
DROP TABLE IF EXISTS pads;
DROP TABLE IF EXISTS owners;

-- Cria a tabela "owners"
-- Precisa ser criada primeiro porque "pads" depende dela
CREATE TABLE owners (
	own_id INTEGER PRIMARY KEY AUTOINCREMENT,
	own_uid TEXT UNIQUE NOT NULL,
	own_display_name TEXT,
	own_email TEXT UNIQUE NOT NULL,
	-- URL da foto do usuário
	own_photo_url TEXT,
	-- 'DEFAULT' significa que vai ser preechido automaticamente
	own_created_at TEXT DEFAULT CURRENT_TIMESTAMP,
	own_last_login_at TEXT DEFAULT CURRENT_TIMESTAMP,
	own_status TEXT NOT NULL DEFAULT 'ON' CHECK (own_status IN ('ON', 'OFF', 'DEL')),
	-- Reservado para uso futuro
	own_metadata TEXT
);

-- Insere alguns registros em "owners" para teste
INSERT INTO owners (
	own_uid,
	own_display_name,
	own_email,
	own_photo_url
) VALUES (
	'92U33H8E839H',
	'Joca da Silva',
	'jocasilva@gmail.com',
	'img/fotojoca.jpg'
), (
	'UT48R407348YE',
	'Maricleuza Siriliano',
	'maricleuza@gmail.com',
	'img/fotomari.png'
), (
	'U45895484H0934',
	'Setembrino Trocatapas',
	'setbrino@gmail.com',
	'img/set.png'
);

-- ----------------------------- --
-- Algumas consultas em 'owners' --
-- ----------------------------- --

-- Lista todos os registros 
SELECT * FROM owners;

-- Lista 'own_display_name' e 'own_email' de todos os registros
SELECT own_email, own_display_name FROM owners;

-- Lista em ordem alfabética pelo 'own_display_name' onde ASC é opcional
SELECT own_uid, own_display_name FROM owners ORDER BY own_display_name ASC;

-- Lista em ordem alfabética inversa pelo 'own_display_name' 
SELECT own_uid, own_display_name FROM owners ORDER BY own_display_name DESC;

-- Lista todos os registros que tem o campo 'own_status' com 'ON'
SELECT * FROM owners WHERE own_status = 'ON';

-- Lista todos os registros que tem o campo 'own_status' com 'OFF'
SELECT * FROM owners WHERE own_status = 'OFF';

-- Pesquisa e retorna os registros onde 'own_photo_url' contém 'png'
SELECT * FROM owners WHERE own_photo_url LIKE '%png';





