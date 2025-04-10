PGDMP  ;                    }            dbinventory    17.4    17.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16387    dbinventory    DATABASE     q   CREATE DATABASE dbinventory WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-MX';
    DROP DATABASE dbinventory;
                     postgres    false            	            2615    16391    buys    SCHEMA        CREATE SCHEMA buys;
    DROP SCHEMA buys;
                     postgres    false            
            2615    16392 	   promotion    SCHEMA        CREATE SCHEMA promotion;
    DROP SCHEMA promotion;
                     postgres    false                        2615    16388    sale    SCHEMA        CREATE SCHEMA sale;
    DROP SCHEMA sale;
                     postgres    false                        2615    16390    store    SCHEMA        CREATE SCHEMA store;
    DROP SCHEMA store;
                     postgres    false                        2615    16389    users    SCHEMA        CREATE SCHEMA users;
    DROP SCHEMA users;
                     postgres    false            �            1259    16585    buy    TABLE     �   CREATE TABLE buys.buy (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_detail integer NOT NULL,
    id_supplier integer NOT NULL,
    date_buy date DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE buys.buy;
       buys         heap r       postgres    false    9            �            1259    16584 
   buy_id_seq    SEQUENCE     �   CREATE SEQUENCE buys.buy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE buys.buy_id_seq;
       buys               postgres    false    9    251            �           0    0 
   buy_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE buys.buy_id_seq OWNED BY buys.buy.id;
          buys               postgres    false    250            �            1259    16571    detail    TABLE       CREATE TABLE buys.detail (
    id integer NOT NULL,
    id_item integer NOT NULL,
    cost_detail integer NOT NULL,
    amount_detail integer,
    CONSTRAINT amount_valid CHECK ((amount_detail >= 0)),
    CONSTRAINT cost_valid CHECK ((cost_detail >= 0))
);
    DROP TABLE buys.detail;
       buys         heap r       postgres    false    9            �            1259    16570    detail_id_seq    SEQUENCE     �   CREATE SEQUENCE buys.detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE buys.detail_id_seq;
       buys               postgres    false    9    249            �           0    0    detail_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE buys.detail_id_seq OWNED BY buys.detail.id;
          buys               postgres    false    248            �            1259    16562    supplier    TABLE     �   CREATE TABLE buys.supplier (
    id integer NOT NULL,
    supplier_name text NOT NULL,
    company_name text NOT NULL,
    email text NOT NULL,
    phone_number text NOT NULL
);
    DROP TABLE buys.supplier;
       buys         heap r       postgres    false    9            �            1259    16561    supplier_id_seq    SEQUENCE     �   CREATE SEQUENCE buys.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE buys.supplier_id_seq;
       buys               postgres    false    247    9            �           0    0    supplier_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE buys.supplier_id_seq OWNED BY buys.supplier.id;
          buys               postgres    false    246            �            1259    16608 	   promotion    TABLE     6  CREATE TABLE promotion.promotion (
    id integer NOT NULL,
    id_item integer NOT NULL,
    date_promotion date DEFAULT CURRENT_TIMESTAMP,
    amount_promotion integer,
    discount integer,
    CONSTRAINT amount_valid CHECK ((amount_promotion >= 0)),
    CONSTRAINT discount_valid CHECK ((discount > 0))
);
     DROP TABLE promotion.promotion;
    	   promotion         heap r       postgres    false    10            �            1259    16607    promotion_id_seq    SEQUENCE     �   CREATE SEQUENCE promotion.promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE promotion.promotion_id_seq;
    	   promotion               postgres    false    253    10            �           0    0    promotion_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE promotion.promotion_id_seq OWNED BY promotion.promotion.id;
       	   promotion               postgres    false    252            �            1259    16516    client    TABLE     U   CREATE TABLE sale.client (
    id integer NOT NULL,
    name_client text NOT NULL
);
    DROP TABLE sale.client;
       sale         heap r       postgres    false    6            �            1259    16515    client_id_seq    SEQUENCE     �   CREATE SEQUENCE sale.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE sale.client_id_seq;
       sale               postgres    false    241    6            �           0    0    client_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE sale.client_id_seq OWNED BY sale.client.id;
          sale               postgres    false    240            �            1259    16538    sale    TABLE       CREATE TABLE sale.sale (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_client integer NOT NULL,
    id_detail integer NOT NULL,
    date_sale date DEFAULT CURRENT_TIMESTAMP,
    stock integer,
    CONSTRAINT stock_valid CHECK ((stock >= 0))
);
    DROP TABLE sale.sale;
       sale         heap r       postgres    false    6            �            1259    16525    sale_detail    TABLE     �   CREATE TABLE sale.sale_detail (
    id integer NOT NULL,
    id_item integer NOT NULL,
    cost_detail integer NOT NULL,
    amount integer,
    CONSTRAINT amount_valid CHECK ((amount >= 0))
);
    DROP TABLE sale.sale_detail;
       sale         heap r       postgres    false    6            �            1259    16524    sale_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE sale.sale_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE sale.sale_detail_id_seq;
       sale               postgres    false    243    6            �           0    0    sale_detail_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE sale.sale_detail_id_seq OWNED BY sale.sale_detail.id;
          sale               postgres    false    242            �            1259    16537    sale_id_seq    SEQUENCE     �   CREATE SEQUENCE sale.sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE sale.sale_id_seq;
       sale               postgres    false    6    245            �           0    0    sale_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE sale.sale_id_seq OWNED BY sale.sale.id;
          sale               postgres    false    244            �            1259    16487    item    TABLE     v   CREATE TABLE store.item (
    id integer NOT NULL,
    name_item text NOT NULL,
    description_item text NOT NULL
);
    DROP TABLE store.item;
       store         heap r       postgres    false    8            �            1259    16486    item_id_seq    SEQUENCE     �   CREATE SEQUENCE store.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE store.item_id_seq;
       store               postgres    false    237    8            �           0    0    item_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE store.item_id_seq OWNED BY store.item.id;
          store               postgres    false    236            �            1259    16496    store    TABLE     �  CREATE TABLE store.store (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_item integer NOT NULL,
    date_store date DEFAULT CURRENT_TIMESTAMP,
    motion character(1) NOT NULL,
    amount_store integer,
    final_amount integer,
    CONSTRAINT amount_valid CHECK ((amount_store >= 0)),
    CONSTRAINT motion_valid CHECK ((motion = ANY (ARRAY['i'::bpchar, 's'::bpchar])))
);
    DROP TABLE store.store;
       store         heap r       postgres    false    8            �            1259    16495    store_id_seq    SEQUENCE     �   CREATE SEQUENCE store.store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE store.store_id_seq;
       store               postgres    false    8    239            �           0    0    store_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE store.store_id_seq OWNED BY store.store.id;
          store               postgres    false    238            �            1259    16403    area    TABLE     m   CREATE TABLE users.area (
    id integer NOT NULL,
    name_area text NOT NULL,
    description_area text
);
    DROP TABLE users.area;
       users         heap r       postgres    false    7            �            1259    16402    area_id_seq    SEQUENCE     �   CREATE SEQUENCE users.area_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE users.area_id_seq;
       users               postgres    false    225    7            �           0    0    area_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE users.area_id_seq OWNED BY users.area.id;
          users               postgres    false    224            �            1259    16456    assing_area    TABLE     |   CREATE TABLE users.assing_area (
    id integer NOT NULL,
    id_employee integer NOT NULL,
    id_area integer NOT NULL
);
    DROP TABLE users.assing_area;
       users         heap r       postgres    false    7            �            1259    16455    assing_area_id_seq    SEQUENCE     �   CREATE SEQUENCE users.assing_area_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE users.assing_area_id_seq;
       users               postgres    false    7    233            �           0    0    assing_area_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE users.assing_area_id_seq OWNED BY users.assing_area.id;
          users               postgres    false    232            �            1259    16435    contract    TABLE     "  CREATE TABLE users.contract (
    id integer NOT NULL,
    id_employee integer NOT NULL,
    id_position integer NOT NULL,
    date_contract date DEFAULT CURRENT_TIMESTAMP,
    type_contract text NOT NULL,
    time_contract integer,
    CONSTRAINT time_valid CHECK ((time_contract > 0))
);
    DROP TABLE users.contract;
       users         heap r       postgres    false    7            �            1259    16434    contract_id_seq    SEQUENCE     �   CREATE SEQUENCE users.contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE users.contract_id_seq;
       users               postgres    false    231    7            �           0    0    contract_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE users.contract_id_seq OWNED BY users.contract.id;
          users               postgres    false    230            �            1259    16473    control_access    TABLE     �   CREATE TABLE users.control_access (
    id integer NOT NULL,
    id_user integer NOT NULL,
    admin_control_access text,
    buys_control_access text,
    sale_control_access text,
    store_control_access text
);
 !   DROP TABLE users.control_access;
       users         heap r       postgres    false    7            �            1259    16472    control_access_id_seq    SEQUENCE     �   CREATE SEQUENCE users.control_access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE users.control_access_id_seq;
       users               postgres    false    7    235            �           0    0    control_access_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE users.control_access_id_seq OWNED BY users.control_access.id;
          users               postgres    false    234            �            1259    16412    employee    TABLE     �   CREATE TABLE users.employee (
    id integer NOT NULL,
    id_user integer NOT NULL,
    name_employee text NOT NULL,
    ap_paterno text,
    ap_materno text
);
    DROP TABLE users.employee;
       users         heap r       postgres    false    7            �            1259    16411    employee_id_seq    SEQUENCE     �   CREATE SEQUENCE users.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE users.employee_id_seq;
       users               postgres    false    227    7            �           0    0    employee_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE users.employee_id_seq OWNED BY users.employee.id;
          users               postgres    false    226            �            1259    16426    position    TABLE     r   CREATE TABLE users."position" (
    id integer NOT NULL,
    name_position text,
    description_position text
);
    DROP TABLE users."position";
       users         heap r       postgres    false    7            �            1259    16425    position_id_seq    SEQUENCE     �   CREATE SEQUENCE users.position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE users.position_id_seq;
       users               postgres    false    7    229            �           0    0    position_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE users.position_id_seq OWNED BY users."position".id;
          users               postgres    false    228            �            1259    16394    users    TABLE     t   CREATE TABLE users.users (
    id integer NOT NULL,
    name_user text NOT NULL,
    password_user text NOT NULL
);
    DROP TABLE users.users;
       users         heap r       postgres    false    7            �            1259    16393    users_id_seq    SEQUENCE     �   CREATE SEQUENCE users.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE users.users_id_seq;
       users               postgres    false    223    7            �           0    0    users_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE users.users_id_seq OWNED BY users.users.id;
          users               postgres    false    222            �           2604    16588    buy id    DEFAULT     \   ALTER TABLE ONLY buys.buy ALTER COLUMN id SET DEFAULT nextval('buys.buy_id_seq'::regclass);
 3   ALTER TABLE buys.buy ALTER COLUMN id DROP DEFAULT;
       buys               postgres    false    250    251    251            �           2604    16574 	   detail id    DEFAULT     b   ALTER TABLE ONLY buys.detail ALTER COLUMN id SET DEFAULT nextval('buys.detail_id_seq'::regclass);
 6   ALTER TABLE buys.detail ALTER COLUMN id DROP DEFAULT;
       buys               postgres    false    248    249    249            �           2604    16565    supplier id    DEFAULT     f   ALTER TABLE ONLY buys.supplier ALTER COLUMN id SET DEFAULT nextval('buys.supplier_id_seq'::regclass);
 8   ALTER TABLE buys.supplier ALTER COLUMN id DROP DEFAULT;
       buys               postgres    false    246    247    247            �           2604    16611    promotion id    DEFAULT     r   ALTER TABLE ONLY promotion.promotion ALTER COLUMN id SET DEFAULT nextval('promotion.promotion_id_seq'::regclass);
 >   ALTER TABLE promotion.promotion ALTER COLUMN id DROP DEFAULT;
    	   promotion               postgres    false    253    252    253            �           2604    16519 	   client id    DEFAULT     b   ALTER TABLE ONLY sale.client ALTER COLUMN id SET DEFAULT nextval('sale.client_id_seq'::regclass);
 6   ALTER TABLE sale.client ALTER COLUMN id DROP DEFAULT;
       sale               postgres    false    241    240    241            �           2604    16541    sale id    DEFAULT     ^   ALTER TABLE ONLY sale.sale ALTER COLUMN id SET DEFAULT nextval('sale.sale_id_seq'::regclass);
 4   ALTER TABLE sale.sale ALTER COLUMN id DROP DEFAULT;
       sale               postgres    false    245    244    245            �           2604    16528    sale_detail id    DEFAULT     l   ALTER TABLE ONLY sale.sale_detail ALTER COLUMN id SET DEFAULT nextval('sale.sale_detail_id_seq'::regclass);
 ;   ALTER TABLE sale.sale_detail ALTER COLUMN id DROP DEFAULT;
       sale               postgres    false    243    242    243            �           2604    16490    item id    DEFAULT     `   ALTER TABLE ONLY store.item ALTER COLUMN id SET DEFAULT nextval('store.item_id_seq'::regclass);
 5   ALTER TABLE store.item ALTER COLUMN id DROP DEFAULT;
       store               postgres    false    237    236    237            �           2604    16499    store id    DEFAULT     b   ALTER TABLE ONLY store.store ALTER COLUMN id SET DEFAULT nextval('store.store_id_seq'::regclass);
 6   ALTER TABLE store.store ALTER COLUMN id DROP DEFAULT;
       store               postgres    false    239    238    239            �           2604    16406    area id    DEFAULT     `   ALTER TABLE ONLY users.area ALTER COLUMN id SET DEFAULT nextval('users.area_id_seq'::regclass);
 5   ALTER TABLE users.area ALTER COLUMN id DROP DEFAULT;
       users               postgres    false    224    225    225            �           2604    16459    assing_area id    DEFAULT     n   ALTER TABLE ONLY users.assing_area ALTER COLUMN id SET DEFAULT nextval('users.assing_area_id_seq'::regclass);
 <   ALTER TABLE users.assing_area ALTER COLUMN id DROP DEFAULT;
       users               postgres    false    232    233    233            �           2604    16438    contract id    DEFAULT     h   ALTER TABLE ONLY users.contract ALTER COLUMN id SET DEFAULT nextval('users.contract_id_seq'::regclass);
 9   ALTER TABLE users.contract ALTER COLUMN id DROP DEFAULT;
       users               postgres    false    230    231    231            �           2604    16476    control_access id    DEFAULT     t   ALTER TABLE ONLY users.control_access ALTER COLUMN id SET DEFAULT nextval('users.control_access_id_seq'::regclass);
 ?   ALTER TABLE users.control_access ALTER COLUMN id DROP DEFAULT;
       users               postgres    false    234    235    235            �           2604    16415    employee id    DEFAULT     h   ALTER TABLE ONLY users.employee ALTER COLUMN id SET DEFAULT nextval('users.employee_id_seq'::regclass);
 9   ALTER TABLE users.employee ALTER COLUMN id DROP DEFAULT;
       users               postgres    false    226    227    227            �           2604    16429    position id    DEFAULT     j   ALTER TABLE ONLY users."position" ALTER COLUMN id SET DEFAULT nextval('users.position_id_seq'::regclass);
 ;   ALTER TABLE users."position" ALTER COLUMN id DROP DEFAULT;
       users               postgres    false    228    229    229            �           2604    16397    users id    DEFAULT     b   ALTER TABLE ONLY users.users ALTER COLUMN id SET DEFAULT nextval('users.users_id_seq'::regclass);
 6   ALTER TABLE users.users ALTER COLUMN id DROP DEFAULT;
       users               postgres    false    222    223    223            �          0    16585    buy 
   TABLE DATA           J   COPY buys.buy (id, id_user, id_detail, id_supplier, date_buy) FROM stdin;
    buys               postgres    false    251   f�       �          0    16571    detail 
   TABLE DATA           G   COPY buys.detail (id, id_item, cost_detail, amount_detail) FROM stdin;
    buys               postgres    false    249   H�       �          0    16562    supplier 
   TABLE DATA           V   COPY buys.supplier (id, supplier_name, company_name, email, phone_number) FROM stdin;
    buys               postgres    false    247   �       �          0    16608 	   promotion 
   TABLE DATA           _   COPY promotion.promotion (id, id_item, date_promotion, amount_promotion, discount) FROM stdin;
 	   promotion               postgres    false    253   Ɯ       �          0    16516    client 
   TABLE DATA           /   COPY sale.client (id, name_client) FROM stdin;
    sale               postgres    false    241   =�       �          0    16538    sale 
   TABLE DATA           Q   COPY sale.sale (id, id_user, id_client, id_detail, date_sale, stock) FROM stdin;
    sale               postgres    false    245   X�       �          0    16525    sale_detail 
   TABLE DATA           E   COPY sale.sale_detail (id, id_item, cost_detail, amount) FROM stdin;
    sale               postgres    false    243   �       �          0    16487    item 
   TABLE DATA           >   COPY store.item (id, name_item, description_item) FROM stdin;
    store               postgres    false    237   ��       �          0    16496    store 
   TABLE DATA           d   COPY store.store (id, id_user, id_item, date_store, motion, amount_store, final_amount) FROM stdin;
    store               postgres    false    239   �       �          0    16403    area 
   TABLE DATA           >   COPY users.area (id, name_area, description_area) FROM stdin;
    users               postgres    false    225   ��       �          0    16456    assing_area 
   TABLE DATA           >   COPY users.assing_area (id, id_employee, id_area) FROM stdin;
    users               postgres    false    233   ñ       �          0    16435    contract 
   TABLE DATA           l   COPY users.contract (id, id_employee, id_position, date_contract, type_contract, time_contract) FROM stdin;
    users               postgres    false    231   0�       �          0    16473    control_access 
   TABLE DATA           �   COPY users.control_access (id, id_user, admin_control_access, buys_control_access, sale_control_access, store_control_access) FROM stdin;
    users               postgres    false    235   2�       �          0    16412    employee 
   TABLE DATA           U   COPY users.employee (id, id_user, name_employee, ap_paterno, ap_materno) FROM stdin;
    users               postgres    false    227   ٳ       �          0    16426    position 
   TABLE DATA           L   COPY users."position" (id, name_position, description_position) FROM stdin;
    users               postgres    false    229   9�       �          0    16394    users 
   TABLE DATA           <   COPY users.users (id, name_user, password_user) FROM stdin;
    users               postgres    false    223   e�       �           0    0 
   buy_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('buys.buy_id_seq', 90, true);
          buys               postgres    false    250            �           0    0    detail_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('buys.detail_id_seq', 90, true);
          buys               postgres    false    248            �           0    0    supplier_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('buys.supplier_id_seq', 10, true);
          buys               postgres    false    246            �           0    0    promotion_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('promotion.promotion_id_seq', 10, true);
       	   promotion               postgres    false    252            �           0    0    client_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('sale.client_id_seq', 90, true);
          sale               postgres    false    240            �           0    0    sale_detail_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('sale.sale_detail_id_seq', 90, true);
          sale               postgres    false    242            �           0    0    sale_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('sale.sale_id_seq', 90, true);
          sale               postgres    false    244            �           0    0    item_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('store.item_id_seq', 90, true);
          store               postgres    false    236            �           0    0    store_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('store.store_id_seq', 90, true);
          store               postgres    false    238            �           0    0    area_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('users.area_id_seq', 20, true);
          users               postgres    false    224            �           0    0    assing_area_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('users.assing_area_id_seq', 20, true);
          users               postgres    false    232            �           0    0    contract_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('users.contract_id_seq', 20, true);
          users               postgres    false    230            �           0    0    control_access_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('users.control_access_id_seq', 20, true);
          users               postgres    false    234            �           0    0    employee_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('users.employee_id_seq', 20, true);
          users               postgres    false    226            �           0    0    position_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('users.position_id_seq', 20, true);
          users               postgres    false    228            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('users.users_id_seq', 60, true);
          users               postgres    false    222            �           2606    16591 
   buy pk_buy 
   CONSTRAINT     F   ALTER TABLE ONLY buys.buy
    ADD CONSTRAINT pk_buy PRIMARY KEY (id);
 2   ALTER TABLE ONLY buys.buy DROP CONSTRAINT pk_buy;
       buys                 postgres    false    251            �           2606    16578    detail pk_detail 
   CONSTRAINT     L   ALTER TABLE ONLY buys.detail
    ADD CONSTRAINT pk_detail PRIMARY KEY (id);
 8   ALTER TABLE ONLY buys.detail DROP CONSTRAINT pk_detail;
       buys                 postgres    false    249            �           2606    16569    supplier pk_supplier 
   CONSTRAINT     P   ALTER TABLE ONLY buys.supplier
    ADD CONSTRAINT pk_supplier PRIMARY KEY (id);
 <   ALTER TABLE ONLY buys.supplier DROP CONSTRAINT pk_supplier;
       buys                 postgres    false    247            �           2606    16616    promotion pk_promotion 
   CONSTRAINT     W   ALTER TABLE ONLY promotion.promotion
    ADD CONSTRAINT pk_promotion PRIMARY KEY (id);
 C   ALTER TABLE ONLY promotion.promotion DROP CONSTRAINT pk_promotion;
    	   promotion                 postgres    false    253            �           2606    16523    client pk_client 
   CONSTRAINT     L   ALTER TABLE ONLY sale.client
    ADD CONSTRAINT pk_client PRIMARY KEY (id);
 8   ALTER TABLE ONLY sale.client DROP CONSTRAINT pk_client;
       sale                 postgres    false    241            �           2606    16531    sale_detail pk_detail 
   CONSTRAINT     Q   ALTER TABLE ONLY sale.sale_detail
    ADD CONSTRAINT pk_detail PRIMARY KEY (id);
 =   ALTER TABLE ONLY sale.sale_detail DROP CONSTRAINT pk_detail;
       sale                 postgres    false    243            �           2606    16545    sale pk_sale 
   CONSTRAINT     H   ALTER TABLE ONLY sale.sale
    ADD CONSTRAINT pk_sale PRIMARY KEY (id);
 4   ALTER TABLE ONLY sale.sale DROP CONSTRAINT pk_sale;
       sale                 postgres    false    245            �           2606    16494    item pk_item 
   CONSTRAINT     I   ALTER TABLE ONLY store.item
    ADD CONSTRAINT pk_item PRIMARY KEY (id);
 5   ALTER TABLE ONLY store.item DROP CONSTRAINT pk_item;
       store                 postgres    false    237            �           2606    16504    store pk_store 
   CONSTRAINT     K   ALTER TABLE ONLY store.store
    ADD CONSTRAINT pk_store PRIMARY KEY (id);
 7   ALTER TABLE ONLY store.store DROP CONSTRAINT pk_store;
       store                 postgres    false    239            �           2606    16410    area pk_area 
   CONSTRAINT     I   ALTER TABLE ONLY users.area
    ADD CONSTRAINT pk_area PRIMARY KEY (id);
 5   ALTER TABLE ONLY users.area DROP CONSTRAINT pk_area;
       users                 postgres    false    225            �           2606    16461    assing_area pk_assing_area 
   CONSTRAINT     W   ALTER TABLE ONLY users.assing_area
    ADD CONSTRAINT pk_assing_area PRIMARY KEY (id);
 C   ALTER TABLE ONLY users.assing_area DROP CONSTRAINT pk_assing_area;
       users                 postgres    false    233            �           2606    16444    contract pk_contract 
   CONSTRAINT     Q   ALTER TABLE ONLY users.contract
    ADD CONSTRAINT pk_contract PRIMARY KEY (id);
 =   ALTER TABLE ONLY users.contract DROP CONSTRAINT pk_contract;
       users                 postgres    false    231            �           2606    16480     control_access pk_control_access 
   CONSTRAINT     ]   ALTER TABLE ONLY users.control_access
    ADD CONSTRAINT pk_control_access PRIMARY KEY (id);
 I   ALTER TABLE ONLY users.control_access DROP CONSTRAINT pk_control_access;
       users                 postgres    false    235            �           2606    16419    employee pk_employee 
   CONSTRAINT     Q   ALTER TABLE ONLY users.employee
    ADD CONSTRAINT pk_employee PRIMARY KEY (id);
 =   ALTER TABLE ONLY users.employee DROP CONSTRAINT pk_employee;
       users                 postgres    false    227            �           2606    16433    position pk_position 
   CONSTRAINT     S   ALTER TABLE ONLY users."position"
    ADD CONSTRAINT pk_position PRIMARY KEY (id);
 ?   ALTER TABLE ONLY users."position" DROP CONSTRAINT pk_position;
       users                 postgres    false    229            �           2606    16401    users pk_user 
   CONSTRAINT     J   ALTER TABLE ONLY users.users
    ADD CONSTRAINT pk_user PRIMARY KEY (id);
 6   ALTER TABLE ONLY users.users DROP CONSTRAINT pk_user;
       users                 postgres    false    223            �           2606    16597    buy fk_detail    FK CONSTRAINT     k   ALTER TABLE ONLY buys.buy
    ADD CONSTRAINT fk_detail FOREIGN KEY (id_detail) REFERENCES buys.detail(id);
 5   ALTER TABLE ONLY buys.buy DROP CONSTRAINT fk_detail;
       buys               postgres    false    251    4833    249            �           2606    16579    detail fk_item    FK CONSTRAINT     i   ALTER TABLE ONLY buys.detail
    ADD CONSTRAINT fk_item FOREIGN KEY (id_item) REFERENCES store.item(id);
 6   ALTER TABLE ONLY buys.detail DROP CONSTRAINT fk_item;
       buys               postgres    false    249    4821    237            �           2606    16602    buy fk_supplier    FK CONSTRAINT     q   ALTER TABLE ONLY buys.buy
    ADD CONSTRAINT fk_supplier FOREIGN KEY (id_supplier) REFERENCES buys.supplier(id);
 7   ALTER TABLE ONLY buys.buy DROP CONSTRAINT fk_supplier;
       buys               postgres    false    4831    251    247            �           2606    16592    buy fk_user    FK CONSTRAINT     g   ALTER TABLE ONLY buys.buy
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES users.users(id);
 3   ALTER TABLE ONLY buys.buy DROP CONSTRAINT fk_user;
       buys               postgres    false    4807    251    223            �           2606    16617    promotion fk_item    FK CONSTRAINT     q   ALTER TABLE ONLY promotion.promotion
    ADD CONSTRAINT fk_item FOREIGN KEY (id_item) REFERENCES store.item(id);
 >   ALTER TABLE ONLY promotion.promotion DROP CONSTRAINT fk_item;
    	   promotion               postgres    false    253    4821    237            �           2606    16551    sale fk_client    FK CONSTRAINT     l   ALTER TABLE ONLY sale.sale
    ADD CONSTRAINT fk_client FOREIGN KEY (id_client) REFERENCES sale.client(id);
 6   ALTER TABLE ONLY sale.sale DROP CONSTRAINT fk_client;
       sale               postgres    false    245    4825    241            �           2606    16556    sale fk_detail    FK CONSTRAINT     q   ALTER TABLE ONLY sale.sale
    ADD CONSTRAINT fk_detail FOREIGN KEY (id_detail) REFERENCES sale.sale_detail(id);
 6   ALTER TABLE ONLY sale.sale DROP CONSTRAINT fk_detail;
       sale               postgres    false    245    4827    243            �           2606    16532    sale_detail fk_item    FK CONSTRAINT     n   ALTER TABLE ONLY sale.sale_detail
    ADD CONSTRAINT fk_item FOREIGN KEY (id_item) REFERENCES store.item(id);
 ;   ALTER TABLE ONLY sale.sale_detail DROP CONSTRAINT fk_item;
       sale               postgres    false    4821    243    237            �           2606    16546    sale fk_user    FK CONSTRAINT     h   ALTER TABLE ONLY sale.sale
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES users.users(id);
 4   ALTER TABLE ONLY sale.sale DROP CONSTRAINT fk_user;
       sale               postgres    false    223    245    4807            �           2606    16510    store fk_item    FK CONSTRAINT     i   ALTER TABLE ONLY store.store
    ADD CONSTRAINT fk_item FOREIGN KEY (id_item) REFERENCES store.item(id);
 6   ALTER TABLE ONLY store.store DROP CONSTRAINT fk_item;
       store               postgres    false    239    237    4821            �           2606    16505    store fk_user    FK CONSTRAINT     j   ALTER TABLE ONLY store.store
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES users.users(id);
 6   ALTER TABLE ONLY store.store DROP CONSTRAINT fk_user;
       store               postgres    false    4807    239    223            �           2606    16467    assing_area fk_area    FK CONSTRAINT     o   ALTER TABLE ONLY users.assing_area
    ADD CONSTRAINT fk_area FOREIGN KEY (id_area) REFERENCES users.area(id);
 <   ALTER TABLE ONLY users.assing_area DROP CONSTRAINT fk_area;
       users               postgres    false    225    4809    233            �           2606    16445    contract fk_employee    FK CONSTRAINT     x   ALTER TABLE ONLY users.contract
    ADD CONSTRAINT fk_employee FOREIGN KEY (id_employee) REFERENCES users.employee(id);
 =   ALTER TABLE ONLY users.contract DROP CONSTRAINT fk_employee;
       users               postgres    false    231    4811    227            �           2606    16462    assing_area fk_employee    FK CONSTRAINT     {   ALTER TABLE ONLY users.assing_area
    ADD CONSTRAINT fk_employee FOREIGN KEY (id_employee) REFERENCES users.employee(id);
 @   ALTER TABLE ONLY users.assing_area DROP CONSTRAINT fk_employee;
       users               postgres    false    227    4811    233            �           2606    16450    contract fk_position    FK CONSTRAINT     z   ALTER TABLE ONLY users.contract
    ADD CONSTRAINT fk_position FOREIGN KEY (id_position) REFERENCES users."position"(id);
 =   ALTER TABLE ONLY users.contract DROP CONSTRAINT fk_position;
       users               postgres    false    229    4813    231            �           2606    16481    control_access fk_user    FK CONSTRAINT     s   ALTER TABLE ONLY users.control_access
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES users.users(id);
 ?   ALTER TABLE ONLY users.control_access DROP CONSTRAINT fk_user;
       users               postgres    false    223    235    4807            �           2606    16420    employee fk_users_user    FK CONSTRAINT     s   ALTER TABLE ONLY users.employee
    ADD CONSTRAINT fk_users_user FOREIGN KEY (id_user) REFERENCES users.users(id);
 ?   ALTER TABLE ONLY users.employee DROP CONSTRAINT fk_users_user;
       users               postgres    false    227    4807    223            �   �  x�]�Q�c1D��f/=2�����:��H�v)GQ���?����f���o3�"{�������>���(/eQ֫}�2��K�h�����U�"a�Q#QD�"�ƋH�1�(bj���/"�F�b�cw���O��%��/��	QTc}�ME5^DQ�QT�>�OUI5^�h�A��~/���F�w�"���)Q=�!���t:�#�OB4���#����%�"WB����ų&�?N�"B��x��(�$D�OB��xf��F��PB�ĽxV?tE'DQ8�	��K�(!�"	Q��YH )�@�h��g�\��"jtBD��x��75�p��A��q��MDԘ�h��DR��3��DQ*!��Q�g�g0Q�N��B�Y<��}��E9	Q�g�gp"f6B�L%D�<�g8�E��h:!��Y<��(��E3	�_ҵx�;8�4�B�j����?�
(�      �   �  x�E�[��*C��`�B��˙�8�I+��]��^�76�=�g��YǞ��@`��\���s
�6V�a�7����y���>�ȵ�	�������y�6���+���0g7T��]�ּ��b7K~�W�UX{84�`k_��(������,�+j���zu�ʳ,�8v���(��(O������MȆ!�˰찁C�M�oV���ξ؝��3yE�@�;�Q�Ny���=�3a���a���0v|�i���/�(�!
!A���8a�k�Ð)il�0�#�!)��0d!�!)Iyaȃ�����(a(C	C9J*P�P��{|�P����:(a`|-���І�v�0t������.�04ߢ0����Z���a���1�0�c�a#<a���4F���0#���0��o��?5���      �   �  x�]�Mn�@�לS�	ɉ��$E좫nh�L0?%�w=J�Yd�#�b��vu%�����89�tt�0��6-�mgMd�sg=�66z3�O�&�)^ʓ*z��fy�M�,WSX!������Zh_��B�Q����	xE.��jL��+X�-q��ի@��{Ւ`����78ȅ�Aݝ�1�J]�;q�F�&�� {�L�v���T5��SyL�V�4���/��A0Ͼ��␒!=�"sl���-e#@��c������"���%.��LZ:"`;tƝ+c΍���G��`�<q�b��;���Ȱ�ڟZ����r��`w�h�M"�MW��?���9�D���.�1�N����;r����Yw�%44���`�dxd���[��U���#Ij%���/��f0����I,��L��(�� kF��      �   g   x�U�Q
�@���.���fw���Ȗ ��)�aj�)7S��*��H�
q�Ok�T��]G�Lp�j5��r�ٕ�\K���+����*���޽v�U1"�      �     x�MU�r�8����܈�T�Ȏ|>;�H�׬ED�| ��S�Gq��E&]Z��} 	ʕG�b���1ewd�;%k�O�U��؊�2]�1-��w8�م�����]�['��ZX�_u���m������z�����%�N�f��[���l���-*��I�&YYw�K�܅wg'��m�,
���iʮ��$+�zkx���*���{��������7�P�{�Z����((ٚ�����ѡb�U�v�Zz��AX�K��d+��va{�6�dE+�w�V�\�}����g�m�.I�s@��g)�P���7�Îg{ %l�HG�x0�٥{���(�$F���J�.޺s��H*��]Vƶa��	�pl���(YN����/"�[Rt"��];s/�O�y�������P{j����<c���4����u8-�U��">y8%����<�qW��\u/R��m�>� F�dk,:�
��s�3F�E�n�d�흱@��E�}c:��l��9^���E1<(p�{
*/G��I�@%���}h\��a�y k��`���vg&�����c�5rR,1���h+��FIg�8��ṃ�����j,3vK�R�I��S4C���(�M��]of#������;�[ʒM��z�?�F�/�Yۣ�F+��܅��У� �*�S.g�^(�;3��Z�� �w�	�`om�N|��*c[B�$���
RT#@��*���6���wR�|�4�)`�3V�E��y��Ю��,���˨o�̑5�K��x�}P#�A1�����Il����*$$3���f}��V��ڿ�zc�ICѕu�!���<��iN��d_p�y,Xu'�uł���E{�5 �z:�֨�fN��a_�'HD;A�7j  .$dca���j����M�V�"���.�v��4��׎ZRA�& �M~�zL���+�Έ��M�+:%�N��@�fzp%쑆����;��G?4��j�G���n����%�P��<�\�3�3�1����s�?���      �   �  x�U�Q��*��]�����e�����X堣>ȑ�5v�����=査��ǵ�v�ֻ��Mv'�v{�l�=���\?�v{��Z,�~vKv��ٍ��Պ�b��ζ��,�^��[*��x0@�=�uy}8�h]�D7�uM>K�D�+����C�D7gD�B�DO m����'���5��������mH���~�8'<���}�J�̉1��%R'F8�l����:>K��XPR'F:�ԉ�sjz,�c;tR�ļ�ԉ��st{J��Á�}�=5��)ub��%�R�g��S��\N���;1ͽNۧ�Y_��O�s;��!{"�~��!{"�u>�O�pB�C�D�������:��3�|H��W^�
���|ȝ���\�!�u����v@��+�:��\��r^�#s�t��?RW�:��/�3��#u�r��#uE:������ǒ�b;��K�ĺ�ԉ��>`���:��:��N��@�_R'V�d��K�댁��~�ܗ��_r'V�`��/����_�'�vB�S�D�/u>eOdw�Χ�N�|J�H��ZK٧���O��t>%O��/|�����)w"�ps�i�Ηԉ����:Q��/�e�c+�5��%u��	�/�י��|I��� ��:Q����e/�/�@�%u��:��N��/�����*id�      �   �  x�=�ٍ� ��I1��Oz���؁0+Y
��200��|&&���s�����g;����{T(̳�шw�XX��g�=q0��|��1�����3f*�}�`Q�y�'�[_`�7n��<��ƗkozO��I�:we���:k���g�c�9g��gRv:�{6�㌛#���캵�i���m��jl�_���56+]۸��&a+s���s�m���&\�>�rv&��\�Ώ*gn��Τr�"�u�fS�ى,g>B�1r�I����s8B���$�H���I�lVαrf��s��s"圆�s:R���{̋,�,�����9R�,��\%�(9���\��sJΕ(9!9W��\%g�rsO����rnG˹-�N����rn��r�z�����<��'�c      �   T  x�mW���6���`�����Pݞ�]-o��=U��	D�)t�����C��9Տ�� �h�$qpq�s_���Zs��}�*�++ia+���K����z}��셎v�U�G��Q��茎���Z����ߺ^��l��U�,�T#ʰ_ �Z4�Ɔ9����ⓔ>Z�s�t�ZaI�5]/�����N'�k @�]���1�+ĳ��q�g�E���}�9N����~���|��+LǷ�^t��ZQ�d߫h�ZUT��~]�X�����_v����-VL���ZY���;�ުg�e�$+���&�I�߸0E��6<^�[�t�=:�J%k��H�Z}Am�#Ngx���Cd�MN����S��a�[�t��
����!]$}46j���[gDho0�6�����C�4���F�(�����y���8�[g���A���K,�N5Q��B�QXx_�fik�*���[��_7�� Ov�!�a%���G��;�:��`��H�}Zá�� ȡ�&� /V�������?�Z�~\"g��J��5���k�"���q�z��(A�.��`=����ѝp��_5Α"�����������x��k��q���Q<ļ{�$	��\.ºp]{��x���j��O�j�/E"D���O�
��dav�h�w�D�ؚ�"B4߈^Y���ðy�×��7��h�&����Ӣ�=�c��a̓m �Tu�g+ˡ�!ɩ��|�	���WQ�QZ(%5�����:��<ٽ�S���}�U�
��=ɲ����
XF�y��$����r<˃��He$�&�S ;/1�1��OS_m�ak��������Y��.�ӌ�|5�H���7�����$�n��G$�nY���<�Lwm�<�5�UK��Y���R`�Z6%�K��#����8��|^�`����w���n�����䒧p��x63�ي}���O��=@��tol����*���)�FH���\�!�v:�r�e�;����<KQl#}�(��{��XI�Ё�$+�e���� =$���Pq�!tO�F�E�+�iX��\<�P�)N�8��{�E������b�4�mُ�F�s���f�]
�<�٣)T�a���&@��GA%��َvv�B�|u�.̅<�^���5Y�fF�F�f4�8(�Pz�*�_'�~Э��}hU�����Qi�*�z�>��1�.cK�������A���(�Ƣ�1��#"478���.f"m�Hpl���d���?N��Z�����i����R�ߒ�w�u��;��ɛ��X�|��������a��a�71%� C�,KT�ؚg*����,�eHxH���j��3Xp^�"m�6�����P�J-3v���q��3�H.����Z�^j��1_�	����~�2��'��y����U�h9ڍ��5��#�X�^i۱��z�$~��Ȼ�Bx�rI��x_K��⥝�� c�|�{����>F?\�Q3�Փ6v�������Z��wU�x<*%��ؽ����[���H!L�߉�R��g�;鵿�F+S����rK�nԺF�24�n�k�|��_o�#���:Y�$�����
hf����E �Z9"ń,W�hGq�I��Q��lOϝ�jdh�-�zӥ��+�)O��G��t7TM�Z�<e?��E������3j���" W(�����=��H�K�SN��[W�|�>Q�xD�m��kF�; �8�6�ѿ�5�p��!=��GR�F?�:�|�g��-��<�7�pԮu{BZB��s���ԅz����E���w��]G���y���3�k��ص�8�w+O�{�a��]z�JG�+�Hu���q������      �   ]  x�m�]r!���]��~�.�@����kkQTf��@�-��|�3�~��k����c�!����GZ~�9<�Ў`��;b�D e�<���A��9s�!��v<�F�ޑ�S�㎢CT�Qu���C�H�Ġ	�Y,��A�X�Ġ	�Y4V��Y��E��Wc8f��4�1��A�x�( �#?�R^bÃ�<֧!��;:9�ź�����]<5��R���;:Gfh����%����D�p:��dZ�X������F�_�g�:��U5�&��Bci��j���X�6��z��{t74����쵡����^{���_�,��׆Ɩ�Ɔ�ֲ`jlhlkBc{��-��F	4dܑ?N�Y]`!�B%���vHH���_��H��% !���x[R���AG��BB�$�sa�wt>z�������,TJ��B�e�e��
�vAh��5��oWޠa�;�A�f��AêF�eа�qxV5�����ӶF�\�����а�[С�E��(��i�����p����ph�������}G��C��~Bõ��s94�ڽ�_o�����^/4�Q�����iX�      �   *  x�uS�n�0<�O�'@M�{\m�T�
*N\�u�������G��8 !/��I���S$�|3�J���zS m��^߃!e���PM�6ʑjLLy��p=��<5mL$y,>�(�����8Ow�@=*Jxs|�)�,΍<+ג�^�� ����e 7�O�4�S�fP�`U�!Z=#��u�g�T��3Q���F�!��mߒ��q�3�yzT�}^
.��\����$�q�o�j�qL-���~#��\c�ћ��Ў��㐌J�^{�Y^b'캵.<�{��`�	4���3�
B6�ĵF��&nK�Ѱ%o�L	i�7p.��H��cʯip>�������YU`�f�����?�Z�+��8L��(��ǈ��{�1�\6�\(<���3w
v�������Tܚ��XE9�x��ǧ�#Y`�vζ����A@.��Ll�1P5S�;��y��?B���ͷ�bB-K;5�b��K�J��i��c�_b.�>��I9Z�QX����@�c"7W���1�R�)W�?|M�Q�1!���:��N=6W�[�WR�?}���      �   ]   x���!D��b�0zI�ud6�;�|c�k2i�y��l���t8,].��-;/����ȓ(9�z��?y9h���='���#����      �   �   x�]��n�0Dg�_X��,˟ЭC�.F�ڤH��(�	w�;Q��J�dI��.�z=_>��q�Q�l��qM.�)�X%-b��/�?���Ej\(X�����W�|B�M��GW^)�����čBkm�(��b���ap-�ǭ�za�Hd1�F0Erz~�f���u��B0���H��۸F%��%Ya�Fb��D#�'4��a��``�z��fl�"�������q��_�����Ul��      �   �   x�mQ�
�0;�3���/�ڝJ�������rb�A��>�|��ڤz:I,,�ϱTu7�'�������~������?!�S����rA���D�5��Ơ@KKZ5x��U<
�O�!t���?�P�N�A}f����V��6�&      �   P  x�=�Mn�0��χ�p�_���"�(T]��ZJ�j���mX�`�|�NH��$[��>[CcY��6\��X�[nj!8\	�9W��+�>�x&�|�$���j�Q0s�اRv�����%?R3���x3��m�#���}�wu8g�c��U6Qc����({4�<�l
5���i�u�X{�LBSL��|4]n3G� ZQ���'������I�wH䦉D�t�Z�����}���\�2��\kRz �,eK�\G�e�BۄX��EU��L�D[*�&����/�C���ҷ\�[N ��ȍ�v6;Id
ݼC.-�����D/���!6t"��'��	۬�      �     x�uS�n�@��� �wI؂� A'p�f}\�܃�#�(]>E��A�����R�)HC�w��3��J-8s��,8r&�ލ�o.$��t)z�l6����g�-����#3��C���(�@�nَ?[g�>Qu$�JO�6���K��A.�S��h(��\�T����݋Vu˹L���.���&���L�[%}��96ܤ���R^
/�+�S1kC �n��V�X�V����'�.��@��SevIj4n��P�	���9
��/�[��/���!��ݛ����(&}�n\��КE7���F���"@~�Y�2���k�s�)LZn0��������+e��)�@EW�Ð��RZ	�` �r3���C����,O��n�)U'j��� S���uu�>�[��~�hi��y�P���;��=S�и�a��d��d�$�B�]�a��9,�����|���uO�Q�5[ٱ��gy�g���ٰq��]]J�e��D�c�W����L;U���*8Y�n�������� ?�r�m�a�]z���a      �   �  x�E��r�:�k�)�6ř��K�u{}��#e�Sl�X�ń"=����mR�p��ݶz�^��̟� �dՁ���S�)پ�l��Iz%d�?]���/����]��"J��P����G��xc%;t�|ed&��}۟%�O����d�qCU��C��VɕŎH��-vɴ�?de#S�ܲ/0�hL6�](y�?���ťEOȍ`/�v_㡓%�/�)Y)}`���?۔�����㧷Bif��E�e�d�*��Fix��qh����0�9�V���6�(N�-��R�n���M%0�P���?�p��{�h�a����dt>"[h5�s��� _��%�I���n]t��1腅���^b�$-��2A�-��?�n�k��Q�+r�3�%���+���i-i��v��?���4\��v�(���{L��5`	w\�6v�iFJ�P�oZ�K���sHr��
�J��^y∬����ij�͗���1�ך�Vk�d�d����S'haV܆ecr�Sl����;}���f�����5x�@g�����z��in�>ԪԃC�	��{%]��՚z���4E����,���f�v��KИ͗^zpN�eo\�����q��ײcm�Q�h��W�z��\i�y��ѷk����=��-�W�f�;vO�A��^:p�[_��A�<2��L�,6��Ҷ7�6|���<b_b��;xìՠ�:Âqv�>�?�@q�'�e���1b�>�	�1�s�b�i�<�L�O�,=xD�]7lA�
c6��]��87m�й��;a]�J�g3�2����`��`i�؟N�7ǂuv(��@[ɡt�<&��ݲ��������;��8@�����<%3�v�N���~��0ǀ���D����csrSun\���_v�z}��v\u��?��ݠ7!�1z���9ri��7>�����^�W�>%�_����ڡGgֆ���� ��?Q�;�9S     