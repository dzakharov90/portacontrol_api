PGDMP     *    	                x            portacontrol    9.6.13    9.6.17 %    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    64376    portacontrol    DATABASE     ~   CREATE DATABASE portacontrol WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE portacontrol;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12393    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    64382    domain_id_seq    SEQUENCE     v   CREATE SEQUENCE public.domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.domain_id_seq;
       public       postgres    false    3            �            1259    64384    domain    TABLE     �   CREATE TABLE public.domain (
    id integer DEFAULT nextval('public.domain_id_seq'::regclass) NOT NULL,
    domain character varying(255)
);
    DROP TABLE public.domain;
       public         postgres    false    185    3            �            1259    65748    knex_migrations    TABLE     �   CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);
 #   DROP TABLE public.knex_migrations;
       public         portacontrol    false    3            �            1259    65746    knex_migrations_id_seq    SEQUENCE        CREATE SEQUENCE public.knex_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.knex_migrations_id_seq;
       public       portacontrol    false    3    194            �           0    0    knex_migrations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;
            public       portacontrol    false    193            �            1259    65754    knex_migrations_lock    TABLE     D   CREATE TABLE public.knex_migrations_lock (
    is_locked integer
);
 (   DROP TABLE public.knex_migrations_lock;
       public         portacontrol    false    3            �            1259    64388    sip_interfaces_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.sip_interfaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.sip_interfaces_id_seq;
       public       postgres    false    3            �            1259    64391    sip_interfaces    TABLE       CREATE TABLE public.sip_interfaces (
    id integer DEFAULT nextval('public.sip_interfaces_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    sip_port character varying(255) NOT NULL,
    authcalls character varying(255) DEFAULT true NOT NULL,
    extsip_ip character varying(255) NOT NULL,
    extrtp_ip character varying(255) NOT NULL,
    challenge_realm character varying(255) NOT NULL,
    user_agent character varying(255) NOT NULL,
    disable_register character varying(255) DEFAULT false NOT NULL
);
 "   DROP TABLE public.sip_interfaces;
       public         postgres    false    187    3            �            1259    64400    sip_trunks_id_seq    SEQUENCE     z   CREATE SEQUENCE public.sip_trunks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sip_trunks_id_seq;
       public       postgres    false    3            �            1259    64402 
   sip_trunks    TABLE     �  CREATE TABLE public.sip_trunks (
    id integer DEFAULT nextval('public.sip_trunks_id_seq'::regclass) NOT NULL,
    gateway_name character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    realm character varying(255),
    fromuser character varying(255),
    fromdomain character varying(255),
    password character varying(255),
    extension character varying(255) NOT NULL,
    proxy character varying(255),
    registerproxy character varying(255),
    expireseconds character varying(255),
    register character varying(255) DEFAULT false NOT NULL,
    registertrans character varying(255),
    retryseconds character varying(255) DEFAULT 30 NOT NULL,
    calleridinfrom character varying(255) NOT NULL,
    pingenabled character varying(255) DEFAULT true NOT NULL,
    pingtime character varying(255),
    sip_interfaces character varying(255) NOT NULL,
    enabled character varying(255) DEFAULT true NOT NULL
);
    DROP TABLE public.sip_trunks;
       public         postgres    false    189    3            �            1259    64413    subscriber_id_seq    SEQUENCE     z   CREATE SEQUENCE public.subscriber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.subscriber_id_seq;
       public       postgres    false    3            �            1259    64415 
   subscriber    TABLE     F  CREATE TABLE public.subscriber (
    id integer DEFAULT nextval('public.subscriber_id_seq'::regclass) NOT NULL,
    clientid character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    calleridnum character varying(255),
    default_areacode character varying(255),
    domain character varying(255)
);
    DROP TABLE public.subscriber;
       public         postgres    false    191    3            �           2604    65751    knex_migrations id    DEFAULT     x   ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);
 A   ALTER TABLE public.knex_migrations ALTER COLUMN id DROP DEFAULT;
       public       portacontrol    false    194    193    194                      0    64384    domain 
   TABLE DATA               ,   COPY public.domain (id, domain) FROM stdin;
    public       postgres    false    186   _+       �           0    0    domain_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.domain_id_seq', 3, true);
            public       postgres    false    185            �          0    65748    knex_migrations 
   TABLE DATA               J   COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
    public       portacontrol    false    194   �+       �           0    0    knex_migrations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.knex_migrations_id_seq', 1, true);
            public       portacontrol    false    193            �          0    65754    knex_migrations_lock 
   TABLE DATA               9   COPY public.knex_migrations_lock (is_locked) FROM stdin;
    public       portacontrol    false    195   �+       �          0    64391    sip_interfaces 
   TABLE DATA               �   COPY public.sip_interfaces (id, name, sip_port, authcalls, extsip_ip, extrtp_ip, challenge_realm, user_agent, disable_register) FROM stdin;
    public       postgres    false    188   �+       �           0    0    sip_interfaces_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sip_interfaces_id_seq', 2, true);
            public       postgres    false    187            �          0    64402 
   sip_trunks 
   TABLE DATA               �   COPY public.sip_trunks (id, gateway_name, username, realm, fromuser, fromdomain, password, extension, proxy, registerproxy, expireseconds, register, registertrans, retryseconds, calleridinfrom, pingenabled, pingtime, sip_interfaces, enabled) FROM stdin;
    public       postgres    false    190   d,       �           0    0    sip_trunks_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.sip_trunks_id_seq', 7, true);
            public       postgres    false    189            �          0    64415 
   subscriber 
   TABLE DATA               c   COPY public.subscriber (id, clientid, password, calleridnum, default_areacode, domain) FROM stdin;
    public       postgres    false    192   �,       �           0    0    subscriber_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.subscriber_id_seq', 3, true);
            public       postgres    false    191                        2606    64423    domain domain_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.domain
    ADD CONSTRAINT domain_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.domain DROP CONSTRAINT domain_pkey;
       public         postgres    false    186    186                       2606    65753 $   knex_migrations knex_migrations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.knex_migrations DROP CONSTRAINT knex_migrations_pkey;
       public         portacontrol    false    194    194                       2606    64425 "   sip_interfaces sip_interfaces_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.sip_interfaces
    ADD CONSTRAINT sip_interfaces_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.sip_interfaces DROP CONSTRAINT sip_interfaces_pkey;
       public         postgres    false    188    188                       2606    64427    sip_trunks sip_trunks_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.sip_trunks
    ADD CONSTRAINT sip_trunks_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.sip_trunks DROP CONSTRAINT sip_trunks_pkey;
       public         postgres    false    190    190                       2606    64429    subscriber subscriber_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.subscriber DROP CONSTRAINT subscriber_pkey;
       public         postgres    false    192    192                  x�3�44�"3=#3�=... $N=      �   F   x�3�42020064441�01��/*It��+)����*�4+�50�54T04�"#c=sSmc�=... 0(D      �      x�3������ S �      �   V   x�3�L�(I-�K��4503�LK�)N�4�4�345ѳ4�343E�&���ǧ��r�Te�'���$:����p���r��qqq �~�      �   g   x�3�,I-.1䴰0641067002356���O���K���KO�K��%� ��,�=;�8ȝ�Zc3Β��T�ҔNc(L 9�%�Ey�9�i�9ũ\1z\\\ '�6S      �   B   x�3�4124561�,I-.1426��!C= 23�321�2�41���4CR��414BU���� Q��     