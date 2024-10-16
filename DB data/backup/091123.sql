PGDMP  6    	        	    
    {         
   restaurant    16.0    16.0 0    X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            [           1262    16390 
   restaurant    DATABASE     �   CREATE DATABASE restaurant WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
    DROP DATABASE restaurant;
                postgres    false            �            1259    16410 	   customers    TABLE     �   CREATE TABLE public.customers (
    id bigint NOT NULL,
    name character varying NOT NULL,
    phone character varying,
    discount_percent double precision
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    16409    customers_id_seq    SEQUENCE     y   CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    220            \           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    219            �            1259    16392    ingredients    TABLE     a   CREATE TABLE public.ingredients (
    id bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.ingredients;
       public         heap    postgres    false            �            1259    16391    ingredients_id_seq    SEQUENCE     {   CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.ingredients_id_seq;
       public          postgres    false    216            ]           0    0    ingredients_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;
          public          postgres    false    215            �            1259    16438    order_product    TABLE     d   CREATE TABLE public.order_product (
    order_id bigint NOT NULL,
    product_id bigint NOT NULL
);
 !   DROP TABLE public.order_product;
       public         heap    postgres    false            �            1259    16431    orders    TABLE     �   CREATE TABLE public.orders (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    price double precision NOT NULL,
    "time" timestamp with time zone DEFAULT now() NOT NULL,
    address character varying
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16430    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    224            ^           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    223            �            1259    16401    product_categories    TABLE     h   CREATE TABLE public.product_categories (
    id bigint NOT NULL,
    name character varying NOT NULL
);
 &   DROP TABLE public.product_categories;
       public         heap    postgres    false            �            1259    16400    product_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.product_category_id_seq;
       public          postgres    false    218            _           0    0    product_category_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.product_category_id_seq OWNED BY public.product_categories.id;
          public          postgres    false    217            �            1259    16727    product_ingredient    TABLE     n   CREATE TABLE public.product_ingredient (
    product_id bigint NOT NULL,
    ingredient_id bigint NOT NULL
);
 &   DROP TABLE public.product_ingredient;
       public         heap    postgres    false            �            1259    16419    products    TABLE     �   CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying NOT NULL,
    category_id bigint NOT NULL,
    price double precision NOT NULL,
    serving_weight bigint,
    energy_value bigint
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    16418    products_id_seq    SEQUENCE     x   CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    222            `           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    221            �           2604    16413    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    16395    ingredients id    DEFAULT     p   ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);
 =   ALTER TABLE public.ingredients ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    16434 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    16404    product_categories id    DEFAULT     |   ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);
 D   ALTER TABLE public.product_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16422    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            O          0    16410 	   customers 
   TABLE DATA           F   COPY public.customers (id, name, phone, discount_percent) FROM stdin;
    public          postgres    false    220   �4       K          0    16392    ingredients 
   TABLE DATA           /   COPY public.ingredients (id, name) FROM stdin;
    public          postgres    false    216   �4       T          0    16438    order_product 
   TABLE DATA           =   COPY public.order_product (order_id, product_id) FROM stdin;
    public          postgres    false    225   
<       S          0    16431    orders 
   TABLE DATA           I   COPY public.orders (id, customer_id, price, "time", address) FROM stdin;
    public          postgres    false    224   D<       M          0    16401    product_categories 
   TABLE DATA           6   COPY public.product_categories (id, name) FROM stdin;
    public          postgres    false    218   �<       U          0    16727    product_ingredient 
   TABLE DATA           G   COPY public.product_ingredient (product_id, ingredient_id) FROM stdin;
    public          postgres    false    226   :=       Q          0    16419    products 
   TABLE DATA           ^   COPY public.products (id, name, category_id, price, serving_weight, energy_value) FROM stdin;
    public          postgres    false    222   ?B       a           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 10, true);
          public          postgres    false    219            b           0    0    ingredients_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ingredients_id_seq', 1, false);
          public          postgres    false    215            c           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 12, true);
          public          postgres    false    223            d           0    0    product_category_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.product_category_id_seq', 1, false);
          public          postgres    false    217            e           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public          postgres    false    221            �           2606    16417    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    220            �           2606    16397    ingredients ingredients_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.ingredients DROP CONSTRAINT ingredients_pkey;
       public            postgres    false    216            �           2606    16437    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    224            �           2606    16408 *   product_categories product_categories_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.product_categories DROP CONSTRAINT product_categories_pkey;
       public            postgres    false    218            �           2606    16731 *   product_ingredient product_ingredient_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT product_ingredient_pkey PRIMARY KEY (product_id, ingredient_id);
 T   ALTER TABLE ONLY public.product_ingredient DROP CONSTRAINT product_ingredient_pkey;
       public            postgres    false    226    226            �           2606    16426    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    222            �           2606    16446    order_product fk_order    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES public.orders(id) NOT VALID;
 @   ALTER TABLE ONLY public.order_product DROP CONSTRAINT fk_order;
       public          postgres    false    3508    225    224            �           2606    16441    orders fk_order_customer    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;
 B   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_order_customer;
       public          postgres    false    220    3504    224            �           2606    16451    order_product fk_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;
 B   ALTER TABLE ONLY public.order_product DROP CONSTRAINT fk_product;
       public          postgres    false    222    3506    225            �           2606    16466    products fk_product_category    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES public.product_categories(id) NOT VALID;
 F   ALTER TABLE ONLY public.products DROP CONSTRAINT fk_product_category;
       public          postgres    false    218    222    3502            O   F   x����̩L��6�0�45222726�4��tI��,������[ �8}�2aL��M@1z\\\ �1�      K   $  x�uW�r�6=_�crHJ �G/cOjƱc�f*U�@$aHX#�����IɩTn ���-͔�Y<�؇ݮ�9{0��v�A{�d��n�;j�8cy�~ת�X���&�nL۪Ƶ\�quR�]�,>s����j|����_���/.���k�pQ�ר�鞋�=�Ƶ=�v��55��=��iR�Ϛ��)�l�e��jwh�ޠ�IK�ѵ��eɾ�V��)�&O�֘�J�lj�S���(���Q=��!`�ox&؃:9<���g�}�C��p�y�m��}oqXV�k�#D9v0��s��X���\�[c�-eϮ׍�'�g�e���t���k��9��iy^��^1�b/�7�#"ł]Y�w�B���lz^HdŶ�(�0]+ı�؍����&N2x\�7���F5F��!kXˋ�=�Ɇ�VH�j��{������Sz~:�#�^ܦ�Cl�&�n����)q�P���`�6�\��`�Bh/q��ql���%�H���s��b�V�i���-��)4e�t#�Hٵŭ���x�E�[M�|��+�# u�:!G,��	ދ�]�:D̡]E %�sK�#V{o�Md^y�@�c��!�v<9��������`��M�n��� M|�j7�����\ j:�k�j�M$v�qI��vʢ#)�(���ݷ@�!�@��s��Y�/�PU���4^�E\�y���͒nbd�V�4�*�Ơ̱Ks�Ha��M�cIC*�.�QE���6)r�:�̝<�,e_��u�o���9�Y�m�O�Y>�dGk"j���.��&,�ڽ�l���,ѶAb��d��MyM��S�:��?�3 )�s7��a�,(ؓw��B�c��s���q`8�L�Ϡ��2V��N_v��/r���QN��@�H^��6i&fT��9ϸ7���F���y��P�H1� ʽ��Vˉ(�˫r�Q�d��o7����Oj�5>�2��k]���AW��C�oC}@>��Qk��}���sI�wt1�=Ol����OI9�V$���p��d_�1[AӍ�� àg��O�Rb}8iΌ >o�)���6�ʵ���[t/����-؟�c�ˀڴbW-ldY�5?� &r�v��-�!7V5X����b�Ͷ[MM�F���h�5��h	�u�lu �$��Y�x�v��5̗�+z
�m�))Y�B�=)(�L����wZ���Y�,�Y�ݥ�� �}V�"t�P�z#�/'3J���p�����(� �V�=b����^�i'��؋�*i��.�������p���9Ę���"2�.&��}Jk�*�V�5�[��hC̋}�Q&�{��>h�S�abIU�����.��PJ���!�֟�l@yG��ݺ�J��Z�*��k@5V��0�X��S]g�y��i1�5�Wo��M�Q�`Tb�����~:���B5�7sICI�B��y��ڷίm8���Q�5}C1�<0������)�/C�v�PM���s��}���\m��~�l0FuTohڝfH� sE�\�1��TU��PH�X�O�����u�����F%�X�J�����)QO\Q-�ω���n<
�c]1h�^�a}���ᭃ�I����wP�Ht���U�5D4[���y|rC�Zbvg2���$�
�ez��k�x'(D����q�͆"Q�_��H;u�Y��6j-GNC��F��+�HNa���4�A�o�?$>�>(=>��~�zr^�R���K�&/��IxĨ�s��]�b�Lݘ��H������w+����8��V�u$�(7a��qo��E�W���E��9����      T   *   x�34�4�2F\�F���`҂�Ѐ�D�IC�=... ��<      S   u   x�m�1�0��>Ev��߉��;�tf)!�DD%nOY)���JM��i ���[�Q����(���u��kV�JY���W���t��Gx.}�w C	B��<ӘQ��O4>Ff� �3%�      M   a   x�eɻ@@F�z���wJ���V3� 6V�������Dd�򌘌�O$��u�z���v #�Y�(rjn]�(>�QRm'�:�M�(�(/��zw�C�"_!�      U   �  x�E�I�� ��a�1w����32]Ջ�%��>�S����6O� ��oS�F���)��Z`���U�(�+�p\�7n襃����`���|Z&���i7��K�\�h��EH�J8ߍ?�
�	��le�G���lZ���g�V�y���+�b�bVS�*�2O�a�=�'�ⅳ�;ÑYomO�P��n�E�o�ݳ�Ȏ�ȵ�I̖M���t�~M'mX�1�p=�$MF�9���2/��%���)jۑϨ.�0�a���'f�̄�	33�h3�f��D[�k9�r�����֟)�p��<�/��Q��X�����������-p{! �EzD>-�m^H,�3��rӇ���9����x=�z���G� ������_Gy[�-��-�v��)��&�h[6�P���DEMK�C[!�d���KWВ7?�Ջ�_���Q��w�2KU�����&X�~3�$�TM�����[Վi���cv^�u*�y�$�j�`����iDfD�����z����I܌�3�f����?��D�숌�^�^Ju7鄨Ғwa�[�仳�ۻg`��[Y�J����yZz���p�R��dIy�ރ"߰F��؝���Խ�����o9���d2�o<~�I'%7���S�F":D�}��h�#�aY2.�#��r-�,k�Q'"mB �U���9�ȯ��TvGj'�O�m8�jQ�y8��9���:,3���Z1Vl+6W��Tץኄ���>҆��pFi�O������>m>O�o�:l�(C�?��v^DMo�(¢M������g���`�j`����?{����h�bںJ��"؜1mjk�ȋ�{�5��8�Oy��'!O�N����^�ס;�EwVQ�倶+��=��i[�[���B�r�#�ow,�-��І�]�%&l��$ ��۹N	-l60�Fd���M
n�e�Y.�l�N�q��I��u�Im˵��i{2������Us��D4eʥ��k�_�*�.Tϭ,邷I�.j����"�S��¥������=�	�/�ӥ�53Q .{�2[lr?*ٌ�w�#A�
��*y0����g�����KSe9G�i��tψ�#�p��4?���(L�t?�ȴc�;fr�����;I?�Q''�o�":Sn�/㽍 ��M��SD�6&v�{�Ǧ�}���ȉ��9"Ŧ�n�����=|����%�n;�&�uzq����ͷ����(��W�M��z̓֍��\ѧq�-l,�j.�lݵ
K����u�o:��y��J���      Q   �  x��W�n�8}&��_��>��N�@;��������R�ՔO���\Qr���:�w=w�d�Ώ.1ɔ���ɢ(�b���\�̨�U��=̃��ݞ��0��.%7�}����6LV���%�������Ȑ΂i���FOߛ
f
�kxuJ>7�I|W������b���m�-{;7��1�{�S*�����`�r�0O��<�8\5Lق��d��������FJ�^�\*�����)&k$���R��y�R�&�b�������}vG?�g�魒\���ڳHh��\V�vN��S�X��Fkv?N)�0�~t�wHQ瑹�U~hȢe���_�f}iQ�w?N��"!6?�Fs%�m�Ѐ<�Q`�SO���+�& �0�L3<�biUp�WWZw��$+��1�>�Tj�49��%۲�d�	n�P@@�%B�*�1�ŕ�=��ٍ�O|
+���w{��0!��P����9����Ks�o�c��6����= r�)��.��w�U��\+��wax�WK�Q2�֠�x�y*y����6�9�3�j���Bt���A_ɾ�G?��=����S�:�&I�U�+���� z�/bO�ߋ�jo\��kirS��MaX�Q)4��q�������fU�J$r6����y,�BJD
K����ҋ�ru�6�3���g��n����y7�`�80���Zū�C�M���<��'F�`d��<��[���KA��7nBNIf�	f7��y�Sh#���p��~���Gq�ZU���&���qs�Ls���}Nd��JL��~ ���	��T+�Q�}����W��A5K�>��3$3�-��a�g׺#��Zh���r��1wp�p�
#�e�6m��6���_��
M�̈́i��P�
5�l����݁մ�����Uk�M�+þj�("�2���f�q�më���e,3,&7<��_u��|#yU1�L���:�Rܩ���ͦ�6���3�)�mu��)2�U]�z(,cK��+�$�1>��m�����h^�UN�/��Z@W�ǟU�������;c����1��&��>�:�azֶG��c���و�v�_S�V���� �c����Q�z�Ns��� R�k,��z�	�d���0�-�}��c�'�6��ó�GL��E�~�����F�&m�.	� G�؟4�ѵ��J��y��WX"�aP0���k�0|�^ܕ�릺�:��Ǝv�]ڗ2�0��}qC�{�R���T��f[��*��Ĳ�)��\�W�Lɑ��ޡ)r9LNR�M��3�4��;k�Hиu��2?���Kko����W4�c����8�*J�qw�=�M7ͭ\f���g|���2i6��j:�������I;���|�]J��K���ӆ�����+0�����&gͲs�7����Q����<��1�-����Har�5�%b-
��xw.�	�R�EF�7��C
W�h��tv�;�	X}�(,�<b��i��?��;�Ԃ�N�O�[\�r�����a���p���V��|�2� ���f�!X��=E�z����蓿���N�7�r��������8�5�%���z؍��'�
�c�
�~w���]/��7���T��:���ۼ��S%w��i�G�ɋ/a��H
�j�y�9��s_�     