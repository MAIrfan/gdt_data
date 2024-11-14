CREATE TABLE `languages`
(
    `id`           int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `english_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `native_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `status`       int                                                                    DEFAULT '0',
    `code`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`   timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `users`
(
    `id`                      int                                                         NOT NULL AUTO_INCREMENT,
    `email`                   varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    `name`                    varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `last_name`               varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `country_code`            varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci            DEFAULT NULL,
    `phone_number`            varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci           DEFAULT NULL,
    `password`                varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `gender`                  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `race`                    varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `ethnicity`               varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `url_to_id_image`         varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci         DEFAULT NULL,
    `url_to_back_id_image`    varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci         DEFAULT NULL,
    `active`                  tinyint(1)                                                           DEFAULT NULL,
    `dob`                     varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci           DEFAULT NULL,
    `account_id`              int                                                                  DEFAULT NULL,
    `parent_recipeint_id`     int                                                                  DEFAULT NULL,
    `password_secret`         varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `user_role`               int                                                         NOT NULL DEFAULT '1' COMMENT '1=purchaser,2=admin,3=observer',
    `timezone_support`        tinyint                                                              DEFAULT NULL COMMENT '1- Assignee Time Zone, 2- Your Time Zone',
    `timezone_id`             varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `avg_turn_around_time`    int                                                                  DEFAULT NULL COMMENT 'average turn around time in minutes',
    `demo_user`               tinyint                                                              DEFAULT '0',
    `manager_privilege`       varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci           DEFAULT NULL,
    `oberver_support_request` int                                                                  DEFAULT NULL,
    `assignee_video_support`  int                                                                  DEFAULT NULL,
    `intake_form_user`        int                                                                  DEFAULT NULL,
    `email_verification`      int                                                                  DEFAULT NULL,
    `sms_verification`        int                                                                  DEFAULT NULL,
    `otp`                     varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT 'One-Time Password',
    `otp_sent_at`             timestamp                                                   NULL     DEFAULT NULL COMMENT 'Timestamp when OTP was sent',
    `language_id`             int unsigned                                                         DEFAULT NULL,
    `auth_token`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci        DEFAULT NULL,
    `is_logged_in`            tinyint                                                     NOT NULL DEFAULT '0' COMMENT '1 => logged in, 2 => logged in',
    `last_login_at`           timestamp                                                   NULL     DEFAULT NULL,
    `last_logout_at`          timestamp                                                   NULL     DEFAULT NULL,
    `account_activation_date` timestamp                                                   NULL     DEFAULT NULL COMMENT 'Account Activated At',
    `is_deleted`              tinyint                                                     NOT NULL DEFAULT '0',
    `created_at`              datetime                                                    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`              timestamp                                                   NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `language_id` (`language_id`),
    CONSTRAINT `users_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1590
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `accounts`
(
    `id`                                                 int                                                         NOT NULL AUTO_INCREMENT,
    `name`                                               varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    `purchaser_name`                                     varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    `create_date`                                        timestamp                                                   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `active`                                             tinyint(1)                                                           DEFAULT '1',
    `phone`                                              varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci           DEFAULT NULL,
    `email`                                              varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci           DEFAULT NULL,
    `consent_url`                                        varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `c4_api_key`                                         varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `messaging_id`                                       int                                                                  DEFAULT NULL,
    `default_intake_form`                                int unsigned                                                         DEFAULT NULL,
    `from_name`                                          varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `billing_line_one`                                   varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `billing_line_two`                                   varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `city`                                               varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `state`                                              varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `country`                                            varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `postal_code`                                        varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `transaction_email`                                  varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci          DEFAULT NULL,
    `demo_account`                                       tinyint(1)                                                           DEFAULT '0',
    `is_deleted`                                         tinyint                                                     NOT NULL DEFAULT '0',
    `account_type`                                       int                                                                  DEFAULT '0' COMMENT '1 means corporate and 2 means individual',
    `sla_time`                                           int                                                         NOT NULL DEFAULT '30' COMMENT 'service level agreement for required turnaround time',
    `language_id`                                        int unsigned                                                         DEFAULT NULL,
    `billing_contact_id`                                 int                                                                  DEFAULT NULL,
    `messaging_set`                                      int unsigned                                                         DEFAULT '1',
    `ecommerce_communication_type_id`                    int unsigned                                                         DEFAULT '1',
    `assignee_portal_communication_type_id`              int unsigned                                                         DEFAULT '1',
    `shipement_communication_type_id`                    int unsigned                                                         DEFAULT '1',
    `general_communication_type_id`                      int unsigned                                                         DEFAULT '1',
    `test_result_communication_type_id`                  int unsigned                                                         DEFAULT '1',
    `2factor_user_auth`                                  int unsigned                                                         DEFAULT '0',
    `2factor_device`                                     int unsigned                                                         DEFAULT '0',
    `2factor_same_device_flag`                           int unsigned                                                         DEFAULT '0',
    `2factor_days`                                       int unsigned                                                         DEFAULT '0',
    `account_portal_access`                              int                                                         NOT NULL DEFAULT '0' COMMENT 'account portal access',
    `assignee_portal_access`                             int                                                         NOT NULL DEFAULT '0' COMMENT 'assignee portal access',
    `reshipments_patients`                               int                                                                  DEFAULT NULL,
    `permit_observer_triggered_reshipments`              int                                                                  DEFAULT NULL,
    `permit_reshipments_observer_on_collections_failure` int                                                                  DEFAULT NULL,
    `updated_at`                                         timestamp                                                   NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `language_id` (`language_id`),
    KEY `billing_contact_id` (`billing_contact_id`),
    CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
    CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`billing_contact_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 49
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `support_entity_category`
(
    `id`          int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`  timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `support_entity`
(
    `id`                                    int unsigned NOT NULL AUTO_INCREMENT,
    `name`                                  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `support_entity_category_id`            int unsigned NOT NULL,
    `entity_contact_name`                   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `entity_contact_email`                  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `entity_contact_phone`                  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `entity_contact_mobile`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `entity_contact_address`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `entity_contact_city`                   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `entity_contact_state`                  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `entity_contact_zip`                    varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `billing_contact_name`                  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `billing_contact_email`                 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `billing_contact_phone`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `billing_contact_mobile`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `billing_contact_address`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `billing_contact_city`                  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `billing_contact_state`                 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `billing_contact_zip`                   varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `payment_terms`                         int                                                           DEFAULT NULL,
    `active`                                int                                                           DEFAULT NULL,
    `ecommerce_communication_type_id`       int unsigned                                                  DEFAULT NULL,
    `assignee_portal_communication_type_id` int unsigned                                                  DEFAULT NULL,
    `shipement_communication_type_id`       int unsigned                                                  DEFAULT NULL,
    `general_communication_type_id`         int unsigned                                                  DEFAULT NULL,
    `test_result_communication_type_id`     int unsigned                                                  DEFAULT NULL,
    `api_url`                               varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `api_key`                               varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `api_secret`                            varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `permit_account_support`                int unsigned                                                  DEFAULT NULL,
    `active_outbound_api`                   int unsigned                                                  DEFAULT NULL,
    `auth_api_key`                          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `path_contains`                         varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `accept_inbound_webhook`                int unsigned                                                  DEFAULT NULL,
    `inbound_webhhook_authentication`       int                                                           DEFAULT '1' COMMENT '1-Path Contains,2-API Key',
    `active_outbound_webhook`               int unsigned                                                  DEFAULT '1',
    `outbound_webhook_url`                  varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `outbound_webhook_key`                  varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `external_id`                           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `is_using_connector`                    int                                                           DEFAULT NULL,
    `created_at`                            timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                            timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `support_entity_category_id` (`support_entity_category_id`),
    CONSTRAINT `support_entity_ibfk_1` FOREIGN KEY (`support_entity_category_id`) REFERENCES `support_entity_category` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `support_entity_credentials`
(
    `id`                              int unsigned NOT NULL AUTO_INCREMENT,
    `support_entity_id`               int unsigned NOT NULL,
    `api_url`                         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `production_api_key`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `sandbox_api_key`                 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `production_api_secret`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `sandbox_api_secret`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `active_outbound_api`             int          NOT NULL                                         DEFAULT '0',
    `production_webhook_key`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `sandbox_webhook_key`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `path_contains`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `accept_inbound_webhook`          int          NOT NULL                                         DEFAULT '0',
    `inbound_webhhook_authentication` int                                                           DEFAULT NULL,
    `active_outbound_webhook`         int          NOT NULL                                         DEFAULT '0',
    `outbound_webhook_url`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `production_outbound_webhook_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `sandbox_outbound_webhook_key`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `production_outbound_api_key`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `sandbox_outbound_api_key`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `username`                        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `password`                        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `auth_token`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `expires_in`                      int                                                           DEFAULT NULL,
    `token_generated_at`              timestamp    NULL                                             DEFAULT NULL,
    `mode_outbound`                   int                                                           DEFAULT NULL,
    `mode_inbound`                    int                                                           DEFAULT NULL,
    `created_at`                      timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                      timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `support_entity_id` (`support_entity_id`),
    CONSTRAINT `support_entity_credentials_ibfk_1` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;
  
CREATE TABLE `account_support_entity_linker`
(
    `id`                              int unsigned NOT NULL AUTO_INCREMENT,
    `account_id`                      int                                                           DEFAULT NULL,
    `hashed_account_id`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `external_account_id`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `support_entity_id`               int unsigned NOT NULL,
    `integration_type_id`             int unsigned                                                  DEFAULT NULL,
    `active_outbound_api`             int unsigned                                                  DEFAULT NULL,
    `api_key`                         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `api_url`                         varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `active_outbound_webhook`         int unsigned                                                  DEFAULT NULL,
    `outbound_webhook_url`            varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `outbound_webhook_key`            varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `accept_inbound_api`              int unsigned                                                  DEFAULT NULL,
    `inbound_api_url`                 varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `inbound_api_key`                 varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `accept_inbound_webhook`          int unsigned                                                  DEFAULT NULL,
    `inbound_webhhook_authentication` int                                                           DEFAULT '2' COMMENT '1-Path Contains,2-API Key',
    `auth_calling_path`               varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `auth_api_key`                    varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `is_active`                       tinyint(1)                                                    DEFAULT '0',
    `username`                        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `password`                        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `auth_token`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `created_at`                      timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                      timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `account_id` (`account_id`),
    KEY `support_entity_id` (`support_entity_id`),
    CONSTRAINT `account_support_entity_linker_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
    CONSTRAINT `account_support_entity_linker_ibfk_2` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `products`
(
    `id`                     int unsigned NOT NULL AUTO_INCREMENT,
    `name`                   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `product_price`          double unsigned                                               DEFAULT NULL,
    `support_entity_id`      int unsigned                                                  DEFAULT NULL,
    `support_entity_id_lab`  int unsigned                                                  DEFAULT NULL,
    `product_sku`            varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `type`                   int                                                           DEFAULT '1' COMMENT '1-Test,2-Device,3-Product',
    `outbound_time`          int                                                           DEFAULT NULL,
    `inbound_time`           int                                                           DEFAULT NULL,
    `collection_type`        int                                                           DEFAULT NULL,
    `is_observable`          int                                                           DEFAULT '1' COMMENT '1-Yes,2-No',
    `starting_units_on_hand` int                                                           DEFAULT NULL,
    `reorder_when_below`     int                                                           DEFAULT NULL,
    `active_value`           int                                                           DEFAULT '1' COMMENT '1-Immediately,2-Beginning on,3-Until',
    `published_at`           datetime                                                      DEFAULT NULL,
    `created_at`             timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`             timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`             datetime                                                      DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `support_entity_id` (`support_entity_id`),
    KEY `support_entity_id_lab` (`support_entity_id_lab`),
    CONSTRAINT `products_ibfk_1` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`),
    CONSTRAINT `products_ibfk_2` FOREIGN KEY (`support_entity_id_lab`) REFERENCES `support_entity` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 67
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `bundles`
(
    `id`                   int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `ecommerce_product_id` int                                                                    DEFAULT NULL,
    `bundle_name`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `bundle_sku`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `bndl_std_price`       decimal(15, 2)                                                         DEFAULT NULL,
    `prod_purc_req`        int                                                                    DEFAULT NULL,
    `bulk_shipment`        int                                                                    DEFAULT NULL,
    `indiv_shipment`       int                                                                    DEFAULT NULL,
    `obs_req_test_purc`    int                                                                    DEFAULT NULL,
    `obs_alw_test_purc`    int                                                                    DEFAULT NULL,
    `obs_alw_no_test_purc` int                                                                    DEFAULT NULL,
    `is_active`            int                                                                    DEFAULT '1' COMMENT '1 is default active',
    `ecommerce_sync`       int                                                                    DEFAULT '0',
    `bundle_description`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `deleted_at`           timestamp                                                     NULL     DEFAULT NULL,
    `created_at`           timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`           timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 44
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `bundle_products_mapping`
(
    `id`         int unsigned NOT NULL AUTO_INCREMENT,
    `product_id` int unsigned          DEFAULT NULL,
    `bundle_id`  int unsigned          DEFAULT NULL,
    `created_at` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `product_id` (`product_id`),
    KEY `bundle_id` (`bundle_id`),
    CONSTRAINT `bundle_products_mapping_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
    CONSTRAINT `bundle_products_mapping_ibfk_2` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 292
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `stage_types`
(
    `id`          int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `stage_label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`  timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `status`
(
    `id`            int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `stage_type_id` int unsigned                                                  NOT NULL,
    `status_label`  varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`    timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `stage_type_id` (`stage_type_id`),
    CONSTRAINT `status_ibfk_1` FOREIGN KEY (`stage_type_id`) REFERENCES `stage_types` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 39
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `status_translation`
(
    `id`                    int unsigned NOT NULL AUTO_INCREMENT,
    `status_id`             int unsigned NOT NULL,
    `language_id`           int unsigned NOT NULL,
    `status_translate_text` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`            timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`            timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `status_id` (`status_id`),
    KEY `language_id` (`language_id`),
    CONSTRAINT `status_translation_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
    CONSTRAINT `status_translation_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 129
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `mapping_types`
(
    `id`           int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `mapping_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`   timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `status_mapping`
(
    `id`                         int unsigned NOT NULL AUTO_INCREMENT,
    `stage_type_id`              int unsigned NOT NULL,
    `status_translation_id`      int unsigned NOT NULL,
    `support_entity_id`          int unsigned NOT NULL,
    `support_entity_category_id` int unsigned NOT NULL,
    `mapping_type_id`            int unsigned NOT NULL,
    `status_key`                 varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `is_active`                  int                                                           DEFAULT '1',
    `created_at`                 timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                 timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `status_translation_id` (`status_translation_id`),
    KEY `support_entity_id` (`support_entity_id`),
    KEY `support_entity_category_id` (`support_entity_category_id`),
    KEY `mapping_type_id` (`mapping_type_id`),
    KEY `stage_type_id` (`stage_type_id`),
    CONSTRAINT `status_mapping_ibfk_1` FOREIGN KEY (`status_translation_id`) REFERENCES `status_translation` (`id`),
    CONSTRAINT `status_mapping_ibfk_2` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`),
    CONSTRAINT `status_mapping_ibfk_3` FOREIGN KEY (`support_entity_category_id`) REFERENCES `support_entity_category` (`id`),
    CONSTRAINT `status_mapping_ibfk_4` FOREIGN KEY (`mapping_type_id`) REFERENCES `mapping_types` (`id`),
    CONSTRAINT `status_mapping_ibfk_5` FOREIGN KEY (`stage_type_id`) REFERENCES `stage_types` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 63
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `electronic_orders`
(
    `id`                               int unsigned NOT NULL AUTO_INCREMENT,
    `external_id`                      varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `external_order_status_mapping_id` int unsigned                                                  DEFAULT NULL,
    `internal_order_status_mapping_id` int unsigned                                                  DEFAULT NULL,
    `support_entity_id`                int unsigned NOT NULL,
    `order_license_id`                 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `ordering_name`                    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `ordering_email`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `ordering_phone`                   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `ordering_entity_name`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `shipment_date`                    timestamp    NULL                                             DEFAULT NULL,
    `created_at`                       timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                       timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `external_order_status_mapping_id` (`external_order_status_mapping_id`),
    KEY `internal_order_status_mapping_id` (`internal_order_status_mapping_id`),
    KEY `support_entity_id` (`support_entity_id`),
    CONSTRAINT `electronic_orders_ibfk_1` FOREIGN KEY (`external_order_status_mapping_id`) REFERENCES `status_mapping` (`id`),
    CONSTRAINT `electronic_orders_ibfk_2` FOREIGN KEY (`internal_order_status_mapping_id`) REFERENCES `status` (`id`),
    CONSTRAINT `electronic_orders_ibfk_3` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 616
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `electronic_order_bundle_mapping`
(
    `id`                  int unsigned NOT NULL AUTO_INCREMENT,
    `electronic_order_id` int unsigned                                                  DEFAULT NULL,
    `bundle_id`           int unsigned NOT NULL,
    `billing_code`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `submit_to_insurance` tinyint(1)                                                    DEFAULT '0',
    `diagnosis_code`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`          timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`          timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `electronic_order_id` (`electronic_order_id`),
    KEY `bundle_id` (`bundle_id`),
    CONSTRAINT `electronic_order_bundle_mapping_ibfk_1` FOREIGN KEY (`electronic_order_id`) REFERENCES `electronic_orders` (`id`),
    CONSTRAINT `electronic_order_bundle_mapping_ibfk_2` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 58
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `us_states`
(
    `id`         int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 52
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `us_cities`
(
    `id`         int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `state_id`   int unsigned                                                           DEFAULT NULL,
    `created_at` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `state_id` (`state_id`),
    CONSTRAINT `us_cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `us_states` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1001
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `country_list`
(
    `id`        int                                                        NOT NULL AUTO_INCREMENT,
    `country`   char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci     NOT NULL,
    `name`      varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    `nicename`  varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    `iso3`      char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
    `numcode`   smallint                                               DEFAULT NULL,
    `phonecode` int                                                        NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 240
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `shipment_recipients`
(
    `id`          int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `user_id`     int                                                                    DEFAULT NULL,
    `city_id`     int unsigned                                                  NOT NULL,
    `state_id`    int unsigned                                                  NOT NULL,
    `country_id`  int                                                                    DEFAULT NULL,
    `first_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `last_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `email`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `phone`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL,
    `street1`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `street2`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `postal_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL,
    `created_at`  timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `city_id` (`city_id`),
    KEY `state_id` (`state_id`),
    KEY `country_id` (`country_id`),
    CONSTRAINT `shipment_recipients_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `shipment_recipients_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `us_cities` (`id`),
    CONSTRAINT `shipment_recipients_ibfk_3` FOREIGN KEY (`state_id`) REFERENCES `us_states` (`id`),
    CONSTRAINT `shipment_recipients_ibfk_4` FOREIGN KEY (`country_id`) REFERENCES `country_list` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 43
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `user_purchases`
(
    `bulk_shipping`                         tinyint        NOT NULL                                    DEFAULT '0',
    `id`                                    int            NOT NULL AUTO_INCREMENT,
    `account_id`                            int            NOT NULL,
    `electronic_order_id`                   int unsigned                                               DEFAULT NULL,
    `woo_order_id`                          int                                                        DEFAULT NULL,
    `user_id`                               int            NOT NULL,
    `purchased_tests`                       int            NOT NULL                                    DEFAULT '0',
    `shipped_tests`                         int            NOT NULL                                    DEFAULT '0',
    `purchased_observations`                int            NOT NULL                                    DEFAULT '0',
    `consumed_observations`                 int            NOT NULL                                    DEFAULT '0',
    `purchase_amt`                          decimal(15, 0) NOT NULL,
    `taxable_amt`                           decimal(15, 0) NOT NULL,
    `shipping_amt`                          decimal(15, 0) NOT NULL,
    `total_amt`                             decimal(15, 0) NOT NULL,
    `messaging_id`                          int            NOT NULL                                    DEFAULT '1',
    `from_name_override`                    varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
    `from_email_override`                   varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
    `shipping_method_id`                    int            NOT NULL                                    DEFAULT '1',
    `observation_flow_id`                   int                                                        DEFAULT NULL,
    `bundle_id`                             int unsigned                                               DEFAULT NULL,
    `variations`                            int unsigned                                               DEFAULT NULL,
    `external_order_id`                     int unsigned                                               DEFAULT NULL,
    `external_kit_id`                       int unsigned                                               DEFAULT NULL,
    `message_assignee`                      int unsigned                                               DEFAULT '1',
    `ecommerce_communication_type_id`       int unsigned                                               DEFAULT '1',
    `assignee_portal_communication_type_id` int unsigned                                               DEFAULT '1',
    `shipement_communication_type_id`       int unsigned                                               DEFAULT '1',
    `general_communication_type_id`         int unsigned                                               DEFAULT '1',
    `test_result_communication_type_id`     int unsigned                                               DEFAULT '1',
    `is_thrid_party_synced`                 int                                                        DEFAULT '0',
    `created_at`                            timestamp      NOT NULL                                    DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                            timestamp      NULL                                        DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `bundle_id` (`bundle_id`),
    KEY `electronic_order_id` (`electronic_order_id`),
    CONSTRAINT `user_purchases_ibfk_1` FOREIGN KEY (`electronic_order_id`) REFERENCES `electronic_orders` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 67
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `user_purchases_attributes`
(
    `id`                  int unsigned NOT NULL AUTO_INCREMENT,
    `electronic_order_id` int unsigned NOT NULL,
    `attribute_key`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `attribute_value`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`          timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`          timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `electronic_order_id` (`electronic_order_id`),
    CONSTRAINT `user_purchases_attributes_ibfk_1` FOREIGN KEY (`electronic_order_id`) REFERENCES `electronic_orders` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 43
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `experiences_by_account`
(
    `id`                                       int       NOT NULL AUTO_INCREMENT,
    `account_id`                               int       NOT NULL,
    `name`                                     varchar(255)       DEFAULT NULL,
    `type`                                     int       NOT NULL DEFAULT '1' COMMENT '1-Provisioning Orders, 2-Electronics and Adoc Orders',
    `permit_observer_feedback_multiple_choice` int                DEFAULT NULL,
    `permit_observer_feedback_free_text`       int                DEFAULT NULL,
    `active`                                   int       NOT NULL DEFAULT '1',
    `sla_time`                                 int                DEFAULT '30',
    `intake_form`                              int unsigned       DEFAULT NULL,
    `source_type`                              int                DEFAULT '1' COMMENT '1-Account,0-Global',
    `created_at`                               timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                               timestamp NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 199
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `observation_flow_linker_product`
(
    `id`                  int unsigned NOT NULL AUTO_INCREMENT,
    `observation_flow_id` int          NOT NULL,
    `product_id`          int unsigned NOT NULL,
    `default_product`     int DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `observation_flow_linker_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 60
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `experiences_by_account_flow_linker`
(
    `id`                        int NOT NULL AUTO_INCREMENT,
    `experiences_by_account_id` int          DEFAULT NULL,
    `product_id`                varchar(252) DEFAULT NULL,
    `observation_flow_id`       int          DEFAULT NULL,
    `order_by`                  int          DEFAULT NULL,
    `bundle_id`                 int unsigned DEFAULT NULL,
    `default_exp_bundle`        int          DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `index1` (`experiences_by_account_id`, `product_id`, `order_by`),
    KEY `bundle_id` (`bundle_id`),
    CONSTRAINT `experiences_by_account_flow_linker_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 384
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `test_assignments`
(
    `id`                         int       NOT NULL AUTO_INCREMENT,
    `user_purchase_id`           int                                                          DEFAULT NULL,
    `assigned_by`                int       NOT NULL,
    `assigned_to`                int       NOT NULL,
    `assigned_datetime`          datetime                                                     DEFAULT NULL,
    `experience_by_account_id`   int                                                          DEFAULT NULL,
    `product_id`                 varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci   DEFAULT NULL,
    `name`                       varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `last_name`                  varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `address`                    varchar(3000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
    `address2`                   varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `city`                       varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `postal`                     varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `state`                      varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `country`                    varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `status`                     int       NOT NULL                                           DEFAULT '0',
    `voucher_code`               varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci   DEFAULT NULL,
    `notify_email`               varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `notify_phone`               varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci   DEFAULT NULL,
    `sessionId`                  varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `kitId`                      varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci   DEFAULT NULL,
    `update_on`                  datetime                                                     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `shipment_id`                varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `shipment_order_id`          varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `shipment_date`              datetime                                                     DEFAULT NULL,
    `shipping_method`            varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `shipment_tracking_id`       varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci   DEFAULT NULL,
    `shipment_shipper_type`      int                                                          DEFAULT NULL COMMENT 'The shipper_type ID (UPS, USPS, Fedex, etc.)',
    `shipment_status`            int                                                          DEFAULT '0' COMMENT '0 = not shipped1 = shipped2 = delayed3 = exception4 = completed',
    `shipment_arrival_date`      datetime                                                     DEFAULT NULL,
    `shipment_status_notes`      varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `event_id`                   int                                                          DEFAULT NULL,
    `recipient_type`             varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci  DEFAULT NULL,
    `bundle_id`                  int unsigned                                                 DEFAULT NULL,
    `total_assigned_test`        int                                                          DEFAULT NULL,
    `total_assigned_observation` int                                                          DEFAULT NULL,
    `task_status`                int                                                          DEFAULT '0',
    `video_photo_status`         int unsigned                                                 DEFAULT '0',
    `is_thrid_party_synced`      int                                                          DEFAULT '0',
    `created_at`                 timestamp NOT NULL                                           DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                 timestamp NULL                                               DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `bundle_id` (`bundle_id`),
    KEY `user_purchase_id` (`user_purchase_id`),
    CONSTRAINT `test_assignments_ibfk_1` FOREIGN KEY (`user_purchase_id`) REFERENCES `user_purchases` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 59
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;
















  











CREATE TABLE `assignment_event_history`
(
    `id`                         int unsigned NOT NULL AUTO_INCREMENT,
    `assignment_id`              int                                                          DEFAULT NULL,
    `external_status_mapping_id` int unsigned                                                 DEFAULT NULL,
    `internal_status_mapping_id` int unsigned                                                 DEFAULT NULL,
    `status`                     varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`                 timestamp    NOT NULL                                        DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                 timestamp    NULL                                            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `assignment_id` (`assignment_id`),
    KEY `external_status_mapping_id` (`external_status_mapping_id`),
    KEY `internal_status_mapping_id` (`internal_status_mapping_id`),
    CONSTRAINT `assignment_event_history_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `test_assignments` (`id`),
    CONSTRAINT `assignment_event_history_ibfk_2` FOREIGN KEY (`external_status_mapping_id`) REFERENCES `status_mapping` (`id`),
    CONSTRAINT `assignment_event_history_ibfk_3` FOREIGN KEY (`internal_status_mapping_id`) REFERENCES `status` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `assignment_report_filter`
(
    `id`          int NOT NULL AUTO_INCREMENT,
    `filter_data` json DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `assignment_report_schedule`
(
    `id`                     int          NOT NULL AUTO_INCREMENT,
    `account_id`             int          NOT NULL,
    `user_id`                int          NOT NULL,
    `user_email`             varchar(255) NOT NULL,
    `report_name`            text         NOT NULL,
    `report_frequency`       int          NOT NULL COMMENT '1=daily,2=weekly,3=monthly',
    `frequency_day_of_week`  int                   DEFAULT NULL COMMENT '1=Monday,2=Tuesday,3=Wednesday,4=Thursday,5=Friday,6=Saturday,7=Sunday',
    `frequency_day_of_month` int                   DEFAULT NULL COMMENT 'Day of the month like 1/2/3',
    `report_filter_id`       int                   DEFAULT NULL,
    `is_deleted`             smallint     NOT NULL DEFAULT '0' COMMENT '1=deleted',
    `created_at`             timestamp    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `bundle_images`
(
    `id`                       int unsigned NOT NULL AUTO_INCREMENT,
    `bundle_id`                int unsigned NOT NULL,
    `file_name`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `file_path`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `is_primary`               int                                                           DEFAULT '0',
    `wordpress_image_id`       int                                                           DEFAULT '0',
    `wordpress_image_path`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `wordpress_image_position` int                                                           DEFAULT NULL,
    `created_at`               timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`               timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `bundle_id` (`bundle_id`),
    CONSTRAINT `bundle_images_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `carrier_codes`
(
    `id`            int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `carrier_code`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL,
    `friendly_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`    timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 50
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `carriers_by_country`
(
    `id`                int unsigned NOT NULL AUTO_INCREMENT,
    `support_entity_id` int unsigned NOT NULL,
    `carrier_codes_id`  int unsigned NOT NULL,
    `country_code`      varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`        timestamp    NOT NULL                                       DEFAULT CURRENT_TIMESTAMP,
    `updated_at`        timestamp    NULL                                           DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `support_entity_id` (`support_entity_id`),
    KEY `carrier_codes_id` (`carrier_codes_id`),
    CONSTRAINT `carriers_by_country_ibfk_1` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`),
    CONSTRAINT `carriers_by_country_ibfk_2` FOREIGN KEY (`carrier_codes_id`) REFERENCES `carrier_codes` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `communication_log`
(
    `id`              int      NOT NULL AUTO_INCREMENT,
    `account_id`      int               DEFAULT NULL,
    `user_id`         int               DEFAULT NULL,
    `message_type_id` smallint          DEFAULT NULL,
    `type`            int               DEFAULT NULL,
    `recipient`       varchar(255)      DEFAULT NULL,
    `subject`         varchar(500)      DEFAULT NULL,
    `body`            longtext,
    `delivery_id`     varchar(50)       DEFAULT NULL,
    `delivery_status` int               DEFAULT NULL,
    `send_date`       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = MyISAM
  DEFAULT CHARSET = latin1;

CREATE TABLE `communication_settings`
(
    `id`                 int                                                           NOT NULL AUTO_INCREMENT,
    `is_sandbox_enabled` tinyint(1)                                                    NOT NULL DEFAULT '0',
    `sandbox_email`      varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `sandbox_phone`      varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `communication_types`
(
    `id`         int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `name`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `is_active`  int                                                                    DEFAULT '1',
    `created_at` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `connectors_by_support_entity`
(
    `id`                int unsigned NOT NULL AUTO_INCREMENT,
    `support_entity_id` int unsigned NOT NULL,
    `connector_id`      int          NOT NULL COMMENT 'ID of the connector (e.g. ShipHero)',
    `active`            int                   DEFAULT '1',
    `created_by`        int          NOT NULL,
    `created_at`        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`        timestamp    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `support_entity_id` (`support_entity_id`),
    KEY `created_by` (`created_by`),
    CONSTRAINT `connectors_by_support_entity_ibfk_1` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`),
    CONSTRAINT `connectors_by_support_entity_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `consent_form`
(
    `id`                  int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `intake_form_id`      int unsigned                                                  NOT NULL,
    `consent_form_name`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `consent_instruction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `reject_flag`         int                                                                    DEFAULT '0',
    `reject_options`      int                                                                    DEFAULT NULL,
    `consent_content`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `created_at`          timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`          timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `intake_form_id` (`intake_form_id`),
    CONSTRAINT `consent_form_ibfk_1` FOREIGN KEY (`intake_form_id`) REFERENCES `intake_form` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `contact_us`
(
    `id`               int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `name`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `user_id`          int                                                           NOT NULL,
    `email`            varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `phone`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL,
    `company_account`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `contact_method`   int                                                                    DEFAULT '1',
    `question_type`    int                                                                    DEFAULT NULL,
    `question_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`       timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `cron_logs`
(
    `id`         int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `cron_type`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT ' Ex- (master, shipment tracking(shipEngine), shipHero Reconciliation)',
    `is_running` int                                                                    DEFAULT '0',
    `stopped_at` datetime                                                               DEFAULT NULL,
    `created_at` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 48
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `cron_queue`
(
    `id`                int unsigned                                                 NOT NULL AUTO_INCREMENT,
    `relation_id`       int                                                          NOT NULL COMMENT ' Reference ID for related entities (e.g., orders, shipments)',
    `shipment_id`       int unsigned                                                          DEFAULT NULL,
    `account_id`        int                                                          NOT NULL,
    `stage_type_id`     int unsigned                                                 NOT NULL,
    `support_entity_id` int unsigned                                                          DEFAULT NULL,
    `status`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT 'Task status - pending, queued, completed, failed',
    `api_type`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT 'Type of API -shipEngine, shipHero, custom, other',
    `auth_type`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT 'Authentication type =token, api-key',
    `api_key_header`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT 'Header name for the API key',
    `payload`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `api_method`        varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci           DEFAULT NULL,
    `auth_value`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `api_url`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         DEFAULT NULL,
    `cron_type`         varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT 'Type of cron task -api, follow-up',
    `priority`          int                                                          NOT NULL COMMENT 'Task priority (1 for highest priority, 8 for lowest)',
    `api_framework`     varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT 'ex- (GraphQL, RestApi)',
    `created_at`        timestamp                                                    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`        timestamp                                                    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `shipment_id` (`shipment_id`),
    KEY `account_id` (`account_id`),
    KEY `stage_type_id` (`stage_type_id`),
    KEY `support_entity_id` (`support_entity_id`),
    CONSTRAINT `cron_queue_ibfk_1` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`),
    CONSTRAINT `cron_queue_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
    CONSTRAINT `cron_queue_ibfk_3` FOREIGN KEY (`stage_type_id`) REFERENCES `stage_types` (`id`),
    CONSTRAINT `cron_queue_ibfk_4` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `cron_queue_retry`
(
    `id`            int unsigned NOT NULL AUTO_INCREMENT,
    `task_id`       int unsigned NOT NULL,
    `retry_count`   int          NOT NULL DEFAULT '0',
    `retry_time`    datetime     NOT NULL,
    `status`        varchar(25)  NOT NULL,
    `error_message` text,
    `created_at`    datetime              DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    datetime              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 36
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `custom_fields`
(
    `id`                        int unsigned NOT NULL AUTO_INCREMENT,
    `intake_form_id`            int unsigned NOT NULL,
    `section_type`              int                                                           DEFAULT NULL,
    `section_no`                int                                                           DEFAULT NULL,
    `parent_section_no`         int                                                           DEFAULT NULL,
    `consent_form_id`           int                                                           DEFAULT NULL,
    `headline`                  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `instructions`              varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `section_divider`           int                                                           DEFAULT NULL,
    `data_type`                 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `options`                   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `required_flag`             int                                                           DEFAULT '0',
    `default_value`             longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `file_types`                varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `max_upload`                int                                                           DEFAULT NULL,
    `sequence`                  int                                                           DEFAULT NULL,
    `selected_field_id`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `valid_form_id`             longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `other_type_id`             varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `required_manual_entry`     longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `id_validation`             int                                                           DEFAULT NULL,
    `created_at`                timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `insurance_card_images`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `insurance_consent_form_id` int                                                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `intake_form_id` (`intake_form_id`),
    CONSTRAINT `custom_fields_ibfk_1` FOREIGN KEY (`intake_form_id`) REFERENCES `intake_form` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `custom_fields_form`
(
    `id`             int unsigned NOT NULL AUTO_INCREMENT,
    `intake_form_id` int                                                           DEFAULT NULL,
    `label`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `instruction`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `dataType`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `default`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `req`            int                                                           DEFAULT NULL,
    `created_at`     timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`     timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `digital_asset_details`
(
    `id`               int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `digital_asset_id` int unsigned                                                  NOT NULL,
    `filename`         varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `image_path`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `css_path`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `font_path`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `created_at`       timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `digital_asset_id` (`digital_asset_id`),
    CONSTRAINT `digital_asset_details_ibfk_1` FOREIGN KEY (`digital_asset_id`) REFERENCES `digital_assets` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `digital_assets`
(
    `id`               int unsigned NOT NULL AUTO_INCREMENT,
    `system_area_id`   int unsigned NOT NULL,
    `messaging_set_id` int unsigned NOT NULL,
    `asset_type`       int unsigned NOT NULL,
    `account_id`       int                   DEFAULT NULL,
    `created_at`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       timestamp    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `email_queue`
(
    `id`              int unsigned NOT NULL AUTO_INCREMENT,
    `relation_id`     int                                                           DEFAULT NULL,
    `user_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `to_email`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `subject`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `body`            longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `sent_email_flag` int                                                           DEFAULT '0',
    `sent_time`       timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `created_at`      timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`      timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `events`
(
    `id`                        int          NOT NULL AUTO_INCREMENT,
    `account_id`                int          NOT NULL,
    `name`                      varchar(255) NOT NULL,
    `event_start_date`          datetime     DEFAULT NULL,
    `event_end_date`            datetime     DEFAULT NULL,
    `testing_window_start_date` datetime     DEFAULT NULL,
    `testing_window_end_date`   datetime     DEFAULT NULL,
    `location`                  text,
    `event_url`                 varchar(255) DEFAULT NULL,
    `is_deleted`                tinyint      DEFAULT '0',
    `created_by`                int          NOT NULL,
    `updated_by`                int          DEFAULT NULL,
    `created_at`                timestamp    NOT NULL,
    `updated_at`                datetime     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `experiences_by_account_flow_linker`
(
    `id`                        int NOT NULL AUTO_INCREMENT,
    `experiences_by_account_id` int          DEFAULT NULL,
    `product_id`                varchar(252) DEFAULT NULL,
    `observation_flow_id`       int          DEFAULT NULL,
    `order_by`                  int          DEFAULT NULL,
    `bundle_id`                 int unsigned DEFAULT NULL,
    `default_exp_bundle`        int          DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `index1` (`experiences_by_account_id`, `product_id`, `order_by`),
    KEY `bundle_id` (`bundle_id`),
    CONSTRAINT `experiences_by_account_flow_linker_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 384
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `global_settings`
(
    `id`                                    int NOT NULL AUTO_INCREMENT,
    `application_name`                      varchar(255) DEFAULT NULL,
    `address`                               text,
    `address2`                              text,
    `city`                                  varchar(150) DEFAULT NULL,
    `state`                                 varchar(150) DEFAULT NULL,
    `zipcode`                               varchar(150) DEFAULT NULL,
    `country`                               varchar(255) DEFAULT NULL,
    `coordinator_name`                      varchar(200) DEFAULT NULL,
    `coordinator_phone`                     varchar(25)  DEFAULT NULL,
    `coordinator_email`                     varchar(150) DEFAULT NULL,
    `cust_support_name`                     varchar(200) DEFAULT NULL,
    `cust_support_phone`                    varchar(25)  DEFAULT NULL,
    `cust_support_email`                    varchar(150) DEFAULT NULL,
    `from_name`                             varchar(150) DEFAULT NULL,
    `from_email`                            varchar(150) DEFAULT NULL,
    `app_url`                               varchar(150) DEFAULT NULL,
    `res_system`                            varchar(150) DEFAULT NULL,
    `res_endpoint`                          varchar(200) DEFAULT NULL,
    `res_api_key`                           varchar(255) DEFAULT NULL,
    `res_user_id`                           varchar(150) DEFAULT NULL,
    `res_password`                          varchar(150) DEFAULT NULL,
    `workflow_manager_name`                 varchar(150) DEFAULT NULL,
    `workflow_manager_phone`                varchar(25)  DEFAULT NULL,
    `workflow_manager_email`                varchar(150) DEFAULT NULL,
    `app_name`                              varchar(255) DEFAULT NULL,
    `login_url`                             varchar(255) DEFAULT NULL,
    `logo_url`                              varchar(255) DEFAULT NULL,
    `timezone_support`                      tinyint      DEFAULT NULL COMMENT '1- Assignee Time Zone, 2- Your Time Zone',
    `timezone_id`                           varchar(255) DEFAULT NULL,
    `default_sla`                           int          DEFAULT '30',
    `is_re_shipments_enable_patient`        int          DEFAULT '0',
    `is_re_shipments_enable_lab`            int          DEFAULT '0',
    `permit_observers_to_order_reshipments` int          DEFAULT '0',
    `default_word`                          int          DEFAULT '1',
    `shipping_manager_name`                 varchar(150) DEFAULT NULL,
    `shipping_manager_phone`                varchar(25)  DEFAULT NULL,
    `shipping_manager_email`                varchar(150) DEFAULT NULL,
    `ecommerce_support`                     int          DEFAULT NULL,
    `ecommerce_group`                       int          DEFAULT NULL,
    `ecommerce_consumer`                    int          DEFAULT NULL,
    `ecommerce_consumer_user_id`            int          DEFAULT NULL,
    `account_access_setting`                int          DEFAULT NULL,
    `account_ecommerce_group_flag`          int          DEFAULT NULL,
    `bundle_experience`                     int          DEFAULT NULL,
    `bundle_id`                             text,
    `experience_id`                         text,
    `global_message_assignee`               int unsigned DEFAULT '1',
    `ecommerce_communication_type_id`       int unsigned DEFAULT '1',
    `assignee_portal_communication_type_id` int unsigned DEFAULT '1',
    `shipement_communication_type_id`       int unsigned DEFAULT '1',
    `general_communication_type_id`         int unsigned DEFAULT '1',
    `test_result_communication_type_id`     int unsigned DEFAULT '1',
    `webhook_url`                           varchar(100) DEFAULT NULL,
    `api_doc_url`                           varchar(100) DEFAULT NULL,
    `2factor_user_auth`                     int unsigned DEFAULT '0',
    `2factor_device`                        int unsigned DEFAULT '0',
    `2factor_same_device_flag`              int unsigned DEFAULT '0',
    `2factor_days`                          int unsigned DEFAULT '0',
    `g_admin_two_fa`                        int          DEFAULT NULL,
    `g_manager_two_fa`                      int          DEFAULT NULL,
    `g_observer_two_fa`                     int          DEFAULT NULL,
    `account_portal_available`              int          DEFAULT NULL,
    `acc_two_fa`                            int          DEFAULT NULL,
    `assignee_portal_available`             text,
    `ass_two_fa`                            text,
    `acc_user_portal_name`                  text,
    `ass_portal_name`                       text,
    `created_at`                            datetime     DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                            datetime     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `group_accounts`
(
    `id`                int unsigned NOT NULL AUTO_INCREMENT,
    `global_setting_id` int                   DEFAULT NULL,
    `user_id`           int                   DEFAULT NULL,
    `created_at`        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`        timestamp    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `global_setting_id` (`global_setting_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `group_accounts_ibfk_1` FOREIGN KEY (`global_setting_id`) REFERENCES `global_settings` (`id`),
    CONSTRAINT `group_accounts_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 67
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `group_bundles_experiences`
(
    `id`            int unsigned NOT NULL AUTO_INCREMENT,
    `bundle_id`     int unsigned          DEFAULT NULL,
    `experience_id` int                   DEFAULT NULL,
    `group_id`      int unsigned NOT NULL,
    `created_at`    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    timestamp    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `group_id` (`group_id`),
    KEY `bundle_id` (`bundle_id`),
    KEY `experience_id` (`experience_id`),
    CONSTRAINT `group_bundles_experiences_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group_details` (`id`),
    CONSTRAINT `group_bundles_experiences_ibfk_2` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`),
    CONSTRAINT `group_bundles_experiences_ibfk_3` FOREIGN KEY (`experience_id`) REFERENCES `experiences_by_account` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 24
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `group_details`
(
    `id`                                    int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `group_name`                            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `account_id`                            int                                                           NOT NULL,
    `order_mode_id`                         int                                                                    DEFAULT NULL,
    `discount_mode_id`                      int                                                                    DEFAULT NULL,
    `bundle_experience_id`                  int                                                                    DEFAULT NULL,
    `discount_id`                           int unsigned                                                           DEFAULT NULL,
    `group_message_assignee`                int unsigned                                                           DEFAULT '1',
    `ecommerce_communication_type_id`       int unsigned                                                           DEFAULT '1',
    `assignee_portal_communication_type_id` int unsigned                                                           DEFAULT '1',
    `shipement_communication_type_id`       int unsigned                                                           DEFAULT '1',
    `general_communication_type_id`         int unsigned                                                           DEFAULT '1',
    `test_result_communication_type_id`     int unsigned                                                           DEFAULT '1',
    `sent_email_flag`                       int unsigned                                                           DEFAULT '0',
    `communication_preferences`             int                                                                    DEFAULT '0',
    `is_deleted`                            int                                                                    DEFAULT '0',
    `created_at`                            timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                            timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `discount_id` (`discount_id`),
    KEY `account_id` (`account_id`),
    CONSTRAINT `group_details_ibfk_1` FOREIGN KEY (`discount_id`) REFERENCES `group_discounts` (`id`),
    CONSTRAINT `group_details_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `group_discounts`
(
    `id`            int unsigned NOT NULL AUTO_INCREMENT,
    `discount`      double                                                        DEFAULT '5',
    `promo_code`    varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `discount_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`    timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `group_memberships`
(
    `id`              int unsigned NOT NULL AUTO_INCREMENT,
    `user_id`         int          NOT NULL,
    `group_id`        int unsigned NOT NULL,
    `sent_email_flag` int                   DEFAULT '0',
    `created_at`      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`      timestamp    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `group_id` (`group_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `group_memberships_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group_details` (`id`),
    CONSTRAINT `group_memberships_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `insurance_card_collection`
(
    `id`                   int unsigned NOT NULL AUTO_INCREMENT,
    `intake_form_id`       int unsigned NOT NULL,
    `section_type`         int                                                           DEFAULT NULL,
    `section_no`           int                                                           DEFAULT NULL,
    `parent_section_no`    int                                                           DEFAULT NULL,
    `consent_form_id`      int                                                           DEFAULT NULL,
    `headline`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `instructions`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `sequence`             int                                                           DEFAULT NULL,
    `available_collection` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`           timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`           timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `intake_form_id` (`intake_form_id`),
    CONSTRAINT `insurance_card_collection_ibfk_1` FOREIGN KEY (`intake_form_id`) REFERENCES `intake_form` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `intake_bundles_products`
(
    `id`                     int unsigned NOT NULL AUTO_INCREMENT,
    `intake_form_id`         int unsigned NOT NULL,
    `defaultFlag`            int                                                           DEFAULT NULL,
    `intake_form_bundle_id`  int                                                           DEFAULT NULL,
    `intake_form_product_id` int                                                           DEFAULT NULL,
    `intake_form_testkit_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `test_kit_image_path1`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `test_kit_image_path2`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`             timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`             timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `intake_form_id` (`intake_form_id`),
    CONSTRAINT `intake_bundles_products_ibfk_1` FOREIGN KEY (`intake_form_id`) REFERENCES `intake_form` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `intake_form`
(
    `id`                                int unsigned NOT NULL AUTO_INCREMENT,
    `account_id`                        int                                                           DEFAULT NULL,
    `form_type`                         int                                                           DEFAULT NULL,
    `form_scope`                        int                                                           DEFAULT NULL,
    `form_scope_sub_Id`                 int                                                           DEFAULT NULL,
    `form_name`                         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `form_options`                      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `after_form_submission_redirect_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'null',
    `custom_message`                    longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `redirect_to_url`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'null',
    `form_description`                  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `form_image_path`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `form_css_path`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `form_font_path`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `form_instruction`                  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `qr_code_image`                     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `url_shortener`                     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `acceptance_flag`                   int                                                           DEFAULT NULL,
    `is_deleted`                        int                                                           DEFAULT '0',
    `deleted_at`                        datetime                                                      DEFAULT NULL,
    `created_at`                        timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                        timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `intake_form_kit_ids`
(
    `id`                int unsigned NOT NULL AUTO_INCREMENT,
    `intake_form_id`    int                                                           DEFAULT NULL,
    `user_id`           int                                                           DEFAULT NULL,
    `kit_value`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `intake_bundle_id`  int                                                           DEFAULT NULL,
    `intake_product_id` int                                                           DEFAULT NULL,
    `created_at`        timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`        timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `intake_identity_upload`
(
    `id`                       int unsigned NOT NULL AUTO_INCREMENT,
    `intake_form_id`           int unsigned NOT NULL,
    `country_issue`            int                                                           DEFAULT NULL,
    `state_issue`              int unsigned NOT NULL,
    `document_type`            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `front_id_image_path`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `back_id_image_path`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `document_number_id`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `document_expiration_date` datetime                                                      DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `intake_form_id` (`intake_form_id`),
    KEY `country_issue` (`country_issue`),
    KEY `state_issue` (`state_issue`),
    CONSTRAINT `intake_identity_upload_ibfk_1` FOREIGN KEY (`intake_form_id`) REFERENCES `intake_form` (`id`),
    CONSTRAINT `intake_identity_upload_ibfk_2` FOREIGN KEY (`country_issue`) REFERENCES `country_list` (`id`),
    CONSTRAINT `intake_identity_upload_ibfk_3` FOREIGN KEY (`state_issue`) REFERENCES `us_states` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `intake_user_answers`
(
    `id`               int unsigned NOT NULL AUTO_INCREMENT,
    `user_id`          int                   DEFAULT NULL,
    `intake_form_id`   int unsigned          DEFAULT NULL,
    `custom_fields_id` int unsigned          DEFAULT NULL,
    `answer`           longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `manager_approval` int                   DEFAULT NULL,
    `created_at`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       timestamp    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `intake_form_id` (`intake_form_id`),
    KEY `custom_fields_id` (`custom_fields_id`),
    CONSTRAINT `intake_user_answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `intake_user_answers_ibfk_2` FOREIGN KEY (`intake_form_id`) REFERENCES `intake_form` (`id`),
    CONSTRAINT `intake_user_answers_ibfk_3` FOREIGN KEY (`custom_fields_id`) REFERENCES `custom_fields` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `kits`
(
    `id`                             int unsigned NOT NULL AUTO_INCREMENT,
    `third_party_order_id`           int unsigned NOT NULL,
    `status_mapping_id`              int unsigned                                                  DEFAULT NULL,
    `internal_kit_status_mapping_id` int unsigned                                                  DEFAULT NULL,
    `kit_id`                         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `type`                           varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `previous_status`                varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `status`                         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `events`                         text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `shipment_to_customer`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `registered_to`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `created_at`                     timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                     timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `kits_unique` (`third_party_order_id`, `kit_id`),
    KEY `third_party_order_id` (`third_party_order_id`),
    KEY `internal_kit_status_mapping_id` (`internal_kit_status_mapping_id`),
    CONSTRAINT `kits_ibfk_1` FOREIGN KEY (`third_party_order_id`) REFERENCES `third_party_orders` (`id`),
    CONSTRAINT `kits_ibfk_2` FOREIGN KEY (`internal_kit_status_mapping_id`) REFERENCES `status` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `language_phrase_overrides`
(
    `id`               int unsigned NOT NULL AUTO_INCREMENT,
    `language_id`      int unsigned NOT NULL,
    `account_id`       int          NOT NULL,
    `manual_phrase`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `translate_phrase` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`       timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `language_id` (`language_id`),
    CONSTRAINT `language_phrase_overrides_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `language_status`
(
    `id`              int unsigned NOT NULL AUTO_INCREMENT,
    `language_id`     int unsigned NOT NULL,
    `reload_language` int                   DEFAULT '0',
    `created_at`      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`      timestamp    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `language_id` (`language_id`),
    CONSTRAINT `language_status_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `login_sessions`
(
    `id`          int       NOT NULL AUTO_INCREMENT,
    `user_id`     int                DEFAULT NULL,
    `login_date`  date               DEFAULT NULL,
    `ip_address`  varchar(50)        DEFAULT NULL,
    `device_hash` varchar(255)       DEFAULT NULL,
    `os`          varchar(200)       DEFAULT NULL,
    `browser`     varchar(1000)      DEFAULT NULL,
    `device_type` varchar(200)       DEFAULT NULL,
    `created_at`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = MyISAM
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = latin1;

CREATE TABLE `message_notification`
(
    `id`                   int unsigned                                          NOT NULL AUTO_INCREMENT,
    `user_id`              int                                                   NOT NULL,
    `message_notification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `date_seen`            datetime                                                       DEFAULT NULL,
    `login_session_id`     int                                                            DEFAULT NULL,
    `is_deleted`           int                                                            DEFAULT '0',
    `created_at`           timestamp                                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`           timestamp                                             NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `message_notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `message_template_groupings`
(
    `id`            int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `template_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `language_id`   int unsigned                                                  NOT NULL,
    `created_at`    timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `language_id` (`language_id`),
    CONSTRAINT `message_template_groupings_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `message_templates`
(
    `templateID`                   int       NOT NULL AUTO_INCREMENT,
    `messagingID`                  int       NOT NULL,
    `messageTypeID`                int       NOT NULL,
    `templateType`                 int       NOT NULL                                            DEFAULT '1' COMMENT '1 = email, 2 = SMS',
    `subject`                      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `body`                         text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
    `delayDurationInDays`          int       NOT NULL                                            DEFAULT '2',
    `numberOfReminders`            int       NOT NULL                                            DEFAULT '3',
    `startDate`                    datetime                                                      DEFAULT NULL,
    `language_id`                  int unsigned                                                  DEFAULT NULL,
    `message_template_grouping_id` int unsigned                                                  DEFAULT NULL,
    `message_template_bundle`      varchar(255)                                                  DEFAULT NULL,
    `permit_pdf_download`          varchar(200)                                                  DEFAULT NULL,
    `permit_share_email`           varchar(200)                                                  DEFAULT NULL,
    `updated_at`                   timestamp NULL                                                DEFAULT NULL,
    PRIMARY KEY (`templateID`),
    UNIQUE KEY `templateID_UNIQUE` (`templateID`),
    KEY `messaging_unique` (`templateType`, `messagingID`),
    KEY `language_id` (`language_id`),
    CONSTRAINT `message_templates_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1837
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `messaging`
(
    `id`                               int                                                           NOT NULL AUTO_INCREMENT,
    `name`                             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `account_id`                       int                                                                    DEFAULT '0',
    `allow_accounts_to_select`         int                                                                    DEFAULT '0',
    `messaging_set_name`               varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci           DEFAULT NULL,
    `email_from_name_for_purchasers`   varchar(45)                                                            DEFAULT NULL,
    `email_from_address_for_purchsers` varchar(45)                                                            DEFAULT NULL,
    `email_from_name_for_assignees`    varchar(45)                                                            DEFAULT NULL,
    `email_from_address_for_assignees` varchar(45)                                                            DEFAULT NULL,
    `websiteURL`                       varchar(100)                                                           DEFAULT NULL,
    `provisionURL`                     varchar(100)                                                           DEFAULT NULL,
    `logoURL`                          varchar(100)                                                           DEFAULT NULL,
    `supportPhone`                     varchar(45)                                                            DEFAULT NULL,
    `faviconURL`                       varchar(100)                                                           DEFAULT NULL,
    `active`                           tinyint(1)                                                    NOT NULL DEFAULT '1',
    `created_at`                       timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                       timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `messaging_type`
(
    `id`                            smallint  NOT NULL AUTO_INCREMENT,
    `message_purpose`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `create_date`                   datetime  NOT NULL ON UPDATE CURRENT_TIMESTAMP,
    `sortorder`                     int                                                           DEFAULT '0',
    `language_id`                   int unsigned                                                  DEFAULT NULL,
    `message_template_groupings_id` int unsigned                                                  DEFAULT NULL,
    `communication_id`              int unsigned                                                  DEFAULT NULL,
    `updated_at`                    timestamp NULL                                                DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `language_id` (`language_id`),
    KEY `message_template_groupings_id` (`message_template_groupings_id`),
    KEY `communication_id` (`communication_id`),
    CONSTRAINT `messaging_type_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
    CONSTRAINT `messaging_type_ibfk_2` FOREIGN KEY (`message_template_groupings_id`) REFERENCES `message_template_groupings` (`id`),
    CONSTRAINT `messaging_type_ibfk_3` FOREIGN KEY (`communication_id`) REFERENCES `communication_types` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 89
  DEFAULT CHARSET = latin1;

CREATE TABLE `notifications`
(
    `id`           int       NOT NULL AUTO_INCREMENT,
    `sender_id`    int            DEFAULT NULL COMMENT 'id of users	',
    `recipient_id` int            DEFAULT NULL COMMENT 'id of users	',
    `queue_id`     int            DEFAULT NULL COMMENT 'id of observer_task_queues',
    `message`      text,
    `is_read`      tinyint        DEFAULT '0' COMMENT '1->read, 0 -> unread',
    `is_sms_sent`  tinyint        DEFAULT '0' COMMENT '1->Yes, 0 -> No',
    `created_at`   timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `observation_feedback`
(
    `id`                  int unsigned NOT NULL AUTO_INCREMENT,
    `observation_flow_id` int DEFAULT NULL,
    `questions`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `observation_feedback_answers`
(
    `id`                        int unsigned NOT NULL AUTO_INCREMENT,
    `test_assignment_id`        int          NOT NULL,
    `observer_feedback_answers` int                   DEFAULT NULL,
    `free_text_answer`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `specimen_failed_status`    int                   DEFAULT NULL,
    `created_at`                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                timestamp    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `observation_flow_linker`
(
    `id`                  int NOT NULL AUTO_INCREMENT,
    `observation_flow_id` int NOT NULL,
    `product_id`          int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `index1` (`observation_flow_id`, `product_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `observation_flows`
(
    `id`                     int          NOT NULL AUTO_INCREMENT,
    `name`                   varchar(100) NOT NULL,
    `image_path`             text,
    `fonts_path`             text,
    `inline_css_path`        varchar(255)      DEFAULT NULL,
    `active`                 tinyint(1)   NOT NULL,
    `Permit_Video`           int               DEFAULT NULL,
    `Include_Video_Button`   int               DEFAULT NULL,
    `Permit_Chat`            int               DEFAULT NULL,
    `Permit_Email`           int               DEFAULT NULL,
    `flow_purpose`           int               DEFAULT '1',
    `font_size`              varchar(100)      DEFAULT NULL,
    `text_color`             varchar(100)      DEFAULT NULL,
    `button_color`           varchar(100)      DEFAULT NULL,
    `is_deleted`             int               DEFAULT '0',
    `permit_multiple_choice` int               DEFAULT NULL,
    `permit_free_text`       int               DEFAULT NULL,
    `created_at`             timestamp    NULL DEFAULT NULL,
    `updated_at`             timestamp    NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `observation_screens`
(
    `id`                     int         NOT NULL AUTO_INCREMENT,
    `observation_flow_id`    int         NOT NULL,
    `screen_number`          tinyint(1)  NOT NULL,
    `screen_type`            varchar(15) NOT NULL,
    `html_content`           text,
    `timer_type`             varchar(20)          DEFAULT NULL,
    `stopwatch_minutes`      tinyint(1)           DEFAULT NULL,
    `stopwatch_seconds`      tinyint(1)           DEFAULT NULL,
    `countdown_minutes`      tinyint(1)           DEFAULT NULL,
    `countdown_seconds`      tinyint(1)           DEFAULT NULL,
    `question_type`          varchar(20)          DEFAULT NULL,
    `observer_question_type` varchar(255)         DEFAULT NULL COMMENT 'none, custom',
    `custom_question`        text,
    `custom_answer`          text,
    `is_back_button_enable`  int                  DEFAULT '0',
    `allow_video_live_chat`  int                  DEFAULT '0',
    `allow_video_record`     int unsigned         DEFAULT '0',
    `allow_photo_capture`    int unsigned         DEFAULT '0',
    `created_at`             timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`             timestamp   NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 91
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `observation_screens_captures`
(
    `id`                           int       NOT NULL AUTO_INCREMENT,
    `test_observations_capture_id` int                DEFAULT NULL,
    `test_assignment_id`           int                DEFAULT NULL,
    `observation_flow_id`          int                DEFAULT NULL,
    `observation_screen_id`        int                DEFAULT NULL,
    `video_path`                   varchar(255)       DEFAULT NULL,
    `video_question`               varchar(255)       DEFAULT NULL,
    `video_answer`                 varchar(255)       DEFAULT NULL,
    `image_path`                   varchar(255)       DEFAULT NULL,
    `image_question`               varchar(255)       DEFAULT NULL,
    `image_answer`                 varchar(255)       DEFAULT NULL,
    `bundle_id`                    int unsigned       DEFAULT NULL,
    `created_at`                   timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                   timestamp NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `bundle_id` (`bundle_id`),
    CONSTRAINT `observation_screens_captures_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `observer_eligible_bundles`
(
    `id`          int       NOT NULL AUTO_INCREMENT,
    `observer_id` int       NOT NULL COMMENT 'id of table users',
    `bundle_id`   int unsigned       DEFAULT NULL COMMENT 'id of table bundles',
    `status`      tinyint(1)         DEFAULT NULL COMMENT '1=>active 2=> inactive',
    `created_at`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_by`  int       NOT NULL COMMENT 'id of table users',
    `updated_by`  int       NOT NULL COMMENT 'id of table users',
    PRIMARY KEY (`id`),
    KEY `bundle_id` (`bundle_id`),
    CONSTRAINT `observer_eligible_bundles_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 356
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `observer_question_answers`
(
    `id`                             int        NOT NULL AUTO_INCREMENT,
    `observer_question_id`           int        NOT NULL,
    `queue_status_id`                int        NOT NULL,
    `observation_screen_id`          int                 DEFAULT NULL,
    `observation_screens_capture_id` int                 DEFAULT NULL,
    `answer`                         varchar(255)        DEFAULT NULL,
    `export_answer`                  varchar(255)        DEFAULT NULL,
    `status`                         tinyint(1) NOT NULL DEFAULT '1',
    `created_at`                     datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                     datetime            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `observer_questions`
(
    `id`                    int        NOT NULL AUTO_INCREMENT,
    `observation_flow_id`   int                 DEFAULT NULL,
    `observation_screen_id` int        NOT NULL,
    `export_type`           tinyint(1)          DEFAULT '0' COMMENT '0 - select, 1 - None, 2 - cleared4',
    `question`              text,
    `answer`                text,
    `export_answer`         text,
    `question_type`         tinyint(1)          DEFAULT '1' COMMENT '1 - radio button, 2 - checkbox, 3 - single line, 4 - multiple line, 5 - slider',
    `status`                tinyint(1) NOT NULL DEFAULT '1',
    `created_at`            datetime   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`            datetime            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `observer_queue_verification_status`
(
    `id`                            int        NOT NULL AUTO_INCREMENT,
    `observer_id`                   int        NOT NULL COMMENT 'id of table users',
    `task_queue_id`                 int        NOT NULL COMMENT 'id of table observer_task_queues',
    `observation_screen_capture_id` int             DEFAULT NULL COMMENT 'id of table observation_screens_captures',
    `observation_screen_id`         int             DEFAULT NULL COMMENT 'id of table observation_screens',
    `verification_status`           tinyint(1) NOT NULL COMMENT '1-Approved, 2-Disapproved',
    `verification_type`             tinyint(1) NOT NULL COMMENT '1-Photo,2-Video,3-Id',
    `disapproval_reason`            tinyint(1)      DEFAULT NULL COMMENT 'Constant defined in schedule based on type',
    `created_at`                    timestamp  NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                    timestamp  NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `observer_task_queues`
(
    `id`                           int        NOT NULL AUTO_INCREMENT,
    `observer_id`                  int        NOT NULL COMMENT 'id of table users',
    `test_assignment_id`           int                 DEFAULT NULL COMMENT 'id of task assigments',
    `schedule_id`                  int        NOT NULL,
    `schedule_shift_id`            int        NOT NULL,
    `test_observations_capture_id` int        NOT NULL,
    `turn_around_time`             int                 DEFAULT NULL,
    `task_status`                  tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-Pending,2-In process,3-Completed',
    `created_at`                   timestamp  NULL     DEFAULT CURRENT_TIMESTAMP,
    `completed_at`                 timestamp  NULL     DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `order_event_history`
(
    `id`                         int unsigned NOT NULL AUTO_INCREMENT,
    `electronic_order_id`        int unsigned NOT NULL,
    `external_status_mapping_id` int unsigned                                                 DEFAULT NULL,
    `internal_status_mapping_id` int unsigned                                                 DEFAULT NULL,
    `status`                     varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`                 timestamp    NOT NULL                                        DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                 timestamp    NULL                                            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `electronic_order_id` (`electronic_order_id`),
    KEY `external_status_mapping_id` (`external_status_mapping_id`),
    KEY `internal_status_mapping_id` (`internal_status_mapping_id`),
    CONSTRAINT `order_event_history_ibfk_1` FOREIGN KEY (`electronic_order_id`) REFERENCES `electronic_orders` (`id`),
    CONSTRAINT `order_event_history_ibfk_2` FOREIGN KEY (`external_status_mapping_id`) REFERENCES `status_mapping` (`id`),
    CONSTRAINT `order_event_history_ibfk_3` FOREIGN KEY (`internal_status_mapping_id`) REFERENCES `status` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 43
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `order_types`
(
    `id`                     int          NOT NULL AUTO_INCREMENT,
    `order_type`             varchar(100) NOT NULL,
    `test_type_manufacturer` varchar(100) NOT NULL,
    `test_type`              varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = MyISAM
  DEFAULT CHARSET = latin1;

CREATE TABLE `outbound_webhook_queue`
(
    `id`                int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `account_id`        int                                                                    DEFAULT NULL,
    `stage_type_id`     int unsigned                                                  NOT NULL,
    `support_entity_id` int unsigned                                                           DEFAULT NULL,
    `relation_id`       int                                                           NOT NULL,
    `status_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `is_sent`           tinyint(1)                                                    NOT NULL DEFAULT '0',
    `created_at`        timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`        timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `account_id` (`account_id`),
    KEY `stage_type_id` (`stage_type_id`),
    KEY `support_entity_id` (`support_entity_id`),
    CONSTRAINT `outbound_webhook_queue_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
    CONSTRAINT `outbound_webhook_queue_ibfk_2` FOREIGN KEY (`stage_type_id`) REFERENCES `stage_types` (`id`),
    CONSTRAINT `outbound_webhook_queue_ibfk_3` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `phinxlog`
(
    `version`        bigint     NOT NULL,
    `migration_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `start_time`     timestamp  NULL                                               DEFAULT NULL,
    `end_time`       timestamp  NULL                                               DEFAULT NULL,
    `breakpoint`     tinyint(1) NOT NULL                                           DEFAULT '0',
    PRIMARY KEY (`version`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `product_settings`
(
    `id`                   int unsigned NOT NULL AUTO_INCREMENT,
    `product_id`           int unsigned NOT NULL,
    `prod_purc_req`        int                   DEFAULT NULL,
    `bulk_shipment`        int                   DEFAULT NULL,
    `indiv_shipment`       int                   DEFAULT NULL,
    `obs_req_test_purc`    int                   DEFAULT NULL,
    `obs_alw_test_purc`    int                   DEFAULT NULL,
    `obs_alw_no_test_purc` int                   DEFAULT NULL,
    `created_at`           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`           timestamp    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `product_settings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 60
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `reports`
(
    `id`             int unsigned NOT NULL AUTO_INCREMENT,
    `external_id`    varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `sample_id`      int unsigned NOT NULL,
    `report_id`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `pdf`            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `txt`            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `date_collected` timestamp    NULL                                             DEFAULT NULL,
    `date_received`  timestamp    NULL                                             DEFAULT NULL,
    `date_resulted`  timestamp    NULL                                             DEFAULT NULL,
    `is_amendment`   tinyint(1)                                                    DEFAULT '0',
    `result`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `created_at`     timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`     timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_report_sample` (`report_id`, `sample_id`),
    KEY `sample_id` (`sample_id`),
    CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `sample_event_history`
(
    `id`                         int unsigned NOT NULL AUTO_INCREMENT,
    `sample_id`                  int unsigned NOT NULL,
    `external_status_mapping_id` int unsigned                                                 DEFAULT NULL,
    `internal_status_mapping_id` int unsigned                                                 DEFAULT NULL,
    `status`                     varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created`                    timestamp    NULL                                            DEFAULT NULL,
    `created_at`                 timestamp    NOT NULL                                        DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                 timestamp    NULL                                            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `sample_id` (`sample_id`),
    KEY `external_status_mapping_id` (`external_status_mapping_id`),
    KEY `internal_status_mapping_id` (`internal_status_mapping_id`),
    CONSTRAINT `sample_event_history_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`),
    CONSTRAINT `sample_event_history_ibfk_2` FOREIGN KEY (`external_status_mapping_id`) REFERENCES `status_mapping` (`id`),
    CONSTRAINT `sample_event_history_ibfk_3` FOREIGN KEY (`internal_status_mapping_id`) REFERENCES `status` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `samples`
(
    `id`                                int unsigned NOT NULL AUTO_INCREMENT,
    `external_id`                       varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `kit_id`                            int unsigned                                                  DEFAULT NULL,
    `shipment_id`                       int unsigned                                                  DEFAULT NULL,
    `status_mapping_id`                 int unsigned                                                  DEFAULT NULL,
    `internal_sample_status_mapping_id` int unsigned                                                  DEFAULT NULL,
    `sample_id`                         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `type`                              varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `previous_status`                   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `status`                            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `events`                            text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `shipments`                         text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `panels`                            text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `reports`                           text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `report_pdf_link`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `bundle_id`                         int unsigned NOT NULL,
    `order_id`                          int unsigned NOT NULL,
    `created_at`                        timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                        timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `sample_id` (`sample_id`),
    KEY `kit_id` (`kit_id`),
    KEY `shipment_id` (`shipment_id`),
    KEY `internal_sample_status_mapping_id` (`internal_sample_status_mapping_id`),
    KEY `bundle_id` (`bundle_id`),
    KEY `order_id` (`order_id`),
    CONSTRAINT `samples_ibfk_1` FOREIGN KEY (`kit_id`) REFERENCES `kits` (`id`),
    CONSTRAINT `samples_ibfk_2` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`),
    CONSTRAINT `samples_ibfk_3` FOREIGN KEY (`internal_sample_status_mapping_id`) REFERENCES `status` (`id`),
    CONSTRAINT `samples_ibfk_4` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`),
    CONSTRAINT `samples_ibfk_5` FOREIGN KEY (`order_id`) REFERENCES `electronic_orders` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `schedule_shifts`
(
    `id`                  int        NOT NULL AUTO_INCREMENT,
    `schedule_id`         int        NOT NULL COMMENT 'id of table schedules',
    `day_no`              tinyint(1) NOT NULL COMMENT '1-Sun,2-Mon,3-Tue,4-Wed,5-Thu,6-Fri,7-Sat',
    `schedule_start_time` time       NOT NULL,
    `schedule_end_time`   time       NOT NULL,
    `status`              tinyint(1)      DEFAULT NULL COMMENT '1=>active 2=> inactive',
    `created_at`          timestamp  NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`          timestamp  NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 481
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `schedules`
(
    `id`          int       NOT NULL AUTO_INCREMENT,
    `observer_id` int       NOT NULL COMMENT 'id of table users',
    `bundle_id`   int unsigned       DEFAULT NULL COMMENT 'id of table bundles',
    `status`      tinyint(1)         DEFAULT NULL COMMENT '1=>active 2=> inactive',
    `created_at`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_by`  int       NOT NULL COMMENT 'id of table users',
    `updated_by`  int       NOT NULL COMMENT 'id of table users',
    PRIMARY KEY (`id`),
    KEY `bundle_id` (`bundle_id`),
    CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 126
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `sender_notifications_info`
(
    `id`                      int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `message_notification_id` int unsigned                                                  NOT NULL,
    `user_id`                 int                                                           NOT NULL,
    `sender_type`             varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Support Entity, Admin, Purchaser, Manager, Employee, Shipment User, Assignee, Observer',
    `send_date_time`          datetime                                                               DEFAULT NULL,
    `login_session_id`        int                                                                    DEFAULT NULL,
    `appp_session_id`         int                                                                    DEFAULT NULL,
    `created_at`              timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`              timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `message_notification_id` (`message_notification_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `sender_notifications_info_ibfk_1` FOREIGN KEY (`message_notification_id`) REFERENCES `message_notification` (`id`),
    CONSTRAINT `sender_notifications_info_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `shiphero_access_details`
(
    `id`              int                                                           NOT NULL AUTO_INCREMENT,
    `refresh_token`   varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `access_token`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `expires_in`      varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `last_updated_at` date                                                         DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `shipment_carrier_mapping`
(
    `id`                         int unsigned NOT NULL AUTO_INCREMENT,
    `internal_support_entity_id` int unsigned NOT NULL,
    `external_support_entity_id` int unsigned NOT NULL,
    `external_carrier_id`        int unsigned NOT NULL,
    `internal_carrier_id`        int unsigned NOT NULL,
    `external_carrier`           varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `internal_carrier`           varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`                 timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                 timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `internal_support_entity_id` (`internal_support_entity_id`),
    KEY `external_support_entity_id` (`external_support_entity_id`),
    KEY `external_carrier_id` (`external_carrier_id`),
    KEY `internal_carrier_id` (`internal_carrier_id`),
    CONSTRAINT `shipment_carrier_mapping_ibfk_1` FOREIGN KEY (`internal_support_entity_id`) REFERENCES `support_entity` (`id`),
    CONSTRAINT `shipment_carrier_mapping_ibfk_2` FOREIGN KEY (`external_support_entity_id`) REFERENCES `support_entity` (`id`),
    CONSTRAINT `shipment_carrier_mapping_ibfk_3` FOREIGN KEY (`external_carrier_id`) REFERENCES `carrier_codes` (`id`),
    CONSTRAINT `shipment_carrier_mapping_ibfk_4` FOREIGN KEY (`internal_carrier_id`) REFERENCES `carrier_codes` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `shipment_event_history`
(
    `id`                         int unsigned NOT NULL AUTO_INCREMENT,
    `shipment_id`                int unsigned NOT NULL,
    `external_status_mapping_id` int unsigned                                                 DEFAULT NULL,
    `internal_status_mapping_id` int unsigned                                                 DEFAULT NULL,
    `status`                     varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created`                    timestamp    NULL                                            DEFAULT NULL,
    `created_at`                 timestamp    NOT NULL                                        DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                 timestamp    NULL                                            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `shipment_id` (`shipment_id`),
    KEY `external_status_mapping_id` (`external_status_mapping_id`),
    KEY `internal_status_mapping_id` (`internal_status_mapping_id`),
    CONSTRAINT `shipment_event_history_ibfk_1` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`),
    CONSTRAINT `shipment_event_history_ibfk_2` FOREIGN KEY (`external_status_mapping_id`) REFERENCES `status_mapping` (`id`),
    CONSTRAINT `shipment_event_history_ibfk_3` FOREIGN KEY (`internal_status_mapping_id`) REFERENCES `status` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 32
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `shipment_method`
(
    `id`         int unsigned                                                 NOT NULL AUTO_INCREMENT,
    `name`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp                                                    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp                                                    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `shipment_method_mapping`
(
    `id`                         int unsigned NOT NULL AUTO_INCREMENT,
    `internal_support_entity_id` int unsigned NOT NULL,
    `external_support_entity_id` int unsigned NOT NULL,
    `external_method_id`         int unsigned NOT NULL,
    `internal_method_id`         int unsigned NOT NULL,
    `external_method`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `internal_method`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`                 timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                 timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `internal_support_entity_id` (`internal_support_entity_id`),
    KEY `external_support_entity_id` (`external_support_entity_id`),
    KEY `external_method_id` (`external_method_id`),
    KEY `internal_method_id` (`internal_method_id`),
    CONSTRAINT `shipment_method_mapping_ibfk_1` FOREIGN KEY (`internal_support_entity_id`) REFERENCES `support_entity` (`id`),
    CONSTRAINT `shipment_method_mapping_ibfk_2` FOREIGN KEY (`external_support_entity_id`) REFERENCES `support_entity` (`id`),
    CONSTRAINT `shipment_method_mapping_ibfk_3` FOREIGN KEY (`external_method_id`) REFERENCES `shipment_method` (`id`),
    CONSTRAINT `shipment_method_mapping_ibfk_4` FOREIGN KEY (`internal_method_id`) REFERENCES `shipment_method` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `shipment_products_mapping`
(
    `id`                          int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `shipment_id`                 int unsigned                                                           DEFAULT NULL,
    `bundle_id`                   int unsigned                                                  NOT NULL,
    `product_id`                  int unsigned                                                           DEFAULT NULL,
    `order_id`                    int unsigned                                                  NOT NULL COMMENT 'It can be electronic, woocommer & provi id',
    `shipment_test_assignment_id` int                                                                    DEFAULT NULL,
    `line_item_type`              varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`                  timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                  timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `bundle_id` (`bundle_id`),
    KEY `product_id` (`product_id`),
    KEY `shipment_test_assignment_id` (`shipment_test_assignment_id`),
    KEY `shipment_id` (`shipment_id`),
    CONSTRAINT `shipment_products_mapping_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`),
    CONSTRAINT `shipment_products_mapping_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
    CONSTRAINT `shipment_products_mapping_ibfk_3` FOREIGN KEY (`shipment_test_assignment_id`) REFERENCES `test_assignments` (`id`),
    CONSTRAINT `shipment_products_mapping_ibfk_4` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 30
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `shipment_status`
(
    `id`               int unsigned NOT NULL AUTO_INCREMENT,
    `order_id`         int                                                           DEFAULT NULL,
    `user_purchase_id` int                                                           DEFAULT NULL,
    `shipment_status`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`       timestamp    NULL                                             DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       timestamp    NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `shipments`
(
    `id`                                  int unsigned NOT NULL AUTO_INCREMENT,
    `external_id`                         varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `shipment_recipient_id`               int unsigned NOT NULL,
    `external_shipment_status_mapping_id` int unsigned                                                  DEFAULT NULL,
    `internal_shipment_status_mapping_id` int unsigned                                                  DEFAULT NULL,
    `support_entity_id`                   int unsigned NOT NULL,
    `shipment_tracking_id`                varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `shipment_date`                       datetime                                                      DEFAULT NULL,
    `shipping_type`                       int                                                           DEFAULT NULL COMMENT '1. Customer Shipment, 2. Return Shipment',
    `shipping_method`                     varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `status`                              varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `is_shipment_delayed`                 tinyint(1)                                                    DEFAULT '0',
    `shipment_delayed_date`               datetime                                                      DEFAULT NULL,
    `carrier_code`                        varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `shipment_response`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `reshipment_parent_id`                int                                                           DEFAULT NULL,
    `carrier_codes_id`                    int unsigned                                                  DEFAULT NULL,
    `shipment_carrier_mapping_id`         int unsigned                                                  DEFAULT NULL,
    `shipment_method_id`                  int unsigned                                                  DEFAULT NULL,
    `shipment_method_mapping_id`          int unsigned                                                  DEFAULT NULL,
    `tracking_url`                        text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `total_packages`                      int          NOT NULL                                         DEFAULT '0',
    `created_at`                          timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                          timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `shipment_arrival_date`               date                                                          DEFAULT NULL,
    `shipment_status_notes`               varchar(50) COLLATE utf8mb4_unicode_ci                        DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `shipment_recipient_id` (`shipment_recipient_id`),
    KEY `external_shipment_status_mapping_id` (`external_shipment_status_mapping_id`),
    KEY `internal_shipment_status_mapping_id` (`internal_shipment_status_mapping_id`),
    KEY `support_entity_id` (`support_entity_id`),
    KEY `carrier_codes_id` (`carrier_codes_id`),
    KEY `shipment_carrier_mapping_id` (`shipment_carrier_mapping_id`),
    KEY `shipment_method_id` (`shipment_method_id`),
    KEY `shipment_method_mapping_id` (`shipment_method_mapping_id`),
    CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`shipment_recipient_id`) REFERENCES `shipment_recipients` (`id`),
    CONSTRAINT `shipments_ibfk_2` FOREIGN KEY (`external_shipment_status_mapping_id`) REFERENCES `status_mapping` (`id`),
    CONSTRAINT `shipments_ibfk_3` FOREIGN KEY (`internal_shipment_status_mapping_id`) REFERENCES `status` (`id`),
    CONSTRAINT `shipments_ibfk_4` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`),
    CONSTRAINT `shipments_ibfk_5` FOREIGN KEY (`carrier_codes_id`) REFERENCES `carrier_codes` (`id`),
    CONSTRAINT `shipments_ibfk_6` FOREIGN KEY (`shipment_carrier_mapping_id`) REFERENCES `shipment_carrier_mapping` (`id`),
    CONSTRAINT `shipments_ibfk_7` FOREIGN KEY (`shipment_method_id`) REFERENCES `shipment_method` (`id`),
    CONSTRAINT `shipments_ibfk_8` FOREIGN KEY (`shipment_method_mapping_id`) REFERENCES `shipment_method_mapping` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `shipper_type`
(
    `id`           int NOT NULL AUTO_INCREMENT,
    `shipper_name` varchar(45)  DEFAULT NULL,
    `tracking_url` varchar(200) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `supplier_info`
(
    `id`                             int unsigned NOT NULL AUTO_INCREMENT,
    `product_id`                     int unsigned NOT NULL,
    `kit_name`                       varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `kit_sku`                        varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `kit_supplier_cost_per_unit`     decimal(15, 2)                                                DEFAULT NULL,
    `kit_shipment`                   varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `kit_inbound_shipment`           int                                                           DEFAULT NULL,
    `product_name`                   varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `product_supplier_sku`           varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `product_supplier_cost_per_unit` decimal(15, 2)                                                DEFAULT NULL,
    `product_shipment`               varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `product_inbound_shipment`       int                                                           DEFAULT NULL,
    `created_at`                     timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                     timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `supplier_info_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 60
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `support_entity_products_mapping`
(
    `id`                 int unsigned NOT NULL AUTO_INCREMENT,
    `product_id`         int unsigned                                                  DEFAULT NULL,
    `support_entity_id`  int                                                           DEFAULT NULL,
    `support_entity_sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`         timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`         timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `support_entity_products_mapping_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 60
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `synchronous_videoconference`
(
    `id`                  int unsigned NOT NULL AUTO_INCREMENT,
    `observer_id`         int                                                           DEFAULT NULL,
    `assignee_id`         int                                                           DEFAULT NULL,
    `connection_type`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `test_assignments_id` int                                                           DEFAULT NULL,
    `screen_type`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Instructions',
    `active`              int                                                           DEFAULT NULL,
    `status`              int                                                           DEFAULT NULL,
    `is_deleted`          int                                                           DEFAULT '0',
    `created_at`          timestamp    NULL                                             DEFAULT NULL,
    `updated_at`          timestamp    NULL                                             DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `observer_id` (`observer_id`),
    KEY `assignee_id` (`assignee_id`),
    CONSTRAINT `synchronous_videoconference_ibfk_1` FOREIGN KEY (`observer_id`) REFERENCES `users` (`id`),
    CONSTRAINT `synchronous_videoconference_ibfk_2` FOREIGN KEY (`assignee_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `temp_sceen_records`
(
    `id`                    int NOT NULL AUTO_INCREMENT,
    `test_assignment_id`    int          DEFAULT NULL,
    `observation_screen_id` int          DEFAULT NULL,
    `video_path`            varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `test_assigment_obsevation_linker`
(
    `id`                        int NOT NULL AUTO_INCREMENT,
    `test_assignment_id`        int          DEFAULT NULL,
    `experiences_by_account_id` int          DEFAULT NULL,
    `observation_flow_id`       int          DEFAULT NULL,
    `bundle_id`                 int unsigned DEFAULT NULL COMMENT 'id of table bundles',
    `status`                    tinyint      DEFAULT '0' COMMENT '0 - not completed, 1 completed',
    `order_by`                  int          DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `index1` (`experiences_by_account_id`, `observation_flow_id`),
    KEY `bundle_id` (`bundle_id`),
    CONSTRAINT `test_assigment_obsevation_linker_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 40
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `test_observations_captures`
(
    `id`                         int       NOT NULL AUTO_INCREMENT,
    `test_assignment_id`         int                DEFAULT NULL,
    `observation_flow_id`        int                DEFAULT NULL,
    `test_observation_completed` tinyint            DEFAULT '0' COMMENT '1->completed, 0 -> not completed',
    `completed_timestamp`        timestamp NULL     DEFAULT NULL,
    `bundle_id`                  int unsigned       DEFAULT NULL,
    `created_at`                 timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                 timestamp NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `bundle_id` (`bundle_id`),
    CONSTRAINT `test_observations_captures_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `test_types`
(
    `id`                     int NOT NULL AUTO_INCREMENT,
    `test_type_name`         varchar(100) DEFAULT NULL,
    `test_type_manufacturer` varchar(100) DEFAULT NULL,
    `test_type`              varchar(100) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = MyISAM
  DEFAULT CHARSET = latin1;

CREATE TABLE `tests_callback`
(
    `created_at`  timestamp   NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `session_id`  varchar(20) NOT NULL,
    `result_time` int         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `text_translates`
(
    `id`                   int unsigned NOT NULL AUTO_INCREMENT,
    `language_id`          int unsigned NOT NULL,
    `text_id`              int unsigned NOT NULL,
    `manual_text_override` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `auto_translate_text`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `override_flag`        int                                                           DEFAULT '0',
    `created_at`           timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`           timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `language_id` (`language_id`),
    KEY `text_id` (`text_id`),
    CONSTRAINT `text_translates_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
    CONSTRAINT `text_translates_ibfk_2` FOREIGN KEY (`text_id`) REFERENCES `texts` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7981
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `texts`
(
    `id`       int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `text_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1717
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `third_party_failed_orders`
(
    `id`                     int unsigned NOT NULL AUTO_INCREMENT,
    `test_assignment_id`     int          NOT NULL,
    `bundle_id`              int unsigned NOT NULL,
    `support_entity_id`      int unsigned NOT NULL,
    `third_party_order_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `failed_response`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `response`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `is_active`              int                                                           DEFAULT '1',
    `created_at`             timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at`             timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `test_assignment_id_unique` (`test_assignment_id`),
    KEY `user_purchase_id` (`test_assignment_id`),
    KEY `bundle_id` (`bundle_id`),
    KEY `support_entity_id` (`support_entity_id`),
    CONSTRAINT `third_party_failed_orders_ibfk_2` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`),
    CONSTRAINT `third_party_failed_orders_ibfk_3` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`),
    CONSTRAINT `third_party_failed_orders_ibfk_4` FOREIGN KEY (`test_assignment_id`) REFERENCES `test_assignments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `third_party_orders`
(
    `id`                                  int unsigned                                                  NOT NULL AUTO_INCREMENT,
    `test_assignment_id`                  int                                                           NOT NULL,
    `bundle_id`                           int unsigned                                                  NOT NULL,
    `support_entity_id`                   int unsigned                                                  NOT NULL,
    `third_party_order_type`              varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `third_party_order_id`                varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `third_party_order_status`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `third_party_order_previous_status`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `third_party_order_status_mapping_id` int                                                           NOT NULL,
    `third_party_order_full_response`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `created_at`                          timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                          timestamp                                                     NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_purchase_id` (`test_assignment_id`),
    KEY `bundle_id` (`bundle_id`),
    KEY `support_entity_id` (`support_entity_id`),
    CONSTRAINT `third_party_orders_ibfk_2` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`),
    CONSTRAINT `third_party_orders_ibfk_3` FOREIGN KEY (`support_entity_id`) REFERENCES `support_entity` (`id`),
    CONSTRAINT `third_party_orders_ibfk_4` FOREIGN KEY (`test_assignment_id`) REFERENCES `test_assignments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `user_consumed_tests_observations`
(
    `id`                    int       NOT NULL AUTO_INCREMENT,
    `account_id`            int                DEFAULT NULL,
    `bundle_id`             int unsigned       DEFAULT NULL,
    `shipped_tests`         int       NOT NULL DEFAULT '0',
    `consumed_observations` int       NOT NULL DEFAULT '0',
    `create_date`           timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `bundle_id` (`bundle_id`),
    CONSTRAINT `user_consumed_tests_observations_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = latin1;

CREATE TABLE `user_intake_form_setting`
(
    `id`                 int unsigned NOT NULL AUTO_INCREMENT,
    `user_id`            int DEFAULT NULL,
    `intake_form_id`     int unsigned NOT NULL,
    `email_verification` int DEFAULT '0',
    `sms_verification`   int DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `email_verification` (`email_verification`, `sms_verification`),
    KEY `user_id` (`user_id`),
    KEY `intake_form_id` (`intake_form_id`),
    CONSTRAINT `user_intake_form_setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `user_intake_form_setting_ibfk_2` FOREIGN KEY (`intake_form_id`) REFERENCES `intake_form` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `user_intake_session`
(
    `id`         int unsigned NOT NULL AUTO_INCREMENT,
    `user_id`    int                                                           DEFAULT NULL,
    `consent_id` int                                                           DEFAULT NULL,
    `reason`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp    NOT NULL                                         DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp    NULL                                             DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `user_purchases`
(
    `bulk_shipping`                         tinyint        NOT NULL                                    DEFAULT '0',
    `id`                                    int            NOT NULL AUTO_INCREMENT,
    `account_id`                            int            NOT NULL,
    `electronic_order_id`                   int unsigned                                               DEFAULT NULL,
    `woo_order_id`                          int                                                        DEFAULT NULL,
    `user_id`                               int            NOT NULL,
    `purchased_tests`                       int            NOT NULL                                    DEFAULT '0',
    `shipped_tests`                         int            NOT NULL                                    DEFAULT '0',
    `purchased_observations`                int            NOT NULL                                    DEFAULT '0',
    `consumed_observations`                 int            NOT NULL                                    DEFAULT '0',
    `purchase_amt`                          decimal(15, 0) NOT NULL,
    `taxable_amt`                           decimal(15, 0) NOT NULL,
    `shipping_amt`                          decimal(15, 0) NOT NULL,
    `total_amt`                             decimal(15, 0) NOT NULL,
    `messaging_id`                          int            NOT NULL                                    DEFAULT '1',
    `from_name_override`                    varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
    `from_email_override`                   varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
    `shipping_method_id`                    int            NOT NULL                                    DEFAULT '1',
    `observation_flow_id`                   int                                                        DEFAULT NULL,
    `bundle_id`                             int unsigned                                               DEFAULT NULL,
    `variations`                            int unsigned                                               DEFAULT NULL,
    `external_order_id`                     int unsigned                                               DEFAULT NULL,
    `external_kit_id`                       int unsigned                                               DEFAULT NULL,
    `message_assignee`                      int unsigned                                               DEFAULT '1',
    `ecommerce_communication_type_id`       int unsigned                                               DEFAULT '1',
    `assignee_portal_communication_type_id` int unsigned                                               DEFAULT '1',
    `shipement_communication_type_id`       int unsigned                                               DEFAULT '1',
    `general_communication_type_id`         int unsigned                                               DEFAULT '1',
    `test_result_communication_type_id`     int unsigned                                               DEFAULT '1',
    `is_thrid_party_synced`                 int                                                        DEFAULT '0',
    `created_at`                            timestamp      NOT NULL                                    DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                            timestamp      NULL                                        DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `bundle_id` (`bundle_id`),
    KEY `electronic_order_id` (`electronic_order_id`),
    CONSTRAINT `user_purchases_ibfk_1` FOREIGN KEY (`electronic_order_id`) REFERENCES `electronic_orders` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 67
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `woocommerce_purchases`
(
    `id`                        int      NOT NULL AUTO_INCREMENT,
    `orderId`                   varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
    `orderCreatedDate`          varchar(20)                                                 DEFAULT NULL,
    `orderUser`                 varchar(100)                                                DEFAULT NULL,
    `orderMappedId`             varchar(50)                                                 DEFAULT NULL,
    `items`                     longtext,
    `wp_order_created_response` text,
    `created_at`                datetime NOT NULL                                           DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                datetime NOT NULL                                           DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = MyISAM
  DEFAULT CHARSET = latin1;
