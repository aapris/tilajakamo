--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO tilajakamo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO tilajakamo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO tilajakamo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO tilajakamo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO tilajakamo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO tilajakamo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO tilajakamo;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO tilajakamo;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO tilajakamo;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO tilajakamo;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO tilajakamo;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO tilajakamo;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO tilajakamo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO tilajakamo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO tilajakamo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO tilajakamo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO tilajakamo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO tilajakamo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO tilajakamo;

--
-- Name: home_advert; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_advert (
    id integer NOT NULL,
    url character varying(200),
    text character varying(255) NOT NULL,
    page_id integer,
    feed_image_id integer
);


ALTER TABLE home_advert OWNER TO tilajakamo;

--
-- Name: home_advert_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_advert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_advert_id_seq OWNER TO tilajakamo;

--
-- Name: home_advert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_advert_id_seq OWNED BY home_advert.id;


--
-- Name: home_advertplacement; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_advertplacement (
    id integer NOT NULL,
    advert_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE home_advertplacement OWNER TO tilajakamo;

--
-- Name: home_advertplacement_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_advertplacement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_advertplacement_id_seq OWNER TO tilajakamo;

--
-- Name: home_advertplacement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_advertplacement_id_seq OWNED BY home_advertplacement.id;


--
-- Name: home_blogindexpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_blogindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


ALTER TABLE home_blogindexpage OWNER TO tilajakamo;

--
-- Name: home_blogindexpagerelatedlink; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_blogindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_blogindexpagerelatedlink OWNER TO tilajakamo;

--
-- Name: home_blogindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_blogindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_blogindexpagerelatedlink_id_seq OWNER TO tilajakamo;

--
-- Name: home_blogindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_blogindexpagerelatedlink_id_seq OWNED BY home_blogindexpagerelatedlink.id;


--
-- Name: home_blogpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_blogpage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    date date NOT NULL,
    feed_image_id integer,
    public boolean NOT NULL
);


ALTER TABLE home_blogpage OWNER TO tilajakamo;

--
-- Name: home_blogpagecarouselitem; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_blogpagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_blogpagecarouselitem OWNER TO tilajakamo;

--
-- Name: home_blogpagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_blogpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_blogpagecarouselitem_id_seq OWNER TO tilajakamo;

--
-- Name: home_blogpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_blogpagecarouselitem_id_seq OWNED BY home_blogpagecarouselitem.id;


--
-- Name: home_blogpagerelatedlink; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_blogpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_blogpagerelatedlink OWNER TO tilajakamo;

--
-- Name: home_blogpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_blogpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_blogpagerelatedlink_id_seq OWNER TO tilajakamo;

--
-- Name: home_blogpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_blogpagerelatedlink_id_seq OWNED BY home_blogpagerelatedlink.id;


--
-- Name: home_blogpagetag; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_blogpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE home_blogpagetag OWNER TO tilajakamo;

--
-- Name: home_blogpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_blogpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_blogpagetag_id_seq OWNER TO tilajakamo;

--
-- Name: home_blogpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_blogpagetag_id_seq OWNED BY home_blogpagetag.id;


--
-- Name: home_contactpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_contactpage (
    page_ptr_id integer NOT NULL,
    telephone character varying(20) NOT NULL,
    email character varying(254) NOT NULL,
    address_1 character varying(255) NOT NULL,
    address_2 character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    post_code character varying(10) NOT NULL,
    body text NOT NULL,
    feed_image_id integer
);


ALTER TABLE home_contactpage OWNER TO tilajakamo;

--
-- Name: home_eventindexpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_eventindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


ALTER TABLE home_eventindexpage OWNER TO tilajakamo;

--
-- Name: home_eventindexpagerelatedlink; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_eventindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_eventindexpagerelatedlink OWNER TO tilajakamo;

--
-- Name: home_eventindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_eventindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_eventindexpagerelatedlink_id_seq OWNER TO tilajakamo;

--
-- Name: home_eventindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_eventindexpagerelatedlink_id_seq OWNED BY home_eventindexpagerelatedlink.id;


--
-- Name: home_eventpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_eventpage (
    page_ptr_id integer NOT NULL,
    date_from date NOT NULL,
    date_to date,
    time_from time without time zone,
    time_to time without time zone,
    audience character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    body text NOT NULL,
    cost character varying(255) NOT NULL,
    signup_link character varying(200) NOT NULL,
    feed_image_id integer
);


ALTER TABLE home_eventpage OWNER TO tilajakamo;

--
-- Name: home_eventpagecarouselitem; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_eventpagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_eventpagecarouselitem OWNER TO tilajakamo;

--
-- Name: home_eventpagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_eventpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_eventpagecarouselitem_id_seq OWNER TO tilajakamo;

--
-- Name: home_eventpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_eventpagecarouselitem_id_seq OWNED BY home_eventpagecarouselitem.id;


--
-- Name: home_eventpagerelatedlink; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_eventpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_eventpagerelatedlink OWNER TO tilajakamo;

--
-- Name: home_eventpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_eventpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_eventpagerelatedlink_id_seq OWNER TO tilajakamo;

--
-- Name: home_eventpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_eventpagerelatedlink_id_seq OWNED BY home_eventpagerelatedlink.id;


--
-- Name: home_eventpagespeaker; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_eventpagespeaker (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_eventpagespeaker OWNER TO tilajakamo;

--
-- Name: home_eventpagespeaker_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_eventpagespeaker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_eventpagespeaker_id_seq OWNER TO tilajakamo;

--
-- Name: home_eventpagespeaker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_eventpagespeaker_id_seq OWNED BY home_eventpagespeaker.id;


--
-- Name: home_faqindexpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_faqindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


ALTER TABLE home_faqindexpage OWNER TO tilajakamo;

--
-- Name: home_faqpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_faqpage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    public boolean NOT NULL,
    feed_image_id integer
);


ALTER TABLE home_faqpage OWNER TO tilajakamo;

--
-- Name: home_faqpagerelatedlink; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_faqpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_faqpagerelatedlink OWNER TO tilajakamo;

--
-- Name: home_faqpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_faqpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_faqpagerelatedlink_id_seq OWNER TO tilajakamo;

--
-- Name: home_faqpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_faqpagerelatedlink_id_seq OWNED BY home_faqpagerelatedlink.id;


--
-- Name: home_faqpagetag; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_faqpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE home_faqpagetag OWNER TO tilajakamo;

--
-- Name: home_faqpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_faqpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_faqpagetag_id_seq OWNER TO tilajakamo;

--
-- Name: home_faqpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_faqpagetag_id_seq OWNED BY home_faqpagetag.id;


--
-- Name: home_formfield; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_formfield (
    id integer NOT NULL,
    sort_order integer,
    label character varying(255) NOT NULL,
    field_type character varying(16) NOT NULL,
    required boolean NOT NULL,
    choices character varying(512) NOT NULL,
    default_value character varying(255) NOT NULL,
    help_text character varying(255) NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE home_formfield OWNER TO tilajakamo;

--
-- Name: home_formfield_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_formfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_formfield_id_seq OWNER TO tilajakamo;

--
-- Name: home_formfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_formfield_id_seq OWNED BY home_formfield.id;


--
-- Name: home_formpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_formpage (
    page_ptr_id integer NOT NULL,
    to_address character varying(255) NOT NULL,
    from_address character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    intro text NOT NULL,
    thank_you_text text NOT NULL
);


ALTER TABLE home_formpage OWNER TO tilajakamo;

--
-- Name: home_homepage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_homepage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    bg_image_id integer
);


ALTER TABLE home_homepage OWNER TO tilajakamo;

--
-- Name: home_homepagecarouselitem; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_homepagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_homepagecarouselitem OWNER TO tilajakamo;

--
-- Name: home_homepagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_homepagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_homepagecarouselitem_id_seq OWNER TO tilajakamo;

--
-- Name: home_homepagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_homepagecarouselitem_id_seq OWNED BY home_homepagecarouselitem.id;


--
-- Name: home_homepagerelatedlink; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_homepagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_homepagerelatedlink OWNER TO tilajakamo;

--
-- Name: home_homepagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_homepagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_homepagerelatedlink_id_seq OWNER TO tilajakamo;

--
-- Name: home_homepagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_homepagerelatedlink_id_seq OWNED BY home_homepagerelatedlink.id;


--
-- Name: home_personindexpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_personindexpage (
    page_ptr_id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    room_id integer,
    feed_image_id integer,
    intro text NOT NULL
);


ALTER TABLE home_personindexpage OWNER TO tilajakamo;

--
-- Name: home_personpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_personpage (
    page_ptr_id integer NOT NULL,
    telephone character varying(20) NOT NULL,
    email character varying(254) NOT NULL,
    address_1 character varying(255) NOT NULL,
    address_2 character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    post_code character varying(10) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    intro text NOT NULL,
    biography text NOT NULL,
    image_id integer,
    room_id integer,
    public boolean NOT NULL,
    telegram character varying(255) NOT NULL
);


ALTER TABLE home_personpage OWNER TO tilajakamo;

--
-- Name: home_personpagerelatedlink; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_personpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_personpagerelatedlink OWNER TO tilajakamo;

--
-- Name: home_personpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_personpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_personpagerelatedlink_id_seq OWNER TO tilajakamo;

--
-- Name: home_personpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_personpagerelatedlink_id_seq OWNED BY home_personpagerelatedlink.id;


--
-- Name: home_roomindexpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_roomindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


ALTER TABLE home_roomindexpage OWNER TO tilajakamo;

--
-- Name: home_roompage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_roompage (
    page_ptr_id integer NOT NULL,
    free boolean NOT NULL,
    body text NOT NULL,
    feed_image_id integer,
    public boolean NOT NULL
);


ALTER TABLE home_roompage OWNER TO tilajakamo;

--
-- Name: home_standardindexpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_standardindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


ALTER TABLE home_standardindexpage OWNER TO tilajakamo;

--
-- Name: home_standardindexpagerelatedlink; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_standardindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_standardindexpagerelatedlink OWNER TO tilajakamo;

--
-- Name: home_standardindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_standardindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_standardindexpagerelatedlink_id_seq OWNER TO tilajakamo;

--
-- Name: home_standardindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_standardindexpagerelatedlink_id_seq OWNED BY home_standardindexpagerelatedlink.id;


--
-- Name: home_standardpage; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_standardpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    body text NOT NULL,
    feed_image_id integer,
    public boolean NOT NULL
);


ALTER TABLE home_standardpage OWNER TO tilajakamo;

--
-- Name: home_standardpagecarouselitem; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_standardpagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_standardpagecarouselitem OWNER TO tilajakamo;

--
-- Name: home_standardpagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_standardpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_standardpagecarouselitem_id_seq OWNER TO tilajakamo;

--
-- Name: home_standardpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_standardpagecarouselitem_id_seq OWNED BY home_standardpagecarouselitem.id;


--
-- Name: home_standardpagerelatedlink; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE home_standardpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE home_standardpagerelatedlink OWNER TO tilajakamo;

--
-- Name: home_standardpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE home_standardpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_standardpagerelatedlink_id_seq OWNER TO tilajakamo;

--
-- Name: home_standardpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE home_standardpagerelatedlink_id_seq OWNED BY home_standardpagerelatedlink.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE taggit_tag OWNER TO tilajakamo;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggit_tag_id_seq OWNER TO tilajakamo;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE taggit_taggeditem OWNER TO tilajakamo;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggit_taggeditem_id_seq OWNER TO tilajakamo;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE wagtailcore_grouppagepermission OWNER TO tilajakamo;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_grouppagepermission_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailcore_grouppagepermission_id_seq OWNED BY wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE wagtailcore_page OWNER TO tilajakamo;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_page_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailcore_page_id_seq OWNED BY wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


ALTER TABLE wagtailcore_pagerevision OWNER TO tilajakamo;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_pagerevision_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailcore_pagerevision_id_seq OWNED BY wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE wagtailcore_pageviewrestriction OWNER TO tilajakamo;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_pageviewrestriction_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_id_seq OWNED BY wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL,
    site_name character varying(255)
);


ALTER TABLE wagtailcore_site OWNER TO tilajakamo;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_site_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailcore_site_id_seq OWNED BY wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer
);


ALTER TABLE wagtaildocs_document OWNER TO tilajakamo;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtaildocs_document_id_seq OWNER TO tilajakamo;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtaildocs_document_id_seq OWNED BY wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


ALTER TABLE wagtailembeds_embed OWNER TO tilajakamo;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailembeds_embed_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailembeds_embed_id_seq OWNED BY wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE wagtailforms_formsubmission OWNER TO tilajakamo;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailforms_formsubmission_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailforms_formsubmission_id_seq OWNED BY wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_filter; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailimages_filter (
    id integer NOT NULL,
    spec character varying(255) NOT NULL
);


ALTER TABLE wagtailimages_filter OWNER TO tilajakamo;

--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailimages_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailimages_filter_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailimages_filter_id_seq OWNED BY wagtailimages_filter.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    file_size integer,
    CONSTRAINT wagtailimages_image_file_size_check CHECK ((file_size >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


ALTER TABLE wagtailimages_image OWNER TO tilajakamo;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailimages_image_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailimages_image_id_seq OWNED BY wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(255) NOT NULL,
    filter_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE wagtailimages_rendition OWNER TO tilajakamo;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailimages_rendition_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailimages_rendition_id_seq OWNED BY wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(200) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


ALTER TABLE wagtailredirects_redirect OWNER TO tilajakamo;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailredirects_redirect_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailredirects_redirect_id_seq OWNED BY wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_editorspick; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailsearch_editorspick (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE wagtailsearch_editorspick OWNER TO tilajakamo;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailsearch_editorspick_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailsearch_editorspick_id_seq OWNED BY wagtailsearch_editorspick.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


ALTER TABLE wagtailsearch_query OWNER TO tilajakamo;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailsearch_query_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailsearch_query_id_seq OWNED BY wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE wagtailsearch_querydailyhits OWNER TO tilajakamo;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailsearch_querydailyhits_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailsearch_querydailyhits_id_seq OWNED BY wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE TABLE wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE wagtailusers_userprofile OWNER TO tilajakamo;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: tilajakamo
--

CREATE SEQUENCE wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailusers_userprofile_id_seq OWNER TO tilajakamo;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tilajakamo
--

ALTER SEQUENCE wagtailusers_userprofile_id_seq OWNED BY wagtailusers_userprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_advert ALTER COLUMN id SET DEFAULT nextval('home_advert_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_advertplacement ALTER COLUMN id SET DEFAULT nextval('home_advertplacement_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('home_blogindexpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('home_blogpagecarouselitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('home_blogpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagetag ALTER COLUMN id SET DEFAULT nextval('home_blogpagetag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('home_eventindexpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('home_eventpagecarouselitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('home_eventpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagespeaker ALTER COLUMN id SET DEFAULT nextval('home_eventpagespeaker_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_faqpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('home_faqpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_faqpagetag ALTER COLUMN id SET DEFAULT nextval('home_faqpagetag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_formfield ALTER COLUMN id SET DEFAULT nextval('home_formfield_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_homepagecarouselitem ALTER COLUMN id SET DEFAULT nextval('home_homepagecarouselitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_homepagerelatedlink ALTER COLUMN id SET DEFAULT nextval('home_homepagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_personpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('home_personpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('home_standardindexpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('home_standardpagecarouselitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('home_standardpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('wagtailcore_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('wagtailcore_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('wagtaildocs_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('wagtailembeds_embed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailimages_filter ALTER COLUMN id SET DEFAULT nextval('wagtailimages_filter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('wagtailimages_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('wagtailimages_rendition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailsearch_editorspick ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
3	member
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('auth_group_id_seq', 3, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	1	4
8	1	5
9	1	6
10	2	4
11	2	5
12	2	6
13	1	7
14	2	7
15	3	1
16	3	4
17	3	7
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 17, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add image	2	add_image
2	Can change image	2	change_image
3	Can delete image	2	delete_image
4	Can add document	3	add_document
5	Can change document	3	change_document
6	Can delete document	3	delete_document
7	Can access Wagtail admin	4	access_admin
8	Can add advert placement	5	add_advertplacement
9	Can change advert placement	5	change_advertplacement
10	Can delete advert placement	5	delete_advertplacement
11	Can add advert	6	add_advert
12	Can change advert	6	change_advert
13	Can delete advert	6	delete_advert
14	Can add home page carousel item	7	add_homepagecarouselitem
15	Can change home page carousel item	7	change_homepagecarouselitem
16	Can delete home page carousel item	7	delete_homepagecarouselitem
17	Can add home page related link	8	add_homepagerelatedlink
18	Can change home page related link	8	change_homepagerelatedlink
19	Can delete home page related link	8	delete_homepagerelatedlink
20	Can add Homepage	9	add_homepage
21	Can change Homepage	9	change_homepage
22	Can delete Homepage	9	delete_homepage
23	Can add standard index page related link	10	add_standardindexpagerelatedlink
24	Can change standard index page related link	10	change_standardindexpagerelatedlink
25	Can delete standard index page related link	10	delete_standardindexpagerelatedlink
26	Can add standard index page	11	add_standardindexpage
27	Can change standard index page	11	change_standardindexpage
28	Can delete standard index page	11	delete_standardindexpage
29	Can add standard page carousel item	12	add_standardpagecarouselitem
30	Can change standard page carousel item	12	change_standardpagecarouselitem
31	Can delete standard page carousel item	12	delete_standardpagecarouselitem
32	Can add standard page related link	13	add_standardpagerelatedlink
33	Can change standard page related link	13	change_standardpagerelatedlink
34	Can delete standard page related link	13	delete_standardpagerelatedlink
35	Can add standard page	14	add_standardpage
36	Can change standard page	14	change_standardpage
37	Can delete standard page	14	delete_standardpage
38	Can add room page	15	add_roompage
39	Can change room page	15	change_roompage
40	Can delete room page	15	delete_roompage
41	Can add room index page	16	add_roomindexpage
42	Can change room index page	16	change_roomindexpage
43	Can delete room index page	16	delete_roomindexpage
44	Can add blog page carousel item	17	add_blogpagecarouselitem
45	Can change blog page carousel item	17	change_blogpagecarouselitem
46	Can delete blog page carousel item	17	delete_blogpagecarouselitem
47	Can add blog page related link	18	add_blogpagerelatedlink
48	Can change blog page related link	18	change_blogpagerelatedlink
49	Can delete blog page related link	18	delete_blogpagerelatedlink
50	Can add blog page tag	19	add_blogpagetag
51	Can change blog page tag	19	change_blogpagetag
52	Can delete blog page tag	19	delete_blogpagetag
53	Can add blog page	20	add_blogpage
54	Can change blog page	20	change_blogpage
55	Can delete blog page	20	delete_blogpage
56	Can add blog index page	21	add_blogindexpage
57	Can change blog index page	21	change_blogindexpage
58	Can delete blog index page	21	delete_blogindexpage
59	Can add blog index page related link	22	add_blogindexpagerelatedlink
60	Can change blog index page related link	22	change_blogindexpagerelatedlink
61	Can delete blog index page related link	22	delete_blogindexpagerelatedlink
62	Can add faq page related link	23	add_faqpagerelatedlink
63	Can change faq page related link	23	change_faqpagerelatedlink
64	Can delete faq page related link	23	delete_faqpagerelatedlink
65	Can add faq page tag	24	add_faqpagetag
66	Can change faq page tag	24	change_faqpagetag
67	Can delete faq page tag	24	delete_faqpagetag
68	Can add faq page	25	add_faqpage
69	Can change faq page	25	change_faqpage
70	Can delete faq page	25	delete_faqpage
71	Can add faq index page	26	add_faqindexpage
72	Can change faq index page	26	change_faqindexpage
73	Can delete faq index page	26	delete_faqindexpage
74	Can add person page related link	27	add_personpagerelatedlink
75	Can change person page related link	27	change_personpagerelatedlink
76	Can delete person page related link	27	delete_personpagerelatedlink
77	Can add person page	28	add_personpage
78	Can change person page	28	change_personpage
79	Can delete person page	28	delete_personpage
80	Can add person index page	29	add_personindexpage
81	Can change person index page	29	change_personindexpage
82	Can delete person index page	29	delete_personindexpage
83	Can add contact page	30	add_contactpage
84	Can change contact page	30	change_contactpage
85	Can delete contact page	30	delete_contactpage
86	Can add event index page related link	31	add_eventindexpagerelatedlink
87	Can change event index page related link	31	change_eventindexpagerelatedlink
88	Can delete event index page related link	31	delete_eventindexpagerelatedlink
89	Can add event index page	32	add_eventindexpage
90	Can change event index page	32	change_eventindexpage
91	Can delete event index page	32	delete_eventindexpage
92	Can add event page carousel item	33	add_eventpagecarouselitem
93	Can change event page carousel item	33	change_eventpagecarouselitem
94	Can delete event page carousel item	33	delete_eventpagecarouselitem
95	Can add event page related link	34	add_eventpagerelatedlink
96	Can change event page related link	34	change_eventpagerelatedlink
97	Can delete event page related link	34	delete_eventpagerelatedlink
98	Can add event page speaker	35	add_eventpagespeaker
99	Can change event page speaker	35	change_eventpagespeaker
100	Can delete event page speaker	35	delete_eventpagespeaker
101	Can add event page	36	add_eventpage
102	Can change event page	36	change_eventpage
103	Can delete event page	36	delete_eventpage
104	Can add form field	37	add_formfield
105	Can change form field	37	change_formfield
106	Can delete form field	37	delete_formfield
107	Can add form page	38	add_formpage
108	Can change form page	38	change_formpage
109	Can delete form page	38	delete_formpage
110	Can add form submission	39	add_formsubmission
111	Can change form submission	39	change_formsubmission
112	Can delete form submission	39	delete_formsubmission
113	Can add redirect	40	add_redirect
114	Can change redirect	40	change_redirect
115	Can delete redirect	40	delete_redirect
116	Can add embed	41	add_embed
117	Can change embed	41	change_embed
118	Can delete embed	41	delete_embed
119	Can add user profile	42	add_userprofile
120	Can change user profile	42	change_userprofile
121	Can delete user profile	42	delete_userprofile
122	Can add filter	43	add_filter
123	Can change filter	43	change_filter
124	Can delete filter	43	delete_filter
125	Can add rendition	44	add_rendition
126	Can change rendition	44	change_rendition
127	Can delete rendition	44	delete_rendition
128	Can add query	45	add_query
129	Can change query	45	change_query
130	Can delete query	45	delete_query
131	Can add Query Daily Hits	46	add_querydailyhits
132	Can change Query Daily Hits	46	change_querydailyhits
133	Can delete Query Daily Hits	46	delete_querydailyhits
134	Can add site	47	add_site
135	Can change site	47	change_site
136	Can delete site	47	delete_site
137	Can add page	1	add_page
138	Can change page	1	change_page
139	Can delete page	1	delete_page
140	Can add page revision	48	add_pagerevision
141	Can change page revision	48	change_pagerevision
142	Can delete page revision	48	delete_pagerevision
143	Can add group page permission	49	add_grouppagepermission
144	Can change group page permission	49	change_grouppagepermission
145	Can delete group page permission	49	delete_grouppagepermission
146	Can add page view restriction	50	add_pageviewrestriction
147	Can change page view restriction	50	change_pageviewrestriction
148	Can delete page view restriction	50	delete_pageviewrestriction
149	Can add Tag	51	add_tag
150	Can change Tag	51	change_tag
151	Can delete Tag	51	delete_tag
152	Can add Tagged Item	52	add_taggeditem
153	Can change Tagged Item	52	change_taggeditem
154	Can delete Tagged Item	52	delete_taggeditem
155	Can add log entry	53	add_logentry
156	Can change log entry	53	change_logentry
157	Can delete log entry	53	delete_logentry
158	Can add permission	54	add_permission
159	Can change permission	54	change_permission
160	Can delete permission	54	delete_permission
161	Can add group	55	add_group
162	Can change group	55	change_group
163	Can delete group	55	delete_group
164	Can add user	56	add_user
165	Can change user	56	change_user
166	Can delete user	56	delete_user
167	Can add content type	57	add_contenttype
168	Can change content type	57	change_contenttype
169	Can delete content type	57	delete_contenttype
170	Can add session	58	add_session
171	Can change session	58	change_session
172	Can delete session	58	delete_session
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('auth_permission_id_seq', 172, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$24000$8qzPAv43kSwb$TlXcXV2SIy9z/lXjJrTSP3xd56uXYj11bcwuK59L2Lg=	2016-02-12 10:13:42.959116+00	f	kimmo	kimmo	lehtonen	kimmo@lasipalatsi.fi	f	t	2016-02-12 10:12:06.546917+00
2	pbkdf2_sha256$24000$Yg05d4aeIIa1$moMqMfIEG23+A2u9JQ+X8u4BZgaiuQ2aI+zJKxn4FNU=	2016-02-12 10:17:01.995111+00	f	timo.waldmann	timo	waldmann	timo.waldmann@lasipalatsi.fi	f	t	2016-02-12 09:05:06.717785+00
3	pbkdf2_sha256$24000$CEBrIsRnW4UT$D2/DmLy0qoshnEnXQg3nYKPciKZzKgG8zPuvjUWrXp8=	2016-02-12 10:14:16.815157+00	f	ismael	Ismael	Rantala	ismael@lapinlahti.org	f	t	2016-02-12 09:47:18.614849+00
5	pbkdf2_sha256$24000$joClKqBSg9KS$jF1Ll7F6wdYze4rwdBObwvWVAJX0qMfkNuljCq/+f68=	2016-02-18 14:07:18.985672+00	f	esko.matikainen	Esko	Matikainen	esko.matikainen@gmail.com	f	t	2016-02-18 14:01:47.411033+00
1	pbkdf2_sha256$24000$hMDvv2IUNzpG$cI6tHHXOyXWlJcapxBFhyeaC0ac6lNAzR3/tz1t8r2I=	2016-02-24 14:21:21.446941+00	t	leban				t	t	2016-02-09 14:12:09.947+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	3
2	3	3
5	5	3
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 5, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('auth_user_id_seq', 5, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	wagtailimages	image
3	wagtaildocs	document
4	wagtailadmin	admin
5	home	advertplacement
6	home	advert
7	home	homepagecarouselitem
8	home	homepagerelatedlink
9	home	homepage
10	home	standardindexpagerelatedlink
11	home	standardindexpage
12	home	standardpagecarouselitem
13	home	standardpagerelatedlink
14	home	standardpage
15	home	roompage
16	home	roomindexpage
17	home	blogpagecarouselitem
18	home	blogpagerelatedlink
19	home	blogpagetag
20	home	blogpage
21	home	blogindexpage
22	home	blogindexpagerelatedlink
23	home	faqpagerelatedlink
24	home	faqpagetag
25	home	faqpage
26	home	faqindexpage
27	home	personpagerelatedlink
28	home	personpage
29	home	personindexpage
30	home	contactpage
31	home	eventindexpagerelatedlink
32	home	eventindexpage
33	home	eventpagecarouselitem
34	home	eventpagerelatedlink
35	home	eventpagespeaker
36	home	eventpage
37	home	formfield
38	home	formpage
39	wagtailforms	formsubmission
40	wagtailredirects	redirect
41	wagtailembeds	embed
42	wagtailusers	userprofile
43	wagtailimages	filter
44	wagtailimages	rendition
45	wagtailsearch	query
46	wagtailsearch	querydailyhits
47	wagtailcore	site
48	wagtailcore	pagerevision
49	wagtailcore	grouppagepermission
50	wagtailcore	pageviewrestriction
51	taggit	tag
52	taggit	taggeditem
53	admin	logentry
54	auth	permission
55	auth	group
56	auth	user
57	contenttypes	contenttype
58	sessions	session
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('django_content_type_id_seq', 58, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-02-10 15:07:25.463976+00
2	auth	0001_initial	2016-02-10 15:07:25.596599+00
3	admin	0001_initial	2016-02-10 15:07:25.64725+00
4	admin	0002_logentry_remove_auto_add	2016-02-10 15:07:25.679226+00
5	admin	0003_auto_20160120_0754	2016-02-10 15:07:25.709832+00
6	contenttypes	0002_remove_content_type_name	2016-02-10 15:07:25.788997+00
7	auth	0002_alter_permission_name_max_length	2016-02-10 15:07:25.824462+00
8	auth	0003_alter_user_email_max_length	2016-02-10 15:07:25.856852+00
9	auth	0004_alter_user_username_opts	2016-02-10 15:07:25.878296+00
10	auth	0005_alter_user_last_login_null	2016-02-10 15:07:25.903506+00
11	auth	0006_require_contenttypes_0002	2016-02-10 15:07:25.907052+00
12	auth	0007_alter_validators_add_error_messages	2016-02-10 15:07:25.932336+00
13	taggit	0001_initial	2016-02-10 15:07:25.993982+00
14	taggit	0002_auto_20150616_2121	2016-02-10 15:07:26.030844+00
15	wagtailimages	0001_initial	2016-02-10 15:07:26.211252+00
16	wagtailcore	0001_initial	2016-02-10 15:07:26.889427+00
17	wagtailcore	0002_initial_data	2016-02-10 15:07:26.89268+00
18	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2016-02-10 15:07:26.895049+00
19	wagtailcore	0004_page_locked	2016-02-10 15:07:26.898068+00
20	wagtailcore	0005_add_page_lock_permission_to_moderators	2016-02-10 15:07:26.901015+00
21	wagtailcore	0006_add_lock_page_permission	2016-02-10 15:07:26.90358+00
22	wagtailcore	0007_page_latest_revision_created_at	2016-02-10 15:07:26.905899+00
23	wagtailcore	0008_populate_latest_revision_created_at	2016-02-10 15:07:26.908503+00
24	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2016-02-10 15:07:26.91161+00
25	wagtailcore	0010_change_page_owner_to_null_on_delete	2016-02-10 15:07:26.914498+00
26	wagtailcore	0011_page_first_published_at	2016-02-10 15:07:26.916931+00
27	wagtailcore	0012_extend_page_slug_field	2016-02-10 15:07:26.919315+00
28	wagtailcore	0013_update_golive_expire_help_text	2016-02-10 15:07:26.921465+00
29	wagtailcore	0014_add_verbose_name	2016-02-10 15:07:26.9236+00
30	wagtailcore	0015_add_more_verbose_names	2016-02-10 15:07:26.926316+00
31	wagtailcore	0016_change_page_url_path_to_text_field	2016-02-10 15:07:26.928727+00
32	wagtailimages	0002_initial_data	2016-02-10 15:07:26.958749+00
33	wagtailimages	0003_fix_focal_point_fields	2016-02-10 15:07:27.200515+00
34	wagtailimages	0004_make_focal_point_key_not_nullable	2016-02-10 15:07:27.270249+00
35	wagtailimages	0005_make_filter_spec_unique	2016-02-10 15:07:44.516546+00
36	wagtailimages	0006_add_verbose_names	2016-02-10 15:07:44.666888+00
37	wagtailimages	0007_image_file_size	2016-02-10 15:07:44.701706+00
38	wagtailimages	0008_image_created_at_index	2016-02-10 15:07:44.737996+00
39	wagtailimages	0009_capitalizeverbose	2016-02-10 15:07:44.994384+00
40	wagtailimages	0010_change_on_delete_behaviour	2016-02-10 15:07:45.053986+00
41	wagtaildocs	0001_initial	2016-02-10 15:07:45.107127+00
42	wagtaildocs	0002_initial_data	2016-02-10 15:07:45.135217+00
43	wagtaildocs	0003_add_verbose_names	2016-02-10 15:07:45.25293+00
44	wagtaildocs	0004_capitalizeverbose	2016-02-10 15:07:45.556189+00
45	wagtailcore	0017_change_edit_page_permission_description	2016-02-10 15:07:45.595644+00
46	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2016-02-10 15:07:45.638791+00
47	wagtailcore	0019_verbose_names_cleanup	2016-02-10 15:07:45.822673+00
48	wagtailcore	0020_add_index_on_page_first_published_at	2016-02-10 15:07:45.864477+00
49	wagtailcore	0021_capitalizeverbose	2016-02-10 15:07:47.087728+00
50	wagtailcore	0022_add_site_name	2016-02-10 15:07:47.138155+00
51	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2016-02-10 15:07:47.205581+00
52	home	0001_initial	2016-02-10 15:07:47.209005+00
53	home	0002_auto_20160120_1829	2016-02-10 15:07:53.121833+00
54	home	0003_homepage_bg_image	2016-02-10 15:07:53.252689+00
55	home	0004_auto_20160125_1713	2016-02-10 15:07:53.882137+00
56	home	0005_auto_20160125_1714	2016-02-10 15:07:54.127686+00
57	home	0006_blogindexpage_feed_image	2016-02-10 15:07:54.273705+00
58	home	0007_auto_20160125_1803	2016-02-10 15:07:54.967463+00
59	home	0008_auto_20160126_1451	2016-02-10 15:07:55.08853+00
60	home	0009_auto_20160126_1521	2016-02-10 15:07:55.370114+00
61	home	0010_faqindexpagerelatedlink	2016-02-10 15:07:55.503872+00
62	home	0011_auto_20160126_1738	2016-02-10 15:07:56.838618+00
63	home	0012_auto_20160127_1328	2016-02-10 15:07:58.751146+00
64	home	0013_auto_20160127_1328	2016-02-10 15:07:58.883381+00
65	home	0014_auto_20160130_0625	2016-02-10 15:07:59.120158+00
66	home	0015_auto_20160204_1117	2016-02-10 15:08:00.301241+00
67	home	0016_auto_20160204_1306	2016-02-10 15:08:00.441387+00
68	home	0017_auto_20160207_1227	2016-02-10 15:08:00.611442+00
69	home	0018_remove_faqpage_tags	2016-02-10 15:08:00.733777+00
70	home	0019_faqpage_tags	2016-02-10 15:08:00.852616+00
71	home	0020_remove_faqpage_tags	2016-02-10 15:08:00.975109+00
72	home	0021_faqpage_tags	2016-02-10 15:08:01.116274+00
73	home	0022_auto_20160209_0541	2016-02-10 15:08:01.559689+00
74	sessions	0001_initial	2016-02-10 15:08:01.592769+00
75	wagtailadmin	0001_create_admin_access_permissions	2016-02-10 15:08:01.623352+00
76	wagtailembeds	0001_initial	2016-02-10 15:08:01.898663+00
77	wagtailembeds	0002_add_verbose_names	2016-02-10 15:08:01.922403+00
78	wagtailembeds	0003_capitalizeverbose	2016-02-10 15:08:01.949119+00
79	wagtailforms	0001_initial	2016-02-10 15:08:02.135146+00
80	wagtailforms	0002_add_verbose_names	2016-02-10 15:08:02.447086+00
81	wagtailforms	0003_capitalizeverbose	2016-02-10 15:08:02.682158+00
82	wagtailredirects	0001_initial	2016-02-10 15:08:02.83799+00
83	wagtailredirects	0002_add_verbose_names	2016-02-10 15:08:03.100757+00
84	wagtailredirects	0003_make_site_field_editable	2016-02-10 15:08:03.250406+00
85	wagtailredirects	0004_set_unique_on_path_and_site	2016-02-10 15:08:03.646601+00
86	wagtailredirects	0005_capitalizeverbose	2016-02-10 15:08:04.60087+00
87	wagtailsearch	0001_initial	2016-02-10 15:08:04.903741+00
88	wagtailsearch	0002_add_verbose_names	2016-02-10 15:08:05.417559+00
89	wagtailsearch	0003_remove_editors_pick	2016-02-10 15:08:05.551694+00
90	wagtailusers	0001_initial	2016-02-10 15:08:05.720512+00
91	wagtailusers	0002_add_verbose_name_on_userprofile	2016-02-10 15:08:06.244306+00
92	wagtailusers	0003_add_verbose_names	2016-02-10 15:08:06.344671+00
93	wagtailusers	0004_capitalizeverbose	2016-02-10 15:08:06.823277+00
94	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2016-02-10 15:08:06.830349+00
95	home	0023_auto_20160211_0748	2016-02-11 07:48:49.120407+00
96	home	0024_auto_20160211_0748	2016-02-11 07:48:50.117747+00
97	home	0025_advert_feed_image	2016-02-24 14:33:40.405711+00
98	wagtailcore	0024_auto_20160224_1433	2016-02-24 14:33:40.713041+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('django_migrations_id_seq', 98, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
2qnjrkgwn16ci3wa351fh6fann7ncbfk	NzNiMmIzYmU0ZDAyNDBlYmZjYmY0MjRiNmZmNGMxYjVlODJlNDBkYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0MjFmOTVlYmRhM2EwNWFiYTg0OGQ2ODNhM2NjMTZlOTExNjIwNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-23 14:13:44.885+00
k1737sc9ft9k4xa2ducirynbk6nup2xf	MjM3MWQ5Yzc1ZGM5N2M1ZmM0Y2JkYzFjNTliOTM0ZGMxYWEyMjY4ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU1ODU3YTljYzA0MjM2ZDU3NjUzYWNlMzIwZTVkZjY2OGNlNGVlZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-02-26 09:12:24.443471+00
ez13f8hjvmh1o1dkxzcbv258dilvhgsk	MmNiNWVkYjg0OWQwNzQ4ZjI5Y2UzNDcwNDkzNTRlZDhmYzQwMWU0OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1ZjkxZDM4OTRiM2IyN2I5MWVjODVkYjFhYjc1MDQ3OTU3OThhZTgiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-02-26 09:53:56.834092+00
8vkn95welec1snrdk2v9vfcryn4wo55c	MjY3NzZlM2IwZDczNjg4MTU0YmMwNDdhYzQ2MTRkMTYxNzA2NzY5MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1ZjkxZDM4OTRiM2IyN2I5MWVjODVkYjFhYjc1MDQ3OTU3OThhZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2016-02-26 09:54:18.405554+00
smwnwuv1ldrurqy0vmdabsalgsn6opfq	MjM3MWQ5Yzc1ZGM5N2M1ZmM0Y2JkYzFjNTliOTM0ZGMxYWEyMjY4ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU1ODU3YTljYzA0MjM2ZDU3NjUzYWNlMzIwZTVkZjY2OGNlNGVlZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-02-26 10:15:03.939101+00
pr4ti98flmjmgkc9c5f9tvs6au1k61a3	NGE5YzQ4YTNlNzY1ODE5Nzc3OGVhNTQxOWE0YzgwZjM0YzM2YmZiMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxY2IxODZhNmE1NTI4YWY2ZjhmZWFkNzYzMTk5MzYyMjBlMjdlZmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2016-02-26 10:15:46.21244+00
hwhmjdvsvrnoc76h1uovla23d1f0pv1c	MjM3MWQ5Yzc1ZGM5N2M1ZmM0Y2JkYzFjNTliOTM0ZGMxYWEyMjY4ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU1ODU3YTljYzA0MjM2ZDU3NjUzYWNlMzIwZTVkZjY2OGNlNGVlZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-02-26 10:17:01.998369+00
b9eguj9omtvhf1is2ck6zss1clcco8dc	NzNiMmIzYmU0ZDAyNDBlYmZjYmY0MjRiNmZmNGMxYjVlODJlNDBkYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0MjFmOTVlYmRhM2EwNWFiYTg0OGQ2ODNhM2NjMTZlOTExNjIwNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-27 14:10:42.358469+00
znj1rdjp7cu2zovtvyjd01borjoo82ba	YzdhMGY4MGE0Y2U4YjE0NTgwOWFiYmM3OTFhMzk3ODU3YTBmYWY2Zjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM1ZmViNjViMjI5YWRjM2JhMWZiZGQ2YzcxNjI1MmIxMWNmOTBlNTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2016-03-03 14:07:18.988683+00
qml7y1llk6jm2ohzsc1wtu4n40ygq8f8	NzNiMmIzYmU0ZDAyNDBlYmZjYmY0MjRiNmZmNGMxYjVlODJlNDBkYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0MjFmOTVlYmRhM2EwNWFiYTg0OGQ2ODNhM2NjMTZlOTExNjIwNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-09 14:21:21.466568+00
\.


--
-- Data for Name: home_advert; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_advert (id, url, text, page_id, feed_image_id) FROM stdin;
1	http://lasipalatsi.fi	Lasipalatsin mediakeskus Oy	3	56
\.


--
-- Name: home_advert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_advert_id_seq', 1, true);


--
-- Data for Name: home_advertplacement; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_advertplacement (id, advert_id, page_id) FROM stdin;
\.


--
-- Name: home_advertplacement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_advertplacement_id_seq', 1, false);


--
-- Data for Name: home_blogindexpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_blogindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
4	<p>Uutisia ja ajankotaista</p>	33
\.


--
-- Data for Name: home_blogindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_blogindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_blogindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_blogindexpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: home_blogpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_blogpage (page_ptr_id, body, date, feed_image_id, public) FROM stdin;
187	<p>“Telttasaunan löyly napsahtaa kuin silkkinen ruoska”<br/></p><p>Sympaattinen ja vaativammankin saunaintoilijan tarpeet täyttävä puulämmitteinen telttasauna Lapinlahdessa on avoinna perjantaisin ja lauantaisin klo 15 - 20. Saunamaksu on 8€ kerta. Saunan pukuhuoneet ja suihkut sijaitsevat ensimmäisen kerroksen käytävän länsipäässä. Lämmityksestä ja löylyistä vastaa kokenut saunamajuri. Teltan tiloissa juomien nauttiminen ei ole sallittua. Kaikki vuorot ovat sekavuoroja ja sauna-asu on vapaa. </p><p>\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p>Holvista  http://bit.do/telttasauna voi ostaa 10 saunakerran kortin hintaan 70 € (sis alv 24%) Tilausvuoroja voi tiedustella Richieltä tai Martikaiselta.</p>	2016-02-12	50	t
190	<p>Maanantaina 7.3  järjestetään Lapinlahdessa vampyyriaiheinen larppi eli liveroolitapahtumaa nimeltään <b><i>End of the Line</i></b>. Toiminta sijoittuu pääasiassa ensimmäisen kerroksen keittiö- ja aulatioihin, kolmanteen kerrokseen sekä porraskäytäviin, ja jatkuu viidestä iltapäivällä puoleen yöhön. Sen tuottavat yhteistyössä White Wolf Publishing, Odyssé ja Inside Job Agency.</p><p>Kyseessä on suljettu tapahtuma, eräänlainen larpin kenraaliharjoitus, jossa testataan erilaisten suomalaisten ja pohjoismaisten larppaajien ja pelinjärjestäjien kanssa uusia tapoja kehittää White Wolfin Vampire: the Masquerade -peliä. Peli järjestetään Suomessa järjestettävän Solmukohta 2016 -pelikonferenssin yhteydessä.</p><p>Tapahtuman aikana paikan päällä on noin 70 osallistujaa ja järjestäjää. Pahoittelemme mahdollisia häiriöitä ja mikäli tapahtumasta on kysymyksiä, yhteyshenkilöt ovat:</p><p>Pelisuunnittelija Juhana Pettersson (jlp@iki.fi / 045 123 99 81)</p><p>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p>Tuottaja Mikko Pervilä (mikko.pervila@<a href="http://gmail.com/">gmail.com</a> / 044 769 60 68)</p>	2016-02-18	\N	t
\.


--
-- Data for Name: home_blogpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_blogpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_blogpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_blogpagecarouselitem_id_seq', 1, false);


--
-- Data for Name: home_blogpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_blogpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_blogpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_blogpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: home_blogpagetag; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_blogpagetag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Name: home_blogpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_blogpagetag_id_seq', 1, false);


--
-- Data for Name: home_contactpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_contactpage (page_ptr_id, telephone, email, address_1, address_2, city, country, post_code, body, feed_image_id) FROM stdin;
\.


--
-- Data for Name: home_eventindexpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_eventindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
5	<p>Häppeninkejä ja juttuja</p>	11
\.


--
-- Data for Name: home_eventindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_eventindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_eventindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_eventindexpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: home_eventpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_eventpage (page_ptr_id, date_from, date_to, time_from, time_to, audience, location, body, cost, signup_link, feed_image_id) FROM stdin;
188	2016-02-19	2016-06-23	15:00:00	20:00:00	public	Ensimmäisen kerroksen länsipääty	<p><b><i>“Telttasaunan löyly napsahtaa kuin silkkinen ruoska”<br/></i></b></p>\n<p><br/></p>\n<p>Sympaattinen ja vaativammankin saunaintoilijan tarpeet täyttävä puulämmitteinen telttasauna Lapinlahdessa on avoinna perjantaisin ja lauantaisin klo 15 - 20. Saunamaksu on 8€ kerta. Saunan pukuhuoneet ja suihkut sijaitsevat ensimmäisen kerroksen käytävän länsipäässä. Lämmityksestä ja löylyistä vastaa kokenut saunamajuri. Teltan tiloissa juomien nauttiminen ei ole sallittua. Kaikki vuorot ovat sekavuoroja ja sauna-asu on vapaa. </p>\n<p><br/></p>\n<p>Holvista  http://bit.do/telttasauna voi ostaa 10 saunakerran kortin hintaan 70 € (sis alv 24%) Tilausvuoroja voi tiedustella Richieltä tai Martikaiselta.</p>	8 €		51
189	2016-03-07	2016-03-07	17:00:00	00:00:00	private	Tilajakamon Lapinlahti	<p>Maanantaina 7.3  järjestetään Lapinlahdessa vampyyriaiheinen larppi eli liveroolitapahtumaa nimeltään <b><i>End of the Line</i></b>. Toiminta sijoittuu pääasiassa ensimmäisen kerroksen keittiö- ja aulatioihin, kolmanteen kerrokseen sekä porraskäytäviin, ja jatkuu viidestä iltapäivällä puoleen yöhön. Sen tuottavat yhteistyössä White Wolf Publishing, Odyssé ja Inside Job Agency.</p>\n<p>Kyseessä on suljettu tapahtuma, eräänlainen larpin kenraaliharjoitus, jossa testataan erilaisten suomalaisten ja pohjoismaisten larppaajien ja pelinjärjestäjien kanssa uusia tapoja kehittää White Wolfin Vampire: the Masquerade -peliä. Peli järjestetään Suomessa järjestettävän Solmukohta 2016 -pelikonferenssin yhteydessä.</p>\n<p>Tapahtuman aikana paikan päällä on noin 70 osallistujaa ja järjestäjää. Pahoittelemme mahdollisia häiriöitä ja mikäli tapahtumasta on kysymyksiä, yhteyshenkilöt ovat:</p>\n<p>Pelisuunnittelija Juhana Pettersson (jlp@iki.fi / 045 123 99 81)</p>\n<p>Tuottaja Mikko Pervilä (mikko.pervila@<a href="http://gmail.com/">gmail.com</a> / 044 769 60 68)</p>	0		\N
\.


--
-- Data for Name: home_eventpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_eventpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_eventpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_eventpagecarouselitem_id_seq', 1, false);


--
-- Data for Name: home_eventpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_eventpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_eventpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_eventpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: home_eventpagespeaker; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_eventpagespeaker (id, sort_order, link_external, first_name, last_name, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_eventpagespeaker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_eventpagespeaker_id_seq', 1, false);


--
-- Data for Name: home_faqindexpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_faqindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
7	<p>Usein kysytyt kysymykset ja vastaukset</p>	35
\.


--
-- Data for Name: home_faqpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_faqpage (page_ptr_id, body, public, feed_image_id) FROM stdin;
191	<p>Osuuskunnan jäseneksi liitytään maksamalla osuuskunnan jäsenmaksu, joka on 50 € + palvelumaksu. Osuuskunnan jäsenyys ei automaattisesti tarkoita tilojen saamista, mutta se mahdollistaa asettumisen jonoon, kun tiloja tulee tarjolle. Jäsenmaksu on kertamaksu eikä sitä palauteta.<br/></p><p>Kiinnostuksen tarjolla olevia tiloja kohtaan voi myös ilmoittaa verkkolomakkeella.</p>	t	\N
195	<p>Tilajakamolla on käytössään useita kanavia eri tarkoituksiin. </p><p>Yleisen kanavan seuraaminen ei ole pakollista tai sen voi pitää mykistettynä. Osa kanavista on vain informaation jakamista varten, koska muuten tärkeät ilmoitukset saattavat hukkua keskusteluun. Toisissa keskustelu on avoin, mutta varattu tietyn aihepiirin ympärille.<br/></p><p>Yleisen kanavan voi laittaa äänettömälle (mute), jos haluaa vain seurata vain joitakin kanavia tai ryhmiä.</p><p></p><ul><li>Tilajakamo (<b>yleinen</b>): Yhteisöllinen ja yleinen keskustelu</li><li>Tilajakamo <b>tiedottaa</b>: Tärkeille tiedotteille (ei kommentointia)</li><li>Tilajakamo <b>tapahtumat</b>: Tietoa tapahtumista (ei kommentointia)</li><li>Tilajakamon <b>saneeraustyhmä</b>: Keskustelua muutos- ja kunnostustöistä</li><li>Tilajakamon <b>talkoot</b>: Tiedotteita talkoista (ei kommentointia)</li><li>Tilajakamon <b>ehdotukset</b>: ehdotuksia hallitukselle (ei kommentointia)</li><li>Tilajakamon <b>OMV</b>: Osta-Myy-Vaihda-Lahjoita palsta!</li><li>Tilajakamon <b>netti</b>: korjauspyyntöjä nettiongelmiin (ei kommentointia)</li><li>Tilajakamon <b>huolto</b>: toiveita esim. koskien valaistusta tai lukkoja yms. pieniin huoltotoimiin  (ei kommentointia)</li><li>Tilajakamon siivous: toiveita ylimääräisestä siivouksesta (ei kommentointia)</li><li>Tilajakamon HÄLYTYS: SOS VIESTI AKUUTTISSA HÄTÄTAPAUKSESSA (kuten vesivahinko) johon ei välittömästi tarvita poliisia tai palokuntaa (ei kommentointia)</li></ul><p></p><p>Voit liittyä seuraamaan kanavia klikkaamalla alla olevia linkkejä.</p><p><br/></p><p></p><p></p><li></li><li></li><li></li><li></li>	f	\N
192	<p>Oman huoneen lisäavaimet voi hankkia kopioina pikasuutarilta tai lukkoliikkeestä.<br/></p>\n<p>Ulko- ja väliovien iLoq avaimet voi tilata Holvista ja ne saa haltuunsa Lapinlahdessa.</p>	f	\N
194	<p>Telegramiin rekisteröidytään oman puhelinnumeron avulla. Numero vahvistetaan tekstiviestillä. Ensimmäisen rekisteröitymisen jälkeen tilin voi vahvistaa muille laitteille Telegramin avulla.</p><p>Lähtökohtaisesti samoilla kanavilla olevat henkilöt tai ne joilla on toistensa puhelinnumerot voivat viestitellä keskenään suoraan. Ottamalla käyttöön @telegram-tunnus ohjelman/käyttäjän asetuksissa voivat muutkin käyttäjät lähettää suoria viestejä.</p><p>Julkisen tunnuksen avulla voit jakaa myös linkkiä telegram.me/YourUsernameHere jota kautta kuka tahansa voi lähettää sinulle viestejä.</p><p>Huom! Telegram viestit eivät tarkoita, että vastaanottaja saisi sen avulla selville puhelinnumerosi!</p><p><br/></p>	t	\N
196	<p>Kaikkea keskustelua ei tarvitse käydä yleisille kanavilla. Yksityisviestejä voivat lähetellä käyttäjät, jotka jakavat puhelinnumeron yhteystiedoissaan tai käyttäjät joilla on Telegramin julkinen @käyttäjätunnus. Samoissa ryhmissä olevat voivat laittaa viestejä kontakti-tiedon kautta.</p><p>Klikkaa samalla kanavalla olevan henkilön nimeä joko chatissa tai ryhmän Info-sivulla olevasta listasta. </p><p>Macissä viesti lähetetään Send message -linkistä.</p><p><embed alt="YV-mac" embedtype="image" format="fullwidth" id="52"/><br/></p><p>Windows-koneissa viesti lähetetään puhekupla-ikonista.</p><p><embed alt="YV-pc" embedtype="image" format="fullwidth" id="53"/><br/></p><p>Puhelimissa kontatin sivulle pääsee klikkaamalla henkilön kuvaketta.</p><p><br/></p><p><br/></p>	t	\N
211	<p>Osuuskunnan jätehuone sijaitsee pohjoispuolella keittiön vieressä olevassa matalassa lisäosassa. Veräjäportti (vedä oikealle!) avautuu ulko-ovien iLoq-avaimilla.</p>	f	\N
193	<p>Osuuskunta käyttää jäsenten kommunikaatioon Telegram chattia, jotta tieto liikkuisi tehokkaasti. Telegramin käyttöön on helppo omaksua.<br/></p><p>Telegram mahdollistaa nopean kommunikaation milloin ja  missä tahansa puhelimessa ja tietokoneessa, jossa on nettiyhteys. Samat viestit näkyvät kaikissa laitteissa ja viestintä arkistoituu automaattisesti.</p><p>Telegram ottaa käyttäjien yksityisyyden ja tietosuojan vakavasti. Käyttäjien tietoja ei leviä tahattomasti ja tarvittaessa keskustelu voi olla myös salattua. Telegram ei ole kytköksissä mihinkään isoon toimijaan kuten Applen, Googleen, Microsoftiin tai Facebookiin.</p><p>Sitä kautta voi jakaa myös tiedostoja, jotka tallentuvat samalla myös nettiin. </p><p>Lisäksi siihen on mahdollista kehittää omia lisäominaisuuksia ja se on täysin ilmainen.</p><p><br/></p><p><br/></p>	t	\N
213	<p>Jos väliaikainen vuokralainen tai huoneen jakaja liittyy osuuskunnan jäseneksi, niin osuuskunnalla ei ole mitään sitä vastaan.</p>	f	\N
197	<p>Botti on Telegramin viestiautomaatti, joka auttaa ja välittää.</p><p><br/></p><p>Botille laitetaan komentoja joko kanavalla, jossa se on läsnä (esim. Yleinen) kirjoittamalla viestin alkuun:</p><h5>/komento </h5><p>Komento on jokin seuraavista:</p><p><ul><li>/<b>jaa</b> kartta1, kartta2 tai kartta3 =&gt; palauttaa linkit Lapinlahden eri kerrosten karttoihin<br/></li><li>korjauskortit =&gt; linkki korjauskortteihin</li><li>/<b>liity</b> talkookanava =&gt; liittymislinkki kanavalle<br/></li><li>/<b>liity</b> tapahtumakanava =&gt; liittymislinkki kanavalle<br/></li><li>/<b>liity</b> saneerauskanava =&gt; liittymislinkki kanavalle</li></ul><p>Joidenkin komentojen perään kirjoitetaan tarkenteena viesti:</p></p><p><br/></p><h5>/kuka kimmo tai /huone 303</h5><p><ul><li>/<b>kuka</b> etunimi/sukunimi/tittli =&gt; palauttaa tietoa oskusta (tietoja voi päivittää nettisivulla)</li><li>/<b>huone</b> xxx =&gt; osku, joka toimii tässä huoneessa</li></ul></p><p>Osa komennoista välittää viestin muille kanaville, jossa ei käydä keskustelua.</p><p><br/></p><h5>/huolto Kolmosen käytävä vessa on tukossa!</h5><p>HUOM! Kirjoita viesti komennon perään samalle rivillä ilman mitään kommervenkkejä!</p><p><br/></p><p><ul><li>/<b>huolto</b> ilmoitus korjaustarpeesta =&gt; Tilajakamon huolto -kanavalle<br/></li><li>/<b>siivous</b> pyyntö =&gt; Tilajakamon siivous -kanavalle<br/></li><li>/<b>ehdotus</b> hallitukselle =&gt; Aloite osuuskunnan hallitukselle<br/></li><li>/<b>sos</b> joku paikalle heti!!! =&gt; Tilajakamon HÄLYTYS -kanavalle (VAATII VARMISTUKSEN!)<br/></li><li>/<b>netti</b> vikailmoitus jos ei toimi =&gt; Tilajakamon netti -kanavalle<br/></li><li>/<b>talkoot</b> raatajia kaivataan =&gt; Tilajakamon talkoot -kanavalle<br/></li><li> /<b>tapahtuma</b> häppeningin aika ja asia =&gt; Tilajakamon tapahtumat -kanavalle<br/></li><li> /<b>ostan</b>, /<b>myyn</b>, /<b>vaihdan</b> =&gt; Tilajakamon OMV -kanavalle</li></ul><p>Huom! Komento näkyy chatissa linkkinä, mutta sen klikkaaminen ei tee mitään rakentavaa :-)</p></p><p><br/></p><p><b>Voit lähettää botille myös yksityisviestejä! <a href="https://telegram.me/tilajakamo_bot">https://telegram.me/tilajakamo_bot</a> jos et halua tukkia yleisiä kanavia kyselyillä.</b></p><p><br/></p><p><br/></p>	t	\N
198	<p>Ohessa joitakin museovirastolta saatuja ohjeita saneerauksesta:</p><p><br/></p><p><ul><li>Muovimaton alla oleva puulattia vaatii hionnan ennen kuin kelpaa lattiapinnaksi. Ennen lattian kunnostuksen aloittamista tulee olla yhteydessä Museovirastoon.<br/></li><li>Äänieristyksen lisääminen ulkoseinään: paksun eristeen lisääminen ulkoseinään jäähdyttää muuria ulkopintaa kohti ja saattaa vaarantaa ulkorappausta sillä kohdin. Ulkoseinä tulee siis jättää eristämättä. Tarvittaessa ulkoseinällä voi käyttää paksuja ikkunaverhoja, ryijyjä tmv. seinälle ripustettavia tekstiilejä.</li><li>Silikonitiivisteitä ei pidä käyttää äänieristyslevyjen kiinnittämiseen.</li></ul></p><p><ul><li>Seinien ja kattojen ylitasoitusta tulee erityisesti välttää; tasoittaa tulee siis vain paikallisesti, pahimmat kohdat.</li><li>Sementtipitoista tasoituslaastia ei pidä käyttää, vaan selvästi pehmeämpää, mieluiten vesiohenteista tasoitetta.</li><li>Tapetit tulee kiinnittää vain liisterillä (ei siis liimalla tmv.).</li><li>Irtonaisen maalin poisto teräslastalla kaapien </li><li>Maalauspohja määrittää pinnan: esim. lateksille lateksia (esim. Harmony tai Uulan emulsiomaali Into)</li><li>Jos seinissä on tiileen asti meneviä aukkoja, suositellaan kalkkirappausta. Pintoihin voi sitten laittaa modernimpia täyteaineita.  </li></ul></p><p><ul><li>Kattojen kunnostusta ei suositella. </li><li>Ei suosita 1800-1930-luvuilla tehtyjen vanhojen maalipintojen poistoa eli vanhimmat kerrostumat jätetään alle. </li><li><b>Museoviraston tekemät maalitutkimukset on jätettävä joko näkyville tai tapetoitava ko. kohta ennen maalausta</b>  </li><li>Seiniä ei tule tasoittaa kauttaaltaan, vain aukot </li><li>Jos nykyisiä valaisimia ja kalusteita poistetaan, toimittakaa ne Tilajakamon osoittamaan säilytyspaikkaan ja merkitkää mistä huoneesta ne on poistettu. </li></ul></p>	f	\N
199	<p>Kerro suunnittelemistasi muutoksista korjauskortissa ja ilmoita muutoksista isännöitsijälle. Tarvittaessa voi kysyä neuvoa korjauksista muilta oskuilta.<br/></p><p>Kullekin huoneelle on tehty korjauskortti, johon kirjataan ylös toteutettavat muutokset. </p><p><embed alt="Korjauskortti-ohje" embedtype="image" format="fullwidth" id="54"/><br/></p><p><br/></p>	f	\N
200	<p>Huoneiden eri osat ovat joko oskun, osuuskunnan tai rakennuksen omistajan, eli Helsingin kaupungin vastuulla. Ohessa linkki vastuujakotaulukkoon.</p>	f	\N
201	<p>Osuuskunta Lapinlahden tilajakamo säännöt<br/></p><p>1§ Toiminimi ja kotipaikka<br/></p><p>Osuuskunnan toiminimi on Osuuskunta Lapinlahden tilajakamo ja sen kotipaikka on<br/>Helsinki.<br/>2§ Tarkoitus ja toimiala<br/>Osuuskunnan tarkoituksena on edistää kaupunkikulttuuria.<br/>Tarkoituksensa toteuttamiseksi osuuskunta vuokraa Lapinlahden sairaalarakennuksia<br/>ja muita hallinnassaan olevia tiloja jäsenilleen ensisijassa kulttuurin, tieteen, käsityön,<br/>muiden luovien alojen ja niitä tukevien yritys- ja muiden toimintojen tarpeisiin.<br/>Osuuskunta voi myös järjestää ja tukea kaupunkikulttuuria edistäviä tapahtumia ja<br/>muuta toimintaa.</p><p></p>	t	\N
202	<p>Lapinlahden sairaala on Suomen ensimmäinen mielisairaalakäyttöön valmistunut sairaala. Se sijaitsee Helsingissä Lapinlahden osa-alueella meren rannalla Hietaniemen hautausmaan läheisyydessä.<br/></p><p>Sairaala valmistui vuonna 1841 Carl Ludvig Engelin suunnitelmien mukaan. 160 vuotta toiminnassa olleessa sairaalassa on toiminut Helsingin ja Uudenmaan sairaanhoitopiirin psykiatrisen osaston syömishäiriöosasto, -poliklinikka ja -päiväosasto.</p><p>Sairaalaa on alusta lähtien ympäröinyt laaja puutarha. Siitä on aikojen kuluessa lohkaistu alueita muun muassa Länsiväylän rakentamiseksi, mutta sen keskeisin osa on yhä jäljellä.</p><h5>Sairaalatoiminnan loppuminen</h5><p>Lapinlahden sairaalatoiminta päättyi lopullisesti 19. joulukuuta 2008, jolloin HUS:n psykiatrisen osaston syömishäiriöosasto, -poliklinikka ja -päiväosasto muuttivat Psykiatriakeskukseen.</p><p>Osa käytöstä poistuneista rakennuksista vallattiin muun muassa opiskelijoiden toimesta. Vaatimuksissa on ollut sairaala-alueen hyödyntäminen myös jatkossakin. Helsingin kaupunki aikoo peruskorjata sairaala-alueen, ja alue tulee myöhemmin sosiaaliviraston käyttöön.</p><p><br/></p><p><br/></p>	t	\N
203	<p>Kysy <a href="https://telegram.me/ismaelrantala">@ismaelrantala</a></p>	t	\N
204	<p>Omenapuutalo on pääsisäänkäynnin pohjoispuolella oleva puutalo, jota vuokraa tilaisuuksia varten <a href="mailto:joonas@pekkanen.org">joonas@pekkanen.org</a></p><p><br/></p>	t	\N
207	<p>Osassa huoneissa on nettikaapelointi ja eri puolille rakennusta on sijoitettu wlan-tukiasemia, joiden salasana on 'avohoidossa'</p>	f	\N
205	<p>Hallituksen kuuluvat:</p><p></p><ul><li>Teemu Lehto (pj)</li><li>Joonas Pekkanen (siht)</li><li>Egil Silfver (taloudenhoitaja)</li><li>Richie Mattila</li></ul><p>Lisäksi viestinnästä vastaa Kimmo Lehtonen</p><p>Isännöinti on Timo Waldmannin (Lasipalatsin Mediakeskus Oy) vastuulla.</p><p></p><li></li>	t	\N
206	<p>Kannattaa tarkistaa meneekö työhuoneen irtaimisto pelkällä ilmoituksella esim. laajennetun kotivakuutuksen piiriin. Ellei niin vahinko- ja varkausvakuutus on paikallaan varmuuden vuoksi.</p><p>Osuuskunta on ottanut vahinko- ja vastuuvakuutuksen rakennuksen sekä talkootöiden osalta, mutta osuuskuntalaisten omaisuuden vakuuttaminen ei sen kautta ole mahdollista.</p>	f	\N
208	<p>Holvi on suomalainen nettipankki, jossa on myös verkkokauppa ja kirjanpito-ominaisuudet. Osuuskunnan palveluita myydään sitä kautta ja myös vuokran maksu menee sitä kautta. Osuuskunnan budjetti on avoimesti nähtävissä Holvissa.</p>	f	\N
209	<p>Logo äänestyksen voitti Kai 'Kaide' Arposen ehdotus.</p><p><embed alt="logo" embedtype="image" format="fullwidth" id="55"/><br/></p>	f	\N
210	<p>Toisen kerroksen käytävä on merkitty lemmikkivapaaksi alueeksi, jonne eläimiä ei saa tuoda edes käymään.</p>	t	\N
\.


--
-- Data for Name: home_faqpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_faqpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
1	0	https://holvi.com/shop/tilajakamo2016	Holvi	\N	\N	191
2	1	http://goo.gl/forms/rOYa08frvc	Varauslomake	\N	\N	191
5	0	https://telegram.org/apps	Asennus	\N	\N	194
3	0	https://holvi.com/shop/tilajakamo2016	Avaimet	\N	\N	192
4	0	https://telegram.org/	Telegram	\N	\N	193
12	0	https://telegram.me/joinchat/BIHxAgNPTAtjxHVzkdpcUw	Tilajakamo (yleinen)	\N	\N	195
6	1	https://telegram.me/tilajakamotiedottaa	Tilajakamo tiedottaa	\N	\N	195
7	2	https://telegram.me/tilajakamontapahtumat	Tilajakamon tapahtumat	\N	\N	195
8	3	https://telegram.me/joinchat/BphCMgQazU_AHOwzY_HPHg	Tilajakamon saneerauskanava	\N	\N	195
10	4	https://telegram.me/tilajakamontalkoot	Tilajakamon talkoot	\N	\N	195
9	5	https://telegram.me/joinchat/A9q4ZwQfYtjvvX6MfAIezw	Tilajakamon OMV	\N	\N	195
11	6	https://telegram.me/joinchat/A9q4ZwQeL8YWZ6JVd_BDWw	HÄLYTYS	\N	\N	195
13	0	https://docs.google.com/presentation/d/15E-cyAUW92AChTl_bKnZoIJy844XfllmKlH_P5jYxQw/edit#slide=id.gfe03b4d79_0_283	1. kerros	\N	\N	199
14	1	https://docs.google.com/presentation/d/1Svhe56PdyHi0TthLWZ7c-ZdK_9YRO5J_p_ULp_02x00/edit#slide=id.gfe0726ebd_0_0	2. kerros	\N	\N	199
15	2	https://docs.google.com/presentation/d/1CniukRoLqxlwLqHO7R4qK41ThnEHw9luNQu9OXcfmEM/edit#slide=id.gfe0726ebd_0_0	3. kerros	\N	\N	199
16	3	https://docs.google.com/presentation/d/1S-qFmrhw1w06ZBXKHYxPRYxQx8BeL9sbXGygqk7Nubo/edit#slide=id.gfe0726ebd_0_0	Yleinen ohjeistus	\N	\N	199
17	0	https://docs.google.com/spreadsheets/d/1pJuMf3n0IzqKxk8tEW7VLqWPs4bxzHl_Nl_FFacFFU0	Vastuunjakotaulukko	\N	\N	200
18	0	http://fi.wikipedia.org/wiki/Lapinlahden_sairaala	Lähde: wikipedia	\N	\N	202
19	0	https://holvi.com/shop/tilajakamo2016	Holvi Shop	\N	\N	208
\.


--
-- Name: home_faqpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_faqpagerelatedlink_id_seq', 19, true);


--
-- Data for Name: home_faqpagetag; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_faqpagetag (id, content_object_id, tag_id) FROM stdin;
2	191	2
3	191	3
11	194	5
17	192	3
18	192	4
21	193	5
22	195	5
23	195	6
24	196	5
25	197	5
26	197	7
27	198	8
29	199	8
30	199	9
31	200	8
32	200	10
33	201	2
34	202	2
35	203	11
38	205	2
39	205	11
40	206	2
41	207	12
42	208	2
43	209	2
44	210	13
45	211	11
46	213	2
\.


--
-- Name: home_faqpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_faqpagetag_id_seq', 46, true);


--
-- Data for Name: home_formfield; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_formfield (id, sort_order, label, field_type, required, choices, default_value, help_text, page_id) FROM stdin;
\.


--
-- Name: home_formfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_formfield_id_seq', 1, false);


--
-- Data for Name: home_formpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_formpage (page_ptr_id, to_address, from_address, subject, intro, thank_you_text) FROM stdin;
\.


--
-- Data for Name: home_homepage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_homepage (page_ptr_id, body, bg_image_id) FROM stdin;
3	<h4>Tilajakamon tarkoituksena on edistää kaupunkikulttuuria. Osuuskunta vuokraa Lapinlahden sairaalarakennuksesta tiloja jäsenilleen kulttuurin, tieteen, taiteen, käsityön tekemiseen. Osuuskunta myös järjestää ja tukee kaupunkikulttuuria edistäviä tapahtumia ja muuta toimintaa.</h4>	24
\.


--
-- Data for Name: home_homepagecarouselitem; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_homepagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_homepagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_homepagecarouselitem_id_seq', 1, false);


--
-- Data for Name: home_homepagerelatedlink; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_homepagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_homepagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_homepagerelatedlink_id_seq', 1, false);


--
-- Data for Name: home_personindexpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_personindexpage (page_ptr_id, first_name, last_name, room_id, feed_image_id, intro) FROM stdin;
6			\N	16	<p>Osuuskuntalaiset</p>
\.


--
-- Data for Name: home_personpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_personpage (page_ptr_id, telephone, email, address_1, address_2, city, country, post_code, first_name, last_name, intro, biography, image_id, room_id, public, telegram) FROM stdin;
126								Maija	Toukolehto			\N	9	t	
128								Tahwoo	Verstas			\N	11	t	
129								Helena	Westerlund			\N	19	t	
130								Tapio	Olenius			\N	20	t	
131								Eero	Koivistoinen			\N	21	t	
132								Seppo	Kantonen			\N	22	t	
133								Sophia	Ehnrooth			\N	23	t	
134								Tuure	Kilpelainen			\N	25	t	
135								Ville	Suhonen			\N	26	t	
136								Hannele	Helander			\N	28	t	
137								Tuomo	Manninen			\N	32	t	
138								Pohjonen	Kimmo			\N	34	t	
139								Welp	Klaus			\N	35	t	
140								Jukka	Pohjolainen			\N	36	t	
141								Helmi	Kekkonen			\N	38	t	
142								Kimmo	Hakola			\N	39	t	
143								Juha	Mattila			\N	60	t	
144								Tarja	Siik			\N	77	t	
146								Rista	Aapo			\N	79	t	
148								Mika	Priha			\N	83	t	
149								Oona	Skogster			\N	84	t	
151								Teemu	Lehto			\N	87	t	
152								Riku	Pihlanto			\N	89	t	
153								Timo	Martikainen			\N	90	t	
154								Jyrki	Jauhiainen			\N	117	t	
155								Emmi	Komlosi			\N	93	t	
156								Tero	Jartti			\N	98	t	
157								Pekka	Haavisto			\N	99	t	
158								Sampo	Hagelberg			\N	100	t	
162								Tiina	Karvonen			\N	108	t	
163								Riikka	Puputti			\N	109	t	
164								Korpela	Salla			\N	112	t	
165								Antonina	Taylor			\N	113	t	
166								Juha	Motto			\N	114	t	
167								Erno	Iipponen			\N	115	t	
168								Annie	Eleanoora			\N	123	t	
169								Sari	Jay			\N	97	t	
170								Niina	Tamminiemi			\N	24	t	
171								Janne	Lansipuro			\N	122	t	
172								Tatu	Hamalainen			\N	101	t	
176								Joonas	Pekkanen			\N	10	t	
178								Egil	Silfver			\N	85	t	
179								Kristiina	Uusitalo			\N	106	t	
180								Jarkko	Henttonen			\N	120	t	
181								Jaana	Liukkonen	<p>Ja koira</p>		\N	102	t	
173								Kansonen	Carrom-Novuss			\N	110	t	
160	050-5602570	kimmo@netzionale.com						Kimmo	Lehtonen	<h5>"Katkeruus ei kannata, kitkeryys on kivaa"</h5>		49	104	t	lebanonsky
177								LPMK	Waldmann			\N	78	t	
147								Ismael	Rantala			\N	81	f	
159								Esko	Matikainen			\N	102	t	
\.


--
-- Data for Name: home_personpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_personpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
1	0	http://inter.netzionale.com	Netzionale.com	\N	\N	160
\.


--
-- Name: home_personpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_personpagerelatedlink_id_seq', 1, true);


--
-- Data for Name: home_roomindexpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_roomindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
8	<p>Lapinlahden sairaalan pohjoissiipi</p>	10
183		3
184		2
185		1
\.


--
-- Data for Name: home_roompage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_roompage (page_ptr_id, free, body, feed_image_id, public) FROM stdin;
9	f	Koko 9m2, Käynti pääsisäänkäynnistä	\N	t
10	f	Koko 20m2, lavuaari + wc. Käynti pääsisäänkäynnistä	\N	t
11	f	Koko 9m2, lavuaari. Käynti pääsisäänkäynnistä	\N	t
12	f	Koko 27m2, 2xwc (ei vesipistettä käytössä). Käynti pääsisäänkäynnistä	\N	t
13	f	Koko 25m2, lavuaari. Käynti pääsisäänkäynnistä	\N	t
14	f	Koko 15m2, lavuaari. Käynti pääsisäänkäynnistä	\N	t
15	f	Koko 15m2, lavuaari. Käynti pääsisäänkäynnistä	\N	t
16	f	Koko 15m2, lavuaari. Käynti pääsisäänkäynnistä	\N	t
17	f	Koko 81m2, ruokala. Käynti pääsisäänkäynnistä tai pohjoispuolen 1. ovi	\N	t
18	f	Koko 160m2, laitoskeittö. Käynti pääsisäänkäynnistä tai pohjoispuolen 1. ovi	\N	t
19	f	Koko 17m2, keittiö. Käynti pohjoispuolen 1. ovi	\N	t
20	f	Koko 15m2, 2 wc, suihku. Käynti pohjoispuolen 1. ovi	\N	t
21	f	Koko 11m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
22	f	Koko 18m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
23	f	Koko 28m2, lavuaari. Käynti pohjoispuolen 1. ovi	\N	t
24	f	Koko 28m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
25	f	Koko 12m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
26	f	Koko 12m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
27	f	Koko 18m2, wc/suihku. Käynti pohjoispuolen 2. ovi	\N	t
28	f	Koko 18m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
29	f	Koko 13m2, keittö. Käynti pohjoispuolen 2. ovi	\N	t
30	f	Koko 26m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
31	f	Koko 11m2, pyykkihuone. Käynti pohjoispuolen 2. ovi	\N	t
32	f	Koko 14m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
33	f	Koko 14m2, wc/suihku. Käynti pohjoispuolen 2. ovi	\N	t
34	f	Koko 17m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
35	f	Koko 17m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
36	f	Koko 13m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
37	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
38	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
39	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
40	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
41	f	Koko 10m2, wc/suihku. Käynti pohjoispuolen 2. ovi	\N	t
42	f	Koko 10m2, wc. Käynti pohjoispuolen 2. ovi	\N	t
46	f	Koko 10m2, . Käynti pohjoispuolen 3. ovi	\N	t
48	f	Koko 28m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
51	f	Koko 10m2, . Käynti pohjoispuolen 3. ovi	\N	t
60	f	Koko 23m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
75	f	Koko 12m2, lavuaari. Käynti etupihan kulma	\N	t
76	f	Koko 6m2, ei vesipistettä. Käynti etupihan kulma	\N	t
77	f	Koko 6m2, ei vesipistettä. Käynti etupihan kulma	\N	t
78	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi/B	\N	t
79	f	Koko 10m2, lavuaari. Käynti pohjoispuolen 1. ovi/B	\N	t
80	f	Koko 12m2, suihku. Käynti pohjoispuolen 1. ovi/B	\N	t
81	f	Koko 11m2, lavuaari. Käynti pohjoispuolen 1. ovi/B	\N	t
82	f	Koko 11m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi/B	\N	t
83	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
84	f	Koko 11m2, oma wc, minikeittö. Käynti pohjoispuolen 1. ovi	\N	t
85	f	Koko 18m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
86	f	Koko 26m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
87	f	Koko 30m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
88	f	Koko tätä ei ole vaan on osa 234:sta (yhdistetty joskus)m2, . Käynti 	\N	t
89	f	Koko 29m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
90	f	Koko 13m2, lavuaari. Käynti pohjoispuolen 1. ovi	\N	t
91	f	Koko 13m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
92	f	Koko 18m2, wc, suihku. Käynti pohjoispuolen 1. ovi	\N	t
93	f	Koko 19m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
94	f	Koko 13m2, koneet ja vedet. Käynti pohjoispuolen 1. ovi	\N	t
95	f	Koko 26m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
96	f	Koko 11m2, kuivausrumpu ja pesukone. Käynti pohjoispuolen 1. ovi	\N	t
45	f	Koko 11m2, ei vesipistettä. Käynti pohjoispuolen 3. ovi	\N	t
55	f	Koko 12m2, keittö+suihku. Käynti pohjoispuolen 3. ovi	\N	t
68	f	Koko 9m2, kylpyhuone. Käynti etupihan kulma	\N	t
74	f	Koko 44m2, ei vesipistettä. Käynti etupihan kulma	\N	t
71	f	Koko 6m2, lavuaari. Käynti etupihan kulma	\N	t
72	f	Koko 16m2, ei vesipistettä. Käynti etupihan kulma	\N	t
44	f	Koko 10m2, wc/suihku. Käynti pohjoispuolen 3. ovi	\N	t
43	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 3. ovi	\N	t
50	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 3. ovi	\N	t
52	f	Koko 8m2, ei vesipistettä. Käynti pohjoispuolen 3. ovi	\N	t
54	f	Koko 10m2, lavuaari. Käynti pohjoispuolen 3. ovi	\N	t
53	f	Koko 22m2, ja keittö. Käynti pohjoispuolen 3. ovi	\N	t
47	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 2. ovi	\N	t
49	f	Koko m2, . Käynti pohjoispuolen 3. ovi	\N	t
66	f	Koko 11m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
58	f	Koko 16m2, wc. Käynti pääsisäänkäynnistä	\N	t
56	f	Koko 33m2, ei vesipistettä. Käynti pääsisäänkäynnistä	\N	t
73	f	Koko 11m2, ei vesipistettä. Käynti etupihan kulma	\N	t
59	f	Koko 25m2, ei vesipistettä. Käynti pääsisäänkäynnistä	\N	t
61	f	Koko 14m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
62	f	Koko 15,5m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
63	f	Koko 20m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
64	f	Koko 12m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
65	f	Koko 8m2, wc ei vesipistettä suihkua. Käynti pohjoispuolen 1. ovi	\N	t
67	f	Koko 6m2, keittö, liesi, lavuaari. Käynti pohjoispuolen 1. ovi	\N	t
57	f	Koko 13,5m2, ei vesipistettä. Käynti pääsisäänkäynnistä	\N	t
97	f	Koko 14m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
98	f	Koko 14m2, wc, lavuaari. Käynti pohjoispuolen 1. ovi	\N	t
99	f	Koko 18m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
100	f	Koko 18m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
101	f	Koko 12m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
102	f	Koko 16m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
103	f	Koko 26m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
105	f	Koko 14m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi 	\N	t
106	f	Koko 30m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
107	f	Koko 16m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
108	f	Koko 14m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
109	f	Koko 11m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
110	f	Koko 15m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
111	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
112	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
113	f	Koko 11m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
114	f	Koko 11m2, wc/suihko. Käynti pohjoispuolen 1. ovi	\N	t
115	f	Koko 24m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
116	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
117	f	Koko 20m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
118	f	Koko 9m2, keittö. Käynti pohjoispuolen 1. ovi	\N	t
119	f	Koko 16m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
120	f	Koko 16m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
121	f	Koko 12m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
122	f	Koko 13m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
123	f	Koko 12m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	\N	t
70	f	Koko 13m2, ei vesipistettä. Käynti etupihan kulma	\N	t
69	f	Koko 27m2, ei vesipistettä. Käynti etupihan kulma	\N	t
104	f	Koko 10m2, ei vesipistettä. Käynti pohjoispuolen 1. ovi	49	t
\.


--
-- Data for Name: home_standardindexpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_standardindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
\.


--
-- Data for Name: home_standardindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_standardindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_standardindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_standardindexpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: home_standardpage; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_standardpage (page_ptr_id, intro, body, feed_image_id, public) FROM stdin;
186	<h2>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteisö, jonka tavoitteena on kehittää kaupunkia jakamalla saatavilla olevia tiloja jäseniensä käyttöön. </h2>	<p><embed alt="IMG_1039.JPG" embedtype="image" format="fullwidth" id="22"/>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteisö, jonka tavoitteena on kehittää kaupunkia jakamalla saatavilla olevia tiloja jäseniensä käyttöön. Joulukuussa 2015 osuuskunta päätyi yli kaksi vuotta kestäneiden neuvotteluiden jälkeen vuokraamaan puolet Lapinlahden sairaalan tiloista.</p><p>Osuuskunnassa on reilut 100 jäsentä, kuvataiteilijoita, valokuvaajia, musiikintekijöitä, käsityöläisiä, yrittäjiä ja tutkijoita, joista noin puolet on saanut työtiloja Lapinlahdesta. </p><p>Vuonna 1841 C. L. Engelin suunnittelema mielisairaalaksi rakennettu Lapinlahden sairaala on ollut osin tyhjillään sen jälkeen kun sairaalatoiminta loppui vuonna 2008. Osuuskunnan toissijainen tavoite on arkkitehtuurillisesti merkittävän historiallisen rakennuksen suojeleminen aktiivisella käytöllä.</p><p>Suunnitelmissa on avata Lapinlahti myös ulkopuolisille. Yleisiin tiloihin on kaavailtu kahvilaa, näyttelyitä ja myymälätiloja, ruokasaleihin ravintolaa ja sairaalan laitoskeittiöön osuuskunnallista keittiötoimintaa. Myös piha-alueilla ja puistossa alkaa kevään mittaan tapahtua — osuuskunnan organisoima telttasauna on jo avoinna perjantaisin ja lauantaisin.</p><p>Lapinlahden sairaalaan tehdään vuoden 2016 -2017 Helsingin kaupungin toimesta remonttia ikkunoiden ja julkisivun kohentamiseksi sekä vaurioiden korjaamiseksi. Tällä hetkellä suurin osa sisätiloista on hyvässä kunnossa, mutta lähes jokainen tila tarvitsee jonkin asteista remontointia. Sairaala on suojeltu rakennus, joten kaiken remontoinnin tulee olla museoviraston antamien ohjeiden mukaista. Kunnostuksesta vastaa tilojen osuuskuntalainen, mutta yleisten tilojen remontointi on yhteisön vastuulla.</p><p>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p>Ensimmäiset osuuskuntalaiset muuttivat sairaalaan vuoden 2016 alussa jai tilat on jo varattu. Vuoden 2016 aikana tavoitteena on remontoida tiloja ja jatkaa osuuskunnan päätavoitteena olevaa kaupungin kehittäminen. Osuuskunta etsii edelleen uusia vastaavia tiloja kaupungista.</p><p><embed alt="IMG_1054.JPG" embedtype="image" format="fullwidth" id="34"/><br/></p>	\N	t
\.


--
-- Data for Name: home_standardpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_standardpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_standardpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_standardpagecarouselitem_id_seq', 1, false);


--
-- Data for Name: home_standardpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY home_standardpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: home_standardpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('home_standardpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY taggit_tag (id, name, slug) FROM stdin;
1	sauna	sauna
2	osuuskunta	osuuskunta
3	holvi	holvi
4	avaimet	avaimet
5	Telegram	telegram
6	kanavat	kanavat
7	ohje	ohje
8	saneeraus	saneeraus
9	korjauskortti	korjauskortti
10	vastuu	vastuu
11	ylläpito	yllapito
12	netti	netti
13	lemmikit	lemmikit
14	advert	advert
15	logo	logo
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 15, true);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
1	51	2	1
2	52	2	5
3	53	2	5
4	56	2	14
5	56	2	15
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 5, true);


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
7	add	3	6
8	publish	3	6
\.


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailcore_grouppagepermission_id_seq', 10, true);


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at) FROM stdin;
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N
2	00010001	2	1	Welcome to your new Wagtail site!	home	t	f	/home/		f		\N	\N	f	1	\N	f	\N	\N
58	00010001000100050073000M	6	0	203	203	f	t	/home/tilajakamo/huoneet/toinen-kerros/203/		f		\N	\N	f	15	\N	f	\N	\N
59	00010001000100050073000P	6	0	204	204	f	t	/home/tilajakamo/huoneet/toinen-kerros/204/		f		\N	\N	f	15	\N	f	\N	\N
63	00010001000100050073000U	6	0	208	208	f	t	/home/tilajakamo/huoneet/toinen-kerros/208/		f		\N	\N	f	15	\N	f	\N	\N
64	00010001000100050073000W	6	0	209	209	f	t	/home/tilajakamo/huoneet/toinen-kerros/209/		f		\N	\N	f	15	\N	f	\N	\N
5	0001000100010002	4	2	TAPAHTUMIA	tapahtumia	t	f	/home/tilajakamo/tapahtumia/		t		\N	\N	f	32	1	f	2016-02-09 15:00:39.121+00	2016-02-09 14:42:07.816+00
104	00010001000100050075000J	6	0	303	303	t	f	/home/tilajakamo/huoneet/kolmas-kerros/303/		f		\N	\N	f	15	\N	f	2016-02-11 21:15:39.102276+00	2016-02-11 16:36:33.694167+00
203	0001000100010004000D	5	0	Mitä todellisuuskoordinaattori tekee?	mita-todellisuuskoordinaattori-tekee	t	f	/home/tilajakamo/ukk/mita-todellisuuskoordinaattori-tekee/		f		\N	\N	f	25	1	f	2016-02-18 12:55:13.619509+00	2016-02-18 12:55:13.638731+00
4	0001000100010001	4	2	UUTISET	uutiset	t	f	/home/tilajakamo/uutiset/		t		\N	\N	f	21	1	f	2016-02-09 14:56:22.062+00	2016-02-09 14:39:22.425+00
7	0001000100010004	4	22	U.K.K.	ukk	t	f	/home/tilajakamo/ukk/		t		\N	\N	f	26	1	f	2016-02-09 14:55:13.279+00	2016-02-09 14:44:32.074+00
44	00010001000100050041	5	0	157	157	f	t	/home/tilajakamo/huoneet/157/		f		\N	\N	f	15	\N	f	\N	\N
195	00010001000100040005	5	0	Miten liityn tilajakamon kanaville?	miten-liityn-tilajakamon-kanaville	t	f	/home/tilajakamo/ukk/miten-liityn-tilajakamon-kanaville/		f		\N	\N	f	25	1	f	2016-02-18 10:12:46.019281+00	2016-02-18 09:23:16.218263+00
187	00010001000100010001	5	0	Lapinlahden telttasauna perjantaisin ja lauantaisin	lapinlahdessa-telttasauna	t	f	/home/tilajakamo/uutiset/lapinlahdessa-telttasauna/		f		\N	\N	f	20	1	f	2016-02-18 07:55:17.408683+00	2016-02-12 07:11:47.187848+00
116	00010001000100050075000H	6	0	318	318	t	f	/home/tilajakamo/huoneet/kolmas-kerros/318/		f		\N	\N	f	15	\N	f	\N	\N
102	00010001000100050075000K	6	0	301	301	t	f	/home/tilajakamo/huoneet/kolmas-kerros/301/		f		\N	\N	f	15	\N	f	\N	\N
119	000100010001000500750007	6	0	322	322	t	f	/home/tilajakamo/huoneet/kolmas-kerros/322/		f		\N	\N	f	15	\N	f	\N	\N
121	000100010001000500750008	6	0	324	324	t	f	/home/tilajakamo/huoneet/kolmas-kerros/324/		f		\N	\N	f	15	\N	f	\N	\N
122	000100010001000500750009	6	0	326	326	t	f	/home/tilajakamo/huoneet/kolmas-kerros/326/		f		\N	\N	f	15	\N	f	\N	\N
108	00010001000100050075000A	6	0	307	307	t	f	/home/tilajakamo/huoneet/kolmas-kerros/307/		f		\N	\N	f	15	\N	f	\N	\N
123	00010001000100050075000B	6	0	328	328	t	f	/home/tilajakamo/huoneet/kolmas-kerros/328/		f		\N	\N	f	15	\N	f	\N	\N
111	00010001000100050075000F	6	0	310	310	t	f	/home/tilajakamo/huoneet/kolmas-kerros/310/		f		\N	\N	f	15	\N	f	\N	\N
113	00010001000100050075000G	6	0	312	312	t	f	/home/tilajakamo/huoneet/kolmas-kerros/312/		f		\N	\N	f	15	\N	f	\N	\N
118	00010001000100050075000I	6	0	320	320	t	f	/home/tilajakamo/huoneet/kolmas-kerros/320/		f		\N	\N	f	15	\N	f	\N	\N
105	00010001000100050075000L	6	0	304	304	t	f	/home/tilajakamo/huoneet/kolmas-kerros/304/		f		\N	\N	f	15	\N	f	\N	\N
82	00010001000100050073000K	6	0	228	228	t	f	/home/tilajakamo/huoneet/toinen-kerros/228/		f		\N	\N	f	15	\N	f	\N	\N
81	00010001000100050073000L	6	0	226	226	t	f	/home/tilajakamo/huoneet/toinen-kerros/226/		f		\N	\N	f	15	\N	f	\N	\N
79	00010001000100050073000N	6	0	224	224	t	f	/home/tilajakamo/huoneet/toinen-kerros/224/		f		\N	\N	f	15	\N	f	\N	\N
90	00010001000100050073000O	6	0	238	238	t	f	/home/tilajakamo/huoneet/toinen-kerros/238/		f		\N	\N	f	15	\N	f	\N	\N
78	00010001000100050073000Q	6	0	223	223	t	f	/home/tilajakamo/huoneet/toinen-kerros/223/		f		\N	\N	f	15	\N	f	\N	\N
98	00010001000100050073000R	6	0	246	246	t	f	/home/tilajakamo/huoneet/toinen-kerros/246/		f		\N	\N	f	15	\N	f	\N	\N
100	00010001000100050073000S	6	0	248	248	t	f	/home/tilajakamo/huoneet/toinen-kerros/248/		f		\N	\N	f	15	\N	f	\N	\N
86	00010001000100050073000T	6	0	233	233	t	f	/home/tilajakamo/huoneet/toinen-kerros/233/		f		\N	\N	f	15	\N	f	\N	\N
91	00010001000100050073000V	6	0	239	239	t	f	/home/tilajakamo/huoneet/toinen-kerros/239/		f		\N	\N	f	15	\N	f	\N	\N
84	00010001000100050073000X	6	0	231	231	t	f	/home/tilajakamo/huoneet/toinen-kerros/231/		f		\N	\N	f	15	\N	f	\N	\N
88	00010001000100050073000Y	6	0	236	236	t	f	/home/tilajakamo/huoneet/toinen-kerros/236/		f		\N	\N	f	15	\N	f	\N	\N
211	0001000100010004000L	5	0	Mihin toimitamme jätteet?	mihin-toimitamme-jatteet	t	f	/home/tilajakamo/ukk/mihin-toimitamme-jatteet/		f		\N	\N	f	25	1	f	2016-02-18 13:10:06.576625+00	2016-02-18 13:10:06.599257+00
6	0001000100010003	4	50	ME OSKUT	me	t	f	/home/tilajakamo/me/		t		\N	\N	f	29	1	f	2016-02-09 18:33:23.122+00	2016-02-09 14:43:05.273+00
45	00010001000100050042	5	0	158	158	f	t	/home/tilajakamo/huoneet/158/		f		\N	\N	f	15	\N	f	\N	\N
55	00010001000100050052	5	0	168	168	f	t	/home/tilajakamo/huoneet/168/		f		\N	\N	f	15	\N	f	\N	\N
72	00010001000100050069	5	0	217	217	f	t	/home/tilajakamo/huoneet/217/		f		\N	\N	f	15	\N	f	\N	\N
188	00010001000100020001	5	0	Lapinlahden telttasauna perjantaisin ja lauantaisin	lapinlahden-telttasauna-perjantaisin-ja-lauantaisin	t	f	/home/tilajakamo/tapahtumia/lapinlahden-telttasauna-perjantaisin-ja-lauantaisin/		f		\N	\N	f	36	1	f	2016-02-18 07:59:26.657914+00	2016-02-18 07:59:26.671506+00
213	0001000100010004000M	5	0	Voinko edelleen- tai alivuokrata huoneeni?	voinko-edelleen-tai-alivuokrata-huoneeni	t	f	/home/tilajakamo/ukk/voinko-edelleen-tai-alivuokrata-huoneeni/		f		\N	\N	f	25	1	f	2016-02-18 15:10:47.341921+00	2016-02-18 15:10:47.360241+00
196	00010001000100040006	5	0	Miten laitan yksityisviestin Telegramilla?	miten-yksityisviestin-telegramillaa	t	f	/home/tilajakamo/ukk/miten-yksityisviestin-telegramillaa/		f		\N	\N	f	25	1	f	2016-02-18 10:18:05.850259+00	2016-02-18 10:04:24.862764+00
103	000100010001000500750001	6	0	302	302	t	f	/home/tilajakamo/huoneet/kolmas-kerros/302/		f		\N	\N	f	15	\N	f	\N	\N
115	000100010001000500750004	6	0	316	316	t	f	/home/tilajakamo/huoneet/kolmas-kerros/316/		f		\N	\N	f	15	\N	f	\N	\N
69	00010001000100050066	5	0	214	214	f	t	/home/tilajakamo/huoneet/214/		f		\N	\N	f	15	\N	f	\N	\N
110	000100010001000500750005	6	0	309	309	t	f	/home/tilajakamo/huoneet/kolmas-kerros/309/		f		\N	\N	f	15	\N	f	\N	\N
109	00010001000100050075000C	6	0	308	308	t	f	/home/tilajakamo/huoneet/kolmas-kerros/308/		f		\N	\N	f	15	\N	f	\N	\N
204	0001000100010004000E	5	0	Kuka vuokraa Omenapuutaloa?	kuka-vuokraa-omenapuutaloa	t	f	/home/tilajakamo/ukk/kuka-vuokraa-omenapuutaloa/		f		\N	\N	f	25	1	f	2016-02-18 12:56:38.518054+00	2016-02-18 12:56:38.532162+00
106	00010001000100050075000D	6	0	305	305	t	f	/home/tilajakamo/huoneet/kolmas-kerros/305/		f		\N	\N	f	15	\N	f	\N	\N
117	00010001000100050075000E	6	0	319	319	t	f	/home/tilajakamo/huoneet/kolmas-kerros/319/		f		\N	\N	f	15	\N	f	\N	\N
114	00010001000100050075000M	6	0	315	315	t	f	/home/tilajakamo/huoneet/kolmas-kerros/315/		f		\N	\N	f	15	\N	f	\N	\N
60	00010001000100050073000Z	6	0	205	205	t	f	/home/tilajakamo/huoneet/toinen-kerros/205/		f		\N	\N	f	15	\N	f	\N	\N
93	000100010001000500730010	6	0	241	241	t	f	/home/tilajakamo/huoneet/toinen-kerros/241/		f		\N	\N	f	15	\N	f	\N	\N
97	000100010001000500730011	6	0	245	245	t	f	/home/tilajakamo/huoneet/toinen-kerros/245/		f		\N	\N	f	15	\N	f	\N	\N
75	000100010001000500730012	6	0	220	220	t	f	/home/tilajakamo/huoneet/toinen-kerros/220/		f		\N	\N	f	15	\N	f	\N	\N
101	000100010001000500730013	6	0	249	249	t	f	/home/tilajakamo/huoneet/toinen-kerros/249/		f		\N	\N	f	15	\N	f	\N	\N
85	000100010001000500730014	6	0	232	232	t	f	/home/tilajakamo/huoneet/toinen-kerros/232/		f		\N	\N	f	15	\N	f	\N	\N
126	00010001000100030048	5	0	Maija Toukolehto	Toukolehto	t	f	/home/tilajakamo/me/Toukolehto/		f		\N	\N	f	28	\N	f	\N	\N
128	00010001000100030005	5	0	Tahwoo Verstas Ky	Verstas	t	f	/home/tilajakamo/me/Verstas/		f		\N	\N	f	28	\N	f	\N	\N
70	00010001000100050067	5	0	215	215	f	t	/home/tilajakamo/huoneet/215/		f		\N	\N	f	15	\N	f	\N	\N
68	00010001000100050065	5	0	213	213	f	t	/home/tilajakamo/huoneet/213/		f		\N	\N	f	15	\N	f	\N	\N
74	00010001000100050071	5	0	219	219	f	t	/home/tilajakamo/huoneet/219/		f		\N	\N	f	15	\N	f	\N	\N
71	00010001000100050068	5	0	216	216	f	t	/home/tilajakamo/huoneet/216/		f		\N	\N	f	15	\N	f	\N	\N
129	00010001000100030006	5	0	Helena Westerlund	Westerlund	t	f	/home/tilajakamo/me/Westerlund/		f		\N	\N	f	28	\N	f	\N	\N
130	00010001000100030007	5	0	Tapio Olenius	Olenius	t	f	/home/tilajakamo/me/Olenius/		f		\N	\N	f	28	\N	f	\N	\N
131	00010001000100030008	5	0	Eero Koivistoinen	Koivistoinen	t	f	/home/tilajakamo/me/Koivistoinen/		f		\N	\N	f	28	\N	f	\N	\N
132	00010001000100030009	5	0	Seppo Kantonen	Kantonen	t	f	/home/tilajakamo/me/Kantonen/		f		\N	\N	f	28	\N	f	\N	\N
133	00010001000100030010	5	0	Sophia Ehnrooth	Ehnrooth	t	f	/home/tilajakamo/me/Ehnrooth/		f		\N	\N	f	28	\N	f	\N	\N
134	00010001000100030011	5	0	Tuure Kilpelainen	Kilpelainen	t	f	/home/tilajakamo/me/Kilpelainen/		f		\N	\N	f	28	\N	f	\N	\N
135	00010001000100030012	5	0	Ville Suhonen	Suhonen	t	f	/home/tilajakamo/me/Suhonen/		f		\N	\N	f	28	\N	f	\N	\N
136	00010001000100030013	5	0	Hannele Helander	Helander	t	f	/home/tilajakamo/me/Helander/		f		\N	\N	f	28	\N	f	\N	\N
137	00010001000100030014	5	0	Tuomo Manninen	Manninen	t	f	/home/tilajakamo/me/Manninen/		f		\N	\N	f	28	\N	f	\N	\N
138	00010001000100030015	5	0	Pohjonen Kimmo	Kimmo	t	f	/home/tilajakamo/me/Kimmo/		f		\N	\N	f	28	\N	f	\N	\N
139	00010001000100030016	5	0	Welp Klaus	Klaus	t	f	/home/tilajakamo/me/Klaus/		f		\N	\N	f	28	\N	f	\N	\N
140	00010001000100030017	5	0	Jukka Pohjolainen	Pohjolainen	t	f	/home/tilajakamo/me/Pohjolainen/		f		\N	\N	f	28	\N	f	\N	\N
141	00010001000100030018	5	0	Helmi Kekkonen	Kekkonen	t	f	/home/tilajakamo/me/Kekkonen/		f		\N	\N	f	28	\N	f	\N	\N
142	00010001000100030019	5	0	Kimmo Hakola	Hakola	t	f	/home/tilajakamo/me/Hakola/		f		\N	\N	f	28	\N	f	\N	\N
143	00010001000100030020	5	0	Juha Mattila	Mattila	t	f	/home/tilajakamo/me/Mattila/		f		\N	\N	f	28	\N	f	\N	\N
144	00010001000100030021	5	0	Tarja Siik	Siik	t	f	/home/tilajakamo/me/Siik/		f		\N	\N	f	28	\N	f	\N	\N
146	00010001000100030023	5	0	Rista Aapo	Aapo	t	f	/home/tilajakamo/me/Aapo/		f		\N	\N	f	28	\N	f	\N	\N
159	00010001000100030036	5	0	Esko Matikainen	Matikainen	t	f	/home/tilajakamo/me/Matikainen/		f		\N	\N	f	28	5	f	2016-02-18 14:02:40.787752+00	2016-02-18 14:02:40.805155+00
148	00010001000100030025	5	0	Mika Priha	Priha	t	f	/home/tilajakamo/me/Priha/		f		\N	\N	f	28	\N	f	\N	\N
149	00010001000100030026	5	0	Oona Skogster	Skogster	t	f	/home/tilajakamo/me/Skogster/		f		\N	\N	f	28	\N	f	\N	\N
151	00010001000100030028	5	0	Teemu Lehto	Lehto	t	f	/home/tilajakamo/me/Lehto/		f		\N	\N	f	28	\N	f	\N	\N
152	00010001000100030029	5	0	Riku Pihlanto	Pihlanto	t	f	/home/tilajakamo/me/Pihlanto/		f		\N	\N	f	28	\N	f	\N	\N
153	00010001000100030030	5	0	Timo Martikainen	Martikainen	t	f	/home/tilajakamo/me/Martikainen/		f		\N	\N	f	28	\N	f	\N	\N
154	00010001000100030045	5	0	Jyrki Jauhiainen	Jauhiainen	t	f	/home/tilajakamo/me/Jauhiainen/		f		\N	\N	f	28	\N	f	\N	\N
155	00010001000100030032	5	0	Emmi Komlosi	Komlosi	t	f	/home/tilajakamo/me/Komlosi/		f		\N	\N	f	28	\N	f	\N	\N
156	00010001000100030033	5	0	Tero Jartti	Jartti	t	f	/home/tilajakamo/me/Jartti/		f		\N	\N	f	28	\N	f	\N	\N
157	00010001000100030034	5	0	Pekka Haavisto	Haavisto	t	f	/home/tilajakamo/me/Haavisto/		f		\N	\N	f	28	\N	f	\N	\N
158	00010001000100030035	5	0	Sampo Hagelberg	Hagelberg	t	f	/home/tilajakamo/me/Hagelberg/		f		\N	\N	f	28	\N	f	\N	\N
162	00010001000100030039	5	0	Tiina Karvonen	Karvonen	t	f	/home/tilajakamo/me/Karvonen/		f		\N	\N	f	28	\N	f	\N	\N
163	00010001000100030040	5	0	Riikka Puputti	Puputti	t	f	/home/tilajakamo/me/Puputti/		f		\N	\N	f	28	\N	f	\N	\N
164	00010001000100030041	5	0	Korpela Salla	Salla	t	f	/home/tilajakamo/me/Salla/		f		\N	\N	f	28	\N	f	\N	\N
165	00010001000100030042	5	0	Antonina Taylor	Taylor	t	f	/home/tilajakamo/me/Taylor/		f		\N	\N	f	28	\N	f	\N	\N
166	00010001000100030043	5	0	Juha Motto	Motto	t	f	/home/tilajakamo/me/Motto/		f		\N	\N	f	28	\N	f	\N	\N
167	00010001000100030044	5	0	Erno Iipponen	Iipponen	t	f	/home/tilajakamo/me/Iipponen/		f		\N	\N	f	28	\N	f	\N	\N
168	00010001000100030046	5	0	Annie Eleanoora	Eleanoora	t	f	/home/tilajakamo/me/Eleanoora/		f		\N	\N	f	28	\N	f	\N	\N
169	00010001000100030047	5	0	Sari Jay	Jay	t	f	/home/tilajakamo/me/Jay/		f		\N	\N	f	28	\N	f	\N	\N
170	00010001000100030049	5	0	Niina Tamminiemi	Tamminiemi	t	f	/home/tilajakamo/me/Tamminiemi/		f		\N	\N	f	28	\N	f	\N	\N
171	00010001000100030050	5	0	Janne Lansipuro	Lansipuro	t	f	/home/tilajakamo/me/Lansipuro/		f		\N	\N	f	28	\N	f	\N	\N
172	00010001000100030051	5	0	Tatu Hamalainen	Hamalainen	t	f	/home/tilajakamo/me/Hamalainen/		f		\N	\N	f	28	\N	f	\N	\N
176	00010001000100030004	5	0	Joonas Pekkanen Maurinko	Pekkanen	t	f	/home/tilajakamo/me/Pekkanen/		f		\N	\N	f	28	\N	f	\N	\N
178	00010001000100030027	5	0	Egil Silfver GrokIT	Silfver	t	f	/home/tilajakamo/me/Silfver/		f		\N	\N	f	28	\N	f	\N	\N
179	00010001000100030038	5	0	Kristiina Uusitalo Olli Pekka Jokela	Uusitalo	t	f	/home/tilajakamo/me/Uusitalo/		f		\N	\N	f	28	\N	f	\N	\N
180	00010001000100030053	5	0	Jarkko Henttonen After Dark	Henttonen	t	f	/home/tilajakamo/me/Henttonen/		f		\N	\N	f	28	\N	f	\N	\N
181	00010001000100030054	5	0	Kaospilotti	kaospilotti	f	t	/home/tilajakamo/me/kaospilotti/		f		\N	\N	f	28	1	f	2016-02-10 11:47:51.173+00	\N
184	00010001000100050073	5	40	Toinen kerros	toinen-kerros	t	f	/home/tilajakamo/huoneet/toinen-kerros/		t		\N	\N	f	16	1	f	2016-02-10 14:47:38.715+00	2016-02-10 14:47:38.733+00
173	00010001000100030052	5	0	Kansonen Carrom-Novuss	Carrom-Novuss	t	f	/home/tilajakamo/me/Carrom-Novuss/		f		\N	\N	f	28	1	f	2016-02-11 11:15:39.61531+00	2016-02-11 11:15:39.635741+00
160	00010001000100030037	5	0	Eksistentialistinen kirjallisuusnörtti	Lehtonen	t	f	/home/tilajakamo/me/Lehtonen/		f		\N	\N	f	28	\N	f	2016-02-11 21:15:14.786117+00	2016-02-11 16:25:53.952019+00
177	00010001000100030022	5	0	LPMK Waldmann	Waldmann	t	f	/home/tilajakamo/me/Waldmann/		f		\N	\N	f	28	2	f	2016-02-12 09:13:13.403156+00	2016-02-12 09:13:13.421958+00
147	00010001000100030024	5	0	katu ry	katury	f	t	/home/tilajakamo/me/katury/		f		\N	\N	f	28	3	f	2016-02-12 13:16:15.115666+00	2016-02-12 09:48:33.905699+00
189	00010001000100020002	5	0	Liveroolitapahtuma End of the Line	liveroolitapahtuma-end-line	t	f	/home/tilajakamo/tapahtumia/liveroolitapahtuma-end-line/		f		\N	\N	f	36	1	f	2016-02-18 08:01:19.266906+00	2016-02-18 08:01:19.28498+00
197	00010001000100040007	5	0	Miten tilajakamo_botti toimii?	miten-tilajakamo_botti-toimii	t	f	/home/tilajakamo/ukk/miten-tilajakamo_botti-toimii/		f		\N	\N	f	25	1	f	2016-02-18 10:35:41.941022+00	2016-02-18 10:35:41.967769+00
205	0001000100010004000F	5	0	Kuka pyörittää osuuskuntaa?	kuka-pyorittaa-osuuskuntaa	t	f	/home/tilajakamo/ukk/kuka-pyorittaa-osuuskuntaa/		f		\N	\N	f	25	1	f	2016-02-18 12:59:37.348579+00	2016-02-18 12:58:50.193714+00
67	000100010001000500730004	6	0	212	212	f	t	/home/tilajakamo/huoneet/toinen-kerros/212/		f		\N	\N	f	15	\N	f	\N	\N
185	00010001000100050075	5	22	Kolmas kerros	kolmas-kerros	t	f	/home/tilajakamo/huoneet/kolmas-kerros/		t		\N	\N	f	16	1	f	2016-02-10 14:48:03.219+00	2016-02-10 14:48:03.237+00
120	000100010001000500750002	6	0	323	323	t	f	/home/tilajakamo/huoneet/kolmas-kerros/323/		f		\N	\N	f	15	\N	f	\N	\N
112	000100010001000500750003	6	0	311	311	t	f	/home/tilajakamo/huoneet/kolmas-kerros/311/		f		\N	\N	f	15	\N	f	\N	\N
107	000100010001000500750006	6	0	306	306	t	f	/home/tilajakamo/huoneet/kolmas-kerros/306/		f		\N	\N	f	15	\N	f	\N	\N
80	000100010001000500730001	6	0	225	225	t	f	/home/tilajakamo/huoneet/toinen-kerros/225/		f		\N	\N	f	15	\N	f	\N	\N
96	000100010001000500730003	6	0	244	244	t	f	/home/tilajakamo/huoneet/toinen-kerros/244/		f		\N	\N	f	15	\N	f	\N	\N
87	000100010001000500730005	6	0	234	234	t	f	/home/tilajakamo/huoneet/toinen-kerros/234/		f		\N	\N	f	15	\N	f	\N	\N
99	000100010001000500730006	6	0	247	247	t	f	/home/tilajakamo/huoneet/toinen-kerros/247/		f		\N	\N	f	15	\N	f	\N	\N
83	000100010001000500730007	6	0	230	230	t	f	/home/tilajakamo/huoneet/toinen-kerros/230/		f		\N	\N	f	15	\N	f	\N	\N
94	000100010001000500730008	6	0	242	242	t	f	/home/tilajakamo/huoneet/toinen-kerros/242/		f		\N	\N	f	15	\N	f	\N	\N
190	00010001000100010002	5	0	Liveroolitapahtumaa nimeltään End of the Line	liveroolitapahtumaa-nimeltaan-end-line	t	f	/home/tilajakamo/uutiset/liveroolitapahtumaa-nimeltaan-end-line/		f		\N	\N	f	20	1	f	2016-02-18 08:02:22.576165+00	2016-02-18 08:02:22.594751+00
198	00010001000100040008	5	0	Museoviraston ohjeet huoneiden kunnostuksesta?	museoviraston-ohjeet-huoneiden-kunnostuksesta	t	f	/home/tilajakamo/ukk/museoviraston-ohjeet-huoneiden-kunnostuksesta/		f		\N	\N	f	25	1	f	2016-02-18 10:40:58.037888+00	2016-02-18 10:40:58.058856+00
186	0001000100010009	4	0	YLEISTÄ	yleista	t	f	/home/tilajakamo/yleista/		t		\N	\N	f	14	1	f	2016-02-18 13:52:46.762972+00	2016-02-10 17:05:20.71223+00
206	0001000100010004000G	5	0	Pitää oma irtaimisto vakuuttaa?	pitaa-oma-irtaimisto-vakuuttaa	t	f	/home/tilajakamo/ukk/pitaa-oma-irtaimisto-vakuuttaa/		f		\N	\N	f	25	1	f	2016-02-18 13:02:36.94159+00	2016-02-18 13:02:25.868303+00
13	000100010001000500720010	6	0	105	105	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/105/		f		\N	\N	f	15	\N	f	\N	\N
8	0001000100010005	4	12	Huoneet	huoneet	t	f	/home/tilajakamo/huoneet/		t		\N	\N	f	16	1	f	2016-02-09 14:55:01.701+00	2016-02-09 14:46:31.486+00
66	000100010001000500730009	6	0	211	211	f	t	/home/tilajakamo/huoneet/toinen-kerros/211/		f		\N	\N	f	15	\N	f	\N	\N
56	00010001000100050073000E	6	0	201	201	f	t	/home/tilajakamo/huoneet/toinen-kerros/201/		f		\N	\N	f	15	\N	f	\N	\N
61	000100010001000500730002	6	0	206	206	f	t	/home/tilajakamo/huoneet/toinen-kerros/206/		f		\N	\N	f	15	\N	f	\N	\N
62	00010001000100050073000F	6	0	207	207	f	t	/home/tilajakamo/huoneet/toinen-kerros/207/		f		\N	\N	f	15	\N	f	\N	\N
65	00010001000100050073000I	6	0	210	210	f	t	/home/tilajakamo/huoneet/toinen-kerros/210/		f		\N	\N	f	15	\N	f	\N	\N
57	00010001000100050073000G	6	0	202	202	t	f	/home/tilajakamo/huoneet/toinen-kerros/202/		f		\N	\N	f	15	\N	f	2016-02-10 17:25:50.573481+00	2016-02-10 17:25:50.601168+00
73	00010001000100050073000C	6	0	218	218	f	t	/home/tilajakamo/huoneet/toinen-kerros/218/		f		\N	\N	f	15	\N	f	\N	\N
3	000100010001	3	6	Tilajakamo	tilajakamo	t	f	/home/tilajakamo/		f		\N	\N	f	9	1	f	2016-02-19 20:20:06.712554+00	2016-02-09 14:28:57.723+00
191	00010001000100040001	5	0	Miten osuuskuntaan voi liittyä?	miten-osuuskuntaan-voi-liittya	t	f	/home/tilajakamo/ukk/miten-osuuskuntaan-voi-liittya/		f		\N	\N	f	25	1	f	2016-02-18 08:36:04.44741+00	2016-02-18 08:36:04.47487+00
199	00010001000100040009	5	0	Mihin ilmoitan kunnostustöistä?	mihin-ilmoitan-kunnostustoista	t	f	/home/tilajakamo/ukk/mihin-ilmoitan-kunnostustoista/		f		\N	\N	f	25	1	f	2016-02-18 10:45:57.488082+00	2016-02-18 10:45:57.516841+00
207	0001000100010004000H	5	0	Mistä löytyy netti?	mista-loytyy-netti	t	f	/home/tilajakamo/ukk/mista-loytyy-netti/		f		\N	\N	f	25	1	f	2016-02-18 13:03:39.325774+00	2016-02-18 13:03:39.342816+00
77	00010001000100050073000A	6	0	222	222	t	f	/home/tilajakamo/huoneet/toinen-kerros/222/		f		\N	\N	f	15	\N	f	\N	\N
89	00010001000100050073000B	6	0	237	237	t	f	/home/tilajakamo/huoneet/toinen-kerros/237/		f		\N	\N	f	15	\N	f	\N	\N
95	00010001000100050073000D	6	0	243	243	t	f	/home/tilajakamo/huoneet/toinen-kerros/243/		f		\N	\N	f	15	\N	f	\N	\N
92	00010001000100050073000H	6	0	240	240	t	f	/home/tilajakamo/huoneet/toinen-kerros/240/		f		\N	\N	f	15	\N	f	\N	\N
76	00010001000100050073000J	6	0	221	221	t	f	/home/tilajakamo/huoneet/toinen-kerros/221/		f		\N	\N	f	15	\N	f	\N	\N
192	00010001000100040002	5	0	Mistä saan lisäavaimia?	mista-saan-lisaavaimia	t	f	/home/tilajakamo/ukk/mista-saan-lisaavaimia/		f		\N	\N	f	25	1	f	2016-02-18 09:35:02.043303+00	2016-02-18 08:38:12.732526+00
200	0001000100010004000A	5	0	Mistä olet vastuussa omassa huoneessasi?	mista-olet-vastuussa-omassa-huoneessasi	t	f	/home/tilajakamo/ukk/mista-olet-vastuussa-omassa-huoneessasi/		f		\N	\N	f	25	1	f	2016-02-18 10:48:06.753044+00	2016-02-18 10:48:06.776517+00
208	0001000100010004000I	5	0	Mikä ihmeen Holvi?	mika-ihmeen-holvi	t	f	/home/tilajakamo/ukk/mika-ihmeen-holvi/		f		\N	\N	f	25	1	f	2016-02-18 13:06:02.692529+00	2016-02-18 13:06:02.725051+00
43	00010001000100050072000S	6	0	156	156	f	t	/home/tilajakamo/huoneet/ensimmainen-kerros/156/		f		\N	\N	f	15	\N	f	\N	\N
50	00010001000100050072000I	6	0	163	163	f	t	/home/tilajakamo/huoneet/ensimmainen-kerros/163/		f		\N	\N	f	15	\N	f	\N	\N
52	00010001000100050072000R	6	0	165	165	f	t	/home/tilajakamo/huoneet/ensimmainen-kerros/165/		f		\N	\N	f	15	\N	f	\N	\N
54	00010001000100050072000F	6	0	167	167	f	t	/home/tilajakamo/huoneet/ensimmainen-kerros/167/		f		\N	\N	f	15	\N	f	\N	\N
183	00010001000100050072	5	44	Ensimmäinen kerros	ensimmainen-kerros	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/		t		\N	\N	f	16	1	f	2016-02-10 14:47:07.212+00	2016-02-10 14:46:50.553+00
23	00010001000100050072000O	6	0	134	134	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/134/		f		\N	\N	f	15	\N	f	\N	\N
35	00010001000100050072000Q	6	0	148	148	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/148/		f		\N	\N	f	15	\N	f	\N	\N
32	00010001000100050072000U	6	0	145	145	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/145/		f		\N	\N	f	15	\N	f	\N	\N
12	00010001000100050072000V	6	0	104	104	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/104/		f		\N	\N	f	15	\N	f	\N	\N
10	00010001000100050072000W	6	0	102	102	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/102/		f		\N	\N	f	15	\N	f	\N	\N
26	00010001000100050072000X	6	0	139	139	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/139/		f		\N	\N	f	15	\N	f	\N	\N
18	00010001000100050072000Z	6	0	121	121	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/121/		f		\N	\N	f	15	\N	f	\N	\N
38	000100010001000500720015	6	0	151	151	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/151/		f		\N	\N	f	15	\N	f	\N	\N
34	000100010001000500720017	6	0	147	147	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/147/		f		\N	\N	f	15	\N	f	\N	\N
21	000100010001000500720018	6	0	132	132	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/132/		f		\N	\N	f	15	\N	f	\N	\N
20	00010001000100050072001A	6	0	131	131	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/131/		f		\N	\N	f	15	\N	f	\N	\N
37	00010001000100050072001B	6	0	150	150	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/150/		f		\N	\N	f	15	\N	f	\N	\N
31	00010001000100050072000P	6	0	144	144	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/144/		f		\N	\N	f	15	\N	f	\N	\N
25	00010001000100050072000T	6	0	138	138	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/138/		f		\N	\N	f	15	\N	f	\N	\N
42	00010001000100050072000Y	6	0	155	155	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/155/		f		\N	\N	f	15	\N	f	\N	\N
22	000100010001000500720012	6	0	133	133	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/133/		f		\N	\N	f	15	\N	f	\N	\N
24	000100010001000500720013	6	0	135	135	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/135/		f		\N	\N	f	15	\N	f	\N	\N
27	000100010001000500720014	6	0	140	140	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/140/		f		\N	\N	f	15	\N	f	\N	\N
29	000100010001000500720016	6	0	142	142	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/142/		f		\N	\N	f	15	\N	f	\N	\N
41	000100010001000500720019	6	0	154	154	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/154/		f		\N	\N	f	15	\N	f	\N	\N
16	000100010001000500720005	6	0	108	108	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/108/		f		\N	\N	f	15	\N	f	\N	\N
36	00010001000100050072000E	6	0	149	149	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/149/		f		\N	\N	f	15	\N	f	\N	\N
9	000100010001000500720003	6	0	101	101	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/101/		f		\N	\N	f	15	\N	f	\N	\N
11	000100010001000500720004	6	0	103	103	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/103/		f		\N	\N	f	15	\N	f	\N	\N
39	000100010001000500720006	6	0	152	152	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/152/		f		\N	\N	f	15	\N	f	\N	\N
14	000100010001000500720009	6	0	106	106	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/106/		f		\N	\N	f	15	\N	f	\N	\N
46	00010001000100050072000A	6	0	159	159	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/159/		f		\N	\N	f	15	\N	f	\N	\N
48	00010001000100050072000B	6	0	161	161	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/161/		f		\N	\N	f	15	\N	f	\N	\N
17	00010001000100050072000C	6	0	120	120	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/120/		f		\N	\N	f	15	\N	f	\N	\N
28	00010001000100050072000D	6	0	141	141	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/141/		f		\N	\N	f	15	\N	f	\N	\N
15	00010001000100050072000G	6	0	107	107	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/107/		f		\N	\N	f	15	\N	f	\N	\N
30	00010001000100050072000H	6	0	143	143	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/143/		f		\N	\N	f	15	\N	f	\N	\N
33	00010001000100050072000J	6	0	146	146	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/146/		f		\N	\N	f	15	\N	f	\N	\N
47	000100010001000500720008	6	0	160	160	f	t	/home/tilajakamo/huoneet/ensimmainen-kerros/160/		f		\N	\N	f	15	\N	f	\N	\N
49	000100010001000500720011	6	0	162	162	f	t	/home/tilajakamo/huoneet/ensimmainen-kerros/162/		f		\N	\N	f	15	\N	f	\N	\N
201	0001000100010004000B	5	0	Osuuskunnan säännöt	osuuskunnan-saannot	t	f	/home/tilajakamo/ukk/osuuskunnan-saannot/		f		\N	\N	f	25	1	f	2016-02-18 12:51:24.35993+00	2016-02-18 12:51:24.380423+00
209	0001000100010004000J	5	0	Kuka teki logon?	kuka-teki-logon	t	f	/home/tilajakamo/ukk/kuka-teki-logon/		f		\N	\N	f	25	1	f	2016-02-18 13:07:21.229401+00	2016-02-18 13:07:21.251826+00
193	00010001000100040003	5	0	Mikä on Telegram?	mika-telegram	t	f	/home/tilajakamo/ukk/mika-telegram/		f		\N	\N	f	25	1	f	2016-02-18 10:06:03.661031+00	2016-02-18 08:46:16.160288+00
40	00010001000100050072000K	6	0	153	153	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/153/		f		\N	\N	f	15	\N	f	\N	\N
19	00010001000100050072000M	6	0	130	130	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/130/		f		\N	\N	f	15	\N	f	\N	\N
51	00010001000100050072000N	6	0	164	164	t	f	/home/tilajakamo/huoneet/ensimmainen-kerros/164/		f		\N	\N	f	15	\N	f	\N	\N
53	00010001000100050072000L	6	0	166	166	f	t	/home/tilajakamo/huoneet/ensimmainen-kerros/166/		f		\N	\N	f	15	\N	f	\N	\N
194	00010001000100040004	5	0	Miten lataan ja otan käyttöön Telegrammin?	miten-lataan-ja-otan-kayttoon-telegrammin	t	f	/home/tilajakamo/ukk/miten-lataan-ja-otan-kayttoon-telegrammin/		f		\N	\N	f	25	1	f	2016-02-18 09:01:36.90281+00	2016-02-18 09:01:36.925395+00
202	0001000100010004000C	5	0	Historia	historia	t	f	/home/tilajakamo/ukk/historia/		f		\N	\N	f	25	1	f	2016-02-18 12:53:47.524905+00	2016-02-18 12:53:47.553396+00
210	0001000100010004000K	5	0	Koiria? Allergikkoja?	koiria-allergikkoja	t	f	/home/tilajakamo/ukk/koiria-allergikkoja/		f		\N	\N	f	25	1	f	2016-02-18 13:08:27.357243+00	2016-02-18 13:08:27.377464+00
\.


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailcore_page_id_seq', 213, true);


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
4	f	2016-02-09 14:39:22.411+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Uutisia ja ajankotaista</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 33, "related_links": [], "title": "UUTISET", "seo_title": "", "slug": "uutiset", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 21, "show_in_menus": false, "path": "0001000100010001", "url_path": "/home/tilajakamo/uutiset/", "expired": false, "pk": 4, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	4	1
5	f	2016-02-09 14:42:07.802+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>H\\u00e4ppeninkej\\u00e4 ja juttuja</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 11, "related_links": [], "title": "TAPAHTUMIA", "seo_title": "", "slug": "tapahtumia", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 32, "show_in_menus": false, "path": "0001000100010002", "url_path": "/home/tilajakamo/tapahtumia/", "expired": false, "pk": 5, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	5	1
6	f	2016-02-09 14:43:05.259+00	{"last_name": "", "advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Osuuskuntalaiset</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 16, "first_name": "", "title": "ME OSKUT", "seo_title": "", "slug": "me-oskut", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 29, "show_in_menus": false, "path": "0001000100010003", "url_path": "/home/tilajakamo/me-oskut/", "expired": false, "pk": 6, "locked": false, "room": null, "depth": 4, "first_published_at": null, "expire_at": null}	\N	6	1
7	f	2016-02-09 14:44:32.051+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Usein kysytyt kysymykset ja vastaukset</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 35, "title": "U.K.K.", "seo_title": "", "slug": "ukk", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 26, "show_in_menus": false, "path": "0001000100010004", "url_path": "/home/tilajakamo/ukk/", "expired": false, "pk": 7, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	7	1
8	f	2016-02-09 14:46:31.471+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Lapinlahden sairaalan pohjoissiipi</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 10, "title": "Huoneet", "seo_title": "", "slug": "huoneet", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 16, "show_in_menus": false, "path": "0001000100010005", "url_path": "/home/tilajakamo/huoneet/", "expired": false, "pk": 8, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	8	1
10	f	2016-02-09 14:55:01.701+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Lapinlahden sairaalan pohjoissiipi</p>", "latest_revision_created_at": "2016-02-09T14:46:31.471Z", "go_live_at": null, "feed_image": 10, "title": "Huoneet", "seo_title": "", "slug": "huoneet", "live": true, "has_unpublished_changes": false, "numchild": 1, "content_type": 16, "show_in_menus": true, "path": "0001000100010005", "url_path": "/home/tilajakamo/huoneet/", "expired": false, "pk": 8, "locked": false, "depth": 4, "first_published_at": "2016-02-09T14:46:31.486Z", "expire_at": null}	\N	8	1
11	f	2016-02-09 14:55:13.279+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Usein kysytyt kysymykset ja vastaukset</p>", "latest_revision_created_at": "2016-02-09T14:44:32.051Z", "go_live_at": null, "feed_image": 35, "title": "U.K.K.", "seo_title": "", "slug": "ukk", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 26, "show_in_menus": true, "path": "0001000100010004", "url_path": "/home/tilajakamo/ukk/", "expired": false, "pk": 7, "locked": false, "depth": 4, "first_published_at": "2016-02-09T14:44:32.074Z", "expire_at": null}	\N	7	1
12	f	2016-02-09 14:55:24.775+00	{"last_name": "", "advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Osuuskuntalaiset</p>", "latest_revision_created_at": "2016-02-09T14:43:05.259Z", "go_live_at": null, "feed_image": 16, "first_name": "", "title": "ME OSKUT", "seo_title": "", "slug": "me-oskut", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 29, "show_in_menus": true, "path": "0001000100010003", "url_path": "/home/tilajakamo/me-oskut/", "expired": false, "pk": 6, "locked": false, "room": null, "depth": 4, "first_published_at": "2016-02-09T14:43:05.273Z", "expire_at": null}	\N	6	1
13	f	2016-02-09 14:55:53.963+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>H\\u00e4ppeninkej\\u00e4 ja juttuja</p>", "latest_revision_created_at": "2016-02-09T14:42:07.802Z", "go_live_at": null, "feed_image": 11, "related_links": [], "title": "TAPAHTUMIA", "seo_title": "", "slug": "tapahtumia", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 32, "show_in_menus": false, "path": "0001000100010002", "url_path": "/home/tilajakamo/tapahtumia/", "expired": false, "pk": 5, "locked": false, "depth": 4, "first_published_at": "2016-02-09T14:42:07.816Z", "expire_at": null}	\N	5	1
14	f	2016-02-09 14:56:22.062+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Uutisia ja ajankotaista</p>", "latest_revision_created_at": "2016-02-09T14:39:22.411Z", "go_live_at": null, "feed_image": 33, "related_links": [], "title": "UUTISET", "seo_title": "", "slug": "uutiset", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 21, "show_in_menus": true, "path": "0001000100010001", "url_path": "/home/tilajakamo/uutiset/", "expired": false, "pk": 4, "locked": false, "depth": 4, "first_published_at": "2016-02-09T14:39:22.425Z", "expire_at": null}	\N	4	1
15	f	2016-02-09 15:00:39.121+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>H\\u00e4ppeninkej\\u00e4 ja juttuja</p>", "latest_revision_created_at": "2016-02-09T14:55:53.963Z", "go_live_at": null, "feed_image": 11, "related_links": [], "title": "TAPAHTUMIA", "seo_title": "", "slug": "tapahtumia", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 32, "show_in_menus": true, "path": "0001000100010002", "url_path": "/home/tilajakamo/tapahtumia/", "expired": false, "pk": 5, "locked": false, "depth": 4, "first_published_at": "2016-02-09T14:42:07.816Z", "expire_at": null}	\N	5	1
18	f	2016-02-09 18:33:23.122+00	{"last_name": "", "advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Osuuskuntalaiset</p>", "latest_revision_created_at": "2016-02-09T14:55:24.775Z", "go_live_at": null, "feed_image": 16, "first_name": "", "title": "ME OSKUT", "seo_title": "", "slug": "me", "live": true, "has_unpublished_changes": false, "numchild": 1, "content_type": 29, "show_in_menus": true, "path": "0001000100010003", "url_path": "/home/tilajakamo/me-oskut/", "expired": false, "pk": 6, "locked": false, "room": null, "depth": 4, "first_published_at": "2016-02-09T14:43:05.273Z", "expire_at": null}	\N	6	1
19	f	2016-02-10 11:47:51.173+00	{"last_name": "Liukkonen", "advert_placements": [], "telegram": "", "image": null, "telephone": "", "search_description": "", "owner": 1, "intro": "<p>Ja koira</p>", "latest_revision_created_at": null, "biography": "", "go_live_at": null, "city": "", "first_name": "Jaana", "title": "Kaospilotti", "seo_title": "", "slug": "kaospilotti", "live": false, "has_unpublished_changes": false, "email": "", "post_code": "", "numchild": 0, "related_links": [], "content_type": 28, "show_in_menus": false, "path": "00010001000100030054", "url_path": "/home/tilajakamo/me/kaospilotti/", "expired": false, "pk": 181, "locked": false, "room": 102, "country": "", "public": true, "depth": 5, "address_1": "", "address_2": "", "first_published_at": null, "expire_at": null}	\N	181	1
21	f	2016-02-10 14:46:50.535+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 3, "title": "Ensimm\\u00e4inen kerros", "seo_title": "", "slug": "ensimmainen-kerros", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 16, "show_in_menus": false, "path": "00010001000100050122", "url_path": "/home/tilajakamo/huoneet/ensimmainen-kerros/", "expired": false, "pk": 183, "locked": false, "depth": 5, "first_published_at": null, "expire_at": null}	\N	183	1
22	f	2016-02-10 14:47:07.212+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-02-10T14:46:50.535Z", "go_live_at": null, "feed_image": 3, "title": "Ensimm\\u00e4inen kerros", "seo_title": "", "slug": "ensimmainen-kerros", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 16, "show_in_menus": true, "path": "00010001000100050122", "url_path": "/home/tilajakamo/huoneet/ensimmainen-kerros/", "expired": false, "pk": 183, "locked": false, "depth": 5, "first_published_at": "2016-02-10T14:46:50.553Z", "expire_at": null}	\N	183	1
23	f	2016-02-10 14:47:38.715+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 2, "title": "Toinen kerros", "seo_title": "", "slug": "toinen-kerros", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 16, "show_in_menus": true, "path": "00010001000100050123", "url_path": "/home/tilajakamo/huoneet/toinen-kerros/", "expired": false, "pk": 184, "locked": false, "depth": 5, "first_published_at": null, "expire_at": null}	\N	184	1
24	f	2016-02-10 14:48:03.219+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 1, "title": "Kolmas kerros", "seo_title": "", "slug": "kolmas-kerros", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 16, "show_in_menus": true, "path": "00010001000100050124", "url_path": "/home/tilajakamo/huoneet/kolmas-kerros/", "expired": false, "pk": 185, "locked": false, "depth": 5, "first_published_at": null, "expire_at": null}	\N	185	1
29	f	2016-02-11 16:25:53.93547+00	{"last_name": "Lehtonen", "advert_placements": [], "telegram": "lebanonsky", "image": null, "telephone": "050-5602570", "search_description": "", "owner": null, "intro": "<p>Eksistentialistinen kirjallisuusn\\u00f6rtti.</p>", "latest_revision_created_at": null, "biography": "", "go_live_at": null, "city": "", "first_name": "Kimmo", "title": "Kimmo Lehtonen", "seo_title": "", "slug": "Lehtonen", "live": true, "has_unpublished_changes": false, "email": "kimmo@netzionale.com", "post_code": "", "numchild": 0, "related_links": [], "content_type": 28, "show_in_menus": false, "path": "00010001000100030037", "url_path": "/home/tilajakamo/me/Lehtonen/", "expired": false, "pk": 160, "locked": false, "room": 104, "country": "", "public": true, "depth": 5, "address_1": "", "address_2": "", "first_published_at": null, "expire_at": null}	\N	160	1
27	f	2016-02-10 17:25:50.573481+00	{"advert_placements": [], "search_description": "", "owner": null, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "title": "202", "seo_title": "", "slug": "202", "member": null, "live": false, "has_unpublished_changes": true, "public": true, "body": "Koko 13,5m2, ei vesipistett\\u00e4. K\\u00e4ynti p\\u00e4\\u00e4sis\\u00e4\\u00e4nk\\u00e4ynnist\\u00e4", "numchild": 0, "free": false, "content_type": 15, "show_in_menus": false, "path": "00010001000100050073000G", "url_path": "/home/tilajakamo/huoneet/toinen-kerros/202/", "expired": false, "pk": 57, "locked": false, "depth": 6, "first_published_at": null, "expire_at": null}	\N	57	1
87	f	2016-02-18 13:07:21.229401+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Kuka teki logon?", "seo_title": "", "slug": "kuka-teki-logon", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Logo \\u00e4\\u00e4nestyksen voitti Kai 'Kaide' Arposen ehdotus.</p><p><embed alt=\\"logo\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"55\\"/><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000J", "url_path": "/home/tilajakamo/ukk/kuka-teki-logon/", "expired": false, "pk": 209, "locked": false, "tagged_items": [{"pk": 43, "tag": 2, "content_object": 209}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	209	1
28	f	2016-02-11 11:15:39.61531+00	{"last_name": "Carrom-Novuss", "advert_placements": [], "telegram": "", "image": null, "telephone": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "biography": "", "go_live_at": null, "city": "", "first_name": "Kansonen", "title": "Kansonen Carrom-Novuss", "seo_title": "", "slug": "Carrom-Novuss", "live": true, "has_unpublished_changes": false, "email": "", "post_code": "", "numchild": 0, "related_links": [], "content_type": 28, "show_in_menus": false, "path": "00010001000100030052", "url_path": "/home/tilajakamo/me/Carrom-Novuss/", "expired": false, "pk": 173, "locked": false, "room": 110, "country": "", "public": true, "depth": 5, "address_1": "", "address_2": "", "first_published_at": null, "expire_at": null}	\N	173	1
26	f	2016-02-10 17:05:20.700226+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "YLEIST\\u00c4", "seo_title": "", "slug": "yleista", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>T\\u00e4h\\u00e4n tulee yleist\\u00e4 tietoa</p>", "numchild": 0, "content_type": 14, "show_in_menus": true, "path": "0001000100010009", "url_path": "/home/tilajakamo/yleista/", "expired": false, "pk": 186, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	186	1
99	f	2016-02-18 14:02:40.787752+00	{"last_name": "Matikainen", "advert_placements": [], "telegram": "", "image": null, "telephone": "", "search_description": "", "owner": 5, "intro": "", "latest_revision_created_at": null, "biography": "", "go_live_at": null, "city": "", "first_name": "Esko", "title": "Esko Matikainen", "seo_title": "", "slug": "Matikainen", "live": true, "has_unpublished_changes": false, "email": "", "post_code": "", "numchild": 0, "related_links": [], "content_type": 28, "show_in_menus": false, "path": "00010001000100030036", "url_path": "/home/tilajakamo/me/Matikainen/", "expired": false, "pk": 159, "locked": false, "room": 102, "country": "", "public": true, "depth": 5, "address_1": "", "address_2": "", "first_published_at": null, "expire_at": null}	\N	159	1
31	f	2016-02-11 16:36:33.679801+00	{"advert_placements": [], "search_description": "", "owner": null, "latest_revision_created_at": null, "go_live_at": null, "feed_image": 47, "title": "303", "seo_title": "", "slug": "303", "live": true, "has_unpublished_changes": false, "public": true, "body": "Koko 10m2, ei vesipistett\\u00e4. K\\u00e4ynti pohjoispuolen 1. ovi", "numchild": 0, "free": false, "content_type": 15, "show_in_menus": false, "path": "00010001000100050075000J", "url_path": "/home/tilajakamo/huoneet/kolmas-kerros/303/", "expired": false, "pk": 104, "locked": false, "depth": 6, "first_published_at": null, "expire_at": null}	\N	104	1
70	f	2016-02-18 10:18:05.850259+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T10:04:24.829Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "Miten laitan yksityisviestin Telegramilla?", "seo_title": "", "slug": "miten-yksityisviestin-telegramillaa", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Kaikkea keskustelua ei tarvitse k\\u00e4yd\\u00e4 yleisille kanavilla. Yksityisviestej\\u00e4 voivat l\\u00e4hetell\\u00e4 k\\u00e4ytt\\u00e4j\\u00e4t, jotka jakavat puhelinnumeron yhteystiedoissaan tai k\\u00e4ytt\\u00e4j\\u00e4t joilla on Telegramin julkinen @k\\u00e4ytt\\u00e4j\\u00e4tunnus. Samoissa ryhmiss\\u00e4 olevat voivat laittaa viestej\\u00e4 kontakti-tiedon kautta.</p><p>Klikkaa samalla kanavalla olevan henkil\\u00f6n nime\\u00e4 joko chatissa tai ryhm\\u00e4n Info-sivulla olevasta listasta.\\u00a0</p><p>Maciss\\u00e4 viesti l\\u00e4hetet\\u00e4\\u00e4n Send message -linkist\\u00e4.</p><p><embed alt=\\"YV-mac\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"52\\"/><br/></p><p>Windows-koneissa viesti l\\u00e4hetet\\u00e4\\u00e4n puhekupla-ikonista.</p><p><embed alt=\\"YV-pc\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"53\\"/><br/></p><p>Puhelimissa kontatin sivulle p\\u00e4\\u00e4see klikkaamalla henkil\\u00f6n kuvaketta.</p><p><br/></p><p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040006", "url_path": "/home/tilajakamo/ukk/miten-yksityisviestin-telegramillaa/", "expired": false, "pk": 196, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 196}], "depth": 5, "first_published_at": "2016-02-18T10:04:24.862Z", "expire_at": null}	\N	196	1
88	f	2016-02-18 13:08:27.357243+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Koiria? Allergikkoja?", "seo_title": "", "slug": "koiria-allergikkoja", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Toisen kerroksen k\\u00e4yt\\u00e4v\\u00e4 on merkitty lemmikkivapaaksi alueeksi, jonne el\\u00e4imi\\u00e4 ei saa tuoda edes k\\u00e4ym\\u00e4\\u00e4n.</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000K", "url_path": "/home/tilajakamo/ukk/koiria-allergikkoja/", "expired": false, "pk": 210, "locked": false, "tagged_items": [{"pk": 44, "tag": 13, "content_object": 210}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	210	1
100	f	2016-02-18 15:10:47.341921+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Voinko edelleen- tai alivuokrata huoneeni?", "seo_title": "", "slug": "voinko-edelleen-tai-alivuokrata-huoneeni", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Jos v\\u00e4liaikainen vuokralainen tai huoneen jakaja liittyy osuuskunnan j\\u00e4seneksi, niin osuuskunnalla ei ole mit\\u00e4\\u00e4n sit\\u00e4 vastaan.</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000M", "url_path": "/home/tilajakamo/ukk/voinko-edelleen-tai-alivuokrata-huoneeni/", "expired": false, "pk": 213, "locked": false, "tagged_items": [{"pk": 46, "tag": 2, "content_object": 213}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	213	1
30	f	2016-02-11 16:28:05.83766+00	{"last_name": "Lehtonen", "advert_placements": [], "telegram": "lebanonsky", "image": null, "telephone": "050-5602570", "search_description": "", "owner": null, "intro": "<p>Eksistentialistinen kirjallisuusn\\u00f6rtti.</p>", "latest_revision_created_at": "2016-02-11T16:25:53.935Z", "biography": "", "go_live_at": null, "city": "", "first_name": "Kimmo", "title": "Kimmo Lehtonen", "seo_title": "", "slug": "Lehtonen", "live": true, "has_unpublished_changes": false, "email": "kimmo@netzionale.com", "post_code": "", "numchild": 0, "related_links": [{"link_page": null, "title": "Netzionale.com", "link_external": "http://inter.netzionale.com", "sort_order": 0, "link_document": null, "pk": null, "page": 160}], "content_type": 28, "show_in_menus": false, "path": "00010001000100030037", "url_path": "/home/tilajakamo/me/Lehtonen/", "expired": false, "pk": 160, "locked": false, "room": 104, "country": "", "public": true, "depth": 5, "address_1": "", "address_2": "", "first_published_at": "2016-02-11T16:25:53.952Z", "expire_at": null}	\N	160	1
71	f	2016-02-18 10:35:41.941022+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Miten tilajakamo_botti toimii?", "seo_title": "", "slug": "miten-tilajakamo_botti-toimii", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Botti on Telegramin viestiautomaatti, joka auttaa ja v\\u00e4litt\\u00e4\\u00e4.</p><p><br/></p><p>Botille laitetaan komentoja joko kanavalla, jossa se on l\\u00e4sn\\u00e4 (esim. Yleinen) kirjoittamalla viestin alkuun:</p><h5>/komento\\u00a0</h5><p>Komento on jokin seuraavista:</p><p><ul><li>/<b>jaa</b> kartta1, kartta2 tai kartta3 =&gt; palauttaa linkit Lapinlahden eri kerrosten karttoihin<br/></li><li>korjauskortit =&gt; linkki korjauskortteihin</li><li>/<b>liity</b> talkookanava =&gt; liittymislinkki kanavalle<br/></li><li>/<b>liity</b> tapahtumakanava\\u00a0=&gt; liittymislinkki kanavalle<br/></li><li>/<b>liity</b> saneerauskanava\\u00a0=&gt; liittymislinkki kanavalle</li></ul><p>Joidenkin komentojen per\\u00e4\\u00e4n kirjoitetaan tarkenteena viesti:</p></p><p><br/></p><h5>/kuka kimmo tai /huone 303</h5><p><ul><li>/<b>kuka</b> etunimi/sukunimi/tittli =&gt; palauttaa tietoa oskusta (tietoja voi p\\u00e4ivitt\\u00e4\\u00e4 nettisivulla)</li><li>/<b>huone</b> xxx =&gt; osku, joka toimii t\\u00e4ss\\u00e4 huoneessa</li></ul></p><p>Osa komennoista v\\u00e4litt\\u00e4\\u00e4 viestin muille kanaville, jossa ei k\\u00e4yd\\u00e4 keskustelua.</p><p><br/></p><h5>/huolto Kolmosen k\\u00e4yt\\u00e4v\\u00e4 vessa on tukossa!</h5><p>HUOM! Kirjoita viesti komennon per\\u00e4\\u00e4n samalle rivill\\u00e4 ilman mit\\u00e4\\u00e4n kommervenkkej\\u00e4!</p><p><br/></p><p><ul><li>/<b>huolto</b> ilmoitus korjaustarpeesta =&gt; Tilajakamon huolto -kanavalle<br/></li><li>/<b>siivous</b> pyynt\\u00f6\\u00a0=&gt; Tilajakamon siivous -kanavalle<br/></li><li>/<b>ehdotus</b> hallitukselle\\u00a0=&gt; Aloite osuuskunnan hallitukselle<br/></li><li>/<b>sos</b> joku paikalle heti!!!\\u00a0=&gt; Tilajakamon H\\u00c4LYTYS -kanavalle (VAATII VARMISTUKSEN!)<br/></li><li>/<b>netti</b> vikailmoitus jos ei toimi\\u00a0=&gt; Tilajakamon netti -kanavalle<br/></li><li>/<b>talkoot</b> raatajia kaivataan\\u00a0=&gt; Tilajakamon talkoot -kanavalle<br/></li><li>\\u00a0/<b>tapahtuma</b> h\\u00e4ppeningin aika ja asia\\u00a0=&gt; Tilajakamon tapahtumat -kanavalle<br/></li><li>\\u00a0/<b>ostan</b>, /<b>myyn</b>, /<b>vaihdan</b>\\u00a0=&gt; Tilajakamon OMV -kanavalle</li></ul><p>Huom! Komento n\\u00e4kyy chatissa linkkin\\u00e4, mutta sen klikkaaminen ei tee mit\\u00e4\\u00e4n rakentavaa :-)</p></p><p><br/></p><p><b>Voit l\\u00e4hett\\u00e4\\u00e4 botille my\\u00f6s yksityisviestej\\u00e4! <a href=\\"https://telegram.me/tilajakamo_bot\\">https://telegram.me/tilajakamo_bot</a>\\u00a0jos et halua tukkia yleisi\\u00e4 kanavia kyselyill\\u00e4.</b></p><p><br/></p><p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040007", "url_path": "/home/tilajakamo/ukk/miten-tilajakamo_botti-toimii/", "expired": false, "pk": 197, "locked": false, "tagged_items": [{"pk": 25, "tag": 5, "content_object": 197}, {"pk": 26, "tag": 7, "content_object": 197}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	197	1
32	f	2016-02-11 16:45:42.590531+00	{"last_name": "Lehtonen", "advert_placements": [], "telegram": "lebanonsky", "image": 48, "telephone": "050-5602570", "search_description": "", "owner": null, "intro": "<p>Eksistentialistinen kirjallisuusn\\u00f6rtti.</p>", "latest_revision_created_at": "2016-02-11T16:28:05.837Z", "biography": "", "go_live_at": null, "city": "", "first_name": "Kimmo", "title": "Kimmo Lehtonen", "seo_title": "", "slug": "Lehtonen", "live": true, "has_unpublished_changes": false, "email": "kimmo@netzionale.com", "post_code": "", "numchild": 0, "related_links": [{"link_page": null, "title": "Netzionale.com", "link_external": "http://inter.netzionale.com", "sort_order": 0, "link_document": null, "pk": 1, "page": 160}], "content_type": 28, "show_in_menus": false, "path": "00010001000100030037", "url_path": "/home/tilajakamo/me/Lehtonen/", "expired": false, "pk": 160, "locked": false, "room": 104, "country": "", "public": true, "depth": 5, "address_1": "", "address_2": "", "first_published_at": "2016-02-11T16:25:53.952Z", "expire_at": null}	\N	160	1
33	f	2016-02-11 16:47:05.525115+00	{"last_name": "Lehtonen", "advert_placements": [], "telegram": "lebanonsky", "image": 48, "telephone": "050-5602570", "search_description": "", "owner": null, "intro": "<h5>\\"Katkeruus ei kannata, kitkeryys on kivaa\\"</h5>", "latest_revision_created_at": "2016-02-11T16:45:42.590Z", "biography": "", "go_live_at": null, "city": "", "first_name": "Kimmo", "title": "Eksistentialistinen kirjallisuusn\\u00f6rtti", "seo_title": "", "slug": "Lehtonen", "live": true, "has_unpublished_changes": false, "email": "kimmo@netzionale.com", "post_code": "", "numchild": 0, "related_links": [{"link_page": null, "title": "Netzionale.com", "link_external": "http://inter.netzionale.com", "sort_order": 0, "link_document": null, "pk": 1, "page": 160}], "content_type": 28, "show_in_menus": false, "path": "00010001000100030037", "url_path": "/home/tilajakamo/me/Lehtonen/", "expired": false, "pk": 160, "locked": false, "room": 104, "country": "", "public": true, "depth": 5, "address_1": "", "address_2": "", "first_published_at": "2016-02-11T16:25:53.952Z", "expire_at": null}	\N	160	1
101	f	2016-02-19 20:20:06.712554+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-09T18:23:37.267Z", "go_live_at": null, "related_links": [], "title": "Tilajakamo", "seo_title": "", "slug": "tilajakamo", "live": true, "has_unpublished_changes": false, "body": "<h4>Tilajakamon tarkoituksena on edist\\u00e4\\u00e4 kaupunkikulttuuria.\\u00a0Osuuskunta vuokraa Lapinlahden sairaalarakennuksesta tiloja j\\u00e4senilleen kulttuurin, tieteen, taiteen, k\\u00e4sity\\u00f6n tekemiseen.\\u00a0Osuuskunta my\\u00f6s j\\u00e4rjest\\u00e4\\u00e4 ja tukee kaupunkikulttuuria edist\\u00e4vi\\u00e4 tapahtumia ja\\u00a0muuta toimintaa.</h4>", "numchild": 6, "bg_image": 24, "content_type": 9, "show_in_menus": false, "path": "000100010001", "url_path": "/home/tilajakamo/", "expired": false, "pk": 3, "locked": false, "depth": 3, "first_published_at": "2016-02-09T14:28:57.723Z", "expire_at": null}	\N	3	1
34	f	2016-02-11 21:15:14.786117+00	{"last_name": "Lehtonen", "advert_placements": [], "telegram": "lebanonsky", "image": 49, "telephone": "050-5602570", "search_description": "", "owner": null, "intro": "<h5>\\"Katkeruus ei kannata, kitkeryys on kivaa\\"</h5>", "latest_revision_created_at": "2016-02-11T16:47:05.525Z", "biography": "", "go_live_at": null, "city": "", "first_name": "Kimmo", "title": "Eksistentialistinen kirjallisuusn\\u00f6rtti", "seo_title": "", "slug": "Lehtonen", "live": true, "has_unpublished_changes": false, "email": "kimmo@netzionale.com", "post_code": "", "numchild": 0, "related_links": [{"link_page": null, "title": "Netzionale.com", "link_external": "http://inter.netzionale.com", "sort_order": 0, "link_document": null, "pk": 1, "page": 160}], "content_type": 28, "show_in_menus": false, "path": "00010001000100030037", "url_path": "/home/tilajakamo/me/Lehtonen/", "expired": false, "pk": 160, "locked": false, "room": 104, "country": "", "public": true, "depth": 5, "address_1": "", "address_2": "", "first_published_at": "2016-02-11T16:25:53.952Z", "expire_at": null}	\N	160	1
35	f	2016-02-11 21:15:39.102276+00	{"advert_placements": [], "search_description": "", "owner": null, "latest_revision_created_at": "2016-02-11T16:36:33.679Z", "go_live_at": null, "feed_image": 49, "title": "303", "seo_title": "", "slug": "303", "live": true, "has_unpublished_changes": false, "public": true, "body": "Koko 10m2, ei vesipistett\\u00e4. K\\u00e4ynti pohjoispuolen 1. ovi", "numchild": 0, "free": false, "content_type": 15, "show_in_menus": false, "path": "00010001000100050075000J", "url_path": "/home/tilajakamo/huoneet/kolmas-kerros/303/", "expired": false, "pk": 104, "locked": false, "depth": 6, "first_published_at": "2016-02-11T16:36:33.694Z", "expire_at": null}	\N	104	1
36	f	2016-02-12 07:11:47.172894+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Lapinlahdessa telttasauna", "seo_title": "", "slug": "lapinlahdessa-telttasauna", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p><b>Puul\\u00e4mmitteinen telttasauna Lapinlahden sairaalan sis\\u00e4pihalla l\\u00e4mpi\\u00e4\\u00e4 perjantaisin klo 15-20 ja lauantaisin 12-18\\u00a0</b></p><p>Pyyhemaksu eli narikka 8 \\u20ac kerta, suihkumahdollisuus -\\u00a0sarjaliput mahdollisia.</p><p>Viikolla voi tilata tilaussaunaksi omalle porukalle</p><p>Tiedustelut Timo Martikainen huone #238</p>", "numchild": 0, "content_type": 20, "show_in_menus": false, "date": "2016-02-12", "path": "00010001000100010001", "url_path": "/home/tilajakamo/uutiset/lapinlahdessa-telttasauna/", "expired": false, "pk": 187, "locked": false, "tagged_items": [], "depth": 5, "first_published_at": null, "expire_at": null}	\N	187	1
38	f	2016-02-12 09:13:13.403156+00	{"last_name": "Waldmann", "advert_placements": [], "telegram": "", "image": null, "telephone": "", "search_description": "", "owner": 2, "intro": "", "latest_revision_created_at": null, "biography": "", "go_live_at": null, "city": "", "first_name": "LPMK", "title": "LPMK Waldmann", "seo_title": "", "slug": "Waldmann", "live": true, "has_unpublished_changes": false, "email": "", "post_code": "", "numchild": 0, "related_links": [], "content_type": 28, "show_in_menus": false, "path": "00010001000100030022", "url_path": "/home/tilajakamo/me/Waldmann/", "expired": false, "pk": 177, "locked": false, "room": 78, "country": "", "public": true, "depth": 5, "address_1": "", "address_2": "", "first_published_at": null, "expire_at": null}	\N	177	1
89	f	2016-02-18 13:10:06.576625+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Mihin toimitamme j\\u00e4tteet?", "seo_title": "", "slug": "mihin-toimitamme-jatteet", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Osuuskunnan j\\u00e4tehuone sijaitsee pohjoispuolella keitti\\u00f6n vieress\\u00e4 olevassa matalassa lis\\u00e4osassa. Ver\\u00e4j\\u00e4portti (ved\\u00e4 oikealle!) avautuu ulko-ovien iLoq-avaimilla.</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000L", "url_path": "/home/tilajakamo/ukk/mihin-toimitamme-jatteet/", "expired": false, "pk": 211, "locked": false, "tagged_items": [{"pk": 45, "tag": 11, "content_object": 211}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	211	1
40	f	2016-02-12 10:18:36.867255+00	{"last_name": "Rantala", "advert_placements": [], "telegram": "", "image": null, "telephone": "", "search_description": "", "owner": 3, "intro": "", "latest_revision_created_at": "2016-02-12T09:48:33.882Z", "biography": "", "go_live_at": null, "city": "", "first_name": "Ismael", "title": "katu ry", "seo_title": "", "slug": "katury", "live": true, "has_unpublished_changes": false, "email": "", "post_code": "", "numchild": 0, "related_links": [], "content_type": 28, "show_in_menus": false, "path": "00010001000100030024", "url_path": "/home/tilajakamo/me/Rantala/", "expired": false, "pk": 147, "locked": false, "room": 81, "country": "", "public": false, "depth": 5, "address_1": "", "address_2": "", "first_published_at": "2016-02-12T09:48:33.905Z", "expire_at": null}	\N	147	3
41	f	2016-02-12 13:16:15.115666+00	{"last_name": "Rantala", "advert_placements": [], "telegram": "", "image": null, "telephone": "", "search_description": "", "owner": 3, "intro": "", "latest_revision_created_at": "2016-02-12T10:18:36.867Z", "biography": "", "go_live_at": null, "city": "", "first_name": "Ismael", "title": "katu ry", "seo_title": "", "slug": "katury", "live": true, "has_unpublished_changes": true, "email": "", "post_code": "", "numchild": 0, "related_links": [], "content_type": 28, "show_in_menus": false, "path": "00010001000100030024", "url_path": "/home/tilajakamo/me/katury/", "expired": false, "pk": 147, "locked": false, "room": 81, "country": "", "public": false, "depth": 5, "address_1": "", "address_2": "", "first_published_at": "2016-02-12T09:48:33.905Z", "expire_at": null}	\N	147	3
39	f	2016-02-12 09:48:33.882168+00	{"last_name": "Rantala", "advert_placements": [], "telegram": "", "image": null, "telephone": "", "search_description": "", "owner": 3, "intro": "", "latest_revision_created_at": null, "biography": "", "go_live_at": null, "city": "", "first_name": "Markku", "title": "Markku Rantala", "seo_title": "", "slug": "Rantala", "live": true, "has_unpublished_changes": false, "email": "", "post_code": "", "numchild": 0, "related_links": [], "content_type": 28, "show_in_menus": false, "path": "00010001000100030024", "url_path": "/home/tilajakamo/me/Rantala/", "expired": false, "pk": 147, "locked": false, "room": 81, "country": "", "public": true, "depth": 5, "address_1": "", "address_2": "", "first_published_at": null, "expire_at": null}	\N	147	1
53	f	2016-02-18 08:40:18.747092+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Telegram", "link_external": "https://telegram.org/", "sort_order": 0, "link_document": null, "pk": 4, "page": 193}], "title": "Mik\\u00e4 on Telegram?", "seo_title": "", "slug": "mika-telegram", "live": false, "has_unpublished_changes": false, "public": true, "body": "<p>Osuuskunta k\\u00e4ytt\\u00e4\\u00e4 j\\u00e4senten kommunikaatioon Telegram chattia, jotta tieto liikkuisi tehokkaasti.\\u00a0<br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040003", "url_path": "/home/tilajakamo/ukk/mika-telegram/", "expired": false, "pk": 193, "locked": false, "tagged_items": [{"pk": 8, "tag": 5, "content_object": 193}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	193	1
72	f	2016-02-18 10:40:58.037888+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Museoviraston ohjeet huoneiden kunnostuksesta?", "seo_title": "", "slug": "museoviraston-ohjeet-huoneiden-kunnostuksesta", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Ohessa joitakin museovirastolta saatuja ohjeita saneerauksesta:</p><p><br/></p><p><ul><li>Muovimaton alla oleva puulattia vaatii hionnan ennen kuin kelpaa lattiapinnaksi. Ennen lattian kunnostuksen aloittamista tulee olla yhteydess\\u00e4 Museovirastoon.<br/></li><li>\\u00c4\\u00e4nieristyksen lis\\u00e4\\u00e4minen ulkosein\\u00e4\\u00e4n: paksun eristeen lis\\u00e4\\u00e4minen ulkosein\\u00e4\\u00e4n j\\u00e4\\u00e4hdytt\\u00e4\\u00e4 muuria ulkopintaa kohti ja saattaa vaarantaa ulkorappausta sill\\u00e4 kohdin. Ulkosein\\u00e4 tulee siis j\\u00e4tt\\u00e4\\u00e4 erist\\u00e4m\\u00e4tt\\u00e4. Tarvittaessa\\u00a0ulkosein\\u00e4ll\\u00e4 voi k\\u00e4ytt\\u00e4\\u00e4 paksuja ikkunaverhoja, ryijyj\\u00e4 tmv. sein\\u00e4lle ripustettavia tekstiilej\\u00e4.</li><li>Silikonitiivisteit\\u00e4 ei pid\\u00e4 k\\u00e4ytt\\u00e4\\u00e4 \\u00e4\\u00e4nieristyslevyjen kiinnitt\\u00e4miseen.</li></ul></p><p><ul><li>Seinien ja kattojen ylitasoitusta tulee erityisesti v\\u00e4ltt\\u00e4\\u00e4; tasoittaa tulee siis vain paikallisesti, pahimmat kohdat.</li><li>Sementtipitoista tasoituslaastia ei pid\\u00e4 k\\u00e4ytt\\u00e4\\u00e4, vaan selv\\u00e4sti pehme\\u00e4mp\\u00e4\\u00e4, mieluiten vesiohenteista tasoitetta.</li><li>Tapetit tulee kiinnitt\\u00e4\\u00e4 vain liisterill\\u00e4 (ei siis liimalla tmv.).</li><li>Irtonaisen maalin poisto ter\\u00e4slastalla kaapien\\u2028</li><li>Maalauspohja m\\u00e4\\u00e4ritt\\u00e4\\u00e4 pinnan: esim. lateksille lateksia (esim. Harmony tai Uulan emulsiomaali Into)</li><li>Jos seiniss\\u00e4 on tiileen asti menevi\\u00e4 aukkoja, suositellaan kalkkirappausta. Pintoihin voi sitten laittaa modernimpia t\\u00e4yteaineita. \\u2028</li></ul></p><p><ul><li>Kattojen kunnostusta ei suositella.\\u2028</li><li>Ei suosita 1800-1930-luvuilla tehtyjen vanhojen maalipintojen poistoa eli vanhimmat kerrostumat j\\u00e4tet\\u00e4\\u00e4n alle.\\u2028</li><li><b>Museoviraston tekem\\u00e4t maalitutkimukset on j\\u00e4tett\\u00e4v\\u00e4 joko n\\u00e4kyville tai tapetoitava ko. kohta ennen maalausta</b> \\u2028</li><li>Seini\\u00e4 ei tule tasoittaa kauttaaltaan, vain aukot\\u2028</li><li>Jos nykyisi\\u00e4 valaisimia ja kalusteita poistetaan, toimittakaa ne Tilajakamon osoittamaan s\\u00e4ilytyspaikkaan ja merkitk\\u00e4\\u00e4 mist\\u00e4 huoneesta ne on poistettu.\\u2028</li></ul></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040008", "url_path": "/home/tilajakamo/ukk/museoviraston-ohjeet-huoneiden-kunnostuksesta/", "expired": false, "pk": 198, "locked": false, "tagged_items": [{"pk": 27, "tag": 8, "content_object": 198}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	198	1
1	f	2016-02-09 14:28:57.71+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Tilajakamo", "seo_title": "", "slug": "tilajakamo", "live": true, "has_unpublished_changes": false, "body": "Osuuskunnan tarkoituksena on edist\\u00e4\\u00e4 kaupunkikulttuuria.<br/>Tarkoituksensa toteuttamiseksi osuuskunta vuokraa Lapinlahden sairaalarakennuksesta<br/>\\u00a0tiloja j\\u00e4senilleen ensisijassa kulttuurin, tieteen, k\\u00e4sity\\u00f6n,<br/>muiden luovien alojen ja niit\\u00e4 tukevien yritys- ja muiden toimintojen tarpeisiin.<br/>Osuuskunta my\\u00f6s j\\u00e4rjest\\u00e4\\u00e4 ja tukea kaupunkikulttuuria edist\\u00e4vi\\u00e4 tapahtumia ja<br/><p>muuta toimintaa.</p>", "numchild": 0, "bg_image": null, "content_type": 9, "show_in_menus": false, "path": "000100010001", "url_path": "/home/tilajakamo/", "expired": false, "pk": 3, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	3	1
2	f	2016-02-09 14:29:22.542+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-09T14:28:57.710Z", "go_live_at": null, "related_links": [], "title": "Tilajakamo", "seo_title": "", "slug": "tilajakamo", "live": true, "has_unpublished_changes": false, "body": "Osuuskunnan tarkoituksena on edist\\u00e4\\u00e4 kaupunkikulttuuria.\\u00a0Tarkoituksensa toteuttamiseksi osuuskunta vuokraa Lapinlahden sairaalarakennuksesta\\u00a0\\u00a0tiloja j\\u00e4senilleen ensisijassa kulttuurin, tieteen, k\\u00e4sity\\u00f6n,\\u00a0muiden luovien alojen ja niit\\u00e4 tukevien yritys- ja muiden toimintojen tarpeisiin.\\u00a0Osuuskunta my\\u00f6s j\\u00e4rjest\\u00e4\\u00e4 ja tukea kaupunkikulttuuria edist\\u00e4vi\\u00e4 tapahtumia ja<br/><p>muuta toimintaa.</p>", "numchild": 0, "bg_image": null, "content_type": 9, "show_in_menus": false, "path": "000100010001", "url_path": "/home/tilajakamo/", "expired": false, "pk": 3, "locked": false, "depth": 3, "first_published_at": "2016-02-09T14:28:57.723Z", "expire_at": null}	\N	3	1
42	f	2016-02-13 14:13:13.378222+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-12T07:11:47.172Z", "go_live_at": null, "feed_image": 50, "related_links": [], "title": "Lapinlahdessa telttasauna", "seo_title": "", "slug": "lapinlahdessa-telttasauna", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p><b>Puul\\u00e4mmitteinen telttasauna Lapinlahden sairaalan sis\\u00e4pihalla l\\u00e4mpi\\u00e4\\u00e4 perjantaisin klo 15-20 ja lauantaisin 12-18\\u00a0</b></p><p>Pyyhemaksu eli narikka 8 \\u20ac kerta, suihkumahdollisuus -\\u00a0sarjaliput mahdollisia.</p><p>Viikolla voi tilata tilaussaunaksi omalle porukalle</p><p>Tiedustelut Timo Martikainen huone #238</p>", "numchild": 0, "content_type": 20, "show_in_menus": false, "date": "2016-02-12", "path": "00010001000100010001", "url_path": "/home/tilajakamo/uutiset/lapinlahdessa-telttasauna/", "expired": false, "pk": 187, "locked": false, "tagged_items": [], "depth": 5, "first_published_at": "2016-02-12T07:11:47.187Z", "expire_at": null}	\N	187	1
43	f	2016-02-18 07:55:17.408683+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-13T14:13:13.378Z", "go_live_at": null, "feed_image": 50, "related_links": [], "title": "Lapinlahden telttasauna perjantaisin ja lauantaisin", "seo_title": "", "slug": "lapinlahdessa-telttasauna", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>\\u201cTelttasaunan l\\u00f6yly napsahtaa kuin silkkinen ruoska\\u201d<br/></p><p>Sympaattinen ja vaativammankin saunaintoilijan tarpeet t\\u00e4ytt\\u00e4v\\u00e4 puul\\u00e4mmitteinen telttasauna Lapinlahdessa on avoinna perjantaisin ja lauantaisin klo 15 - 20. Saunamaksu on 8\\u20ac kerta. Saunan pukuhuoneet ja suihkut sijaitsevat ensimm\\u00e4isen kerroksen k\\u00e4yt\\u00e4v\\u00e4n l\\u00e4nsip\\u00e4\\u00e4ss\\u00e4. L\\u00e4mmityksest\\u00e4 ja l\\u00f6ylyist\\u00e4 vastaa kokenut saunamajuri. Teltan tiloissa juomien nauttiminen ei ole sallittua. Kaikki vuorot ovat sekavuoroja ja sauna-asu on vapaa.\\u00a0</p><p>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n</p><p>Holvista\\u00a0 http://bit.do/telttasauna voi ostaa 10 saunakerran kortin hintaan 70 \\u20ac (sis alv 24%) Tilausvuoroja voi tiedustella Richielt\\u00e4 tai Martikaiselta.</p>", "numchild": 0, "content_type": 20, "show_in_menus": false, "date": "2016-02-12", "path": "00010001000100010001", "url_path": "/home/tilajakamo/uutiset/lapinlahdessa-telttasauna/", "expired": false, "pk": 187, "locked": false, "tagged_items": [], "depth": 5, "first_published_at": "2016-02-12T07:11:47.187Z", "expire_at": null}	\N	187	1
3	f	2016-02-09 14:38:10.331+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-09T14:29:22.542Z", "go_live_at": null, "related_links": [], "title": "Tilajakamo", "seo_title": "", "slug": "tilajakamo", "live": true, "has_unpublished_changes": false, "body": "Osuuskunnan tarkoituksena on edist\\u00e4\\u00e4 kaupunkikulttuuria.\\u00a0Tarkoituksensa toteuttamiseksi osuuskunta vuokraa Lapinlahden sairaalarakennuksesta\\u00a0\\u00a0tiloja j\\u00e4senilleen ensisijassa kulttuurin, tieteen, k\\u00e4sity\\u00f6n,\\u00a0muiden luovien alojen ja niit\\u00e4 tukevien yritys- ja muiden toimintojen tarpeisiin.\\u00a0Osuuskunta my\\u00f6s j\\u00e4rjest\\u00e4\\u00e4 ja tukea kaupunkikulttuuria edist\\u00e4vi\\u00e4 tapahtumia ja<br/><p>muuta toimintaa.</p>", "numchild": 0, "bg_image": 24, "content_type": 9, "show_in_menus": false, "path": "000100010001", "url_path": "/home/tilajakamo/", "expired": false, "pk": 3, "locked": false, "depth": 3, "first_published_at": "2016-02-09T14:28:57.723Z", "expire_at": null}	\N	3	1
44	f	2016-02-18 07:59:26.657914+00	{"advert_placements": [], "carousel_items": [], "show_in_menus": false, "search_description": "", "owner": 1, "cost": "8 \\u20ac", "latest_revision_created_at": null, "time_to": "20:00:00", "go_live_at": null, "feed_image": 51, "related_links": [], "title": "Lapinlahden telttasauna perjantaisin ja lauantaisin", "signup_link": "", "date_from": "2016-02-19", "seo_title": "", "slug": "lapinlahden-telttasauna-perjantaisin-ja-lauantaisin", "live": true, "location": "Ensimm\\u00e4isen kerroksen l\\u00e4nsip\\u00e4\\u00e4ty", "has_unpublished_changes": false, "body": "<p><b><i>\\u201cTelttasaunan l\\u00f6yly napsahtaa kuin silkkinen ruoska\\u201d<br/></i></b></p>\\n<p><br/></p>\\n<p>Sympaattinen ja vaativammankin saunaintoilijan tarpeet t\\u00e4ytt\\u00e4v\\u00e4 puul\\u00e4mmitteinen telttasauna Lapinlahdessa on avoinna perjantaisin ja lauantaisin klo 15 - 20. Saunamaksu on 8\\u20ac kerta. Saunan pukuhuoneet ja suihkut sijaitsevat ensimm\\u00e4isen kerroksen k\\u00e4yt\\u00e4v\\u00e4n l\\u00e4nsip\\u00e4\\u00e4ss\\u00e4. L\\u00e4mmityksest\\u00e4 ja l\\u00f6ylyist\\u00e4 vastaa kokenut saunamajuri. Teltan tiloissa juomien nauttiminen ei ole sallittua. Kaikki vuorot ovat sekavuoroja ja sauna-asu on vapaa.\\u00a0</p>\\n<p><br/></p>\\n<p>Holvista\\u00a0 http://bit.do/telttasauna voi ostaa 10 saunakerran kortin hintaan 70 \\u20ac (sis alv 24%) Tilausvuoroja voi tiedustella Richielt\\u00e4 tai Martikaiselta.</p>", "numchild": 0, "time_from": "15:00:00", "speakers": [], "audience": "public", "content_type": 36, "date_to": "2016-06-23", "path": "00010001000100020001", "url_path": "/home/tilajakamo/tapahtumia/lapinlahden-telttasauna-perjantaisin-ja-lauantaisin/", "expired": false, "pk": 188, "locked": false, "depth": 5, "first_published_at": null, "expire_at": null}	\N	188	1
17	f	2016-02-09 18:23:37.267+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-09T14:38:10.331Z", "go_live_at": null, "related_links": [], "title": "Tilajakamo", "seo_title": "", "slug": "tilajakamo", "live": true, "has_unpublished_changes": false, "body": "<h4>Osuuskunnan tarkoituksena on edist\\u00e4\\u00e4 kaupunkikulttuuria.\\u00a0Tarkoituksensa toteuttamiseksi osuuskunta vuokraa Lapinlahden sairaalarakennuksesta\\u00a0\\u00a0tiloja j\\u00e4senilleen ensisijassa kulttuurin, tieteen, k\\u00e4sity\\u00f6n,\\u00a0muiden luovien alojen ja niit\\u00e4 tukevien yritys- ja muiden toimintojen tarpeisiin.\\u00a0Osuuskunta my\\u00f6s j\\u00e4rjest\\u00e4\\u00e4 ja tukea kaupunkikulttuuria edist\\u00e4vi\\u00e4 tapahtumia ja\\u00a0muuta toimintaa.</h4>", "numchild": 5, "bg_image": 24, "content_type": 9, "show_in_menus": false, "path": "000100010001", "url_path": "/home/tilajakamo/", "expired": false, "pk": 3, "locked": false, "depth": 3, "first_published_at": "2016-02-09T14:28:57.723Z", "expire_at": null}	\N	3	1
46	f	2016-02-18 08:02:22.576165+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Liveroolitapahtumaa nimelt\\u00e4\\u00e4n End of the Line", "seo_title": "", "slug": "liveroolitapahtumaa-nimeltaan-end-line", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Maanantaina 7.3\\u00a0 j\\u00e4rjestet\\u00e4\\u00e4n Lapinlahdessa vampyyriaiheinen larppi eli liveroolitapahtumaa nimelt\\u00e4\\u00e4n <b><i>End of the Line</i></b>. Toiminta sijoittuu p\\u00e4\\u00e4asiassa ensimm\\u00e4isen kerroksen keitti\\u00f6- ja aulatioihin, kolmanteen kerrokseen sek\\u00e4 porrask\\u00e4yt\\u00e4viin, ja jatkuu viidest\\u00e4 iltap\\u00e4iv\\u00e4ll\\u00e4 puoleen y\\u00f6h\\u00f6n. Sen tuottavat yhteisty\\u00f6ss\\u00e4 White Wolf Publishing, Odyss\\u00e9 ja Inside Job Agency.</p><p>Kyseess\\u00e4 on suljettu tapahtuma, er\\u00e4\\u00e4nlainen larpin kenraaliharjoitus, jossa testataan erilaisten suomalaisten ja pohjoismaisten larppaajien ja pelinj\\u00e4rjest\\u00e4jien kanssa uusia tapoja kehitt\\u00e4\\u00e4 White Wolfin Vampire: the Masquerade -peli\\u00e4. Peli j\\u00e4rjestet\\u00e4\\u00e4n Suomessa j\\u00e4rjestett\\u00e4v\\u00e4n Solmukohta 2016 -pelikonferenssin yhteydess\\u00e4.</p><p>Tapahtuman aikana paikan p\\u00e4\\u00e4ll\\u00e4 on noin 70 osallistujaa ja j\\u00e4rjest\\u00e4j\\u00e4\\u00e4. Pahoittelemme mahdollisia h\\u00e4iri\\u00f6it\\u00e4 ja mik\\u00e4li tapahtumasta on kysymyksi\\u00e4, yhteyshenkil\\u00f6t ovat:</p><p>Pelisuunnittelija Juhana Pettersson (jlp@iki.fi / 045 123 99 81)</p><p>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n</p><p>Tuottaja Mikko Pervil\\u00e4 (mikko.pervila@<a href=\\"http://gmail.com/\\">gmail.com</a> / 044 769 60 68)</p>", "numchild": 0, "content_type": 20, "show_in_menus": false, "date": "2016-02-18", "path": "00010001000100010002", "url_path": "/home/tilajakamo/uutiset/liveroolitapahtumaa-nimeltaan-end-line/", "expired": false, "pk": 190, "locked": false, "tagged_items": [], "depth": 5, "first_published_at": null, "expire_at": null}	\N	190	1
45	f	2016-02-18 08:01:19.266906+00	{"advert_placements": [], "carousel_items": [], "show_in_menus": false, "search_description": "", "owner": 1, "cost": "0", "latest_revision_created_at": null, "time_to": "00:00:00", "go_live_at": null, "feed_image": null, "related_links": [], "title": "Liveroolitapahtuma End of the Line", "signup_link": "", "date_from": "2016-03-07", "seo_title": "", "slug": "liveroolitapahtuma-end-line", "live": true, "location": "Tilajakamon Lapinlahti", "has_unpublished_changes": false, "body": "<p>Maanantaina 7.3\\u00a0 j\\u00e4rjestet\\u00e4\\u00e4n Lapinlahdessa vampyyriaiheinen larppi eli liveroolitapahtumaa nimelt\\u00e4\\u00e4n <b><i>End of the Line</i></b>. Toiminta sijoittuu p\\u00e4\\u00e4asiassa ensimm\\u00e4isen kerroksen keitti\\u00f6- ja aulatioihin, kolmanteen kerrokseen sek\\u00e4 porrask\\u00e4yt\\u00e4viin, ja jatkuu viidest\\u00e4 iltap\\u00e4iv\\u00e4ll\\u00e4 puoleen y\\u00f6h\\u00f6n. Sen tuottavat yhteisty\\u00f6ss\\u00e4 White Wolf Publishing, Odyss\\u00e9 ja Inside Job Agency.</p>\\n<p>Kyseess\\u00e4 on suljettu tapahtuma, er\\u00e4\\u00e4nlainen larpin kenraaliharjoitus, jossa testataan erilaisten suomalaisten ja pohjoismaisten larppaajien ja pelinj\\u00e4rjest\\u00e4jien kanssa uusia tapoja kehitt\\u00e4\\u00e4 White Wolfin Vampire: the Masquerade -peli\\u00e4. Peli j\\u00e4rjestet\\u00e4\\u00e4n Suomessa j\\u00e4rjestett\\u00e4v\\u00e4n Solmukohta 2016 -pelikonferenssin yhteydess\\u00e4.</p>\\n<p>Tapahtuman aikana paikan p\\u00e4\\u00e4ll\\u00e4 on noin 70 osallistujaa ja j\\u00e4rjest\\u00e4j\\u00e4\\u00e4. Pahoittelemme mahdollisia h\\u00e4iri\\u00f6it\\u00e4 ja mik\\u00e4li tapahtumasta on kysymyksi\\u00e4, yhteyshenkil\\u00f6t ovat:</p>\\n<p>Pelisuunnittelija Juhana Pettersson (jlp@iki.fi / 045 123 99 81)</p>\\n<p>Tuottaja Mikko Pervil\\u00e4 (mikko.pervila@<a href=\\"http://gmail.com/\\">gmail.com</a> / 044 769 60 68)</p>", "numchild": 0, "time_from": "17:00:00", "speakers": [], "audience": "private", "content_type": 36, "date_to": "2016-03-07", "path": "00010001000100020002", "url_path": "/home/tilajakamo/tapahtumia/liveroolitapahtuma-end-line/", "expired": false, "pk": 189, "locked": false, "depth": 5, "first_published_at": null, "expire_at": null}	\N	189	1
48	f	2016-02-18 08:06:16.656934+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Holvi", "link_external": "https://holvi.com/shop/tilajakamo2016", "sort_order": 0, "link_document": null, "pk": 1, "page": 191}], "title": "Miten j\\u00e4seneksi liittyminen tarkoittaa?", "seo_title": "", "slug": "miten-jaseneksi-liittyminen-tarkoittaa", "live": false, "has_unpublished_changes": false, "public": true, "body": "<p>Osuuskunnan j\\u00e4seneksi liityt\\u00e4\\u00e4n maksamalla osuuskunnan j\\u00e4senmaksu, joka on 50 \\u20ac + palvelumaksu. Osuuskunnan j\\u00e4senyys ei automaattisesti tarkoita tilojen saamista, mutta se mahdollistaa asettumisen jonoon, kun tiloja tulee tarjolle. J\\u00e4sen maksu on kertamaksu eik\\u00e4 sit\\u00e4 palauteta.<br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040001", "url_path": "/home/tilajakamo/ukk/miten-jaseneksi-liittyminen-tarkoittaa/", "expired": false, "pk": 191, "locked": false, "tagged_items": [{"pk": 1, "tag": 2, "content_object": 191}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	191	1
47	f	2016-02-18 08:05:02.563459+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n.\\u00a0</p>", "latest_revision_created_at": "2016-02-10T17:05:20.700Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "YLEIST\\u00c4", "seo_title": "", "slug": "yleista", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n. Joulukuussa 2015 osuuskunta p\\u00e4\\u00e4tyi yli kaksi vuotta kest\\u00e4neiden neuvotteluiden j\\u00e4lkeen vuokraamaan puolet Lapinlahden sairaalan tiloista.</p><p>Osuuskunnassa on reilut 100 j\\u00e4sent\\u00e4, kuvataiteilijoita, valokuvaajia, musiikintekij\\u00f6it\\u00e4, k\\u00e4sity\\u00f6l\\u00e4isi\\u00e4, yritt\\u00e4ji\\u00e4 ja tutkijoita, joista noin puolet on saanut ty\\u00f6tiloja Lapinlahdesta.\\u00a0</p><p>Vuonna 1841 C. L. Engelin suunnittelema mielisairaalaksi rakennettu Lapinlahden sairaala on ollut osin tyhjill\\u00e4\\u00e4n sen j\\u00e4lkeen kun sairaalatoiminta loppui vuonna 2008. Osuuskunnan toissijainen tavoite on arkkitehtuurillisesti merkitt\\u00e4v\\u00e4n historiallisen rakennuksen suojeleminen aktiivisella k\\u00e4yt\\u00f6ll\\u00e4.</p><p>Suunnitelmissa on avata Lapinlahti my\\u00f6s ulkopuolisille. Yleisiin tiloihin on kaavailtu kahvilaa, n\\u00e4yttelyit\\u00e4 ja myym\\u00e4l\\u00e4tiloja, ruokasaleihin ravintolaa ja sairaalan laitoskeitti\\u00f6\\u00f6n osuuskunnallista keitti\\u00f6toimintaa. My\\u00f6s piha-alueilla ja puistossa alkaa kev\\u00e4\\u00e4n mittaan tapahtua \\u2014 osuuskunnan organisoima telttasauna on jo avoinna perjantaisin ja lauantaisin.</p><p>Lapinlahden sairaalaan tehd\\u00e4\\u00e4n vuoden 2016 -2017 Helsingin kaupungin toimesta remonttia ikkunoiden ja julkisivun kohentamiseksi sek\\u00e4 vaurioiden korjaamiseksi. T\\u00e4ll\\u00e4 hetkell\\u00e4 suurin osa sis\\u00e4tiloista on hyv\\u00e4ss\\u00e4 kunnossa, mutta l\\u00e4hes jokainen tila tarvitsee jonkin asteista remontointia. Sairaala on suojeltu rakennus, joten kaiken remontoinnin tulee olla museoviraston antamien ohjeiden mukaista. Kunnostuksesta vastaa tilojen osuuskuntalainen, mutta yleisten tilojen remontointi on yhteis\\u00f6n vastuulla.</p><p>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n</p><p>Ensimm\\u00e4iset osuuskuntalaiset muuttivat sairaalaan vuoden 2016 alussa jai tilat on jo varattu. Vuoden 2016 aikana tavoitteena on remontoida tiloja ja jatkaa osuuskunnan p\\u00e4\\u00e4tavoitteena olevaa kaupungin kehitt\\u00e4minen. Osuuskunta etsii edelleen uusia vastaavia tiloja kaupungista.</p>", "numchild": 0, "content_type": 14, "show_in_menus": true, "path": "0001000100010009", "url_path": "/home/tilajakamo/yleista/", "expired": false, "pk": 186, "locked": false, "depth": 4, "first_published_at": "2016-02-10T17:05:20.712Z", "expire_at": null}	\N	186	1
73	f	2016-02-18 10:43:40.248622+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "1. kerros", "link_external": "https://docs.google.com/presentation/d/15E-cyAUW92AChTl_bKnZoIJy844XfllmKlH_P5jYxQw/edit#slide=id.gfe03b4d79_0_283", "sort_order": 0, "link_document": null, "pk": 13, "page": 199}, {"link_page": null, "title": "2. kerros", "link_external": "https://docs.google.com/presentation/d/1Svhe56PdyHi0TthLWZ7c-ZdK_9YRO5J_p_ULp_02x00/edit#slide=id.gfe0726ebd_0_0", "sort_order": 1, "link_document": null, "pk": 14, "page": 199}, {"link_page": null, "title": "3. kerros", "link_external": "https://docs.google.com/presentation/d/1CniukRoLqxlwLqHO7R4qK41ThnEHw9luNQu9OXcfmEM/edit#slide=id.gfe0726ebd_0_0", "sort_order": 2, "link_document": null, "pk": 15, "page": 199}, {"link_page": null, "title": "Yleinen ohjeistus", "link_external": "https://docs.google.com/presentation/d/1S-qFmrhw1w06ZBXKHYxPRYxQx8BeL9sbXGygqk7Nubo/edit#slide=id.gfe0726ebd_0_0", "sort_order": 3, "link_document": null, "pk": 16, "page": 199}], "title": "Mihin ilmoitan kunnostust\\u00f6ist\\u00e4?", "seo_title": "", "slug": "mihin-ilmoitan-kunnostustoista", "live": false, "has_unpublished_changes": false, "public": false, "body": "<p>Kerro suunnittelemistasi muutoksista korjauskortissa ja ilmoita muutoksista is\\u00e4nn\\u00f6itsij\\u00e4lle. Tarvittaessa voi kysy\\u00e4 neuvoa korjauksista muilta oskuilta.<br/></p><p><br/></p><p>1. kerros\\u00a0</p><p>2. kerros\\u00a0</p><p>3. kerros\\u00a0</p><p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040009", "url_path": "/home/tilajakamo/ukk/mihin-ilmoitan-kunnostustoista/", "expired": false, "pk": 199, "locked": false, "tagged_items": [{"pk": 28, "tag": 8, "content_object": 199}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	199	1
50	f	2016-02-18 08:36:04.44741+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T08:08:50.069Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Holvi", "link_external": "https://holvi.com/shop/tilajakamo2016", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "title": "Varauslomake", "link_external": "http://goo.gl/forms/rOYa08frvc", "sort_order": 1, "link_document": null, "pk": null, "page": 191}], "title": "Miten osuuskuntaan voi liitty\\u00e4?", "seo_title": "", "slug": "miten-osuuskuntaan-voi-liittya", "live": false, "has_unpublished_changes": true, "public": true, "body": "<p>Osuuskunnan j\\u00e4seneksi liityt\\u00e4\\u00e4n maksamalla osuuskunnan j\\u00e4senmaksu, joka on 50 \\u20ac + palvelumaksu. Osuuskunnan j\\u00e4senyys ei automaattisesti tarkoita tilojen saamista, mutta se mahdollistaa asettumisen jonoon, kun tiloja tulee tarjolle. J\\u00e4senmaksu on kertamaksu eik\\u00e4 sit\\u00e4 palauteta.<br/></p><p>Kiinnostuksen tarjolla olevia tiloja kohtaan voi my\\u00f6s ilmoittaa verkkolomakkeella.</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040001", "url_path": "/home/tilajakamo/ukk/miten-jaseneksi-liittyminen-tarkoittaa/", "expired": false, "pk": 191, "locked": false, "tagged_items": [{"pk": null, "tag": 2, "content_object": 191}, {"pk": null, "tag": 3, "content_object": 191}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	191	1
49	f	2016-02-18 08:08:50.069954+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T08:06:16.656Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Holvi", "link_external": "https://holvi.com/shop/tilajakamo2016", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "title": "Varauslomake", "link_external": "http://goo.gl/forms/rOYa08frvc", "sort_order": 1, "link_document": null, "pk": null, "page": 191}], "title": "Miten j\\u00e4seneksi liittyminen tarkoittaa?", "seo_title": "", "slug": "miten-jaseneksi-liittyminen-tarkoittaa", "live": false, "has_unpublished_changes": true, "public": true, "body": "<p>Osuuskunnan j\\u00e4seneksi liityt\\u00e4\\u00e4n maksamalla osuuskunnan j\\u00e4senmaksu, joka on 50 \\u20ac + palvelumaksu. Osuuskunnan j\\u00e4senyys ei automaattisesti tarkoita tilojen saamista, mutta se mahdollistaa asettumisen jonoon, kun tiloja tulee tarjolle. J\\u00e4sen maksu on kertamaksu eik\\u00e4 sit\\u00e4 palauteta.<br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040001", "url_path": "/home/tilajakamo/ukk/miten-jaseneksi-liittyminen-tarkoittaa/", "expired": false, "pk": 191, "locked": false, "tagged_items": [{"pk": null, "tag": 2, "content_object": 191}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	191	1
74	f	2016-02-18 10:45:57.488082+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T10:43:40.248Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "1. kerros", "link_external": "https://docs.google.com/presentation/d/15E-cyAUW92AChTl_bKnZoIJy844XfllmKlH_P5jYxQw/edit#slide=id.gfe03b4d79_0_283", "sort_order": 0, "link_document": null, "pk": 13, "page": null}, {"link_page": null, "title": "2. kerros", "link_external": "https://docs.google.com/presentation/d/1Svhe56PdyHi0TthLWZ7c-ZdK_9YRO5J_p_ULp_02x00/edit#slide=id.gfe0726ebd_0_0", "sort_order": 1, "link_document": null, "pk": 14, "page": null}, {"link_page": null, "title": "3. kerros", "link_external": "https://docs.google.com/presentation/d/1CniukRoLqxlwLqHO7R4qK41ThnEHw9luNQu9OXcfmEM/edit#slide=id.gfe0726ebd_0_0", "sort_order": 2, "link_document": null, "pk": 15, "page": null}, {"link_page": null, "title": "Yleinen ohjeistus", "link_external": "https://docs.google.com/presentation/d/1S-qFmrhw1w06ZBXKHYxPRYxQx8BeL9sbXGygqk7Nubo/edit#slide=id.gfe0726ebd_0_0", "sort_order": 3, "link_document": null, "pk": 16, "page": null}], "title": "Mihin ilmoitan kunnostust\\u00f6ist\\u00e4?", "seo_title": "", "slug": "mihin-ilmoitan-kunnostustoista", "live": false, "has_unpublished_changes": true, "public": false, "body": "<p>Kerro suunnittelemistasi muutoksista korjauskortissa ja ilmoita muutoksista is\\u00e4nn\\u00f6itsij\\u00e4lle. Tarvittaessa voi kysy\\u00e4 neuvoa korjauksista muilta oskuilta.<br/></p><p>Kullekin huoneelle on tehty korjauskortti, johon kirjataan yl\\u00f6s toteutettavat muutokset.\\u00a0</p><p><embed alt=\\"Korjauskortti-ohje\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"54\\"/><br/></p><p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040009", "url_path": "/home/tilajakamo/ukk/mihin-ilmoitan-kunnostustoista/", "expired": false, "pk": 199, "locked": false, "tagged_items": [{"pk": null, "tag": 8, "content_object": 199}, {"pk": null, "tag": 9, "content_object": 199}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	199	1
52	f	2016-02-18 08:38:12.713247+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T08:37:03.749Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Avaimet", "link_external": "https://holvi.com/shop/tilajakamo2016", "sort_order": 0, "link_document": null, "pk": 3, "page": null}], "title": "Mist\\u00e4 saan lis\\u00e4avaimia?", "seo_title": "", "slug": "mista-saan-lisaavaimia", "live": false, "has_unpublished_changes": true, "public": true, "body": "<p>Oman huoneen lis\\u00e4avaimet voi hankkia kopioina pikasuutarilta tai lukkoliikkeest\\u00e4.<br/></p>\\n<p>Ulko- ja v\\u00e4liovien iLoq avaimet voi tilata Holvista ja ne saa haltuunsa Lapinlahdessa.</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040002", "url_path": "/home/tilajakamo/ukk/mista-saan-lisaavaimia/", "expired": false, "pk": 192, "locked": false, "tagged_items": [{"pk": null, "tag": 3, "content_object": 192}, {"pk": null, "tag": 4, "content_object": 192}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	192	1
51	f	2016-02-18 08:37:03.749856+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Avaimet", "link_external": "https://holvi.com/shop/tilajakamo2016", "sort_order": 0, "link_document": null, "pk": 3, "page": 192}], "title": "Mist\\u00e4 saan lis\\u00e4avaimia?", "seo_title": "", "slug": "mista-saan-lisaavaimia", "live": false, "has_unpublished_changes": false, "public": true, "body": "<p>Oman huoneen lis\\u00e4avaimet hankkia suutarilta tai lukkoliikkeest\\u00e4<br/></p>\\n<p>Ulko-ovien iLoq avaimet voi tilata Holvista.</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040002", "url_path": "/home/tilajakamo/ukk/mista-saan-lisaavaimia/", "expired": false, "pk": 192, "locked": false, "tagged_items": [{"pk": 4, "tag": 3, "content_object": 192}, {"pk": 5, "tag": 4, "content_object": 192}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	192	1
75	f	2016-02-18 10:48:06.753044+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Vastuunjakotaulukko", "link_external": "https://docs.google.com/spreadsheets/d/1pJuMf3n0IzqKxk8tEW7VLqWPs4bxzHl_Nl_FFacFFU0", "sort_order": 0, "link_document": null, "pk": 17, "page": 200}], "title": "Mist\\u00e4 olet vastuussa omassa huoneessasi?", "seo_title": "", "slug": "mista-olet-vastuussa-omassa-huoneessasi", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Huoneiden eri osat ovat joko oskun, osuuskunnan tai rakennuksen omistajan, eli Helsingin kaupungin vastuulla. Ohessa linkki vastuujakotaulukkoon.</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000A", "url_path": "/home/tilajakamo/ukk/mista-olet-vastuussa-omassa-huoneessasi/", "expired": false, "pk": 200, "locked": false, "tagged_items": [{"pk": 31, "tag": 8, "content_object": 200}, {"pk": 32, "tag": 10, "content_object": 200}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	200	1
54	f	2016-02-18 08:46:16.140211+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T08:40:18.747Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Telegram", "link_external": "https://telegram.org/", "sort_order": 0, "link_document": null, "pk": 4, "page": null}], "title": "Mik\\u00e4 on Telegram?", "seo_title": "", "slug": "mika-telegram", "live": false, "has_unpublished_changes": true, "public": true, "body": "<p>Osuuskunta k\\u00e4ytt\\u00e4\\u00e4 j\\u00e4senten kommunikaatioon Telegram chattia, jotta tieto liikkuisi tehokkaasti.\\u00a0<br/></p><p>Telegram mahdollistaa nopean kommunikaation milloin ja\\u00a0 miss\\u00e4 tahansa puhelimessa ja tietokoneessa, jossa on nettiyhteys. Samat viestit n\\u00e4kyv\\u00e4t kaikissa laitteissa ja viestint\\u00e4 arkistoituu automaattisesti.Tarvittaessa keskustelu voi olla my\\u00f6s salattua.</p><p>Sit\\u00e4 kautta voi jakaa my\\u00f6s tiedostoja, jotka tallentuvat samalla my\\u00f6s nettiin.\\u00a0</p><p>Lis\\u00e4ksi siihen on mahdollista kehitt\\u00e4\\u00e4 omia lis\\u00e4ominaisuuksia ja se on t\\u00e4ysin ilmainen.</p><p><br/></p><p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040003", "url_path": "/home/tilajakamo/ukk/mika-telegram/", "expired": false, "pk": 193, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 193}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	193	1
55	f	2016-02-18 08:48:25.163275+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Asennus", "link_external": "https://telegram.org/apps", "sort_order": 0, "link_document": null, "pk": 5, "page": 194}], "title": "Miten lataan ja asennan Telegrammin?", "seo_title": "", "slug": "miten-lataan-ja-asennan-telegrammin", "live": false, "has_unpublished_changes": false, "public": true, "body": "<p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040004", "url_path": "/home/tilajakamo/ukk/miten-lataan-ja-asennan-telegrammin/", "expired": false, "pk": 194, "locked": false, "tagged_items": [{"pk": 10, "tag": 5, "content_object": 194}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	194	1
56	f	2016-02-18 09:01:36.90281+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T08:48:25.163Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Asennus", "link_external": "https://telegram.org/apps", "sort_order": 0, "link_document": null, "pk": 5, "page": null}], "title": "Miten lataan ja otan k\\u00e4ytt\\u00f6\\u00f6n Telegrammin?", "seo_title": "", "slug": "miten-lataan-ja-otan-kayttoon-telegrammin", "live": false, "has_unpublished_changes": true, "public": true, "body": "<p>Telegramiin rekister\\u00f6idyt\\u00e4\\u00e4n oman puhelinnumeron avulla. Numero vahvistetaan tekstiviestill\\u00e4. Ensimm\\u00e4isen rekister\\u00f6itymisen j\\u00e4lkeen tilin voi vahvistaa muille laitteille Telegramin avulla.</p><p>L\\u00e4ht\\u00f6kohtaisesti samoilla kanavilla olevat henkil\\u00f6t tai ne joilla on toistensa puhelinnumerot voivat viestitell\\u00e4 kesken\\u00e4\\u00e4n suoraan. Ottamalla k\\u00e4ytt\\u00f6\\u00f6n @telegram-tunnus ohjelman/k\\u00e4ytt\\u00e4j\\u00e4n asetuksissa voivat muutkin k\\u00e4ytt\\u00e4j\\u00e4t l\\u00e4hett\\u00e4\\u00e4 suoria viestej\\u00e4.</p><p>Julkisen tunnuksen avulla voit jakaa my\\u00f6s linkki\\u00e4 telegram.me/YourUsernameHere jota kautta kuka tahansa voi l\\u00e4hett\\u00e4\\u00e4 sinulle viestej\\u00e4.</p><p>Huom! Telegram viestit eiv\\u00e4t tarkoita, ett\\u00e4 vastaanottaja saisi sen avulla selville puhelinnumerosi!</p><p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040004", "url_path": "/home/tilajakamo/ukk/miten-lataan-ja-asennan-telegrammin/", "expired": false, "pk": 194, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 194}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	194	1
76	f	2016-02-18 12:51:24.35993+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Osuuskunnan s\\u00e4\\u00e4nn\\u00f6t", "seo_title": "", "slug": "osuuskunnan-saannot", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Osuuskunta Lapinlahden tilajakamo s\\u00e4\\u00e4nn\\u00f6t<br/></p><p>1\\u00a7 Toiminimi ja kotipaikka<br/></p><p>Osuuskunnan toiminimi on Osuuskunta Lapinlahden tilajakamo ja sen kotipaikka on<br/>Helsinki.<br/>2\\u00a7 Tarkoitus ja toimiala<br/>Osuuskunnan tarkoituksena on edist\\u00e4\\u00e4 kaupunkikulttuuria.<br/>Tarkoituksensa toteuttamiseksi osuuskunta vuokraa Lapinlahden sairaalarakennuksia<br/>ja muita hallinnassaan olevia tiloja j\\u00e4senilleen ensisijassa kulttuurin, tieteen, k\\u00e4sity\\u00f6n,<br/>muiden luovien alojen ja niit\\u00e4 tukevien yritys- ja muiden toimintojen tarpeisiin.<br/>Osuuskunta voi my\\u00f6s j\\u00e4rjest\\u00e4\\u00e4 ja tukea kaupunkikulttuuria edist\\u00e4vi\\u00e4 tapahtumia ja<br/>muuta toimintaa.</p><p></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000B", "url_path": "/home/tilajakamo/ukk/osuuskunnan-saannot/", "expired": false, "pk": 201, "locked": false, "tagged_items": [{"pk": 33, "tag": 2, "content_object": 201}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	201	1
77	f	2016-02-18 12:53:47.524905+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "L\\u00e4hde: wikipedia", "link_external": "http://fi.wikipedia.org/wiki/Lapinlahden_sairaala", "sort_order": 0, "link_document": null, "pk": 18, "page": 202}], "title": "Historia", "seo_title": "", "slug": "historia", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Lapinlahden sairaala on Suomen ensimm\\u00e4inen mielisairaalak\\u00e4ytt\\u00f6\\u00f6n valmistunut sairaala. Se sijaitsee Helsingiss\\u00e4 Lapinlahden osa-alueella meren rannalla Hietaniemen hautausmaan l\\u00e4heisyydess\\u00e4.<br/></p><p>Sairaala valmistui vuonna 1841 Carl Ludvig Engelin suunnitelmien mukaan. 160 vuotta toiminnassa olleessa sairaalassa on toiminut Helsingin ja Uudenmaan sairaanhoitopiirin psykiatrisen osaston sy\\u00f6mish\\u00e4iri\\u00f6osasto, -poliklinikka ja -p\\u00e4iv\\u00e4osasto.</p><p>Sairaalaa on alusta l\\u00e4htien ymp\\u00e4r\\u00f6inyt laaja puutarha. Siit\\u00e4 on aikojen kuluessa lohkaistu alueita muun muassa L\\u00e4nsiv\\u00e4yl\\u00e4n rakentamiseksi, mutta sen keskeisin osa on yh\\u00e4 j\\u00e4ljell\\u00e4.</p><h5>Sairaalatoiminnan loppuminen</h5><p>Lapinlahden sairaalatoiminta p\\u00e4\\u00e4ttyi lopullisesti 19. joulukuuta 2008, jolloin HUS:n psykiatrisen osaston sy\\u00f6mish\\u00e4iri\\u00f6osasto, -poliklinikka ja -p\\u00e4iv\\u00e4osasto muuttivat Psykiatriakeskukseen.</p><p>Osa k\\u00e4yt\\u00f6st\\u00e4 poistuneista rakennuksista vallattiin muun muassa opiskelijoiden toimesta. Vaatimuksissa on ollut sairaala-alueen hy\\u00f6dynt\\u00e4minen my\\u00f6s jatkossakin. Helsingin kaupunki aikoo peruskorjata sairaala-alueen, ja alue tulee my\\u00f6hemmin sosiaaliviraston k\\u00e4ytt\\u00f6\\u00f6n.</p><p><br/></p><p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000C", "url_path": "/home/tilajakamo/ukk/historia/", "expired": false, "pk": 202, "locked": false, "tagged_items": [{"pk": 34, "tag": 2, "content_object": 202}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	202	1
58	f	2016-02-18 09:16:16.706617+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Miten liityn tilajakamon kanaville?", "seo_title": "", "slug": "miten-liityn-tilajakamon-kanaville", "live": false, "has_unpublished_changes": false, "public": true, "body": "<p>Tilajakamolla on k\\u00e4yt\\u00f6ss\\u00e4\\u00e4n useita kanavia eri tarkoituksiin, koska yleinen kanava on tarkoitettu yhteis\\u00f6lliseen rupatteluun eik\\u00e4 sen seuraaminen on pakollista, jotta pysyisi tilanteen tasalla. Osa kanavista on vain informaatiota varten eik\\u00e4 niill\\u00e4 ole tarkoitus k\\u00e4yd\\u00e4 keskustelua.\\u00a0</p><p>Yleisen kanavan voi laittaa \\u00e4\\u00e4nett\\u00f6m\\u00e4lle (mute), jos haluaa vain seurata vain joitakin aiheita.</p><p></p><ul><li>Tilajakamo tiedottaa: T\\u00e4rkeille tiedotteille (ei kommentointia)</li><li>Tilajakamo tapahtumat: Tietoa tapahtumista (ei kommentointia)</li><li>Tilajakamon saneeraustyhm\\u00e4: Keskustelua muutos- ja kunnostust\\u00f6ist\\u00e4</li><li>Tilajakamon talkoot: Tiedotteita talkoista (ei kommentointia)</li><li>Tilajakamon ehdotukset: ehdotuksia hallitukselle (ei kommentointia)</li><li>Tilajakamon netti: korjauspyynt\\u00f6j\\u00e4 nettiongelmiin (ei kommentointia)</li><li>Tilajakamon huolto: toiveita esim. koskien valaistusta tai lukkoja yms. pieniin huoltotoimiin \\u00a0(ei kommentointia)</li><li>Tilajakamon siivous: toiveita ylim\\u00e4\\u00e4r\\u00e4isest\\u00e4 siivouksesta (ei kommentointia)</li><li>Tilajakamon H\\u00c4LYTYS: SOS VIESTI AKUUTTISSA H\\u00c4T\\u00c4TAPAUKSESSA (kuten vesivahinko) johon ei v\\u00e4litt\\u00f6m\\u00e4sti tarvita poliisia tai palokuntaa (ei kommentointia)</li></ul><p></p><li></li><li></li><li></li><li></li>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040005", "url_path": "/home/tilajakamo/ukk/miten-liityn-tilajakamon-kanaville/", "expired": false, "pk": 195, "locked": false, "tagged_items": [], "depth": 5, "first_published_at": null, "expire_at": null}	\N	195	1
78	f	2016-02-18 12:55:13.619509+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Mit\\u00e4 todellisuuskoordinaattori tekee?", "seo_title": "", "slug": "mita-todellisuuskoordinaattori-tekee", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Kysy <a href=\\"https://telegram.me/ismaelrantala\\">@ismaelrantala</a></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000D", "url_path": "/home/tilajakamo/ukk/mita-todellisuuskoordinaattori-tekee/", "expired": false, "pk": 203, "locked": false, "tagged_items": [{"pk": 35, "tag": 11, "content_object": 203}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	203	1
79	f	2016-02-18 12:56:38.518054+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Kuka vuokraa Omenapuutaloa?", "seo_title": "", "slug": "kuka-vuokraa-omenapuutaloa", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Omenapuutalo on p\\u00e4\\u00e4sis\\u00e4\\u00e4nk\\u00e4ynnin pohjoispuolella oleva puutalo, jota vuokraa tilaisuuksia varten\\u00a0<a href=\\"mailto:joonas@pekkanen.org\\">joonas@pekkanen.org</a></p><p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000E", "url_path": "/home/tilajakamo/ukk/kuka-vuokraa-omenapuutaloa/", "expired": false, "pk": 204, "locked": false, "tagged_items": [], "depth": 5, "first_published_at": null, "expire_at": null}	\N	204	1
80	f	2016-02-18 12:58:50.180077+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Kuka py\\u00f6ritt\\u00e4\\u00e4 osuuskuntaa?", "seo_title": "", "slug": "kuka-pyorittaa-osuuskuntaa", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Hallituksen kuuluvat:</p><p></p><ul><li>Teemu Lehto (pj)</li><li>Joonas Pekkanen (siht)</li><li>Egil Silfver (taloudenhoitaja)</li><li>Richie Mattila</li></ul><p>Lis\\u00e4ksi viestinn\\u00e4st\\u00e4 vastaa Kimmo Lehtonen</p><p><br/></p><p>Is\\u00e4nn\\u00f6inti on Timo Waldmannin (Lasipalatsin Mediakeskus Oy) vastuulla.</p><p></p><li></li>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000F", "url_path": "/home/tilajakamo/ukk/kuka-pyorittaa-osuuskuntaa/", "expired": false, "pk": 205, "locked": false, "tagged_items": [], "depth": 5, "first_published_at": null, "expire_at": null}	\N	205	1
64	f	2016-02-18 09:34:48.088754+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T09:31:13.741Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Tilajakamo (yleinen)", "link_external": "https://telegram.me/joinchat/BIHxAgNPTAtjxHVzkdpcUw", "sort_order": 0, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamo tiedottaa", "link_external": "https://telegram.me/tilajakamotiedottaa", "sort_order": 1, "link_document": null, "pk": 6, "page": null}, {"link_page": null, "title": "Tilajakamon tapahtumat", "link_external": "https://telegram.me/tilajakamontapahtumat", "sort_order": 2, "link_document": null, "pk": 7, "page": null}, {"link_page": null, "title": "Tilajakamon saneerauskanava", "link_external": "https://telegram.me/joinchat/BphCMgQazU_AHOwzY_HPHg", "sort_order": 3, "link_document": null, "pk": 8, "page": null}, {"link_page": null, "title": "Tilajakamon talkoot", "link_external": "https://telegram.me/tilajakamontalkoot", "sort_order": 4, "link_document": null, "pk": 10, "page": null}, {"link_page": null, "title": "Tilajakamon OMV", "link_external": "https://telegram.me/joinchat/A9q4ZwQfYtjvvX6MfAIezw", "sort_order": 5, "link_document": null, "pk": 9, "page": null}, {"link_page": null, "title": "H\\u00c4LYTYS", "link_external": "https://telegram.me/joinchat/A9q4ZwQeL8YWZ6JVd_BDWw", "sort_order": 6, "link_document": null, "pk": 11, "page": null}], "title": "Miten liityn tilajakamon kanaville?", "seo_title": "", "slug": "miten-liityn-tilajakamon-kanaville", "live": true, "has_unpublished_changes": true, "public": false, "body": "<p>Tilajakamolla on k\\u00e4yt\\u00f6ss\\u00e4\\u00e4n useita kanavia eri tarkoituksiin.\\u00a0</p><p>Yleisen kanavan seuraaminen ei ole pakollista tai sen voi pit\\u00e4\\u00e4 mykistettyn\\u00e4. Osa kanavista on vain informaation jakamista varten, koska muuten t\\u00e4rke\\u00e4t ilmoitukset saattavat hukkua keskusteluun. Toisissa keskustelu on avoin, mutta varattu tietyn aihepiirin ymp\\u00e4rille.<br/></p><p>Yleisen kanavan voi laittaa \\u00e4\\u00e4nett\\u00f6m\\u00e4lle (mute), jos haluaa vain seurata vain joitakin kanavia tai ryhmi\\u00e4.</p><p></p><ul><li>Tilajakamo (<b>yleinen</b>): Yhteis\\u00f6llinen ja yleinen keskustelu</li><li>Tilajakamo <b>tiedottaa</b>: T\\u00e4rkeille tiedotteille (ei kommentointia)</li><li>Tilajakamo <b>tapahtumat</b>: Tietoa tapahtumista (ei kommentointia)</li><li>Tilajakamon <b>saneeraustyhm\\u00e4</b>: Keskustelua muutos- ja kunnostust\\u00f6ist\\u00e4</li><li>Tilajakamon <b>talkoot</b>: Tiedotteita talkoista (ei kommentointia)</li><li>Tilajakamon <b>ehdotukset</b>: ehdotuksia hallitukselle (ei kommentointia)</li><li>Tilajakamon <b>OMV</b>: Osta-Myy-Vaihda-Lahjoita palsta!</li><li>Tilajakamon <b>netti</b>: korjauspyynt\\u00f6j\\u00e4 nettiongelmiin (ei kommentointia)</li><li>Tilajakamon <b>huolto</b>: toiveita esim. koskien valaistusta tai lukkoja yms. pieniin huoltotoimiin \\u00a0(ei kommentointia)</li><li>Tilajakamon siivous: toiveita ylim\\u00e4\\u00e4r\\u00e4isest\\u00e4 siivouksesta (ei kommentointia)</li><li>Tilajakamon H\\u00c4LYTYS: SOS VIESTI AKUUTTISSA H\\u00c4T\\u00c4TAPAUKSESSA (kuten vesivahinko) johon ei v\\u00e4litt\\u00f6m\\u00e4sti tarvita poliisia tai palokuntaa (ei kommentointia)</li></ul><p></p><p>Voit liitty\\u00e4 seuraamaan kanavia klikkaamalla alla olevia linkkej\\u00e4.</p><p></p><p></p><li></li><li></li><li></li><li></li>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040005", "url_path": "/home/tilajakamo/ukk/miten-liityn-tilajakamon-kanaville/", "expired": false, "pk": 195, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 195}, {"pk": null, "tag": 6, "content_object": 195}], "depth": 5, "first_published_at": "2016-02-18T09:23:16.218Z", "expire_at": null}	\N	195	1
96	f	2016-02-18 13:52:05.483926+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n.\\u00a0<br/></p>", "latest_revision_created_at": "2016-02-18T13:51:14.268Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "YLEIST\\u00c4", "seo_title": "", "slug": "yleista", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p><embed alt=\\"IMG_1039.JPG\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"22\\"/>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n. Joulukuussa 2015 osuuskunta p\\u00e4\\u00e4tyi yli kaksi vuotta kest\\u00e4neiden neuvotteluiden j\\u00e4lkeen vuokraamaan puolet Lapinlahden sairaalan tiloista.</p><p>Osuuskunnassa on reilut 100 j\\u00e4sent\\u00e4, kuvataiteilijoita, valokuvaajia, musiikintekij\\u00f6it\\u00e4, k\\u00e4sity\\u00f6l\\u00e4isi\\u00e4, yritt\\u00e4ji\\u00e4 ja tutkijoita, joista noin puolet on saanut ty\\u00f6tiloja Lapinlahdesta.\\u00a0</p><p>Vuonna 1841 C. L. Engelin suunnittelema mielisairaalaksi rakennettu Lapinlahden sairaala on ollut osin tyhjill\\u00e4\\u00e4n sen j\\u00e4lkeen kun sairaalatoiminta loppui vuonna 2008. Osuuskunnan toissijainen tavoite on arkkitehtuurillisesti merkitt\\u00e4v\\u00e4n historiallisen rakennuksen suojeleminen aktiivisella k\\u00e4yt\\u00f6ll\\u00e4.</p><p>Suunnitelmissa on avata Lapinlahti my\\u00f6s ulkopuolisille. Yleisiin tiloihin on kaavailtu kahvilaa, n\\u00e4yttelyit\\u00e4 ja myym\\u00e4l\\u00e4tiloja, ruokasaleihin ravintolaa ja sairaalan laitoskeitti\\u00f6\\u00f6n osuuskunnallista keitti\\u00f6toimintaa. My\\u00f6s piha-alueilla ja puistossa alkaa kev\\u00e4\\u00e4n mittaan tapahtua \\u2014 osuuskunnan organisoima telttasauna on jo avoinna perjantaisin ja lauantaisin.</p><p>Lapinlahden sairaalaan tehd\\u00e4\\u00e4n vuoden 2016 -2017 Helsingin kaupungin toimesta remonttia ikkunoiden ja julkisivun kohentamiseksi sek\\u00e4 vaurioiden korjaamiseksi. T\\u00e4ll\\u00e4 hetkell\\u00e4 suurin osa sis\\u00e4tiloista on hyv\\u00e4ss\\u00e4 kunnossa, mutta l\\u00e4hes jokainen tila tarvitsee jonkin asteista remontointia. Sairaala on suojeltu rakennus, joten kaiken remontoinnin tulee olla museoviraston antamien ohjeiden mukaista. Kunnostuksesta vastaa tilojen osuuskuntalainen, mutta yleisten tilojen remontointi on yhteis\\u00f6n vastuulla.</p><p>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n</p><p>Ensimm\\u00e4iset osuuskuntalaiset muuttivat sairaalaan vuoden 2016 alussa jai tilat on jo varattu. Vuoden 2016 aikana tavoitteena on remontoida tiloja ja jatkaa osuuskunnan p\\u00e4\\u00e4tavoitteena olevaa kaupungin kehitt\\u00e4minen. Osuuskunta etsii edelleen uusia vastaavia tiloja kaupungista.</p><p><embed alt=\\"IMG_1054.JPG\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"34\\"/><br/></p>", "numchild": 0, "content_type": 14, "show_in_menus": true, "path": "0001000100010009", "url_path": "/home/tilajakamo/yleista/", "expired": false, "pk": 186, "locked": false, "depth": 4, "first_published_at": "2016-02-10T17:05:20.712Z", "expire_at": null}	\N	186	1
95	f	2016-02-18 13:51:14.268287+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "<p><embed alt=\\"IMG_1039.JPG\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"22\\"/><br/></p><p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n.\\u00a0</p>", "latest_revision_created_at": "2016-02-18T13:50:29.504Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "YLEIST\\u00c4", "seo_title": "", "slug": "yleista", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n. Joulukuussa 2015 osuuskunta p\\u00e4\\u00e4tyi yli kaksi vuotta kest\\u00e4neiden neuvotteluiden j\\u00e4lkeen vuokraamaan puolet Lapinlahden sairaalan tiloista.</p><p>Osuuskunnassa on reilut 100 j\\u00e4sent\\u00e4, kuvataiteilijoita, valokuvaajia, musiikintekij\\u00f6it\\u00e4, k\\u00e4sity\\u00f6l\\u00e4isi\\u00e4, yritt\\u00e4ji\\u00e4 ja tutkijoita, joista noin puolet on saanut ty\\u00f6tiloja Lapinlahdesta.\\u00a0</p><p>Vuonna 1841 C. L. Engelin suunnittelema mielisairaalaksi rakennettu Lapinlahden sairaala on ollut osin tyhjill\\u00e4\\u00e4n sen j\\u00e4lkeen kun sairaalatoiminta loppui vuonna 2008. Osuuskunnan toissijainen tavoite on arkkitehtuurillisesti merkitt\\u00e4v\\u00e4n historiallisen rakennuksen suojeleminen aktiivisella k\\u00e4yt\\u00f6ll\\u00e4.</p><p>Suunnitelmissa on avata Lapinlahti my\\u00f6s ulkopuolisille. Yleisiin tiloihin on kaavailtu kahvilaa, n\\u00e4yttelyit\\u00e4 ja myym\\u00e4l\\u00e4tiloja, ruokasaleihin ravintolaa ja sairaalan laitoskeitti\\u00f6\\u00f6n osuuskunnallista keitti\\u00f6toimintaa. My\\u00f6s piha-alueilla ja puistossa alkaa kev\\u00e4\\u00e4n mittaan tapahtua \\u2014 osuuskunnan organisoima telttasauna on jo avoinna perjantaisin ja lauantaisin.</p><p>Lapinlahden sairaalaan tehd\\u00e4\\u00e4n vuoden 2016 -2017 Helsingin kaupungin toimesta remonttia ikkunoiden ja julkisivun kohentamiseksi sek\\u00e4 vaurioiden korjaamiseksi. T\\u00e4ll\\u00e4 hetkell\\u00e4 suurin osa sis\\u00e4tiloista on hyv\\u00e4ss\\u00e4 kunnossa, mutta l\\u00e4hes jokainen tila tarvitsee jonkin asteista remontointia. Sairaala on suojeltu rakennus, joten kaiken remontoinnin tulee olla museoviraston antamien ohjeiden mukaista. Kunnostuksesta vastaa tilojen osuuskuntalainen, mutta yleisten tilojen remontointi on yhteis\\u00f6n vastuulla.</p><p>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n</p><p>Ensimm\\u00e4iset osuuskuntalaiset muuttivat sairaalaan vuoden 2016 alussa jai tilat on jo varattu. Vuoden 2016 aikana tavoitteena on remontoida tiloja ja jatkaa osuuskunnan p\\u00e4\\u00e4tavoitteena olevaa kaupungin kehitt\\u00e4minen. Osuuskunta etsii edelleen uusia vastaavia tiloja kaupungista.</p>", "numchild": 0, "content_type": 14, "show_in_menus": true, "path": "0001000100010009", "url_path": "/home/tilajakamo/yleista/", "expired": false, "pk": 186, "locked": false, "depth": 4, "first_published_at": "2016-02-10T17:05:20.712Z", "expire_at": null}	\N	186	1
81	f	2016-02-18 12:59:08.768498+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T12:58:50.180Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "Kuka py\\u00f6ritt\\u00e4\\u00e4 osuuskuntaa?", "seo_title": "", "slug": "kuka-pyorittaa-osuuskuntaa", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Hallituksen kuuluvat:</p><p></p><ul><li>Teemu Lehto (pj)</li><li>Joonas Pekkanen (siht)</li><li>Egil Silfver (taloudenhoitaja)</li><li>Richie Mattila</li></ul><p>Lis\\u00e4ksi viestinn\\u00e4st\\u00e4 vastaa Kimmo Lehtonen</p><p><br/></p><p>Is\\u00e4nn\\u00f6inti on Timo Waldmannin (Lasipalatsin Mediakeskus Oy) vastuulla.</p><p></p><li></li>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000F", "url_path": "/home/tilajakamo/ukk/kuka-pyorittaa-osuuskuntaa/", "expired": false, "pk": 205, "locked": false, "tagged_items": [{"pk": null, "tag": 2, "content_object": 205}, {"pk": null, "tag": 11, "content_object": 205}], "depth": 5, "first_published_at": "2016-02-18T12:58:50.193Z", "expire_at": null}	\N	205	1
97	f	2016-02-18 13:52:46.762972+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "<h2>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n.\\u00a0</h2>", "latest_revision_created_at": "2016-02-18T13:52:05.483Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "YLEIST\\u00c4", "seo_title": "", "slug": "yleista", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p><embed alt=\\"IMG_1039.JPG\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"22\\"/>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n. Joulukuussa 2015 osuuskunta p\\u00e4\\u00e4tyi yli kaksi vuotta kest\\u00e4neiden neuvotteluiden j\\u00e4lkeen vuokraamaan puolet Lapinlahden sairaalan tiloista.</p><p>Osuuskunnassa on reilut 100 j\\u00e4sent\\u00e4, kuvataiteilijoita, valokuvaajia, musiikintekij\\u00f6it\\u00e4, k\\u00e4sity\\u00f6l\\u00e4isi\\u00e4, yritt\\u00e4ji\\u00e4 ja tutkijoita, joista noin puolet on saanut ty\\u00f6tiloja Lapinlahdesta.\\u00a0</p><p>Vuonna 1841 C. L. Engelin suunnittelema mielisairaalaksi rakennettu Lapinlahden sairaala on ollut osin tyhjill\\u00e4\\u00e4n sen j\\u00e4lkeen kun sairaalatoiminta loppui vuonna 2008. Osuuskunnan toissijainen tavoite on arkkitehtuurillisesti merkitt\\u00e4v\\u00e4n historiallisen rakennuksen suojeleminen aktiivisella k\\u00e4yt\\u00f6ll\\u00e4.</p><p>Suunnitelmissa on avata Lapinlahti my\\u00f6s ulkopuolisille. Yleisiin tiloihin on kaavailtu kahvilaa, n\\u00e4yttelyit\\u00e4 ja myym\\u00e4l\\u00e4tiloja, ruokasaleihin ravintolaa ja sairaalan laitoskeitti\\u00f6\\u00f6n osuuskunnallista keitti\\u00f6toimintaa. My\\u00f6s piha-alueilla ja puistossa alkaa kev\\u00e4\\u00e4n mittaan tapahtua \\u2014 osuuskunnan organisoima telttasauna on jo avoinna perjantaisin ja lauantaisin.</p><p>Lapinlahden sairaalaan tehd\\u00e4\\u00e4n vuoden 2016 -2017 Helsingin kaupungin toimesta remonttia ikkunoiden ja julkisivun kohentamiseksi sek\\u00e4 vaurioiden korjaamiseksi. T\\u00e4ll\\u00e4 hetkell\\u00e4 suurin osa sis\\u00e4tiloista on hyv\\u00e4ss\\u00e4 kunnossa, mutta l\\u00e4hes jokainen tila tarvitsee jonkin asteista remontointia. Sairaala on suojeltu rakennus, joten kaiken remontoinnin tulee olla museoviraston antamien ohjeiden mukaista. Kunnostuksesta vastaa tilojen osuuskuntalainen, mutta yleisten tilojen remontointi on yhteis\\u00f6n vastuulla.</p><p>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n</p><p>Ensimm\\u00e4iset osuuskuntalaiset muuttivat sairaalaan vuoden 2016 alussa jai tilat on jo varattu. Vuoden 2016 aikana tavoitteena on remontoida tiloja ja jatkaa osuuskunnan p\\u00e4\\u00e4tavoitteena olevaa kaupungin kehitt\\u00e4minen. Osuuskunta etsii edelleen uusia vastaavia tiloja kaupungista.</p><p><embed alt=\\"IMG_1054.JPG\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"34\\"/><br/></p>", "numchild": 0, "content_type": 14, "show_in_menus": true, "path": "0001000100010009", "url_path": "/home/tilajakamo/yleista/", "expired": false, "pk": 186, "locked": false, "depth": 4, "first_published_at": "2016-02-10T17:05:20.712Z", "expire_at": null}	\N	186	1
82	f	2016-02-18 12:59:37.348579+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T12:59:08.768Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "Kuka py\\u00f6ritt\\u00e4\\u00e4 osuuskuntaa?", "seo_title": "", "slug": "kuka-pyorittaa-osuuskuntaa", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Hallituksen kuuluvat:</p><p></p><ul><li>Teemu Lehto (pj)</li><li>Joonas Pekkanen (siht)</li><li>Egil Silfver (taloudenhoitaja)</li><li>Richie Mattila</li></ul><p>Lis\\u00e4ksi viestinn\\u00e4st\\u00e4 vastaa Kimmo Lehtonen</p><p>Is\\u00e4nn\\u00f6inti on Timo Waldmannin (Lasipalatsin Mediakeskus Oy) vastuulla.</p><p></p><li></li>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000F", "url_path": "/home/tilajakamo/ukk/kuka-pyorittaa-osuuskuntaa/", "expired": false, "pk": 205, "locked": false, "tagged_items": [{"pk": null, "tag": 2, "content_object": 205}, {"pk": null, "tag": 11, "content_object": 205}], "depth": 5, "first_published_at": "2016-02-18T12:58:50.193Z", "expire_at": null}	\N	205	1
66	f	2016-02-18 09:35:54.499104+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Miten k\\u00e4yt\\u00e4n Telegramia?", "seo_title": "", "slug": "miten-kaytan-telegramia", "live": false, "has_unpublished_changes": false, "public": true, "body": "", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040006", "url_path": "/home/tilajakamo/ukk/miten-kaytan-telegramia/", "expired": false, "pk": 196, "locked": false, "tagged_items": [{"pk": 19, "tag": 5, "content_object": 196}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	196	1
65	f	2016-02-18 09:35:02.043303+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T08:38:12.713Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Avaimet", "link_external": "https://holvi.com/shop/tilajakamo2016", "sort_order": 0, "link_document": null, "pk": 3, "page": 192}], "title": "Mist\\u00e4 saan lis\\u00e4avaimia?", "seo_title": "", "slug": "mista-saan-lisaavaimia", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Oman huoneen lis\\u00e4avaimet voi hankkia kopioina pikasuutarilta tai lukkoliikkeest\\u00e4.<br/></p>\\n<p>Ulko- ja v\\u00e4liovien iLoq avaimet voi tilata Holvista ja ne saa haltuunsa Lapinlahdessa.</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040002", "url_path": "/home/tilajakamo/ukk/mista-saan-lisaavaimia/", "expired": false, "pk": 192, "locked": false, "tagged_items": [{"pk": null, "tag": 3, "content_object": 192}, {"pk": null, "tag": 4, "content_object": 192}], "depth": 5, "first_published_at": "2016-02-18T08:38:12.732Z", "expire_at": null}	\N	192	1
63	f	2016-02-18 09:31:13.741257+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T09:29:09.565Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Tilajakamo (yleinen)", "link_external": "https://telegram.me/joinchat/BIHxAgNPTAtjxHVzkdpcUw", "sort_order": 0, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamo tiedottaa", "link_external": "https://telegram.me/tilajakamotiedottaa", "sort_order": 1, "link_document": null, "pk": 6, "page": null}, {"link_page": null, "title": "Tilajakamon tapahtumat", "link_external": "https://telegram.me/tilajakamontapahtumat", "sort_order": 2, "link_document": null, "pk": 7, "page": null}, {"link_page": null, "title": "Tilajakamon saneerauskanava", "link_external": "https://telegram.me/joinchat/BphCMgQazU_AHOwzY_HPHg", "sort_order": 3, "link_document": null, "pk": 8, "page": null}, {"link_page": null, "title": "Tilajakamon talkoot", "link_external": "https://telegram.me/tilajakamontalkoot", "sort_order": 4, "link_document": null, "pk": 10, "page": null}, {"link_page": null, "title": "Tilajakamon OMV", "link_external": "https://telegram.me/joinchat/A9q4ZwQfYtjvvX6MfAIezw", "sort_order": 5, "link_document": null, "pk": 9, "page": null}, {"link_page": null, "title": "H\\u00c4LYTYS", "link_external": "https://telegram.me/joinchat/A9q4ZwQeL8YWZ6JVd_BDWw", "sort_order": 6, "link_document": null, "pk": 11, "page": null}], "title": "Miten liityn tilajakamon kanaville?", "seo_title": "", "slug": "miten-liityn-tilajakamon-kanaville", "live": true, "has_unpublished_changes": true, "public": false, "body": "<p>Tilajakamolla on k\\u00e4yt\\u00f6ss\\u00e4\\u00e4n useita kanavia eri tarkoituksiin.\\u00a0</p><p>Yleisen kanavan seuraaminen ei ole pakollista tai sen voi pit\\u00e4\\u00e4 mykistettyn\\u00e4. Osa kanavista on vain informaation jakamista varten eik\\u00e4 niill\\u00e4 ole tarkoitus k\\u00e4yd\\u00e4 keskustelua. Toisissa keskustelu on varattu tietyn aihepiirin ymp\\u00e4rille.<br/></p><p>Yleisen kanavan voi laittaa \\u00e4\\u00e4nett\\u00f6m\\u00e4lle (mute), jos haluaa vain seurata vain joitakin kanavia tai ryhmi\\u00e4.</p><p></p><ul><li>Tilajakamo (yleinen): Yhteis\\u00f6llinen ja yleinen keskustelu</li><li>Tilajakamo tiedottaa: T\\u00e4rkeille tiedotteille (ei kommentointia)</li><li>Tilajakamo tapahtumat: Tietoa tapahtumista (ei kommentointia)</li><li>Tilajakamon saneeraustyhm\\u00e4: Keskustelua muutos- ja kunnostust\\u00f6ist\\u00e4</li><li>Tilajakamon talkoot: Tiedotteita talkoista (ei kommentointia)</li><li>Tilajakamon ehdotukset: ehdotuksia hallitukselle (ei kommentointia)</li><li>Tilajakamon OMV: Osta-Myy-Vaihda-Lahjoita palsta!</li><li>Tilajakamon netti: korjauspyynt\\u00f6j\\u00e4 nettiongelmiin (ei kommentointia)</li><li>Tilajakamon huolto: toiveita esim. koskien valaistusta tai lukkoja yms. pieniin huoltotoimiin \\u00a0(ei kommentointia)</li><li>Tilajakamon siivous: toiveita ylim\\u00e4\\u00e4r\\u00e4isest\\u00e4 siivouksesta (ei kommentointia)</li><li>Tilajakamon H\\u00c4LYTYS: SOS VIESTI AKUUTTISSA H\\u00c4T\\u00c4TAPAUKSESSA (kuten vesivahinko) johon ei v\\u00e4litt\\u00f6m\\u00e4sti tarvita poliisia tai palokuntaa (ei kommentointia)</li></ul><p></p><p>Voit liitty\\u00e4 seuraamaan kanavia klikkaamalla alla olevia linkkej\\u00e4.</p><p></p><p></p><li></li><li></li><li></li><li></li>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040005", "url_path": "/home/tilajakamo/ukk/miten-liityn-tilajakamon-kanaville/", "expired": false, "pk": 195, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 195}, {"pk": null, "tag": 6, "content_object": 195}], "depth": 5, "first_published_at": "2016-02-18T09:23:16.218Z", "expire_at": null}	\N	195	1
67	f	2016-02-18 10:04:24.829677+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T09:35:54.499Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "Miten yksityisviestin Telegramillaa?", "seo_title": "", "slug": "miten-yksityisviestin-telegramillaa", "live": false, "has_unpublished_changes": true, "public": true, "body": "<p>Kaikkea keskustelua ei tarvitse k\\u00e4yd\\u00e4 yleisille kanavilla. Yksityisviestej\\u00e4 voivat l\\u00e4hetell\\u00e4 k\\u00e4ytt\\u00e4j\\u00e4t, jotka jakavat puhelinnumeron yhteystiedoissaan tai k\\u00e4ytt\\u00e4j\\u00e4t joilla on Telegramin julkinen @k\\u00e4ytt\\u00e4j\\u00e4tunnus. Samoissa ryhmiss\\u00e4 olevat voivat laittaa viestej\\u00e4 kontakti-tiedon kautta.</p><p>Klikkaa samalla kanavalla olevan henkil\\u00f6n nime\\u00e4 joko chatissa tai ryhm\\u00e4n Info-sivulla olevasta listasta.\\u00a0</p><p>Maciss\\u00e4 viesti l\\u00e4hetet\\u00e4\\u00e4n Send message -linkist\\u00e4.</p><p><embed alt=\\"YV-mac\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"52\\"/><br/></p><p>Windows-koneissa viesti l\\u00e4hetet\\u00e4\\u00e4n puhekupla-ikonista.</p><p><embed alt=\\"YV-pc\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"53\\"/><br/></p><p>Puhelimissa kontatin sivulle p\\u00e4\\u00e4see klikkaamalla henkil\\u00f6n kuvaketta.</p><p><br/></p><p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040006", "url_path": "/home/tilajakamo/ukk/miten-kaytan-telegramia/", "expired": false, "pk": 196, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 196}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	196	1
57	f	2016-02-18 09:02:40.840305+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T08:46:16.140Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Telegram", "link_external": "https://telegram.org/", "sort_order": 0, "link_document": null, "pk": 4, "page": 193}], "title": "Mik\\u00e4 on Telegram?", "seo_title": "", "slug": "mika-telegram", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Osuuskunta k\\u00e4ytt\\u00e4\\u00e4 j\\u00e4senten kommunikaatioon Telegram chattia, jotta tieto liikkuisi tehokkaasti.\\u00a0<br/></p><p>Telegram mahdollistaa nopean kommunikaation milloin ja\\u00a0 miss\\u00e4 tahansa puhelimessa ja tietokoneessa, jossa on nettiyhteys. Samat viestit n\\u00e4kyv\\u00e4t kaikissa laitteissa ja viestint\\u00e4 arkistoituu automaattisesti.</p><p>Telegram ottaa k\\u00e4ytt\\u00e4jien yksityisyyden ja tietosuojan vakavasti. K\\u00e4ytt\\u00e4jien tietoja ei levi\\u00e4 tahattomasti ja tarvittaessa keskustelu voi olla my\\u00f6s salattua.</p><p>Sit\\u00e4 kautta voi jakaa my\\u00f6s tiedostoja, jotka tallentuvat samalla my\\u00f6s nettiin.\\u00a0</p><p>Lis\\u00e4ksi siihen on mahdollista kehitt\\u00e4\\u00e4 omia lis\\u00e4ominaisuuksia ja se on t\\u00e4ysin ilmainen.</p><p><br/></p><p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040003", "url_path": "/home/tilajakamo/ukk/mika-telegram/", "expired": false, "pk": 193, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 193}], "depth": 5, "first_published_at": "2016-02-18T08:46:16.160Z", "expire_at": null}	\N	193	1
68	f	2016-02-18 10:06:03.661031+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T09:02:40.840Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Telegram", "link_external": "https://telegram.org/", "sort_order": 0, "link_document": null, "pk": 4, "page": 193}], "title": "Mik\\u00e4 on Telegram?", "seo_title": "", "slug": "mika-telegram", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Osuuskunta k\\u00e4ytt\\u00e4\\u00e4 j\\u00e4senten kommunikaatioon Telegram chattia, jotta tieto liikkuisi tehokkaasti. Telegramin k\\u00e4ytt\\u00f6\\u00f6n on helppo omaksua.<br/></p><p>Telegram mahdollistaa nopean kommunikaation milloin ja\\u00a0 miss\\u00e4 tahansa puhelimessa ja tietokoneessa, jossa on nettiyhteys. Samat viestit n\\u00e4kyv\\u00e4t kaikissa laitteissa ja viestint\\u00e4 arkistoituu automaattisesti.</p><p>Telegram ottaa k\\u00e4ytt\\u00e4jien yksityisyyden ja tietosuojan vakavasti. K\\u00e4ytt\\u00e4jien tietoja ei levi\\u00e4 tahattomasti ja tarvittaessa keskustelu voi olla my\\u00f6s salattua. Telegram ei ole kytk\\u00f6ksiss\\u00e4 mihink\\u00e4\\u00e4n isoon toimijaan kuten Applen, Googleen, Microsoftiin tai Facebookiin.</p><p>Sit\\u00e4 kautta voi jakaa my\\u00f6s tiedostoja, jotka tallentuvat samalla my\\u00f6s nettiin.\\u00a0</p><p>Lis\\u00e4ksi siihen on mahdollista kehitt\\u00e4\\u00e4 omia lis\\u00e4ominaisuuksia ja se on t\\u00e4ysin ilmainen.</p><p><br/></p><p><br/></p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040003", "url_path": "/home/tilajakamo/ukk/mika-telegram/", "expired": false, "pk": 193, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 193}], "depth": 5, "first_published_at": "2016-02-18T08:46:16.160Z", "expire_at": null}	\N	193	1
84	f	2016-02-18 13:02:36.94159+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T13:02:25.849Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "Pit\\u00e4\\u00e4 oma irtaimisto vakuuttaa?", "seo_title": "", "slug": "pitaa-oma-irtaimisto-vakuuttaa", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Kannattaa tarkistaa meneek\\u00f6 ty\\u00f6huoneen irtaimisto pelk\\u00e4ll\\u00e4 ilmoituksella esim. laajennetun kotivakuutuksen piiriin. Ellei niin vahinko- ja varkausvakuutus on paikallaan varmuuden vuoksi.</p><p>Osuuskunta on ottanut vahinko- ja vastuuvakuutuksen rakennuksen sek\\u00e4 talkoot\\u00f6iden osalta, mutta osuuskuntalaisten omaisuuden vakuuttaminen ei sen kautta ole mahdollista.</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000G", "url_path": "/home/tilajakamo/ukk/pitaa-oma-irtaimisto-vakuuttaa/", "expired": false, "pk": 206, "locked": false, "tagged_items": [{"pk": null, "tag": 2, "content_object": 206}], "depth": 5, "first_published_at": "2016-02-18T13:02:25.868Z", "expire_at": null}	\N	206	1
83	f	2016-02-18 13:02:25.849247+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Pit\\u00e4\\u00e4 oma irtaimisto vakuuttaa?", "seo_title": "", "slug": "pitaa-oma-irtaimisto-vakuuttaa", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Kannattaa tarkistaa meneek\\u00f6 ty\\u00f6huoneen irtaimisto pelk\\u00e4ll\\u00e4 ilmoituksella esim. laajennetun kotivakuutuksen piiriin. Ellei niin vahinko- ja varkausvakuutus on paikallaan varmuuden vuoksi.</p><p>Osuuskunta on ottanut vahinko- ja vastuuvakuutuksen rakennuksen sek\\u00e4 talkoot\\u00f6iden osalta, mutta osuuskuntalaisten omaisuuden vakuuttaminen ei sen kautta ole mahdollista.</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000G", "url_path": "/home/tilajakamo/ukk/pitaa-oma-irtaimisto-vakuuttaa/", "expired": false, "pk": 206, "locked": false, "tagged_items": [], "depth": 5, "first_published_at": null, "expire_at": null}	\N	206	1
59	f	2016-02-18 09:20:54.129082+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T09:16:16.706Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Tilajakamo tiedottaa", "link_external": "https://telegram.me/tilajakamotiedottaa", "sort_order": 0, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon tapahtumat", "link_external": "https://telegram.me/tilajakamontapahtumat", "sort_order": 1, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon saneerauskanava", "link_external": "https://telegram.me/joinchat/BphCMgQazU_AHOwzY_HPHg", "sort_order": 2, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon OMV", "link_external": "https://telegram.me/joinchat/A9q4ZwQfYtjvvX6MfAIezw", "sort_order": 3, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon talkoot", "link_external": "https://telegram.me/tilajakamontalkoot", "sort_order": 4, "link_document": null, "pk": null, "page": 195}], "title": "Miten liityn tilajakamon kanaville?", "seo_title": "", "slug": "miten-liityn-tilajakamon-kanaville", "live": false, "has_unpublished_changes": true, "public": true, "body": "<p>Tilajakamolla on k\\u00e4yt\\u00f6ss\\u00e4\\u00e4n useita kanavia eri tarkoituksiin, koska yleinen kanava on tarkoitettu yhteis\\u00f6lliseen rupatteluun eik\\u00e4 sen seuraaminen on pakollista, jotta pysyisi tilanteen tasalla. Osa kanavista on vain informaatiota varten eik\\u00e4 niill\\u00e4 ole tarkoitus k\\u00e4yd\\u00e4 keskustelua.\\u00a0</p><p>Yleisen kanavan voi laittaa \\u00e4\\u00e4nett\\u00f6m\\u00e4lle (mute), jos haluaa vain seurata vain joitakin kanavia tai ryhmi\\u00e4.</p><p></p><ul><li>Tilajakamo tiedottaa: T\\u00e4rkeille tiedotteille (ei kommentointia)</li><li>Tilajakamo tapahtumat: Tietoa tapahtumista (ei kommentointia)</li><li>Tilajakamon saneeraustyhm\\u00e4: Keskustelua muutos- ja kunnostust\\u00f6ist\\u00e4</li><li>Tilajakamon talkoot: Tiedotteita talkoista (ei kommentointia)</li><li>Tilajakamon ehdotukset: ehdotuksia hallitukselle (ei kommentointia)</li><li>Tilajakamon OMV: Osta-Myy-Vaihda-Lahjoita palsta!</li><li>Tilajakamon netti: korjauspyynt\\u00f6j\\u00e4 nettiongelmiin (ei kommentointia)</li><li>Tilajakamon huolto: toiveita esim. koskien valaistusta tai lukkoja yms. pieniin huoltotoimiin \\u00a0(ei kommentointia)</li><li>Tilajakamon siivous: toiveita ylim\\u00e4\\u00e4r\\u00e4isest\\u00e4 siivouksesta (ei kommentointia)</li><li>Tilajakamon H\\u00c4LYTYS: SOS VIESTI AKUUTTISSA H\\u00c4T\\u00c4TAPAUKSESSA (kuten vesivahinko) johon ei v\\u00e4litt\\u00f6m\\u00e4sti tarvita poliisia tai palokuntaa (ei kommentointia)</li></ul><p><br/></p><p><p>\\t\\"talkookanava\\":\\"klikkaa -&gt; https://telegram.me/tilajakamontalkoot\\",</p><p>\\t\\"tapahtumakanava\\":\\"klikkaa -&gt; https://telegram.me/tilajakamontapahtumat\\",</p><p>\\t\\"saneerauskanava\\":\\"klikkaa -&gt; https://telegram.me/joinchat/BphCMgQazU_AHOwzY_HPHg\\",</p><p>\\t\\"ostomyyntivaihto\\":\\"klikkaa -&gt; https://telegram.me/joinchat/A9q4ZwQfYtjvvX6MfAIezw\\",</p><p>\\t\\"tiedotteet\\":\\"klikkaa -&gt; https://telegram.me/tilajakamotiedottaa\\",</p></p><p></p><li></li><li></li><li></li><li></li>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040005", "url_path": "/home/tilajakamo/ukk/miten-liityn-tilajakamon-kanaville/", "expired": false, "pk": 195, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 195}, {"pk": null, "tag": 6, "content_object": 195}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	195	1
61	f	2016-02-18 09:23:16.173972+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T09:22:15.454Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Tilajakamo tiedottaa", "link_external": "https://telegram.me/tilajakamotiedottaa", "sort_order": 0, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon tapahtumat", "link_external": "https://telegram.me/tilajakamontapahtumat", "sort_order": 1, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon saneerauskanava", "link_external": "https://telegram.me/joinchat/BphCMgQazU_AHOwzY_HPHg", "sort_order": 2, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon OMV", "link_external": "https://telegram.me/joinchat/A9q4ZwQfYtjvvX6MfAIezw", "sort_order": 3, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon talkoot", "link_external": "https://telegram.me/tilajakamontalkoot", "sort_order": 4, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "H\\u00c4LYTYS", "link_external": "https://telegram.me/joinchat/A9q4ZwQeL8YWZ6JVd_BDWw", "sort_order": 5, "link_document": null, "pk": null, "page": 195}], "title": "Miten liityn tilajakamon kanaville?", "seo_title": "", "slug": "miten-liityn-tilajakamon-kanaville", "live": false, "has_unpublished_changes": true, "public": true, "body": "<p>Tilajakamolla on k\\u00e4yt\\u00f6ss\\u00e4\\u00e4n useita kanavia eri tarkoituksiin, koska yleinen kanava on tarkoitettu yhteis\\u00f6lliseen rupatteluun eik\\u00e4 sen seuraaminen on pakollista, jotta pysyisi tilanteen tasalla. Osa kanavista on vain informaation jakamista varten eik\\u00e4 niill\\u00e4 ole tarkoitus k\\u00e4yd\\u00e4 keskustelua. Toisissa keskustelu on varattu tietyn aihepiirin ymp\\u00e4rille.</p><p>Yleisen kanavan voi laittaa \\u00e4\\u00e4nett\\u00f6m\\u00e4lle (mute), jos haluaa vain seurata vain joitakin kanavia tai ryhmi\\u00e4.</p><p></p><ul><li>Tilajakamo tiedottaa: T\\u00e4rkeille tiedotteille (ei kommentointia)</li><li>Tilajakamo tapahtumat: Tietoa tapahtumista (ei kommentointia)</li><li>Tilajakamon saneeraustyhm\\u00e4: Keskustelua muutos- ja kunnostust\\u00f6ist\\u00e4</li><li>Tilajakamon talkoot: Tiedotteita talkoista (ei kommentointia)</li><li>Tilajakamon ehdotukset: ehdotuksia hallitukselle (ei kommentointia)</li><li>Tilajakamon OMV: Osta-Myy-Vaihda-Lahjoita palsta!</li><li>Tilajakamon netti: korjauspyynt\\u00f6j\\u00e4 nettiongelmiin (ei kommentointia)</li><li>Tilajakamon huolto: toiveita esim. koskien valaistusta tai lukkoja yms. pieniin huoltotoimiin \\u00a0(ei kommentointia)</li><li>Tilajakamon siivous: toiveita ylim\\u00e4\\u00e4r\\u00e4isest\\u00e4 siivouksesta (ei kommentointia)</li><li>Tilajakamon H\\u00c4LYTYS: SOS VIESTI AKUUTTISSA H\\u00c4T\\u00c4TAPAUKSESSA (kuten vesivahinko) johon ei v\\u00e4litt\\u00f6m\\u00e4sti tarvita poliisia tai palokuntaa (ei kommentointia)</li></ul><p></p><p>Voit liitty\\u00e4 seuraamaan kanavia klikkaamalla alla olevia linkkej\\u00e4.</p><p></p><p></p><li></li><li></li><li></li><li></li>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040005", "url_path": "/home/tilajakamo/ukk/miten-liityn-tilajakamon-kanaville/", "expired": false, "pk": 195, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 195}, {"pk": null, "tag": 6, "content_object": 195}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	195	1
60	f	2016-02-18 09:22:15.454812+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T09:20:54.129Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Tilajakamo tiedottaa", "link_external": "https://telegram.me/tilajakamotiedottaa", "sort_order": 0, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon tapahtumat", "link_external": "https://telegram.me/tilajakamontapahtumat", "sort_order": 1, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon saneerauskanava", "link_external": "https://telegram.me/joinchat/BphCMgQazU_AHOwzY_HPHg", "sort_order": 2, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon OMV", "link_external": "https://telegram.me/joinchat/A9q4ZwQfYtjvvX6MfAIezw", "sort_order": 3, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamon talkoot", "link_external": "https://telegram.me/tilajakamontalkoot", "sort_order": 4, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "H\\u00c4LYTYS", "link_external": "https://telegram.me/joinchat/A9q4ZwQeL8YWZ6JVd_BDWw", "sort_order": 5, "link_document": null, "pk": null, "page": 195}], "title": "Miten liityn tilajakamon kanaville?", "seo_title": "", "slug": "miten-liityn-tilajakamon-kanaville", "live": false, "has_unpublished_changes": true, "public": true, "body": "<p>Tilajakamolla on k\\u00e4yt\\u00f6ss\\u00e4\\u00e4n useita kanavia eri tarkoituksiin, koska yleinen kanava on tarkoitettu yhteis\\u00f6lliseen rupatteluun eik\\u00e4 sen seuraaminen on pakollista, jotta pysyisi tilanteen tasalla. Osa kanavista on vain informaatiota varten eik\\u00e4 niill\\u00e4 ole tarkoitus k\\u00e4yd\\u00e4 keskustelua.\\u00a0</p><p>Yleisen kanavan voi laittaa \\u00e4\\u00e4nett\\u00f6m\\u00e4lle (mute), jos haluaa vain seurata vain joitakin kanavia tai ryhmi\\u00e4.</p><p></p><ul><li>Tilajakamo tiedottaa: T\\u00e4rkeille tiedotteille (ei kommentointia)</li><li>Tilajakamo tapahtumat: Tietoa tapahtumista (ei kommentointia)</li><li>Tilajakamon saneeraustyhm\\u00e4: Keskustelua muutos- ja kunnostust\\u00f6ist\\u00e4</li><li>Tilajakamon talkoot: Tiedotteita talkoista (ei kommentointia)</li><li>Tilajakamon ehdotukset: ehdotuksia hallitukselle (ei kommentointia)</li><li>Tilajakamon OMV: Osta-Myy-Vaihda-Lahjoita palsta!</li><li>Tilajakamon netti: korjauspyynt\\u00f6j\\u00e4 nettiongelmiin (ei kommentointia)</li><li>Tilajakamon huolto: toiveita esim. koskien valaistusta tai lukkoja yms. pieniin huoltotoimiin \\u00a0(ei kommentointia)</li><li>Tilajakamon siivous: toiveita ylim\\u00e4\\u00e4r\\u00e4isest\\u00e4 siivouksesta (ei kommentointia)</li><li>Tilajakamon H\\u00c4LYTYS: SOS VIESTI AKUUTTISSA H\\u00c4T\\u00c4TAPAUKSESSA (kuten vesivahinko) johon ei v\\u00e4litt\\u00f6m\\u00e4sti tarvita poliisia tai palokuntaa (ei kommentointia)</li></ul><p><br/></p><p></p><p>Voit liitty\\u00e4 seuraamaan kanavia klikkaamalla alla olevia linkkej\\u00e4.</p><p></p><p></p><li></li><li></li><li></li><li></li>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040005", "url_path": "/home/tilajakamo/ukk/miten-liityn-tilajakamon-kanaville/", "expired": false, "pk": 195, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 195}, {"pk": null, "tag": 6, "content_object": 195}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	195	1
85	f	2016-02-18 13:03:39.325774+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Mist\\u00e4 l\\u00f6ytyy netti?", "seo_title": "", "slug": "mista-loytyy-netti", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Osassa huoneissa on nettikaapelointi ja eri puolille rakennusta on sijoitettu wlan-tukiasemia, joiden salasana on 'avohoidossa'</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000H", "url_path": "/home/tilajakamo/ukk/mista-loytyy-netti/", "expired": false, "pk": 207, "locked": false, "tagged_items": [{"pk": 41, "tag": 12, "content_object": 207}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	207	1
62	f	2016-02-18 09:29:09.565082+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T09:23:16.173Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Tilajakamo", "link_external": "https://telegram.me/joinchat/BIHxAgNPTAtjxHVzkdpcUw", "sort_order": 0, "link_document": null, "pk": null, "page": 195}, {"link_page": null, "title": "Tilajakamo tiedottaa", "link_external": "https://telegram.me/tilajakamotiedottaa", "sort_order": 1, "link_document": null, "pk": 6, "page": 195}, {"link_page": null, "title": "Tilajakamon tapahtumat", "link_external": "https://telegram.me/tilajakamontapahtumat", "sort_order": 2, "link_document": null, "pk": 7, "page": 195}, {"link_page": null, "title": "Tilajakamon saneerauskanava", "link_external": "https://telegram.me/joinchat/BphCMgQazU_AHOwzY_HPHg", "sort_order": 3, "link_document": null, "pk": 8, "page": 195}, {"link_page": null, "title": "Tilajakamon talkoot", "link_external": "https://telegram.me/tilajakamontalkoot", "sort_order": 4, "link_document": null, "pk": 10, "page": 195}, {"link_page": null, "title": "Tilajakamon OMV", "link_external": "https://telegram.me/joinchat/A9q4ZwQfYtjvvX6MfAIezw", "sort_order": 5, "link_document": null, "pk": 9, "page": 195}, {"link_page": null, "title": "H\\u00c4LYTYS", "link_external": "https://telegram.me/joinchat/A9q4ZwQeL8YWZ6JVd_BDWw", "sort_order": 6, "link_document": null, "pk": 11, "page": 195}], "title": "Miten liityn tilajakamon kanaville?", "seo_title": "", "slug": "miten-liityn-tilajakamon-kanaville", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Tilajakamolla on k\\u00e4yt\\u00f6ss\\u00e4\\u00e4n useita kanavia eri tarkoituksiin.\\u00a0</p><p>Yleiselle kanavalle voi liitty\\u00e4 vain kutsuttuna. \\u00a0</p><p>koska yleinen kanava on tarkoitettu yhteis\\u00f6lliseen rupatteluun eik\\u00e4 sen seuraaminen on pakollista, jotta pysyisi tilanteen tasalla. Osa kanavista on vain informaation jakamista varten eik\\u00e4 niill\\u00e4 ole tarkoitus k\\u00e4yd\\u00e4 keskustelua. Toisissa keskustelu on varattu tietyn aihepiirin ymp\\u00e4rille.</p><p>Yleisen kanavan voi laittaa \\u00e4\\u00e4nett\\u00f6m\\u00e4lle (mute), jos haluaa vain seurata vain joitakin kanavia tai ryhmi\\u00e4.</p><p></p><ul><li>Tilajakamo tiedottaa: T\\u00e4rkeille tiedotteille (ei kommentointia)</li><li>Tilajakamo tapahtumat: Tietoa tapahtumista (ei kommentointia)</li><li>Tilajakamon saneeraustyhm\\u00e4: Keskustelua muutos- ja kunnostust\\u00f6ist\\u00e4</li><li>Tilajakamon talkoot: Tiedotteita talkoista (ei kommentointia)</li><li>Tilajakamon ehdotukset: ehdotuksia hallitukselle (ei kommentointia)</li><li>Tilajakamon OMV: Osta-Myy-Vaihda-Lahjoita palsta!</li><li>Tilajakamon netti: korjauspyynt\\u00f6j\\u00e4 nettiongelmiin (ei kommentointia)</li><li>Tilajakamon huolto: toiveita esim. koskien valaistusta tai lukkoja yms. pieniin huoltotoimiin \\u00a0(ei kommentointia)</li><li>Tilajakamon siivous: toiveita ylim\\u00e4\\u00e4r\\u00e4isest\\u00e4 siivouksesta (ei kommentointia)</li><li>Tilajakamon H\\u00c4LYTYS: SOS VIESTI AKUUTTISSA H\\u00c4T\\u00c4TAPAUKSESSA (kuten vesivahinko) johon ei v\\u00e4litt\\u00f6m\\u00e4sti tarvita poliisia tai palokuntaa (ei kommentointia)</li></ul><p></p><p>Voit liitty\\u00e4 seuraamaan kanavia klikkaamalla alla olevia linkkej\\u00e4.</p><p></p><p></p><li></li><li></li><li></li><li></li>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040005", "url_path": "/home/tilajakamo/ukk/miten-liityn-tilajakamon-kanaville/", "expired": false, "pk": 195, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 195}, {"pk": null, "tag": 6, "content_object": 195}], "depth": 5, "first_published_at": "2016-02-18T09:23:16.218Z", "expire_at": null}	\N	195	1
69	f	2016-02-18 10:12:46.019281+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2016-02-18T09:34:48.088Z", "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Tilajakamo (yleinen)", "link_external": "https://telegram.me/joinchat/BIHxAgNPTAtjxHVzkdpcUw", "sort_order": 0, "link_document": null, "pk": 12, "page": 195}, {"link_page": null, "title": "Tilajakamo tiedottaa", "link_external": "https://telegram.me/tilajakamotiedottaa", "sort_order": 1, "link_document": null, "pk": 6, "page": 195}, {"link_page": null, "title": "Tilajakamon tapahtumat", "link_external": "https://telegram.me/tilajakamontapahtumat", "sort_order": 2, "link_document": null, "pk": 7, "page": 195}, {"link_page": null, "title": "Tilajakamon saneerauskanava", "link_external": "https://telegram.me/joinchat/BphCMgQazU_AHOwzY_HPHg", "sort_order": 3, "link_document": null, "pk": 8, "page": 195}, {"link_page": null, "title": "Tilajakamon talkoot", "link_external": "https://telegram.me/tilajakamontalkoot", "sort_order": 4, "link_document": null, "pk": 10, "page": 195}, {"link_page": null, "title": "Tilajakamon OMV", "link_external": "https://telegram.me/joinchat/A9q4ZwQfYtjvvX6MfAIezw", "sort_order": 5, "link_document": null, "pk": 9, "page": 195}, {"link_page": null, "title": "H\\u00c4LYTYS", "link_external": "https://telegram.me/joinchat/A9q4ZwQeL8YWZ6JVd_BDWw", "sort_order": 6, "link_document": null, "pk": 11, "page": 195}], "title": "Miten liityn tilajakamon kanaville?", "seo_title": "", "slug": "miten-liityn-tilajakamon-kanaville", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Tilajakamolla on k\\u00e4yt\\u00f6ss\\u00e4\\u00e4n useita kanavia eri tarkoituksiin.\\u00a0</p><p>Yleisen kanavan seuraaminen ei ole pakollista tai sen voi pit\\u00e4\\u00e4 mykistettyn\\u00e4. Osa kanavista on vain informaation jakamista varten, koska muuten t\\u00e4rke\\u00e4t ilmoitukset saattavat hukkua keskusteluun. Toisissa keskustelu on avoin, mutta varattu tietyn aihepiirin ymp\\u00e4rille.<br/></p><p>Yleisen kanavan voi laittaa \\u00e4\\u00e4nett\\u00f6m\\u00e4lle (mute), jos haluaa vain seurata vain joitakin kanavia tai ryhmi\\u00e4.</p><p></p><ul><li>Tilajakamo (<b>yleinen</b>): Yhteis\\u00f6llinen ja yleinen keskustelu</li><li>Tilajakamo <b>tiedottaa</b>: T\\u00e4rkeille tiedotteille (ei kommentointia)</li><li>Tilajakamo <b>tapahtumat</b>: Tietoa tapahtumista (ei kommentointia)</li><li>Tilajakamon <b>saneeraustyhm\\u00e4</b>: Keskustelua muutos- ja kunnostust\\u00f6ist\\u00e4</li><li>Tilajakamon <b>talkoot</b>: Tiedotteita talkoista (ei kommentointia)</li><li>Tilajakamon <b>ehdotukset</b>: ehdotuksia hallitukselle (ei kommentointia)</li><li>Tilajakamon <b>OMV</b>: Osta-Myy-Vaihda-Lahjoita palsta!</li><li>Tilajakamon <b>netti</b>: korjauspyynt\\u00f6j\\u00e4 nettiongelmiin (ei kommentointia)</li><li>Tilajakamon <b>huolto</b>: toiveita esim. koskien valaistusta tai lukkoja yms. pieniin huoltotoimiin \\u00a0(ei kommentointia)</li><li>Tilajakamon siivous: toiveita ylim\\u00e4\\u00e4r\\u00e4isest\\u00e4 siivouksesta (ei kommentointia)</li><li>Tilajakamon H\\u00c4LYTYS: SOS VIESTI AKUUTTISSA H\\u00c4T\\u00c4TAPAUKSESSA (kuten vesivahinko) johon ei v\\u00e4litt\\u00f6m\\u00e4sti tarvita poliisia tai palokuntaa (ei kommentointia)</li></ul><p></p><p>Voit liitty\\u00e4 seuraamaan kanavia klikkaamalla alla olevia linkkej\\u00e4.</p><p><br/></p><p></p><p></p><li></li><li></li><li></li><li></li>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "00010001000100040005", "url_path": "/home/tilajakamo/ukk/miten-liityn-tilajakamon-kanaville/", "expired": false, "pk": 195, "locked": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 195}, {"pk": null, "tag": 6, "content_object": 195}], "depth": 5, "first_published_at": "2016-02-18T09:23:16.218Z", "expire_at": null}	\N	195	1
86	f	2016-02-18 13:06:02.692529+00	{"advert_placements": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [{"link_page": null, "title": "Holvi Shop", "link_external": "https://holvi.com/shop/tilajakamo2016", "sort_order": 0, "link_document": null, "pk": 19, "page": 208}], "title": "Mik\\u00e4 ihmeen Holvi?", "seo_title": "", "slug": "mika-ihmeen-holvi", "live": true, "has_unpublished_changes": false, "public": false, "body": "<p>Holvi on suomalainen nettipankki, jossa on my\\u00f6s verkkokauppa ja kirjanpito-ominaisuudet. Osuuskunnan palveluita myyd\\u00e4\\u00e4n sit\\u00e4 kautta ja my\\u00f6s vuokran maksu menee sit\\u00e4 kautta. Osuuskunnan budjetti on avoimesti n\\u00e4ht\\u00e4viss\\u00e4 Holvissa.</p>", "numchild": 0, "content_type": 25, "show_in_menus": false, "path": "0001000100010004000I", "url_path": "/home/tilajakamo/ukk/mika-ihmeen-holvi/", "expired": false, "pk": 208, "locked": false, "tagged_items": [{"pk": 42, "tag": 2, "content_object": 208}], "depth": 5, "first_published_at": null, "expire_at": null}	\N	208	1
90	f	2016-02-18 13:45:45.468641+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n.\\u00a0</p>", "latest_revision_created_at": "2016-02-18T08:05:02.563Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "YLEIST\\u00c4", "seo_title": "", "slug": "yleista", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n. Joulukuussa 2015 osuuskunta p\\u00e4\\u00e4tyi yli kaksi vuotta kest\\u00e4neiden neuvotteluiden j\\u00e4lkeen vuokraamaan puolet Lapinlahden sairaalan tiloista.</p><p>Osuuskunnassa on reilut 100 j\\u00e4sent\\u00e4, kuvataiteilijoita, valokuvaajia, musiikintekij\\u00f6it\\u00e4, k\\u00e4sity\\u00f6l\\u00e4isi\\u00e4, yritt\\u00e4ji\\u00e4 ja tutkijoita, joista noin puolet on saanut ty\\u00f6tiloja Lapinlahdesta.\\u00a0</p><p>Vuonna 1841 C. L. Engelin suunnittelema mielisairaalaksi rakennettu Lapinlahden sairaala on ollut osin tyhjill\\u00e4\\u00e4n sen j\\u00e4lkeen kun sairaalatoiminta loppui vuonna 2008. Osuuskunnan toissijainen tavoite on arkkitehtuurillisesti merkitt\\u00e4v\\u00e4n historiallisen rakennuksen suojeleminen aktiivisella k\\u00e4yt\\u00f6ll\\u00e4.</p><p>Suunnitelmissa on avata Lapinlahti my\\u00f6s ulkopuolisille. Yleisiin tiloihin on kaavailtu kahvilaa, n\\u00e4yttelyit\\u00e4 ja myym\\u00e4l\\u00e4tiloja, ruokasaleihin ravintolaa ja sairaalan laitoskeitti\\u00f6\\u00f6n osuuskunnallista keitti\\u00f6toimintaa. My\\u00f6s piha-alueilla ja puistossa alkaa kev\\u00e4\\u00e4n mittaan tapahtua \\u2014 osuuskunnan organisoima telttasauna on jo avoinna perjantaisin ja lauantaisin.</p><p>Lapinlahden sairaalaan tehd\\u00e4\\u00e4n vuoden 2016 -2017 Helsingin kaupungin toimesta remonttia ikkunoiden ja julkisivun kohentamiseksi sek\\u00e4 vaurioiden korjaamiseksi. T\\u00e4ll\\u00e4 hetkell\\u00e4 suurin osa sis\\u00e4tiloista on hyv\\u00e4ss\\u00e4 kunnossa, mutta l\\u00e4hes jokainen tila tarvitsee jonkin asteista remontointia. Sairaala on suojeltu rakennus, joten kaiken remontoinnin tulee olla museoviraston antamien ohjeiden mukaista. Kunnostuksesta vastaa tilojen osuuskuntalainen, mutta yleisten tilojen remontointi on yhteis\\u00f6n vastuulla.</p><p>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n</p><p>Ensimm\\u00e4iset osuuskuntalaiset muuttivat sairaalaan vuoden 2016 alussa jai tilat on jo varattu. Vuoden 2016 aikana tavoitteena on remontoida tiloja ja jatkaa osuuskunnan p\\u00e4\\u00e4tavoitteena olevaa kaupungin kehitt\\u00e4minen. Osuuskunta etsii edelleen uusia vastaavia tiloja kaupungista.</p>", "numchild": 0, "content_type": 14, "show_in_menus": true, "path": "0001000100010009", "url_path": "/home/tilajakamo/yleista/", "expired": false, "pk": 186, "locked": false, "depth": 4, "first_published_at": "2016-02-10T17:05:20.712Z", "expire_at": null}	\N	186	1
91	f	2016-02-18 13:46:55.731281+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n.\\u00a0</p>", "latest_revision_created_at": "2016-02-18T13:45:45.468Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "YLEIST\\u00c4", "seo_title": "", "slug": "yleista", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n. Joulukuussa 2015 osuuskunta p\\u00e4\\u00e4tyi yli kaksi vuotta kest\\u00e4neiden neuvotteluiden j\\u00e4lkeen vuokraamaan puolet Lapinlahden sairaalan tiloista.</p><p>Osuuskunnassa on reilut 100 j\\u00e4sent\\u00e4, kuvataiteilijoita, valokuvaajia, musiikintekij\\u00f6it\\u00e4, k\\u00e4sity\\u00f6l\\u00e4isi\\u00e4, yritt\\u00e4ji\\u00e4 ja tutkijoita, joista noin puolet on saanut ty\\u00f6tiloja Lapinlahdesta.\\u00a0</p><p>Vuonna 1841 C. L. Engelin suunnittelema mielisairaalaksi rakennettu Lapinlahden sairaala on ollut osin tyhjill\\u00e4\\u00e4n sen j\\u00e4lkeen kun sairaalatoiminta loppui vuonna 2008. Osuuskunnan toissijainen tavoite on arkkitehtuurillisesti merkitt\\u00e4v\\u00e4n historiallisen rakennuksen suojeleminen aktiivisella k\\u00e4yt\\u00f6ll\\u00e4.</p><p>Suunnitelmissa on avata Lapinlahti my\\u00f6s ulkopuolisille. Yleisiin tiloihin on kaavailtu kahvilaa, n\\u00e4yttelyit\\u00e4 ja myym\\u00e4l\\u00e4tiloja, ruokasaleihin ravintolaa ja sairaalan laitoskeitti\\u00f6\\u00f6n osuuskunnallista keitti\\u00f6toimintaa. My\\u00f6s piha-alueilla ja puistossa alkaa kev\\u00e4\\u00e4n mittaan tapahtua \\u2014 osuuskunnan organisoima telttasauna on jo avoinna perjantaisin ja lauantaisin.</p><p>Lapinlahden sairaalaan tehd\\u00e4\\u00e4n vuoden 2016 -2017 Helsingin kaupungin toimesta remonttia ikkunoiden ja julkisivun kohentamiseksi sek\\u00e4 vaurioiden korjaamiseksi. T\\u00e4ll\\u00e4 hetkell\\u00e4 suurin osa sis\\u00e4tiloista on hyv\\u00e4ss\\u00e4 kunnossa, mutta l\\u00e4hes jokainen tila tarvitsee jonkin asteista remontointia. Sairaala on suojeltu rakennus, joten kaiken remontoinnin tulee olla museoviraston antamien ohjeiden mukaista. Kunnostuksesta vastaa tilojen osuuskuntalainen, mutta yleisten tilojen remontointi on yhteis\\u00f6n vastuulla.</p><p>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n</p><p>Ensimm\\u00e4iset osuuskuntalaiset muuttivat sairaalaan vuoden 2016 alussa jai tilat on jo varattu. Vuoden 2016 aikana tavoitteena on remontoida tiloja ja jatkaa osuuskunnan p\\u00e4\\u00e4tavoitteena olevaa kaupungin kehitt\\u00e4minen. Osuuskunta etsii edelleen uusia vastaavia tiloja kaupungista.</p>", "numchild": 0, "content_type": 14, "show_in_menus": true, "path": "0001000100010009", "url_path": "/home/tilajakamo/yleista/", "expired": false, "pk": 186, "locked": false, "depth": 4, "first_published_at": "2016-02-10T17:05:20.712Z", "expire_at": null}	\N	186	1
93	f	2016-02-18 13:48:57.978385+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n.\\u00a0</p>", "latest_revision_created_at": "2016-02-18T13:48:29.919Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "YLEIST\\u00c4", "seo_title": "", "slug": "yleista", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n. Joulukuussa 2015 osuuskunta p\\u00e4\\u00e4tyi yli kaksi vuotta kest\\u00e4neiden neuvotteluiden j\\u00e4lkeen vuokraamaan puolet Lapinlahden sairaalan tiloista.</p><p>Osuuskunnassa on reilut 100 j\\u00e4sent\\u00e4, kuvataiteilijoita, valokuvaajia, musiikintekij\\u00f6it\\u00e4, k\\u00e4sity\\u00f6l\\u00e4isi\\u00e4, yritt\\u00e4ji\\u00e4 ja tutkijoita, joista noin puolet on saanut ty\\u00f6tiloja Lapinlahdesta.\\u00a0</p><p>Vuonna 1841 C. L. Engelin suunnittelema mielisairaalaksi rakennettu Lapinlahden sairaala on ollut osin tyhjill\\u00e4\\u00e4n sen j\\u00e4lkeen kun sairaalatoiminta loppui vuonna 2008. Osuuskunnan toissijainen tavoite on arkkitehtuurillisesti merkitt\\u00e4v\\u00e4n historiallisen rakennuksen suojeleminen aktiivisella k\\u00e4yt\\u00f6ll\\u00e4.</p><p>Suunnitelmissa on avata Lapinlahti my\\u00f6s ulkopuolisille. Yleisiin tiloihin on kaavailtu kahvilaa, n\\u00e4yttelyit\\u00e4 ja myym\\u00e4l\\u00e4tiloja, ruokasaleihin ravintolaa ja sairaalan laitoskeitti\\u00f6\\u00f6n osuuskunnallista keitti\\u00f6toimintaa. My\\u00f6s piha-alueilla ja puistossa alkaa kev\\u00e4\\u00e4n mittaan tapahtua \\u2014 osuuskunnan organisoima telttasauna on jo avoinna perjantaisin ja lauantaisin.</p><p>Lapinlahden sairaalaan tehd\\u00e4\\u00e4n vuoden 2016 -2017 Helsingin kaupungin toimesta remonttia ikkunoiden ja julkisivun kohentamiseksi sek\\u00e4 vaurioiden korjaamiseksi. T\\u00e4ll\\u00e4 hetkell\\u00e4 suurin osa sis\\u00e4tiloista on hyv\\u00e4ss\\u00e4 kunnossa, mutta l\\u00e4hes jokainen tila tarvitsee jonkin asteista remontointia. Sairaala on suojeltu rakennus, joten kaiken remontoinnin tulee olla museoviraston antamien ohjeiden mukaista. Kunnostuksesta vastaa tilojen osuuskuntalainen, mutta yleisten tilojen remontointi on yhteis\\u00f6n vastuulla.</p><p>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n</p><p>Ensimm\\u00e4iset osuuskuntalaiset muuttivat sairaalaan vuoden 2016 alussa jai tilat on jo varattu. Vuoden 2016 aikana tavoitteena on remontoida tiloja ja jatkaa osuuskunnan p\\u00e4\\u00e4tavoitteena olevaa kaupungin kehitt\\u00e4minen. Osuuskunta etsii edelleen uusia vastaavia tiloja kaupungista.</p>", "numchild": 0, "content_type": 14, "show_in_menus": true, "path": "0001000100010009", "url_path": "/home/tilajakamo/yleista/", "expired": false, "pk": 186, "locked": false, "depth": 4, "first_published_at": "2016-02-10T17:05:20.712Z", "expire_at": null}	\N	186	1
94	f	2016-02-18 13:50:29.504717+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n.\\u00a0</p>", "latest_revision_created_at": "2016-02-18T13:48:57.978Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "YLEIST\\u00c4", "seo_title": "", "slug": "yleista", "live": true, "has_unpublished_changes": true, "public": true, "body": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n. Joulukuussa 2015 osuuskunta p\\u00e4\\u00e4tyi yli kaksi vuotta kest\\u00e4neiden neuvotteluiden j\\u00e4lkeen vuokraamaan puolet Lapinlahden sairaalan tiloista.</p><p>Osuuskunnassa on reilut 100 j\\u00e4sent\\u00e4, kuvataiteilijoita, valokuvaajia, musiikintekij\\u00f6it\\u00e4, k\\u00e4sity\\u00f6l\\u00e4isi\\u00e4, yritt\\u00e4ji\\u00e4 ja tutkijoita, joista noin puolet on saanut ty\\u00f6tiloja Lapinlahdesta.\\u00a0</p><p>Vuonna 1841 C. L. Engelin suunnittelema mielisairaalaksi rakennettu Lapinlahden sairaala on ollut osin tyhjill\\u00e4\\u00e4n sen j\\u00e4lkeen kun sairaalatoiminta loppui vuonna 2008. Osuuskunnan toissijainen tavoite on arkkitehtuurillisesti merkitt\\u00e4v\\u00e4n historiallisen rakennuksen suojeleminen aktiivisella k\\u00e4yt\\u00f6ll\\u00e4.</p><p>Suunnitelmissa on avata Lapinlahti my\\u00f6s ulkopuolisille. Yleisiin tiloihin on kaavailtu kahvilaa, n\\u00e4yttelyit\\u00e4 ja myym\\u00e4l\\u00e4tiloja, ruokasaleihin ravintolaa ja sairaalan laitoskeitti\\u00f6\\u00f6n osuuskunnallista keitti\\u00f6toimintaa. My\\u00f6s piha-alueilla ja puistossa alkaa kev\\u00e4\\u00e4n mittaan tapahtua \\u2014 osuuskunnan organisoima telttasauna on jo avoinna perjantaisin ja lauantaisin.</p><p>Lapinlahden sairaalaan tehd\\u00e4\\u00e4n vuoden 2016 -2017 Helsingin kaupungin toimesta remonttia ikkunoiden ja julkisivun kohentamiseksi sek\\u00e4 vaurioiden korjaamiseksi. T\\u00e4ll\\u00e4 hetkell\\u00e4 suurin osa sis\\u00e4tiloista on hyv\\u00e4ss\\u00e4 kunnossa, mutta l\\u00e4hes jokainen tila tarvitsee jonkin asteista remontointia. Sairaala on suojeltu rakennus, joten kaiken remontoinnin tulee olla museoviraston antamien ohjeiden mukaista. Kunnostuksesta vastaa tilojen osuuskuntalainen, mutta yleisten tilojen remontointi on yhteis\\u00f6n vastuulla.</p><p>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n</p><p>Ensimm\\u00e4iset osuuskuntalaiset muuttivat sairaalaan vuoden 2016 alussa jai tilat on jo varattu. Vuoden 2016 aikana tavoitteena on remontoida tiloja ja jatkaa osuuskunnan p\\u00e4\\u00e4tavoitteena olevaa kaupungin kehitt\\u00e4minen. Osuuskunta etsii edelleen uusia vastaavia tiloja kaupungista.</p>", "numchild": 0, "content_type": 14, "show_in_menus": true, "path": "0001000100010009", "url_path": "/home/tilajakamo/yleista/", "expired": false, "pk": 186, "locked": false, "depth": 4, "first_published_at": "2016-02-10T17:05:20.712Z", "expire_at": null}	\N	186	1
92	f	2016-02-18 13:48:29.91907+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n.\\u00a0</p>", "latest_revision_created_at": "2016-02-18T13:46:55.731Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "YLEIST\\u00c4", "seo_title": "", "slug": "yleista", "live": true, "has_unpublished_changes": false, "public": true, "body": "<p>Osuuskunta Lapinlahden tilajakamo on voittoa tavoittelematon yhteis\\u00f6, jonka tavoitteena on kehitt\\u00e4\\u00e4 kaupunkia jakamalla saatavilla olevia tiloja j\\u00e4seniens\\u00e4 k\\u00e4ytt\\u00f6\\u00f6n. Joulukuussa 2015 osuuskunta p\\u00e4\\u00e4tyi yli kaksi vuotta kest\\u00e4neiden neuvotteluiden j\\u00e4lkeen vuokraamaan puolet Lapinlahden sairaalan tiloista.</p><p>Osuuskunnassa on reilut 100 j\\u00e4sent\\u00e4, kuvataiteilijoita, valokuvaajia, musiikintekij\\u00f6it\\u00e4, k\\u00e4sity\\u00f6l\\u00e4isi\\u00e4, yritt\\u00e4ji\\u00e4 ja tutkijoita, joista noin puolet on saanut ty\\u00f6tiloja Lapinlahdesta.\\u00a0</p><p>Vuonna 1841 C. L. Engelin suunnittelema mielisairaalaksi rakennettu Lapinlahden sairaala on ollut osin tyhjill\\u00e4\\u00e4n sen j\\u00e4lkeen kun sairaalatoiminta loppui vuonna 2008. Osuuskunnan toissijainen tavoite on arkkitehtuurillisesti merkitt\\u00e4v\\u00e4n historiallisen rakennuksen suojeleminen aktiivisella k\\u00e4yt\\u00f6ll\\u00e4.</p><p>Suunnitelmissa on avata Lapinlahti my\\u00f6s ulkopuolisille. Yleisiin tiloihin on kaavailtu kahvilaa, n\\u00e4yttelyit\\u00e4 ja myym\\u00e4l\\u00e4tiloja, ruokasaleihin ravintolaa ja sairaalan laitoskeitti\\u00f6\\u00f6n osuuskunnallista keitti\\u00f6toimintaa. My\\u00f6s piha-alueilla ja puistossa alkaa kev\\u00e4\\u00e4n mittaan tapahtua \\u2014 osuuskunnan organisoima telttasauna on jo avoinna perjantaisin ja lauantaisin.</p><p>Lapinlahden sairaalaan tehd\\u00e4\\u00e4n vuoden 2016 -2017 Helsingin kaupungin toimesta remonttia ikkunoiden ja julkisivun kohentamiseksi sek\\u00e4 vaurioiden korjaamiseksi. T\\u00e4ll\\u00e4 hetkell\\u00e4 suurin osa sis\\u00e4tiloista on hyv\\u00e4ss\\u00e4 kunnossa, mutta l\\u00e4hes jokainen tila tarvitsee jonkin asteista remontointia. Sairaala on suojeltu rakennus, joten kaiken remontoinnin tulee olla museoviraston antamien ohjeiden mukaista. Kunnostuksesta vastaa tilojen osuuskuntalainen, mutta yleisten tilojen remontointi on yhteis\\u00f6n vastuulla.</p><p>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n</p><p>Ensimm\\u00e4iset osuuskuntalaiset muuttivat sairaalaan vuoden 2016 alussa jai tilat on jo varattu. Vuoden 2016 aikana tavoitteena on remontoida tiloja ja jatkaa osuuskunnan p\\u00e4\\u00e4tavoitteena olevaa kaupungin kehitt\\u00e4minen. Osuuskunta etsii edelleen uusia vastaavia tiloja kaupungista.</p>", "numchild": 0, "content_type": 14, "show_in_menus": true, "path": "0001000100010009", "url_path": "/home/tilajakamo/yleista/", "expired": false, "pk": 186, "locked": false, "depth": 4, "first_published_at": "2016-02-10T17:05:20.712Z", "expire_at": null}	\N	186	1
\.


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailcore_pagerevision_id_seq', 101, true);


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailcore_pageviewrestriction (id, password, page_id) FROM stdin;
\.


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
1	dev1.netzionale.com	8000	t	3	Tilajakamo
\.


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailcore_site_id_seq', 1, true);


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id) FROM stdin;
\.


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtaildocs_document_id_seq', 1, false);


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailembeds_embed_id_seq', 1, false);


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
\.


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailforms_formsubmission_id_seq', 1, false);


--
-- Data for Name: wagtailimages_filter; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailimages_filter (id, spec) FROM stdin;
1	max-165x165
2	width-2000
3	width-300
4	width-270
5	width-125
6	width-100
7	max-800x600
8	width-500
9	width-800
10	width-200
\.


--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailimages_filter_id_seq', 10, true);


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size) FROM stdin;
1	Lapinlahti-3.png	original_images/Lapinlahti-3.png	2409	814	2016-02-09 14:30:49.135+00	\N	\N	\N	\N	1	713377
2	Lapinlahti-2.png	original_images/Lapinlahti-2.png	3475	1231	2016-02-09 14:30:50.259+00	\N	\N	\N	\N	1	1104412
3	Lapinlahti-1.png	original_images/Lapinlahti-1.png	4741	1857	2016-02-09 14:30:51.545+00	\N	\N	\N	\N	1	1798177
4	_MG_7219.jpg	original_images/_MG_7219.jpg	5616	3744	2016-02-09 14:31:17.267+00	\N	\N	\N	\N	1	7391462
5	_MG_7226.jpg	original_images/_MG_7226.jpg	3722	2482	2016-02-09 14:31:19.003+00	\N	\N	\N	\N	1	3535064
6	_MG_7246.jpg	original_images/_MG_7246.jpg	3744	5616	2016-02-09 14:31:21.444+00	\N	\N	\N	\N	1	5779422
7	_MG_7257.jpg	original_images/_MG_7257.jpg	3744	5616	2016-02-09 14:31:25.166+00	\N	\N	\N	\N	1	8511368
8	_MG_7260.jpg	original_images/_MG_7260.jpg	3744	5616	2016-02-09 14:31:31.683+00	\N	\N	\N	\N	1	6922062
9	IMG_7240.jpg	original_images/IMG_7240.jpg	5616	3744	2016-02-09 14:31:34.481+00	\N	\N	\N	\N	1	6722769
10	IMG_7242.jpg	original_images/IMG_7242.jpg	5616	3744	2016-02-09 14:31:36.888+00	\N	\N	\N	\N	1	6560034
11	jääveistos1.jpg	original_images/jaaveistos1.jpg	2552	1432	2016-02-09 14:31:39.12+00	\N	\N	\N	\N	1	4184616
12	1.jpg	original_images/1.jpg	5054	3370	2016-02-09 14:31:48.591+00	\N	\N	\N	\N	1	7313702
13	2.jpg	original_images/2.jpg	4222	2814	2016-02-09 14:31:51.808+00	\N	\N	\N	\N	1	8350774
14	3.jpg	original_images/3.jpg	4000	2650	2016-02-09 14:32:00.836+00	\N	\N	\N	\N	1	7567885
15	4.jpg	original_images/4.jpg	4549	3033	2016-02-09 14:32:04.691+00	\N	\N	\N	\N	1	9255388
16	5.jpg	original_images/5.jpg	4549	3033	2016-02-09 14:32:11.557+00	\N	\N	\N	\N	1	7554695
17	7.jpg	original_images/7.jpg	3091	4637	2016-02-09 14:32:15.418+00	\N	\N	\N	\N	1	10194784
18	8.jpg	original_images/8.jpg	3250	2167	2016-02-09 14:32:17.799+00	\N	\N	\N	\N	1	4997117
19	9.jpg	original_images/9.jpg	4517	3011	2016-02-09 14:32:24.519+00	\N	\N	\N	\N	1	9940413
20	IMG_1036.JPG	original_images/IMG_1036.JPG	2448	3264	2016-02-09 14:36:01.462+00	\N	\N	\N	\N	1	1538566
21	IMG_1037.JPG	original_images/IMG_1037.JPG	3264	2448	2016-02-09 14:36:02.598+00	\N	\N	\N	\N	1	1313779
22	IMG_1039.JPG	original_images/IMG_1039.JPG	3264	2448	2016-02-09 14:36:04.191+00	\N	\N	\N	\N	1	2687696
23	IMG_1040.JPG	original_images/IMG_1040.JPG	3264	2448	2016-02-09 14:36:08.935+00	\N	\N	\N	\N	1	2006033
24	IMG_1041.JPG	original_images/IMG_1041.JPG	3264	2448	2016-02-09 14:36:10.03+00	\N	\N	\N	\N	1	1311839
25	IMG_1044.JPG	original_images/IMG_1044.JPG	3264	2448	2016-02-09 14:36:11.406+00	\N	\N	\N	\N	1	1777438
26	IMG_1045.JPG	original_images/IMG_1045.JPG	3264	2448	2016-02-09 14:36:12.468+00	\N	\N	\N	\N	1	1061759
27	IMG_1046.JPG	original_images/IMG_1046.JPG	3264	2448	2016-02-09 14:36:13.547+00	\N	\N	\N	\N	1	1304647
28	IMG_1048.JPG	original_images/IMG_1048.JPG	3264	2448	2016-02-09 14:36:14.722+00	\N	\N	\N	\N	1	1438368
29	IMG_1049.JPG	original_images/IMG_1049.JPG	3264	2448	2016-02-09 14:36:15.782+00	\N	\N	\N	\N	1	1050759
30	IMG_1050.JPG	original_images/IMG_1050.JPG	3264	2448	2016-02-09 14:36:16.933+00	\N	\N	\N	\N	1	1302717
31	IMG_1051.JPG	original_images/IMG_1051.JPG	3264	2448	2016-02-09 14:36:18.204+00	\N	\N	\N	\N	1	2075224
32	IMG_1052.JPG	original_images/IMG_1052.JPG	3264	2448	2016-02-09 14:36:24.455+00	\N	\N	\N	\N	1	1451867
33	IMG_1053.JPG	original_images/IMG_1053.JPG	3264	2448	2016-02-09 14:36:25.963+00	\N	\N	\N	\N	1	2580590
34	IMG_1054.JPG	original_images/IMG_1054.JPG	3264	2448	2016-02-09 14:36:27.162+00	\N	\N	\N	\N	1	1133193
35	IMG_1057.JPG	original_images/IMG_1057.JPG	3264	2448	2016-02-09 14:36:28.294+00	\N	\N	\N	\N	1	1260463
36	IMG_1058.JPG	original_images/IMG_1058.JPG	3264	2448	2016-02-09 14:36:29.422+00	\N	\N	\N	\N	1	1207278
37	IMG_1059.JPG	original_images/IMG_1059.JPG	3264	2448	2016-02-09 14:36:30.587+00	\N	\N	\N	\N	1	1431156
38	IMG_1060.JPG	original_images/IMG_1060.JPG	3264	2448	2016-02-09 14:36:33.019+00	\N	\N	\N	\N	1	1359480
39	IMG_1061.JPG	original_images/IMG_1061.JPG	3264	2448	2016-02-09 14:36:34.331+00	\N	\N	\N	\N	1	1520046
40	IMG_1062.JPG	original_images/IMG_1062.JPG	3264	2448	2016-02-09 14:36:36.749+00	\N	\N	\N	\N	1	1564581
41	IMG_1063.JPG	original_images/IMG_1063.JPG	3264	2448	2016-02-09 14:36:39.95+00	\N	\N	\N	\N	1	1737790
42	IMG_1064.JPG	original_images/IMG_1064.JPG	3264	2448	2016-02-09 14:36:41.003+00	\N	\N	\N	\N	1	1125193
43	IMG_1066.JPG	original_images/IMG_1066.JPG	3264	2448	2016-02-09 14:36:42.123+00	\N	\N	\N	\N	1	1373411
44	IMG_1067.JPG	original_images/IMG_1067.JPG	3264	2448	2016-02-09 14:36:43.167+00	\N	\N	\N	\N	1	1023377
45	IMG_1068.JPG	original_images/IMG_1068.JPG	3264	2448	2016-02-09 14:36:44.409+00	\N	\N	\N	\N	1	1535754
46	IMG_1070.JPG	original_images/IMG_1070.JPG	3264	2448	2016-02-09 14:36:45.471+00	\N	\N	\N	\N	1	1074689
47	303	original_images/huone.jpg	1280	960	2016-02-11 16:36:26.259988+00	\N	\N	\N	\N	1	\N
48	kimmo	original_images/kimmo_eNpyuLp.jpg	300	224	2016-02-11 16:45:38.428809+00	\N	\N	\N	\N	1	\N
49	kimmo-gringo	original_images/kimmo-gringo.jpg	1280	1018	2016-02-11 21:15:08.708289+00	\N	\N	\N	\N	1	\N
50	image.jpeg	original_images/image.jpeg	3264	2448	2016-02-13 14:12:16.929893+00	\N	\N	\N	\N	1	2426378
51	telttasauna	original_images/telttasauna.jpg	1280	1280	2016-02-18 07:59:21.058048+00	\N	\N	\N	\N	1	\N
52	YV-mac	original_images/telegram-yv-mac.jpg	1676	2296	2016-02-18 09:57:14.504491+00	\N	\N	\N	\N	1	\N
53	YV-pc	original_images/telegram-yv-pc.jpg	1013	578	2016-02-18 10:02:16.031346+00	\N	\N	\N	\N	1	\N
54	Korjauskortti-ohje	original_images/Screen_Shot_2016-02-18_at_12.44.09.png	2218	1256	2016-02-18 10:44:52.84292+00	\N	\N	\N	\N	1	\N
55	logo	original_images/tilajakamo_vaaka_neg.png	3078	542	2016-02-18 13:07:02.15201+00	\N	\N	\N	\N	1	\N
56	lasipalatsi	original_images/lasipalatsi.png	250	39	2016-02-24 14:37:28.066008+00	\N	\N	\N	\N	1	\N
\.


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailimages_image_id_seq', 56, true);


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailimages_rendition (id, file, width, height, focal_point_key, filter_id, image_id) FROM stdin;
1	images/IMG_1070.max-165x165.jpg	165	123		1	46
2	images/IMG_1068.max-165x165.jpg	165	123		1	45
3	images/IMG_1067.max-165x165.jpg	165	123		1	44
4	images/IMG_1066.max-165x165.jpg	165	123		1	43
5	images/IMG_1064.max-165x165.jpg	165	123		1	42
6	images/IMG_1063.max-165x165.jpg	165	123		1	41
7	images/IMG_1062.max-165x165.jpg	165	123		1	40
8	images/IMG_1061.max-165x165.jpg	165	123		1	39
9	images/IMG_1060.max-165x165.jpg	165	123		1	38
10	images/IMG_1059.max-165x165.jpg	165	123		1	37
11	images/IMG_1058.max-165x165.jpg	165	123		1	36
12	images/IMG_1057.max-165x165.jpg	165	123		1	35
13	images/IMG_1054.max-165x165.jpg	165	123		1	34
14	images/IMG_1053.max-165x165.jpg	165	123		1	33
15	images/IMG_1052.max-165x165.jpg	165	123		1	32
16	images/IMG_1051.max-165x165.jpg	165	123		1	31
17	images/IMG_1050.max-165x165.jpg	165	123		1	30
18	images/IMG_1049.max-165x165.jpg	165	123		1	29
19	images/IMG_1048.max-165x165.jpg	165	123		1	28
20	images/IMG_1046.max-165x165.jpg	165	123		1	27
21	images/IMG_1045.max-165x165.jpg	165	123		1	26
22	images/IMG_1044.max-165x165.jpg	165	123		1	25
23	images/IMG_1041.max-165x165.jpg	165	123		1	24
24	images/IMG_1040.max-165x165.jpg	165	123		1	23
25	images/IMG_1039.max-165x165.jpg	165	123		1	22
26	images/IMG_1037.max-165x165.jpg	165	123		1	21
27	images/IMG_1036.max-165x165.jpg	123	165		1	20
28	images/9.max-165x165.jpg	165	109		1	19
29	images/8.max-165x165.jpg	165	110		1	18
30	images/7.max-165x165.jpg	109	165		1	17
31	images/5.max-165x165.jpg	165	110		1	16
32	images/4.max-165x165.jpg	165	110		1	15
33	images/3.max-165x165.jpg	165	109		1	14
34	images/2.max-165x165.jpg	165	109		1	13
35	images/1.max-165x165.jpg	165	110		1	12
36	images/jaaveistos1.max-165x165.jpg	165	92		1	11
37	images/IMG_7242.max-165x165.jpg	165	110		1	10
38	images/IMG_7240.max-165x165.jpg	165	110		1	9
39	images/_MG_7260.max-165x165.jpg	110	165		1	8
40	images/_MG_7257.max-165x165.jpg	110	165		1	7
41	images/_MG_7246.max-165x165.jpg	110	165		1	6
42	images/_MG_7226.max-165x165.jpg	165	110		1	5
43	images/_MG_7219.max-165x165.jpg	165	110		1	4
44	images/Lapinlahti-1.max-165x165.png	165	64		1	3
45	images/Lapinlahti-2.max-165x165.png	165	58		1	2
46	images/Lapinlahti-3.max-165x165.png	165	55		1	1
47	images/IMG_7242.width-2000.jpg	2000	1333		2	10
48	images/IMG_1041.width-2000.jpg	2000	1500		2	24
49	images/IMG_1053.width-2000.jpg	2000	1500		2	33
50	images/jaaveistos1.width-2000.jpg	2000	1122		2	11
51	images/5.width-2000.jpg	2000	1333		2	16
52	images/IMG_1057.width-2000.jpg	2000	1500		2	35
53	images/Lapinlahti-1.width-2000_EEO3kEF.png	2000	783		2	3
54	images/Lapinlahti-3.width-2000.png	2000	675		2	1
55	images/huone.max-165x165.jpg	165	123		1	47
56	images/huone.width-2000.jpg	1280	960		2	47
57	images/huone.width-300.jpg	300	225		3	47
58	images/huone.width-270.jpg	270	202		4	47
59	images/kimmo_eNpyuLp.max-165x165.jpg	165	123		1	48
60	images/kimmo_eNpyuLp.width-300.jpg	300	224		3	48
61	images/kimmo-gringo.max-165x165.jpg	165	131		1	49
62	images/kimmo-gringo.width-300.jpg	300	238		3	49
63	images/kimmo-gringo.width-2000.jpg	1280	1018		2	49
64	images/kimmo-gringo.width-125.jpg	125	99		5	49
65	images/Lapinlahti-2.width-2000.png	2000	708		2	2
66	images/image.max-165x165.jpg	165	123		1	50
67	images/image.width-2000.jpg	2000	1500		2	50
68	images/image.width-300.jpg	300	225		3	50
69	images/image.width-100.jpg	100	75		6	50
70	images/telttasauna.max-165x165.jpg	165	165		1	51
71	images/telegram-yv-mac.max-800x600.jpg	437	600		7	52
72	images/telegram-yv-mac.width-500.jpg	500	684		8	52
73	images/telegram-yv-mac.max-165x165.jpg	120	165		1	52
74	images/telegram-yv-mac.width-800.jpg	800	1095		9	52
75	images/telegram-yv-pc.max-800x600.jpg	800	456		7	53
76	images/telegram-yv-pc.width-800.jpg	800	456		9	53
77	images/telegram-yv-pc.max-165x165.jpg	165	94		1	53
78	images/Screen_Shot_2016-02-18_at_12.44.09.max-800x600.png	800	453		7	54
79	images/Screen_Shot_2016-02-18_at_12.44.09.width-800.png	800	453		9	54
80	images/Screen_Shot_2016-02-18_at_12.44.09.max-165x165.png	165	93		1	54
81	images/tilajakamo_vaaka_neg.max-800x600.png	800	140		7	55
82	images/tilajakamo_vaaka_neg.width-800.png	800	140		9	55
83	images/telttasauna.width-100.jpg	100	100		6	51
84	images/telttasauna.width-300.jpg	300	300		3	51
85	images/tilajakamo_vaaka_neg.max-165x165.png	165	29		1	55
86	images/IMG_1039.max-800x600.jpg	800	600		7	22
87	images/IMG_1039.width-800.jpg	800	600		9	22
88	images/IMG_1054.max-800x600.jpg	800	600		7	34
89	images/IMG_1054.width-800.jpg	800	600		9	34
90	images/lasipalatsi.max-165x165.png	165	25		1	56
91	images/lasipalatsi.width-200.png	200	31		10	56
\.


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailimages_rendition_id_seq', 91, true);


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailredirects_redirect_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_editorspick; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailsearch_editorspick (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailsearch_editorspick_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailsearch_query (id, query_string) FROM stdin;
1	lehtonen
2	228
3	jyrki
4	kaos
5	jaana
\.


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailsearch_query_id_seq', 5, true);


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
1	2016-02-11	2	1
2	2016-02-11	1	2
3	2016-02-12	1	3
4	2016-02-13	1	4
5	2016-02-13	1	5
\.


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailsearch_querydailyhits_id_seq', 5, true);


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: tilajakamo
--

COPY wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id) FROM stdin;
1	t	t	t	3
\.


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tilajakamo
--

SELECT pg_catalog.setval('wagtailusers_userprofile_id_seq', 1, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: home_advert_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_advert
    ADD CONSTRAINT home_advert_pkey PRIMARY KEY (id);


--
-- Name: home_advertplacement_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_advertplacement
    ADD CONSTRAINT home_advertplacement_pkey PRIMARY KEY (id);


--
-- Name: home_blogindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_blogindexpage
    ADD CONSTRAINT home_blogindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_blogindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_blogindexpagerelatedlink
    ADD CONSTRAINT home_blogindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: home_blogpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_blogpage
    ADD CONSTRAINT home_blogpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_blogpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_blogpagecarouselitem
    ADD CONSTRAINT home_blogpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: home_blogpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_blogpagerelatedlink
    ADD CONSTRAINT home_blogpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: home_blogpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_blogpagetag
    ADD CONSTRAINT home_blogpagetag_pkey PRIMARY KEY (id);


--
-- Name: home_contactpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_contactpage
    ADD CONSTRAINT home_contactpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_eventindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_eventindexpage
    ADD CONSTRAINT home_eventindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_eventindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_eventindexpagerelatedlink
    ADD CONSTRAINT home_eventindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: home_eventpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_eventpage
    ADD CONSTRAINT home_eventpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_eventpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_eventpagecarouselitem
    ADD CONSTRAINT home_eventpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: home_eventpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_eventpagerelatedlink
    ADD CONSTRAINT home_eventpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: home_eventpagespeaker_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_eventpagespeaker
    ADD CONSTRAINT home_eventpagespeaker_pkey PRIMARY KEY (id);


--
-- Name: home_faqindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_faqindexpage
    ADD CONSTRAINT home_faqindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_faqpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_faqpage
    ADD CONSTRAINT home_faqpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_faqpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_faqpagerelatedlink
    ADD CONSTRAINT home_faqpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: home_faqpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_faqpagetag
    ADD CONSTRAINT home_faqpagetag_pkey PRIMARY KEY (id);


--
-- Name: home_formfield_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_formfield
    ADD CONSTRAINT home_formfield_pkey PRIMARY KEY (id);


--
-- Name: home_formpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_formpage
    ADD CONSTRAINT home_formpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_homepage
    ADD CONSTRAINT home_homepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_homepagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_homepagecarouselitem
    ADD CONSTRAINT home_homepagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: home_homepagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_homepagerelatedlink
    ADD CONSTRAINT home_homepagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: home_personindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_personindexpage
    ADD CONSTRAINT home_personindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_personpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_personpage
    ADD CONSTRAINT home_personpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_personpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_personpagerelatedlink
    ADD CONSTRAINT home_personpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: home_roomindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_roomindexpage
    ADD CONSTRAINT home_roomindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_roompage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_roompage
    ADD CONSTRAINT home_roompage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_standardindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_standardindexpage
    ADD CONSTRAINT home_standardindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_standardindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_standardindexpagerelatedlink
    ADD CONSTRAINT home_standardindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: home_standardpage_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_standardpage
    ADD CONSTRAINT home_standardpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_standardpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_standardpagecarouselitem
    ADD CONSTRAINT home_standardpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: home_standardpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY home_standardpagerelatedlink
    ADD CONSTRAINT home_standardpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission_group_id_16e761a1726500_uniq; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_group_id_16e761a1726500_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site_hostname_29d2c7f94ac026_uniq; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_29d2c7f94ac026_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_url_8a2922d8_uniq; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_8a2922d8_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_filter_spec_42ad6e02_uniq; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_spec_42ad6e02_uniq UNIQUE (spec);


--
-- Name: wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition_image_id_742f4fe4119535f1_uniq; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_742f4fe4119535f1_uniq UNIQUE (image_id, filter_id, focal_point_key);


--
-- Name: wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect_old_path_783622d7_uniq; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_783622d7_uniq UNIQUE (old_path, site_id);


--
-- Name: wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits_query_id_1dd232e6_uniq; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_1dd232e6_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: tilajakamo; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: home_advert_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_advert_1a63c800 ON home_advert USING btree (page_id);


--
-- Name: home_advert_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_advert_92482941 ON home_advert USING btree (feed_image_id);


--
-- Name: home_advertplacement_0dbc927f; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_advertplacement_0dbc927f ON home_advertplacement USING btree (advert_id);


--
-- Name: home_advertplacement_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_advertplacement_1a63c800 ON home_advertplacement USING btree (page_id);


--
-- Name: home_blogindexpage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogindexpage_92482941 ON home_blogindexpage USING btree (feed_image_id);


--
-- Name: home_blogindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogindexpagerelatedlink_121087a8 ON home_blogindexpagerelatedlink USING btree (link_document_id);


--
-- Name: home_blogindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogindexpagerelatedlink_1a63c800 ON home_blogindexpagerelatedlink USING btree (page_id);


--
-- Name: home_blogindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogindexpagerelatedlink_5b76e141 ON home_blogindexpagerelatedlink USING btree (link_page_id);


--
-- Name: home_blogpage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogpage_92482941 ON home_blogpage USING btree (feed_image_id);


--
-- Name: home_blogpagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogpagecarouselitem_121087a8 ON home_blogpagecarouselitem USING btree (link_document_id);


--
-- Name: home_blogpagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogpagecarouselitem_1a63c800 ON home_blogpagecarouselitem USING btree (page_id);


--
-- Name: home_blogpagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogpagecarouselitem_5b76e141 ON home_blogpagecarouselitem USING btree (link_page_id);


--
-- Name: home_blogpagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogpagecarouselitem_f33175e6 ON home_blogpagecarouselitem USING btree (image_id);


--
-- Name: home_blogpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogpagerelatedlink_121087a8 ON home_blogpagerelatedlink USING btree (link_document_id);


--
-- Name: home_blogpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogpagerelatedlink_1a63c800 ON home_blogpagerelatedlink USING btree (page_id);


--
-- Name: home_blogpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogpagerelatedlink_5b76e141 ON home_blogpagerelatedlink USING btree (link_page_id);


--
-- Name: home_blogpagetag_09a80f33; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogpagetag_09a80f33 ON home_blogpagetag USING btree (content_object_id);


--
-- Name: home_blogpagetag_76f094bc; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_blogpagetag_76f094bc ON home_blogpagetag USING btree (tag_id);


--
-- Name: home_contactpage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_contactpage_92482941 ON home_contactpage USING btree (feed_image_id);


--
-- Name: home_eventindexpage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventindexpage_92482941 ON home_eventindexpage USING btree (feed_image_id);


--
-- Name: home_eventindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventindexpagerelatedlink_121087a8 ON home_eventindexpagerelatedlink USING btree (link_document_id);


--
-- Name: home_eventindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventindexpagerelatedlink_1a63c800 ON home_eventindexpagerelatedlink USING btree (page_id);


--
-- Name: home_eventindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventindexpagerelatedlink_5b76e141 ON home_eventindexpagerelatedlink USING btree (link_page_id);


--
-- Name: home_eventpage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpage_92482941 ON home_eventpage USING btree (feed_image_id);


--
-- Name: home_eventpagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpagecarouselitem_121087a8 ON home_eventpagecarouselitem USING btree (link_document_id);


--
-- Name: home_eventpagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpagecarouselitem_1a63c800 ON home_eventpagecarouselitem USING btree (page_id);


--
-- Name: home_eventpagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpagecarouselitem_5b76e141 ON home_eventpagecarouselitem USING btree (link_page_id);


--
-- Name: home_eventpagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpagecarouselitem_f33175e6 ON home_eventpagecarouselitem USING btree (image_id);


--
-- Name: home_eventpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpagerelatedlink_121087a8 ON home_eventpagerelatedlink USING btree (link_document_id);


--
-- Name: home_eventpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpagerelatedlink_1a63c800 ON home_eventpagerelatedlink USING btree (page_id);


--
-- Name: home_eventpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpagerelatedlink_5b76e141 ON home_eventpagerelatedlink USING btree (link_page_id);


--
-- Name: home_eventpagespeaker_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpagespeaker_121087a8 ON home_eventpagespeaker USING btree (link_document_id);


--
-- Name: home_eventpagespeaker_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpagespeaker_1a63c800 ON home_eventpagespeaker USING btree (page_id);


--
-- Name: home_eventpagespeaker_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpagespeaker_5b76e141 ON home_eventpagespeaker USING btree (link_page_id);


--
-- Name: home_eventpagespeaker_f33175e6; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_eventpagespeaker_f33175e6 ON home_eventpagespeaker USING btree (image_id);


--
-- Name: home_faqindexpage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_faqindexpage_92482941 ON home_faqindexpage USING btree (feed_image_id);


--
-- Name: home_faqpage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_faqpage_92482941 ON home_faqpage USING btree (feed_image_id);


--
-- Name: home_faqpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_faqpagerelatedlink_121087a8 ON home_faqpagerelatedlink USING btree (link_document_id);


--
-- Name: home_faqpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_faqpagerelatedlink_1a63c800 ON home_faqpagerelatedlink USING btree (page_id);


--
-- Name: home_faqpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_faqpagerelatedlink_5b76e141 ON home_faqpagerelatedlink USING btree (link_page_id);


--
-- Name: home_faqpagetag_09a80f33; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_faqpagetag_09a80f33 ON home_faqpagetag USING btree (content_object_id);


--
-- Name: home_faqpagetag_76f094bc; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_faqpagetag_76f094bc ON home_faqpagetag USING btree (tag_id);


--
-- Name: home_formfield_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_formfield_1a63c800 ON home_formfield USING btree (page_id);


--
-- Name: home_homepage_4ce7fa67; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_homepage_4ce7fa67 ON home_homepage USING btree (bg_image_id);


--
-- Name: home_homepagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_homepagecarouselitem_121087a8 ON home_homepagecarouselitem USING btree (link_document_id);


--
-- Name: home_homepagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_homepagecarouselitem_1a63c800 ON home_homepagecarouselitem USING btree (page_id);


--
-- Name: home_homepagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_homepagecarouselitem_5b76e141 ON home_homepagecarouselitem USING btree (link_page_id);


--
-- Name: home_homepagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_homepagecarouselitem_f33175e6 ON home_homepagecarouselitem USING btree (image_id);


--
-- Name: home_homepagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_homepagerelatedlink_121087a8 ON home_homepagerelatedlink USING btree (link_document_id);


--
-- Name: home_homepagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_homepagerelatedlink_1a63c800 ON home_homepagerelatedlink USING btree (page_id);


--
-- Name: home_homepagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_homepagerelatedlink_5b76e141 ON home_homepagerelatedlink USING btree (link_page_id);


--
-- Name: home_personindexpage_8273f993; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_personindexpage_8273f993 ON home_personindexpage USING btree (room_id);


--
-- Name: home_personindexpage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_personindexpage_92482941 ON home_personindexpage USING btree (feed_image_id);


--
-- Name: home_personpage_8273f993; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_personpage_8273f993 ON home_personpage USING btree (room_id);


--
-- Name: home_personpage_f33175e6; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_personpage_f33175e6 ON home_personpage USING btree (image_id);


--
-- Name: home_personpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_personpagerelatedlink_121087a8 ON home_personpagerelatedlink USING btree (link_document_id);


--
-- Name: home_personpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_personpagerelatedlink_1a63c800 ON home_personpagerelatedlink USING btree (page_id);


--
-- Name: home_personpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_personpagerelatedlink_5b76e141 ON home_personpagerelatedlink USING btree (link_page_id);


--
-- Name: home_roomindexpage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_roomindexpage_92482941 ON home_roomindexpage USING btree (feed_image_id);


--
-- Name: home_roompage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_roompage_92482941 ON home_roompage USING btree (feed_image_id);


--
-- Name: home_standardindexpage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardindexpage_92482941 ON home_standardindexpage USING btree (feed_image_id);


--
-- Name: home_standardindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardindexpagerelatedlink_121087a8 ON home_standardindexpagerelatedlink USING btree (link_document_id);


--
-- Name: home_standardindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardindexpagerelatedlink_1a63c800 ON home_standardindexpagerelatedlink USING btree (page_id);


--
-- Name: home_standardindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardindexpagerelatedlink_5b76e141 ON home_standardindexpagerelatedlink USING btree (link_page_id);


--
-- Name: home_standardpage_92482941; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardpage_92482941 ON home_standardpage USING btree (feed_image_id);


--
-- Name: home_standardpagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardpagecarouselitem_121087a8 ON home_standardpagecarouselitem USING btree (link_document_id);


--
-- Name: home_standardpagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardpagecarouselitem_1a63c800 ON home_standardpagecarouselitem USING btree (page_id);


--
-- Name: home_standardpagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardpagecarouselitem_5b76e141 ON home_standardpagecarouselitem USING btree (link_page_id);


--
-- Name: home_standardpagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardpagecarouselitem_f33175e6 ON home_standardpagecarouselitem USING btree (image_id);


--
-- Name: home_standardpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardpagerelatedlink_121087a8 ON home_standardpagerelatedlink USING btree (link_document_id);


--
-- Name: home_standardpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardpagerelatedlink_1a63c800 ON home_standardpagerelatedlink USING btree (page_id);


--
-- Name: home_standardpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX home_standardpagerelatedlink_5b76e141 ON home_standardpagerelatedlink USING btree (link_page_id);


--
-- Name: taggit_tag_name_4ed9aad194b72af1_like; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX taggit_tag_name_4ed9aad194b72af1_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_703438030cd922a7_like; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX taggit_tag_slug_703438030cd922a7_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_content_type_id_3c99b32018cc9d40_idx; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX taggit_taggeditem_content_type_id_3c99b32018cc9d40_idx ON taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: wagtailcore_grouppagepermission_0e939a4f; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_0e939a4f ON wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_1a63c800 ON wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_2dbcba41; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_page_2dbcba41 ON wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_417f1b1c; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_page_417f1b1c ON wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_5e7b1936; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_page_5e7b1936 ON wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_first_published_at_2b5dd637_uniq; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_page_first_published_at_2b5dd637_uniq ON wagtailcore_page USING btree (first_published_at);


--
-- Name: wagtailcore_page_path_adbf7302a1ab75e_like; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_page_path_adbf7302a1ab75e_like ON wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_de66a236c47d916_like; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_page_slug_de66a236c47d916_like ON wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_1a63c800 ON wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_e8701ad4; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_e8701ad4 ON wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pagerevision_submitted_for_moderation_c682e44c_uniq; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_submitted_for_moderation_c682e44c_uniq ON wagtailcore_pagerevision USING btree (submitted_for_moderation);


--
-- Name: wagtailcore_pageviewrestriction_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_pageviewrestriction_1a63c800 ON wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_site_0897acf4; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_site_0897acf4 ON wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_8372b497; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_site_8372b497 ON wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtailcore_site_hostname_3649a8ca5c8e8730_like; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailcore_site_hostname_3649a8ca5c8e8730_like ON wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtaildocs_document_ef01e2b6; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtaildocs_document_ef01e2b6 ON wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailforms_formsubmission_1a63c800 ON wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_image_created_at_86fa6cd4_uniq; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailimages_image_created_at_86fa6cd4_uniq ON wagtailimages_image USING btree (created_at);


--
-- Name: wagtailimages_image_ef01e2b6; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailimages_image_ef01e2b6 ON wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_0a317463; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_0a317463 ON wagtailimages_rendition USING btree (filter_id);


--
-- Name: wagtailimages_rendition_f33175e6; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_f33175e6 ON wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailredirects_redirect_2fd79f37; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_2fd79f37 ON wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_9365d6e7 ON wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailsearch_editorspick_0bbeda9c; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_0bbeda9c ON wagtailsearch_editorspick USING btree (query_id);


--
-- Name: wagtailsearch_editorspick_1a63c800; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_1a63c800 ON wagtailsearch_editorspick USING btree (page_id);


--
-- Name: wagtailsearch_query_query_string_e785ea07_like; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailsearch_query_query_string_e785ea07_like ON wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_0bbeda9c; Type: INDEX; Schema: public; Owner: tilajakamo; Tablespace: 
--

CREATE INDEX wagtailsearch_querydailyhits_0bbeda9c ON wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_advert_feed_image_id_f0f4b6ae_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_advert
    ADD CONSTRAINT home_advert_feed_image_id_f0f4b6ae_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_advert_page_id_1b0b97f9_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_advert
    ADD CONSTRAINT home_advert_page_id_1b0b97f9_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_advertplacement_advert_id_8412bc84_fk_home_advert_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_advertplacement
    ADD CONSTRAINT home_advertplacement_advert_id_8412bc84_fk_home_advert_id FOREIGN KEY (advert_id) REFERENCES home_advert(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_advertplacement_page_id_8344ecbc_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_advertplacement
    ADD CONSTRAINT home_advertplacement_page_id_8344ecbc_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_bl_content_object_id_4f0858a1_fk_home_blogpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagetag
    ADD CONSTRAINT home_bl_content_object_id_4f0858a1_fk_home_blogpage_page_ptr_id FOREIGN KEY (content_object_id) REFERENCES home_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogi_link_document_id_daf64327_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogindexpagerelatedlink
    ADD CONSTRAINT home_blogi_link_document_id_daf64327_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogind_page_id_859a722a_fk_home_blogindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogindexpagerelatedlink
    ADD CONSTRAINT home_blogind_page_id_859a722a_fk_home_blogindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_blogindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogindex_feed_image_id_4815b5bb_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogindexpage
    ADD CONSTRAINT home_blogindex_feed_image_id_4815b5bb_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogindexpage_link_page_id_09df2c6a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogindexpagerelatedlink
    ADD CONSTRAINT home_blogindexpage_link_page_id_09df2c6a_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogindexpage_page_ptr_id_82f07c5f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogindexpage
    ADD CONSTRAINT home_blogindexpage_page_ptr_id_82f07c5f_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogp_link_document_id_6db05332_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagecarouselitem
    ADD CONSTRAINT home_blogp_link_document_id_6db05332_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogp_link_document_id_ea0afe4a_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagerelatedlink
    ADD CONSTRAINT home_blogp_link_document_id_ea0afe4a_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogpage_feed_image_id_379b1c22_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpage
    ADD CONSTRAINT home_blogpage_feed_image_id_379b1c22_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogpage_page_ptr_id_5022535a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpage
    ADD CONSTRAINT home_blogpage_page_ptr_id_5022535a_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogpagecaro_page_id_1e4739ac_fk_home_blogpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagecarouselitem
    ADD CONSTRAINT home_blogpagecaro_page_id_1e4739ac_fk_home_blogpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogpagecarou_link_page_id_e6611c96_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagecarouselitem
    ADD CONSTRAINT home_blogpagecarou_link_page_id_e6611c96_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogpagecarous_image_id_0c822d6e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagecarouselitem
    ADD CONSTRAINT home_blogpagecarous_image_id_0c822d6e_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogpagerela_page_id_c6e6d178_fk_home_blogpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagerelatedlink
    ADD CONSTRAINT home_blogpagerela_page_id_c6e6d178_fk_home_blogpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogpagerelat_link_page_id_1419d257_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagerelatedlink
    ADD CONSTRAINT home_blogpagerelat_link_page_id_1419d257_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_blogpagetag_tag_id_5d5e154f_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_blogpagetag
    ADD CONSTRAINT home_blogpagetag_tag_id_5d5e154f_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_contactpa_feed_image_id_9d08bb16_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_contactpage
    ADD CONSTRAINT home_contactpa_feed_image_id_9d08bb16_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_contactpage_page_ptr_id_73be1938_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_contactpage
    ADD CONSTRAINT home_contactpage_page_ptr_id_73be1938_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_event_link_document_id_13a8dd21_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagerelatedlink
    ADD CONSTRAINT home_event_link_document_id_13a8dd21_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_event_link_document_id_4839dae5_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagespeaker
    ADD CONSTRAINT home_event_link_document_id_4839dae5_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_event_link_document_id_77c209d8_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventindexpagerelatedlink
    ADD CONSTRAINT home_event_link_document_id_77c209d8_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_event_link_document_id_b2eb9891_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagecarouselitem
    ADD CONSTRAINT home_event_link_document_id_b2eb9891_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventi_page_id_7fbe07b8_fk_home_eventindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventindexpagerelatedlink
    ADD CONSTRAINT home_eventi_page_id_7fbe07b8_fk_home_eventindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_eventindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventinde_feed_image_id_2a92ea1d_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventindexpage
    ADD CONSTRAINT home_eventinde_feed_image_id_2a92ea1d_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventindexpag_link_page_id_69ccaf83_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventindexpagerelatedlink
    ADD CONSTRAINT home_eventindexpag_link_page_id_69ccaf83_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventindexpage_page_ptr_id_c88ef48f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventindexpage
    ADD CONSTRAINT home_eventindexpage_page_ptr_id_c88ef48f_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventpage_feed_image_id_2031bb91_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpage
    ADD CONSTRAINT home_eventpage_feed_image_id_2031bb91_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventpage_page_ptr_id_a7cf9750_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpage
    ADD CONSTRAINT home_eventpage_page_ptr_id_a7cf9750_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventpageca_page_id_ad8127ff_fk_home_eventpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagecarouselitem
    ADD CONSTRAINT home_eventpageca_page_id_ad8127ff_fk_home_eventpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventpagecaro_link_page_id_8f774cf4_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagecarouselitem
    ADD CONSTRAINT home_eventpagecaro_link_page_id_8f774cf4_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventpagecarou_image_id_bed1993b_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagecarouselitem
    ADD CONSTRAINT home_eventpagecarou_image_id_bed1993b_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventpagere_page_id_c8a75e84_fk_home_eventpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagerelatedlink
    ADD CONSTRAINT home_eventpagere_page_id_c8a75e84_fk_home_eventpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventpagerela_link_page_id_a43818d6_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagerelatedlink
    ADD CONSTRAINT home_eventpagerela_link_page_id_a43818d6_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventpagesp_page_id_d73bfa4e_fk_home_eventpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagespeaker
    ADD CONSTRAINT home_eventpagesp_page_id_d73bfa4e_fk_home_eventpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventpagespea_link_page_id_8ec20de6_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagespeaker
    ADD CONSTRAINT home_eventpagespea_link_page_id_8ec20de6_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_eventpagespeak_image_id_6a87044d_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_eventpagespeaker
    ADD CONSTRAINT home_eventpagespeak_image_id_6a87044d_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_faq_content_object_id_b15fdd86_fk_home_faqpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_faqpagetag
    ADD CONSTRAINT home_faq_content_object_id_b15fdd86_fk_home_faqpage_page_ptr_id FOREIGN KEY (content_object_id) REFERENCES home_faqpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_faqindexp_feed_image_id_beb20eef_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_faqindexpage
    ADD CONSTRAINT home_faqindexp_feed_image_id_beb20eef_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_faqindexpage_page_ptr_id_f77137da_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_faqindexpage
    ADD CONSTRAINT home_faqindexpage_page_ptr_id_f77137da_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_faqpa_link_document_id_502f85d1_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_faqpagerelatedlink
    ADD CONSTRAINT home_faqpa_link_document_id_502f85d1_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_faqpage_feed_image_id_800eb22e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_faqpage
    ADD CONSTRAINT home_faqpage_feed_image_id_800eb22e_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_faqpage_page_ptr_id_1dad03a1_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_faqpage
    ADD CONSTRAINT home_faqpage_page_ptr_id_1dad03a1_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_faqpagerelate_link_page_id_f9e6c23b_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_faqpagerelatedlink
    ADD CONSTRAINT home_faqpagerelate_link_page_id_f9e6c23b_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_faqpagerelate_page_id_9227c0d8_fk_home_faqpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_faqpagerelatedlink
    ADD CONSTRAINT home_faqpagerelate_page_id_9227c0d8_fk_home_faqpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_faqpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_faqpagetag_tag_id_ad728750_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_faqpagetag
    ADD CONSTRAINT home_faqpagetag_tag_id_ad728750_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_formfield_page_id_11ee50f3_fk_home_formpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_formfield
    ADD CONSTRAINT home_formfield_page_id_11ee50f3_fk_home_formpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_formpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_formpage_page_ptr_id_015de79d_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_formpage
    ADD CONSTRAINT home_formpage_page_ptr_id_015de79d_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homep_link_document_id_07f7842a_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_homepagerelatedlink
    ADD CONSTRAINT home_homep_link_document_id_07f7842a_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homep_link_document_id_924e4815_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_homepagecarouselitem
    ADD CONSTRAINT home_homep_link_document_id_924e4815_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepage_bg_image_id_8fd60a7b_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_homepage
    ADD CONSTRAINT home_homepage_bg_image_id_8fd60a7b_fk_wagtailimages_image_id FOREIGN KEY (bg_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepage_page_ptr_id_e5b77cf7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_homepage
    ADD CONSTRAINT home_homepage_page_ptr_id_e5b77cf7_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepagecaro_page_id_c549e8e0_fk_home_homepage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_homepagecarouselitem
    ADD CONSTRAINT home_homepagecaro_page_id_c549e8e0_fk_home_homepage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepagecarou_link_page_id_7710c21a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_homepagecarouselitem
    ADD CONSTRAINT home_homepagecarou_link_page_id_7710c21a_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepagecarous_image_id_170b10f0_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_homepagecarouselitem
    ADD CONSTRAINT home_homepagecarous_image_id_170b10f0_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepagerela_page_id_eae08911_fk_home_homepage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_homepagerelatedlink
    ADD CONSTRAINT home_homepagerela_page_id_eae08911_fk_home_homepage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepagerelat_link_page_id_867eeb48_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_homepagerelatedlink
    ADD CONSTRAINT home_homepagerelat_link_page_id_867eeb48_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_perso_link_document_id_fe30ce32_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_personpagerelatedlink
    ADD CONSTRAINT home_perso_link_document_id_fe30ce32_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_personind_feed_image_id_35cdfd4e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_personindexpage
    ADD CONSTRAINT home_personind_feed_image_id_35cdfd4e_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_personindexp_room_id_5d9d77e6_fk_home_roompage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_personindexpage
    ADD CONSTRAINT home_personindexp_room_id_5d9d77e6_fk_home_roompage_page_ptr_id FOREIGN KEY (room_id) REFERENCES home_roompage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_personindexpag_page_ptr_id_44c0e8fc_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_personindexpage
    ADD CONSTRAINT home_personindexpag_page_ptr_id_44c0e8fc_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_personpage_image_id_67065b69_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_personpage
    ADD CONSTRAINT home_personpage_image_id_67065b69_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_personpage_page_id_cd69996d_fk_home_personpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_personpagerelatedlink
    ADD CONSTRAINT home_personpage_page_id_cd69996d_fk_home_personpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_personpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_personpage_page_ptr_id_b1852c1d_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_personpage
    ADD CONSTRAINT home_personpage_page_ptr_id_b1852c1d_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_personpage_room_id_ef8e3aa9_fk_home_roompage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_personpage
    ADD CONSTRAINT home_personpage_room_id_ef8e3aa9_fk_home_roompage_page_ptr_id FOREIGN KEY (room_id) REFERENCES home_roompage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_personpagerel_link_page_id_ab7fad4c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_personpagerelatedlink
    ADD CONSTRAINT home_personpagerel_link_page_id_ab7fad4c_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_roomindex_feed_image_id_9aac37a7_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_roomindexpage
    ADD CONSTRAINT home_roomindex_feed_image_id_9aac37a7_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_roomindexpage_page_ptr_id_6d15645e_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_roomindexpage
    ADD CONSTRAINT home_roomindexpage_page_ptr_id_6d15645e_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_roompage_feed_image_id_1f203878_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_roompage
    ADD CONSTRAINT home_roompage_feed_image_id_1f203878_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_roompage_page_ptr_id_93b13927_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_roompage
    ADD CONSTRAINT home_roompage_page_ptr_id_93b13927_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_sta_page_id_6fdef7dd_fk_home_standardindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardindexpagerelatedlink
    ADD CONSTRAINT home_sta_page_id_6fdef7dd_fk_home_standardindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_standardindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_stand_link_document_id_43622bdc_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardpagerelatedlink
    ADD CONSTRAINT home_stand_link_document_id_43622bdc_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_stand_link_document_id_e3958f26_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardpagecarouselitem
    ADD CONSTRAINT home_stand_link_document_id_e3958f26_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_stand_link_document_id_ed3eb4d6_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardindexpagerelatedlink
    ADD CONSTRAINT home_stand_link_document_id_ed3eb4d6_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_standard_page_id_453c3683_fk_home_standardpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardpagecarouselitem
    ADD CONSTRAINT home_standard_page_id_453c3683_fk_home_standardpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_standardpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_standard_page_id_7f559e07_fk_home_standardpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardpagerelatedlink
    ADD CONSTRAINT home_standard_page_id_7f559e07_fk_home_standardpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES home_standardpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_standardi_feed_image_id_4b19ccb0_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardindexpage
    ADD CONSTRAINT home_standardi_feed_image_id_4b19ccb0_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_standardindex_link_page_id_2460b441_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardindexpagerelatedlink
    ADD CONSTRAINT home_standardindex_link_page_id_2460b441_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_standardindexp_page_ptr_id_79ae3907_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardindexpage
    ADD CONSTRAINT home_standardindexp_page_ptr_id_79ae3907_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_standardp_feed_image_id_525e8425_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardpage
    ADD CONSTRAINT home_standardp_feed_image_id_525e8425_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_standardpage_page_ptr_id_9284d8b1_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardpage
    ADD CONSTRAINT home_standardpage_page_ptr_id_9284d8b1_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_standardpagec_link_page_id_7600dbc0_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardpagecarouselitem
    ADD CONSTRAINT home_standardpagec_link_page_id_7600dbc0_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_standardpageca_image_id_97cf6cd7_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardpagecarouselitem
    ADD CONSTRAINT home_standardpageca_image_id_97cf6cd7_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_standardpager_link_page_id_1d3a3ca9_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY home_standardpagerelatedlink
    ADD CONSTRAINT home_standardpager_link_page_id_1d3a3ca9_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagg_content_type_id_62e0524705c3ec8f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT tagg_content_type_id_62e0524705c3ec8f_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_6318217c0d95e0d2_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_6318217c0d95e0d2_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore__content_type_id_c28424df_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore__content_type_id_c28424df_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepe_page_id_710b114a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepe_page_id_710b114a_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermiss_group_id_fc07e671_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermiss_group_id_fc07e671_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevisio_page_id_d421cc1d_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevisio_page_id_d421cc1d_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewres_page_id_15a8bea6_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewres_page_id_15a8bea6_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_docume_uploaded_by_user_id_17258b41_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_docume_uploaded_by_user_id_17258b41_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsubmis_page_id_e48e93e7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmis_page_id_e48e93e7_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailima_filter_id_b5a94d704fa1f7f_fk_wagtailimages_filter_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailima_filter_id_b5a94d704fa1f7f_fk_wagtailimages_filter_id FOREIGN KEY (filter_id) REFERENCES wagtailimages_filter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimag_image_id_4b83f0a74ebd24db_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimag_image_id_4b83f0a74ebd24db_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_imag_uploaded_by_user_id_5d73dc75_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_imag_uploaded_by_user_id_5d73dc75_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirec_redirect_page_id_b5728a8f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirec_redirect_page_id_b5728a8f_fk_wagtailcore_page_id FOREIGN KEY (redirect_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redire_site_id_780a0e1e_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redire_site_id_780a0e1e_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_edito_query_id_c6eee4a0_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_edito_query_id_c6eee4a0_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editorspi_page_id_28cbc274_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspi_page_id_28cbc274_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_query_query_id_2185994b_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_query_query_id_2185994b_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tilajakamo
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

