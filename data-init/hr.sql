SET check_function_bodies = false;

DROP SEQUENCE IF EXISTS public.employees_id_seq CASCADE;
CREATE SEQUENCE public.employees_id_seq
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;

DROP TABLE IF EXISTS public.employees CASCADE;
CREATE TABLE public.employees (
    id integer DEFAULT nextval('public.employees_id_seq'::regclass) NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(20) NOT NULL,
    title character varying(30),
    manager_id integer,
    birth_date timestamp without time zone,
    hire_date timestamp without time zone,
    address character varying(70),
    city character varying(40),
    state character varying(40),
    country character varying(40),
    postal_code character varying(10),
    phone character varying(24),
    fax character varying(24),
    email character varying(60)
);

DROP TABLE IF EXISTS public.ad_hoc_manager CASCADE;
CREATE TABLE public.ad_hoc_manager (
    id integer NOT NULL,
    employee_id integer,
    applies_to_org boolean
);

DROP VIEW IF EXISTS public.employee_org_permissions CASCADE;
CREATE OR REPLACE VIEW public.employee_org_permissions AS
WITH RECURSIVE org AS (
    SELECT
        manager_id as org_leader_id,
        id as employee_id
    FROM
        employees
    WHERE
        id IN (
            SELECT
                DISTINCT(id)
            FROM
                employees
            WHERE manager_id IS NOT NULL
        )
    UNION
        SELECT
            org_leader_id,
            e.id as employee_id
        FROM
            employees e
        INNER JOIN org o ON o.employee_id = e.manager_id
) SELECT
    *
FROM
   org
UNION
SELECT
    id as org_leader_id,
    employee_id
FROM ad_hoc_manager
WHERE applies_to_org = false
UNION
SELECT
    ahm.id as org_leader_id,
    o.employee_id
FROM ad_hoc_manager ahm
JOIN org o ON o.org_leader_id = ahm.employee_id
WHERE applies_to_org = true;

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (id);
CREATE INDEX ifk_employee_manager_id ON public.employees USING btree (manager_id);
ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employee_manager_id FOREIGN KEY (manager_id) REFERENCES public.employees(id);

CREATE OR REPLACE FUNCTION public.employee_full_name(employees_row employees)
RETURNS TEXT AS $$
  SELECT employees_row.first_name || ' ' || employees_row.last_name;
$$ LANGUAGE sql STABLE;


--SET SCHEMA 'public';

INSERT INTO employees (id, last_name, first_name, title, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES (1, N'Adams', N'Andrew', N'General Manager', '1962/2/18', '2002/8/14', N'11120 Jasper Ave NW', N'Edmonton', N'AB', N'Canada', N'T5K 2N1', N'+1 (780) 428-9482', N'+1 (780) 428-3457', N'andrew@chinookpublic.com');
INSERT INTO employees (id, last_name, first_name, title, manager_id, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES (2, N'Edwards', N'Nancy', N'Sales Manager', 1, '1958/12/8', '2002/5/1', N'825 8 Ave SW', N'Calgary', N'AB', N'Canada', N'T2P 2T3', N'+1 (403) 262-3443', N'+1 (403) 262-3322', N'nancy@chinookpublic.com');
INSERT INTO employees (id, last_name, first_name, title, manager_id, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES (3, N'Peacock', N'Jane', N'Sales Support Agent', 2, '1973/8/29', '2002/4/1', N'1111 6 Ave SW', N'Calgary', N'AB', N'Canada', N'T2P 5M5', N'+1 (403) 262-3443', N'+1 (403) 262-6712', N'jane@chinookpublic.com');
INSERT INTO employees (id, last_name, first_name, title, manager_id, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES (4, N'Park', N'Margaret', N'Sales Support Agent', 2, '1947/9/19', '2003/5/3', N'683 10 Street SW', N'Calgary', N'AB', N'Canada', N'T2P 5G3', N'+1 (403) 263-4423', N'+1 (403) 263-4289', N'margaret@chinookpublic.com');
INSERT INTO employees (id, last_name, first_name, title, manager_id, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES (5, N'Johnson', N'Steve', N'Sales Support Agent', 2, '1965/3/3', '2003/10/17', N'7727B 41 Ave', N'Calgary', N'AB', N'Canada', N'T3B 1Y7', N'1 (780) 836-9987', N'1 (780) 836-9543', N'steve@chinookpublic.com');
INSERT INTO employees (id, last_name, first_name, title, manager_id, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES (6, N'Mitchell', N'Michael', N'IT Manager', 1, '1973/7/1', '2003/10/17', N'5827 Bowness Road NW', N'Calgary', N'AB', N'Canada', N'T3B 0C5', N'+1 (403) 246-9887', N'+1 (403) 246-9899', N'michael@chinookpublic.com');
INSERT INTO employees (id, last_name, first_name, title, manager_id, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES (7, N'King', N'Robert', N'IT Staff', 6, '1970/5/29', '2004/1/2', N'590 Columbia Boulevard West', N'Lethbridge', N'AB', N'Canada', N'T1K 5N8', N'+1 (403) 456-9986', N'+1 (403) 456-8485', N'robert@chinookpublic.com');
INSERT INTO employees (id, last_name, first_name, title, manager_id, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) VALUES (8, N'Callahan', N'Laura', N'IT Staff', 6, '1968/1/9', '2004/3/4', N'923 7 ST NW', N'Lethbridge', N'AB', N'Canada', N'T1H 1Y8', N'+1 (403) 467-3351', N'+1 (403) 467-8772', N'laura@chinookpublic.com');

INSERT INTO employees (id, last_name, first_name, title, manager_id, email) VALUES (10, N'Smith', N'Robin', N'Management Consultant', 1, N'robin@chinookpublic.com');
INSERT INTO employees (id, last_name, first_name, title, manager_id, email) VALUES (11, N'Jones', N'Sam', N'Management Consultant', 1, N'sam@chinookpublic.com');

INSERT INTO ad_hoc_manager (id, employee_id, applies_to_org) VALUES (10, 2, false);
INSERT INTO ad_hoc_manager (id, employee_id, applies_to_org) VALUES (11, 6, true);
