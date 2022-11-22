CREATE DATABASE hge_metadata_instant;
CREATE DATABASE hge_metadata_main;
CREATE DATABASE hge_metadata_hr;
CREATE DATABASE hge_metadata_crm;
CREATE DATABASE hge_metadata_orders;

CREATE USER chinook;

CREATE DATABASE chinook_corp;
GRANT ALL PRIVILEGES ON DATABASE chinook_corp TO chinook;

CREATE DATABASE chinook_music;
GRANT ALL PRIVILEGES ON DATABASE chinook_music TO chinook;

CREATE DATABASE chinook_playlist;
GRANT ALL PRIVILEGES ON DATABASE chinook_playlist TO chinook;
