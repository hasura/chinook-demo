SET check_function_bodies = false;

DROP SEQUENCE IF EXISTS public.customers_id_seq CASCADE;
CREATE SEQUENCE public.customers_id_seq
    START WITH 59
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;

DROP TABLE IF EXISTS public.customers CASCADE;
CREATE TABLE public.customers (
    id integer DEFAULT nextval('public.customers_id_seq'::regclass) NOT NULL,
    first_name character varying(40) NOT NULL,
    last_name character varying(20) NOT NULL,
    company character varying(80),
    address character varying(70),
    city character varying(40),
    state character varying(40),
    country character varying(40),
    postal_code character varying(10),
    phone character varying(24),
    fax character varying(24),
    email character varying(60) NOT NULL,
    support_rep_id integer
);

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT pk_customers PRIMARY KEY (id);
CREATE INDEX ifk_customer_support_rep_id ON public.customers USING btree (support_rep_id);


--SET SCHEMA 'public';

INSERT INTO customers (id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES (1, N'Luís', N'Gonçalves', N'Embraer - Empresa Brasileira de Aeronáutica S.A.', N'Av. Brigadeiro Faria Lima, 2170', N'São José dos Campos', N'SP', N'Brazil', N'12227-000', N'+55 (12) 3923-5555', N'+55 (12) 3923-5566', N'luisg@embraer.com.br', 3);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (2, N'Leonie', N'Köhler', N'Theodor-Heuss-Straße 34', N'Stuttgart', N'Germany', N'70174', N'+49 0711 2842222', N'leonekohler@surfeu.de', 5);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (3, N'François', N'Tremblay', N'1498 rue Bélanger', N'Montréal', N'QC', N'Canada', N'H2G 1A7', N'+1 (514) 721-4711', N'ftremblay@gmail.com', 3);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (4, N'Bjørn', N'Hansen', N'Ullevålsveien 14', N'Oslo', N'Norway', N'0171', N'+47 22 44 22 22', N'bjorn.hansen@yahoo.no', 4);
INSERT INTO customers (id, first_name, last_name, company, address, city, country, postal_code, phone, fax, email, support_rep_id) VALUES (5, N'František', N'Wichterlová', N'JetBrains s.r.o.', N'Klanova 9/506', N'Prague', N'Czech Republic', N'14700', N'+420 2 4172 5555', N'+420 2 4172 5555', N'frantisekw@jetbrains.com', 4);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (6, N'Helena', N'Holý', N'Rilská 3174/6', N'Prague', N'Czech Republic', N'14300', N'+420 2 4177 0449', N'hholy@gmail.com', 5);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (7, N'Astrid', N'Gruber', N'Rotenturmstraße 4, 1010 Innere Stadt', N'Vienne', N'Austria', N'1010', N'+43 01 5134505', N'astrid.gruber@apple.at', 5);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (8, N'Daan', N'Peeters', N'Grétrystraat 63', N'Brussels', N'Belgium', N'1000', N'+32 02 219 03 03', N'daan_peeters@apple.be', 4);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (9, N'Kara', N'Nielsen', N'Sønder Boulevard 51', N'Copenhagen', N'Denmark', N'1720', N'+453 3331 9991', N'kara.nielsen@jubii.dk', 4);
INSERT INTO customers (id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES (10, N'Eduardo', N'Martins', N'Woodstock Discos', N'Rua Dr. Falcão Filho, 155', N'São Paulo', N'SP', N'Brazil', N'01007-010', N'+55 (11) 3033-5446', N'+55 (11) 3033-4564', N'eduardo@woodstock.com.br', 4);
INSERT INTO customers (id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES (11, N'Alexandre', N'Rocha', N'Banco do Brasil S.A.', N'Av. Paulista, 2022', N'São Paulo', N'SP', N'Brazil', N'01310-200', N'+55 (11) 3055-3278', N'+55 (11) 3055-8131', N'alero@uol.com.br', 5);
INSERT INTO customers (id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES (12, N'Roberto', N'Almeida', N'Riotur', N'Praça Pio X, 119', N'Rio de Janeiro', N'RJ', N'Brazil', N'20040-020', N'+55 (21) 2271-7000', N'+55 (21) 2271-7070', N'roberto.almeida@riotur.gov.br', 3);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES (13, N'Fernanda', N'Ramos', N'Qe 7 Bloco G', N'Brasília', N'DF', N'Brazil', N'71020-677', N'+55 (61) 3363-5547', N'+55 (61) 3363-7855', N'fernadaramos4@uol.com.br', 4);
INSERT INTO customers (id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES (14, N'Mark', N'Philips', N'Telus', N'8210 111 ST NW', N'Edmonton', N'AB', N'Canada', N'T6G 2C7', N'+1 (780) 434-4554', N'+1 (780) 434-5565', N'mphilips12@shaw.ca', 5);
INSERT INTO customers (id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES (15, N'Jennifer', N'Peterson', N'Rogers Canada', N'700 W Pender Street', N'Vancouver', N'BC', N'Canada', N'V6C 1G8', N'+1 (604) 688-2255', N'+1 (604) 688-8756', N'jenniferp@rogers.ca', 3);
INSERT INTO customers (id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES (16, N'Frank', N'Harris', N'Google Inc.', N'1600 Amphitheatre Parkway', N'Mountain View', N'CA', N'USA', N'94043-1351', N'+1 (650) 253-0000', N'+1 (650) 253-0000', N'fharris@google.com', 4);
INSERT INTO customers (id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES (17, N'Jack', N'Smith', N'Microsoft Corporation', N'1 Microsoft Way', N'Redmond', N'WA', N'USA', N'98052-8300', N'+1 (425) 882-8080', N'+1 (425) 882-8081', N'jacksmith@microsoft.com', 5);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES (18, N'Michelle', N'Brooks', N'627 Broadway', N'New York', N'NY', N'USA', N'10012-2612', N'+1 (212) 221-3546', N'+1 (212) 221-4679', N'michelleb@aol.com', 3);
INSERT INTO customers (id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) VALUES (19, N'Tim', N'Goyer', N'Apple Inc.', N'1 Infinite Loop', N'Cupertino', N'CA', N'USA', N'95014', N'+1 (408) 996-1010', N'+1 (408) 996-1011', N'tgoyer@apple.com', 3);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (20, N'Dan', N'Miller', N'541 Del Medio Avenue', N'Mountain View', N'CA', N'USA', N'94040-111', N'+1 (650) 644-3358', N'dmiller@comcast.com', 4);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (21, N'Kathy', N'Chase', N'801 W 4th Street', N'Reno', N'NV', N'USA', N'89503', N'+1 (775) 223-7665', N'kachase@hotmail.com', 5);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (22, N'Heather', N'Leacock', N'120 S Orange Ave', N'Orlando', N'FL', N'USA', N'32801', N'+1 (407) 999-7788', N'hleacock@gmail.com', 4);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (23, N'John', N'Gordon', N'69 Salem Street', N'Boston', N'MA', N'USA', N'2113', N'+1 (617) 522-1333', N'johngordon22@yahoo.com', 4);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (24, N'Frank', N'Ralston', N'162 E Superior Street', N'Chicago', N'IL', N'USA', N'60611', N'+1 (312) 332-3232', N'fralston@gmail.com', 3);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (25, N'Victor', N'Stevens', N'319 N. Frances Street', N'Madison', N'WI', N'USA', N'53703', N'+1 (608) 257-0597', N'vstevens@yahoo.com', 5);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (26, N'Richard', N'Cunningham', N'2211 W Berry Street', N'Fort Worth', N'TX', N'USA', N'76110', N'+1 (817) 924-7272', N'ricunningham@hotmail.com', 4);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (27, N'Patrick', N'Gray', N'1033 N Park Ave', N'Tucson', N'AZ', N'USA', N'85719', N'+1 (520) 622-4200', N'patrick.gray@aol.com', 4);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (28, N'Julia', N'Barnett', N'302 S 700 E', N'Salt Lake City', N'UT', N'USA', N'84102', N'+1 (801) 531-7272', N'jubarnett@gmail.com', 5);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (29, N'Robert', N'Brown', N'796 Dundas Street West', N'Toronto', N'ON', N'Canada', N'M6J 1V1', N'+1 (416) 363-8888', N'robbrown@shaw.ca', 3);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (30, N'Edward', N'Francis', N'230 Elgin Street', N'Ottawa', N'ON', N'Canada', N'K2P 1L7', N'+1 (613) 234-3322', N'edfrancis@yachoo.ca', 3);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (31, N'Martha', N'Silk', N'194A Chain Lake Drive', N'Halifax', N'NS', N'Canada', N'B3S 1C5', N'+1 (902) 450-0450', N'marthasilk@gmail.com', 5);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (32, N'Aaron', N'Mitchell', N'696 Osborne Street', N'Winnipeg', N'MB', N'Canada', N'R3L 2B9', N'+1 (204) 452-6452', N'aaronmitchell@yahoo.ca', 4);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (33, N'Ellie', N'Sullivan', N'5112 48 Street', N'Yellowknife', N'NT', N'Canada', N'X1A 1N6', N'+1 (867) 920-2233', N'ellie.sullivan@shaw.ca', 3);
INSERT INTO customers (id, first_name, last_name, address, city, country, phone, email, support_rep_id) VALUES (34, N'João', N'Fernandes', N'Rua da Assunção 53', N'Lisbon', N'Portugal', N'+351 (213) 466-111', N'jfernandes@yahoo.pt', 4);
INSERT INTO customers (id, first_name, last_name, address, city, country, phone, email, support_rep_id) VALUES (35, N'Madalena', N'Sampaio', N'Rua dos Campeões Europeus de Viena, 4350', N'Porto', N'Portugal', N'+351 (225) 022-448', N'masampaio@sapo.pt', 4);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (36, N'Hannah', N'Schneider', N'Tauentzienstraße 8', N'Berlin', N'Germany', N'10789', N'+49 030 26550280', N'hannah.schneider@yahoo.de', 5);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (37, N'Fynn', N'Zimmermann', N'Berger Straße 10', N'Frankfurt', N'Germany', N'60316', N'+49 069 40598889', N'fzimmermann@yahoo.de', 3);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (38, N'Niklas', N'Schröder', N'Barbarossastraße 19', N'Berlin', N'Germany', N'10779', N'+49 030 2141444', N'nschroder@surfeu.de', 3);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (39, N'Camille', N'Bernard', N'4, Rue Milton', N'Paris', N'France', N'75009', N'+33 01 49 70 65 65', N'camille.bernard@yahoo.fr', 4);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (40, N'Dominique', N'Lefebvre', N'8, Rue Hanovre', N'Paris', N'France', N'75002', N'+33 01 47 42 71 71', N'dominiquelefebvre@gmail.com', 4);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (41, N'Marc', N'Dubois', N'11, Place Bellecour', N'Lyon', N'France', N'69002', N'+33 04 78 30 30 30', N'marc.dubois@hotmail.com', 5);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (42, N'Wyatt', N'Girard', N'9, Place Louis Barthou', N'Bordeaux', N'France', N'33000', N'+33 05 56 96 96 96', N'wyatt.girard@yahoo.fr', 3);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (43, N'Isabelle', N'Mercier', N'68, Rue Jouvence', N'Dijon', N'France', N'21000', N'+33 03 80 73 66 99', N'isabelle_mercier@apple.fr', 3);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (44, N'Terhi', N'Hämäläinen', N'Porthaninkatu 9', N'Helsinki', N'Finland', N'00530', N'+358 09 870 2000', N'terhi.hamalainen@apple.fi', 3);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, email, support_rep_id) VALUES (45, N'Ladislav', N'Kovács', N'Erzsébet krt. 58.', N'Budapest', N'Hungary', N'H-1073', N'ladislav_kovacs@apple.hu', 3);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, phone, email, support_rep_id) VALUES (46, N'Hugh', N'O''Reilly', N'3 Chatham Street', N'Dublin', N'Dublin', N'Ireland', N'+353 01 6792424', N'hughoreilly@apple.ie', 3);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (47, N'Lucas', N'Mancini', N'Via Degli Scipioni, 43', N'Rome', N'RM', N'Italy', N'00192', N'+39 06 39733434', N'lucas.mancini@yahoo.it', 5);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (48, N'Johannes', N'Van der Berg', N'Lijnbaansgracht 120bg', N'Amsterdam', N'VV', N'Netherlands', N'1016', N'+31 020 6223130', N'johavanderberg@yahoo.nl', 5);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (49, N'Stanislaw', N'Wójcik', N'Ordynacka 10', N'Warsaw', N'Poland', N'00-358', N'+48 22 828 37 39', N'stanislaw.wójcik@wp.pl', 4);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (50, N'Enrique', N'Muñoz', N'C/ San Bernardo 85', N'Madrid', N'Spain', N'28015', N'+34 914 454 454', N'enrique_munoz@yahoo.es', 5);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (51, N'Joakim', N'Johansson', N'Celsiusg. 9', N'Stockholm', N'Sweden', N'11230', N'+46 08-651 52 52', N'joakim.johansson@yahoo.se', 5);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (52, N'Emma', N'Jones', N'202 Hoxton Street', N'London', N'United Kingdom', N'N1 5LH', N'+44 020 7707 0707', N'emma_jones@hotmail.com', 3);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (53, N'Phil', N'Hughes', N'113 Lupus St', N'London', N'United Kingdom', N'SW1V 3EN', N'+44 020 7976 5722', N'phil.hughes@gmail.com', 3);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (54, N'Steve', N'Murray', N'110 Raeburn Pl', N'Edinburgh ', N'United Kingdom', N'EH4 1HH', N'+44 0131 315 3300', N'steve.murray@yahoo.uk', 5);
INSERT INTO customers (id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) VALUES (55, N'Mark', N'Taylor', N'421 Bourke Street', N'Sidney', N'NSW', N'Australia', N'2010', N'+61 (02) 9332 3633', N'mark.taylor@yahoo.au', 4);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (56, N'Diego', N'Gutiérrez', N'307 Macacha Güemes', N'Buenos Aires', N'Argentina', N'1106', N'+54 (0)11 4311 4333', N'diego.gutierrez@yahoo.ar', 4);
INSERT INTO customers (id, first_name, last_name, address, city, country, phone, email, support_rep_id) VALUES (57, N'Luis', N'Rojas', N'Calle Lira, 198', N'Santiago', N'Chile', N'+56 (0)2 635 4444', N'luisrojas@yahoo.cl', 5);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (58, N'Manoj', N'Pareek', N'12,Community Centre', N'Delhi', N'India', N'110017', N'+91 0124 39883988', N'manoj.pareek@rediff.com', 3);
INSERT INTO customers (id, first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) VALUES (59, N'Puja', N'Srivastava', N'3,Raj Bhavan Road', N'Bangalore', N'India', N'560001', N'+91 080 22289999', N'puja_srivastava@yahoo.in', 3);
