CREATE TABLE brand
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NULL,
    CONSTRAINT pk_brand PRIMARY KEY (id)
);

CREATE TABLE colors
(
    id        BIGINT AUTO_INCREMENT NOT NULL,
    name      VARCHAR(255) NULL,
    image_url VARCHAR(255) NOT NULL,
    CONSTRAINT pk_colors PRIMARY KEY (id)
);

CREATE TABLE dimensions
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    size VARCHAR(255) NULL,
    CONSTRAINT pk_dimensions PRIMARY KEY (id)
);

CREATE TABLE main_categories
(
    id        BIGINT AUTO_INCREMENT NOT NULL,
    name      VARCHAR(255) NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    CONSTRAINT pk_main_categories PRIMARY KEY (id)
);

CREATE TABLE nested_categories
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    subcategory_id BIGINT       NOT NULL,
    name           VARCHAR(255) NOT NULL,
    CONSTRAINT pk_nested_categories PRIMARY KEY (id)
);

CREATE TABLE order_items
(
    id               BIGINT AUTO_INCREMENT NOT NULL,
    order_id         BIGINT NOT NULL,
    product_id       BIGINT NOT NULL,
    quantity_ordered INT    NOT NULL,
    color_id         BIGINT NOT NULL,
    dimension_id     BIGINT NOT NULL,
    CONSTRAINT pk_order_items PRIMARY KEY (id)
);

CREATE TABLE orders
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    full_name  VARCHAR(255) NOT NULL,
    phone      VARCHAR(255) NOT NULL,
    email      VARCHAR(255) NULL,
    address    VARCHAR(255) NULL,
    order_date datetime NULL,
    CONSTRAINT pk_orders PRIMARY KEY (id)
);

CREATE TABLE product_color
(
    color_id   BIGINT NOT NULL,
    product_id BIGINT NOT NULL
);

CREATE TABLE product_dimension
(
    dimension_id BIGINT NOT NULL,
    product_id   BIGINT NOT NULL
);

CREATE TABLE product_images
(
    product_id BIGINT NOT NULL,
    image_url  VARCHAR(255) NULL
);

CREATE TABLE product_tag
(
    product_id BIGINT NOT NULL,
    tag_id     BIGINT NOT NULL
);

CREATE TABLE products
(
    id                 BIGINT AUTO_INCREMENT NOT NULL,
    name               VARCHAR(255)  NOT NULL,
    `description`      TEXT NULL,
    price              DECIMAL(8, 2) NOT NULL,
    discounted_price   DECIMAL(8, 2) NULL,
    stock_quantity     INT           NOT NULL,
    brand_id           BIGINT        NOT NULL,
    nested_category_id BIGINT NULL,
    onec_id            BIGINT        NOT NULL,
    is_active          INT NULL,
    CONSTRAINT pk_products PRIMARY KEY (id)
);

CREATE TABLE subcategories
(
    id               BIGINT AUTO_INCREMENT NOT NULL,
    main_category_id BIGINT       NOT NULL,
    name             VARCHAR(255) NOT NULL,
    CONSTRAINT pk_subcategories PRIMARY KEY (id)
);

CREATE TABLE tag
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT pk_tag PRIMARY KEY (id)
);

ALTER TABLE brand
    ADD CONSTRAINT uc_brand_name UNIQUE (name);

ALTER TABLE products
    ADD CONSTRAINT uc_products_onec UNIQUE (onec_id);

ALTER TABLE nested_categories
    ADD CONSTRAINT FK_NESTED_CATEGORIES_ON_SUBCATEGORY FOREIGN KEY (subcategory_id) REFERENCES subcategories (id);

ALTER TABLE order_items
    ADD CONSTRAINT FK_ORDER_ITEMS_ON_COLOR FOREIGN KEY (color_id) REFERENCES colors (id);

ALTER TABLE order_items
    ADD CONSTRAINT FK_ORDER_ITEMS_ON_DIMENSION FOREIGN KEY (dimension_id) REFERENCES dimensions (id);

ALTER TABLE order_items
    ADD CONSTRAINT FK_ORDER_ITEMS_ON_ORDER FOREIGN KEY (order_id) REFERENCES orders (id);

ALTER TABLE order_items
    ADD CONSTRAINT FK_ORDER_ITEMS_ON_PRODUCT FOREIGN KEY (product_id) REFERENCES products (id);

ALTER TABLE products
    ADD CONSTRAINT FK_PRODUCTS_ON_BRAND FOREIGN KEY (brand_id) REFERENCES brand (id);

ALTER TABLE products
    ADD CONSTRAINT FK_PRODUCTS_ON_NESTED_CATEGORY FOREIGN KEY (nested_category_id) REFERENCES nested_categories (id);

ALTER TABLE subcategories
    ADD CONSTRAINT FK_SUBCATEGORIES_ON_MAIN_CATEGORY FOREIGN KEY (main_category_id) REFERENCES main_categories (id);

ALTER TABLE product_color
    ADD CONSTRAINT fk_procol_on_color FOREIGN KEY (color_id) REFERENCES colors (id);

ALTER TABLE product_color
    ADD CONSTRAINT fk_procol_on_product FOREIGN KEY (product_id) REFERENCES products (id);

ALTER TABLE product_dimension
    ADD CONSTRAINT fk_prodim_on_dimensions FOREIGN KEY (dimension_id) REFERENCES dimensions (id);

ALTER TABLE product_dimension
    ADD CONSTRAINT fk_prodim_on_product FOREIGN KEY (product_id) REFERENCES products (id);

ALTER TABLE product_images
    ADD CONSTRAINT fk_product_images_on_product FOREIGN KEY (product_id) REFERENCES products (id);

ALTER TABLE product_tag
    ADD CONSTRAINT fk_protag_on_product FOREIGN KEY (product_id) REFERENCES products (id);

ALTER TABLE product_tag
    ADD CONSTRAINT fk_protag_on_tag FOREIGN KEY (tag_id) REFERENCES tag (id);