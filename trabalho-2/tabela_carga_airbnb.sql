-- Criando as tabelas do Airbnb

DROP TYPE IF EXISTS bool_sigla CASCADE;
CREATE TYPE bool_sigla AS ENUM {'t', 'f'};

DROP TABLE IF EXISTS Listings CASCADE;
CREATE TABLE Listings (
    id BIGINT PRIMARY KEY,
    listing_url TEXT UNIQUE NOT NULL,
    scrape_id BIGINT NOT NULL,
    last_scraped DATE,
    source TEXT,
    name TEXT,
    description TEXT,
    neighborhood_overview TEXT,
    picture_url TEXT,
    host_id BIGINT NOT NULL, 
    host_url TEXT NOT NULL,
    host_name TEXT,
    host_since DATE,
    host_location TEXT,
    host_about TEXT,
    host_response_time TEXT,
    host_response_rate TEXT,
    host_acceptance_rate TEXT,
    host_is_superhost bool_sigla,
    host_thumbnail_url TEXT,
    host_picture_url TEXT,
    host_neighbourhood TEXT,
    host_listings_count INT,
    host_total_listings_count INT,
    host_verifications TEXT,
    host_has_profile_pic BOOLEAN,
    host_identity_verified BOOLEAN,
    neighbourhood TEXT,
    neighbourhood_cleansed TEXT,
    neighbourhood_group_cleansed TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    property_type TEXT,
    room_type TEXT,
    accommodates INT,
    bathrooms INT,
    bathrooms_text TEXT,
    bedrooms INT,
    beds INT,
    amenities TEXT,
    price TEXT,
    minimum_nights INT,
    maximum_nights INT,
    minimum_minimum_nights INT,
    maximum_minimum_nights INT,
    minimum_maximum_nights INT,
    maximum_maximum_nights INT,
    minimum_nights_avg_ntm DOUBLE PRECISION,
    maximum_nights_avg_ntm DOUBLE PRECISION,
    calendar_updated TEXT,
    has_availability bool_sigla,
    availability_30 INT,
    availability_60 INT,
    availability_90 INT,
    availability_365 INT,
    calendar_last_scraped DATE,
    number_of_reviews INT,
    number_of_reviews_ltm INT,
    number_of_reviews_l30d INT,
    first_review DATE,
    last_review DATE,
    review_scores_rating DOUBLE PRECISION,
    review_scores_accuracy DOUBLE PRECISION,
    review_scores_cleanliness DOUBLE PRECISION,
    review_scores_checkin DOUBLE PRECISION,
    review_scores_communication DOUBLE PRECISION,
    review_scores_location DOUBLE PRECISION,
    review_scores_value DOUBLE PRECISION,
    license TEXT,
    instant_bookable bool_sigla,
    calculated_host_listings_count INT,
    calculated_host_listings_count_entire_homes INT,
    calculated_host_listings_count_private_rooms INT,
    calculated_host_listings_count_shared_rooms INT,
    reviews_per_month DOUBLE PRECISION
);

DROP TABLE IF EXISTS Reviews CASCADE;
CREATE TABLE Reviews (
    id BIGINT NOT NULL,
    listing_id BIGINT,
    date DATE,
    reviewer_id BIGINT,
    reviewer_name TEXT,
    comments TEXT
);

DROP TABLE IF EXISTS Calendar CASCADE;
CREATE TABLE Calendar (
    listing_id BIGINT,
    date DATE,
    available bool_sigla,
    price TEXT,
    adjusted_price TEXT,
    minimum_nights INT,
    maximum_nights INT,
    PRIMARY KEY (listing_id, date),
    FOREIGN KEY (listing_id) REFERENCES Listings(id)
);

-- Inserindo os dados .csv para as tabelas

COPY Listings
    FROM './listings.csv' 
        WITH (FORMAT CSV, 
              DELIMITER ',', 
              ENCODING 'UTF8',
              NULL '',
              QUOTE '"', 
              HEADER true);

COPY Reviews
    FROM './reviews.csv' 
        WITH (FORMAT CSV, 
              DELIMITER ',', 
              ENCODING 'UTF8',
              NULL '',
              QUOTE '"', 
              HEADER true);

COPY Calendar
    FROM './calendar.csv' 
        WITH (FORMAT CSV, 
              DELIMITER ',', 
              ENCODING 'UTF8',
              NULL '',
              QUOTE '"', 
              HEADER true);


-- Para uso no jupyter, se precisar
-- Estavamos com problemas utilizando o codigo de exemplo do professor
!psql -c "\copy Listings FROM './listings.csv' WITH (FORMAT CSV, DELIMITER ',', ENCODING 'UTF8', NULL '', QUOTE '\"', HEADER true);" -U postgres -d airbnb_icmc_2

!psql -c "\copy Reviews FROM './reviews.csv' WITH (FORMAT CSV, DELIMITER ',', ENCODING 'UTF8', NULL '', QUOTE '\"', HEADER true);" -U postgres -d airbnb_icmc_2

!psql -c "\copy Calendar FROM './calendar.csv' WITH (FORMAT CSV, DELIMITER ',', ENCODING 'UTF8', NULL '', QUOTE '\"', HEADER true);" -U postgres -d airbnb_icmc_2

-- Criacao das tabelas normalizadas

DROP TABLE IF EXISTS Listings_norm CASCADE;
CREATE TABLE Listings_norm AS (
    SELECT
        id,
        listing_url,
        name,
        description,
        neighborhood_overview,
        picture_url,
        neighbourhood,
        neighbourhood_cleansed,
        neighbourhood_group_cleansed,
        latitude,
        longitude,
        property_type,
        room_type,
        accommodates,
        bathrooms,
        bathrooms_text,
        bedrooms,
        beds,
        price,
        minimum_nights,
        maximum_nights,
        minimum_minimum_nights,
        maximum_minimum_nights,
        minimum_maximum_nights,
        maximum_maximum_nights,
        minimum_nights_avg_ntm,
        maximum_nights_avg_ntm,
        calendar_updated,
        has_availability,
        availability_30,
        availability_60,
        availability_90,
        availability_365,
        calendar_last_scraped,
        number_of_reviews,
        number_of_reviews_ltm,
        number_of_reviews_l30d,
        first_review,
        last_review,
        review_scores_rating,
        review_scores_accuracy,
        review_scores_cleanliness,
        review_scores_checkin,
        review_scores_communication,
        review_scores_location,
        review_scores_value,
        license,
        instant_bookable,
        reviews_per_month
    FROM Listings
)
WITH NO DATA;

ALTER TABLE Listings_norm
    ADD PRIMARY KEY (id),
    ADD CONSTRAINT listing_url_unique UNIQUE (listing_url),
    ALTER COLUMN listing_url SET NOT NULL;

INSERT INTO Listings_norm
    SELECT 
        id,
        listing_url,
        name,
        description,
        neighborhood_overview,
        picture_url,
        neighbourhood,
        neighbourhood_cleansed,
        neighbourhood_group_cleansed,
        latitude,
        longitude,
        property_type,
        room_type,
        accommodates,
        bathrooms,
        bathrooms_text,
        bedrooms,
        beds,
        price,
        minimum_nights,
        maximum_nights,
        minimum_minimum_nights,
        maximum_minimum_nights,
        minimum_maximum_nights,
        maximum_maximum_nights,
        minimum_nights_avg_ntm,
        maximum_nights_avg_ntm,
        calendar_updated,
        has_availability,
        availability_30,
        availability_60,
        availability_90,
        availability_365,
        calendar_last_scraped,
        number_of_reviews,
        number_of_reviews_ltm,
        number_of_reviews_l30d,
        first_review,
        last_review,
        review_scores_rating,
        review_scores_accuracy,
        review_scores_cleanliness,
        review_scores_checkin,
        review_scores_communication,
        review_scores_location,
        review_scores_value,
        license,
        instant_bookable,
        reviews_per_month
    FROM Listings;

DROP TABLE IF EXISTS Scrape CASCADE;
CREATE TABLE Scrape AS (
    SELECT
        scrape_id,
        source,
        last_scraped,
        calendar_last_scraped
    FROM Listings
)
WITH NO DATA;

ALTER TABLE Scrape
    ALTER COLUMN scrape_id SET NOT NULL;

INSERT INTO Scrape
    SELECT
        scrape_id,
        source,
        last_scraped,
        calendar_last_scraped
    FROM Listings; 

DROP TABLE IF EXISTS Amenities CASCADE;
CREATE TABLE Amenities (
    listing_id BIGINT,
    name_amenity TEXT,
    PRIMARY KEY (listing_id, name_amenity)
);

INSERT INTO Amenities (listing_id, name_amenity)
    SELECT L.id, 
    unnest(string_to_array(trim(both '[]' from replace(replace(amenities, '"', ''), '''', '')), ',')) as host_verification
    FROM 
        Listings as L;

DROP TABLE IF EXISTS Host CASCADE;
CREATE TABLE Host AS (
    SELECT
        host_id,
        host_url,
        host_name,
        host_since,
        host_about,
        host_response_time,
        host_response_rate,
        host_acceptance_rate,
        host_is_superhost,
        host_thumbnail_url,
        host_picture_url,
        host_neighbourhood,
        host_listings_count,
        host_total_listings_count,
        host_has_profile_pic,
        host_identity_verified,
        calculated_host_listings_count,
        calculated_host_listings_count_entire_homes,
        calculated_host_listings_count_private_rooms,
        calculated_host_listings_count_shared_rooms
    FROM
        Listings
)
WITH NO DATA;

ALTER TABLE Host
    ADD PRIMARY KEY (host_id),
    ALTER COLUMN host_url SET NOT NULL;

INSERT INTO Host
    SELECT
        host_id,
        host_url,
        host_name,
        host_since,
        host_about,
        host_response_time,
        host_response_rate,
        host_acceptance_rate,
        host_is_superhost,
        host_thumbnail_url,
        host_picture_url,
        host_neighbourhood,
        host_listings_count,
        host_total_listings_count,
        host_has_profile_pic,
        host_identity_verified,
        calculated_host_listings_count,
        calculated_host_listings_count_entire_homes,
        calculated_host_listings_count_private_rooms,
        calculated_host_listings_count_shared_rooms
    FROM
        Listings
ON CONFLICT (host_id) DO NOTHING;

DROP TABLE IF EXISTS Host_verifications CASCADE;
CREATE TABLE Host_verifications (
    host_id BIGINT,
    verification_field TEXT,
    PRIMARY KEY (host_id, verification_field)
);

INSERT INTO Host_verifications (host_id, verification_field)
    SELECT host_id, 
    unnest(string_to_array(trim(both '[]' from replace(replace(host_verifications, '"', ''), '''', '')), ',')) as verification_field
    FROM 
        Listings as L
ON CONFLICT (host_id, verification_field) DO NOTHING;

DROP TABLE IF EXISTS Host_location CASCADE;
CREATE TABLE Host_location (
    host_id BIGINT,
    estado TEXT,
    pais TEXT,
    PRIMARY KEY (host_id)
);

INSERT INTO Host_location (host_id, estado, pais)
    SELECT
        host_id,
        split_part(host_location, ',', 1),
        split_part(host_location, ',', 2) 
    FROM
        Listings
ON CONFLICT (host_id) DO NOTHING;


DROP TABLE IF EXISTS Reviewer CASCADE;
CREATE TABLE Reviewer AS (
    SELECT
        reviewer_id,
        reviewer_name
    FROM
        Reviews
)
WITH NO DATA;

ALTER TABLE Reviewer
    ADD PRIMARY KEY (reviewer_id);

INSERT INTO Reviewer
    SELECT
        reviewer_id,
        reviewer_name
    FROM
        Reviews
ON CONFLICT (reviewer_id) DO NOTHING;


DROP TABLE IF EXISTS Reviews_norm CASCADE;
CREATE TABLE Reviews_norm AS (
    SELECT
        id,
        listing_id,
        reviewer_id,
        date,
        comments
    FROM
        Reviews
)
WITH NO DATA;

ALTER TABLE Reviews_norm
    ADD PRIMARY KEY (id),
    ALTER COLUMN listing_id SET NOT NULL,
    ALTER COLUMN reviewer_id SET NOT NULL;

INSERT INTO Reviews_norm
    SELECT
        id,
        listing_id,
        reviewer_id,
        date,
        comments
    FROM
        Reviews
ON CONFLICT (id) DO NOTHING;

DROP TABLE IF EXISTS Calendar_norm CASCADE;
CREATE TABLE Calendar_norm AS (
    SELECT
        listing_id,
        date,
        available,
        price,
        adjusted_price
    FROM
        Calendar
)
WITH NO DATA;

ALTER TABLE Calendar_norm
    ADD PRIMARY KEY (listing_id, date);

INSERT INTO Calendar_norm
    SELECT
        listing_id,
        date,
        available,
        price,
        adjusted_price
    FROM
        Calendar;

DROP TABLE IF EXISTS Info_listings CASCADE;
CREATE TABLE Info_listings AS (
    SELECT
        listing_id,
        minimum_nights,
        maximum_nights
    FROM
        Calendar
)
WITH NO DATA;

ALTER TABLE Info_listings
    ADD CONSTRAINT listing_id_unique UNIQUE (listing_id);

INSERT INTO Info_listings
    SELECT
        listing_id,
        minimum_nights,
        maximum_nights
    FROM
        Calendar
ON CONFLICT (listing_id) DO NOTHING;