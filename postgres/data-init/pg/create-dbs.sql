CREATE DATABASE hge_metadata_instant;
CREATE DATABASE hge_metadata_main;
CREATE DATABASE hge_metadata_hr;
CREATE DATABASE hge_metadata_crm;
CREATE DATABASE hge_metadata_orders;
CREATE DATABASE hge_metadata_devices;

ALTER DATABASE hge_metadata_instant OWNER TO postgres;
ALTER DATABASE hge_metadata_main OWNER TO postgres;
ALTER DATABASE hge_metadata_hr OWNER TO postgres;
ALTER DATABASE hge_metadata_crm OWNER TO postgres;
ALTER DATABASE hge_metadata_orders OWNER TO postgres;
ALTER DATABASE hge_metadata_devices OWNER TO postgres;

CREATE USER chinook;

CREATE DATABASE chinook_corp;
ALTER DATABASE chinook_corp OWNER TO postgres;
GRANT ALL PRIVILEGES ON DATABASE chinook_corp TO chinook;

CREATE DATABASE chinook_music;
ALTER DATABASE chinook_music OWNER TO postgres;
GRANT ALL PRIVILEGES ON DATABASE chinook_music TO chinook;

CREATE DATABASE chinook_playlist;
ALTER DATABASE chinook_playlist OWNER TO postgres;
GRANT ALL PRIVILEGES ON DATABASE chinook_playlist TO chinook;
