drop table usertotalstatusmalitransactions;

DROP TABLE IF EXISTS `usertotalstatusmalitransactions`;
CREATE TABLE `usertotalstatusmalitransactions`  (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `usertotalstatusmalis_id` int NOT NULL,
  `transaction_id` int NULL DEFAULT NULL,
  `order_id` int not NULL,
  `wallet_changed_amount` decimal(20, 2) NULL DEFAULT NULL,
  `wallet_change_type` enum('-1','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jarime_amount` decimal(20, 2) NULL DEFAULT NULL,
  `jarime_paid` enum('0','1','-1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bedehi_changed_amount` decimal(20, 2) NULL DEFAULT NULL,
  `bedehi_change_type` enum('-1','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pardakhti_changed_amount` decimal(20, 2) NULL DEFAULT NULL,
  `pardakhti_change_type` enum('-1','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `returned_amount_to_customer` decimal(15, 2) NULL DEFAULT NULL,
  `returned_amount_to_customer_type` enum('naqd','wallet') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,

  INDEX `usertotalstatusmalitransactions_usertotalstatusmalis_indx`(`usertotalstatusmalis_id`) USING BTREE,
  INDEX `usertotalstatusmalitransactions_orders_indx`(`order_id`) USING BTREE,
	
  CONSTRAINT `usertotalstatusmalitransactions_usertotalstatusmalis_fk` FOREIGN KEY (`usertotalstatusmalis_id`) REFERENCES `usertotalstatusmalis` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
	
  CONSTRAINT `usertotalstatusmalitransactions_orders_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
	
);

//=================================================================================
drop table statusmalichangedorders;
CREATE TABLE `statusmalichangedorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `order_id` int(11) NOT NULL,
  `returntocustom_tranaction_id` int null default null,
  `returntowallet_tranaction_id` int null default null,
  `jarime_tranaction_id` int null default null,
	
  `status_order_id` int(11) NOT NULL,
  `order_finally_price` decimal(15,2) DEFAULT NULL,
  `total_paid_amount` decimal(15,2) DEFAULT NULL,
  `returned_to_customer_amount` decimal(15,2) DEFAULT NULL,
  `returned_to_wallet_amount` decimal(15,2) DEFAULT NULL,
  `returned_type` enum('naqd','wallet','naqd_wallet') DEFAULT NULL,
  `has_jarime` enum('0','1') DEFAULT NULL,
  `jarime_amount` decimal(15,2) DEFAULT NULL,
  `jarime_is_paid` enum('0','1') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,

  KEY `statusmalichangedorders_orders_indx` (`order_id`) USING BTREE,
  KEY `statusmalichangedorders__status_orders_indx` (`status_order_id`) USING BTREE,
	
	KEY statusmalichangedorders_transaction_indx1 (returntocustom_tranaction_id),
	KEY statusmalichangedorders_transaction_indx2 (returntowallet_tranaction_id),
	KEY statusmalichangedorders_transaction_indx3 (jarime_tranaction_id),
	
  CONSTRAINT `statusmalichangedorders__status_orders_fk` FOREIGN KEY (`status_order_id`) REFERENCES `status_orders` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `statusmalichangedorders_orders_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
	
	CONSTRAINT statusmalichangedorders_transaction_fk1 FOREIGN KEY  (returntocustom_tranaction_id) REFERENCES transactions (id)  ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT statusmalichangedorders_transaction_fk2 FOREIGN KEY  (returntowallet_tranaction_id) REFERENCES transactions (id)  ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT statusmalichangedorders_transaction_fk3 FOREIGN KEY  (jarime_tranaction_id) REFERENCES transactions (id)  ON DELETE RESTRICT ON UPDATE CASCADE
);

//===================================================================
drop table statusmalichangedorders;
CREATE TABLE `statusmalichangedorders` (
  `id` int(11) NOT NULL PRIMARY KEY ,   -- points to orders table id column
  `status_order_id` int(11) NOT NULL,
	`returntocustom_tranaction_id` int(11) DEFAULT NULL,
  `returntowallet_tranaction_id` int(11) DEFAULT NULL,
  `jarime_tranaction_id` int(11) DEFAULT NULL,
  `order_finally_price` decimal(15,2) DEFAULT NULL,
  `total_paid_amount` decimal(15,2) DEFAULT NULL,
  `returned_to_customer_amount` decimal(15,2) DEFAULT NULL,
  `returned_to_wallet_amount` decimal(15,2) DEFAULT NULL,
  `returned_type` enum('naqd','wallet','naqd_wallet') DEFAULT NULL,
  `has_jarime` enum('0','1') DEFAULT NULL,
  `jarime_amount` decimal(15,2) DEFAULT NULL,
  `jarime_is_paid` enum('0','1') DEFAULT NULL,
	
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,

  KEY `statusmalichangedorders__status_orders_indx` (`status_order_id`) USING BTREE,
  KEY `statusmalichangedorders_transaction_indx1` (`returntocustom_tranaction_id`),
  KEY `statusmalichangedorders_transaction_indx2` (`returntowallet_tranaction_id`),
  KEY `statusmalichangedorders_transaction_indx3` (`jarime_tranaction_id`),

  CONSTRAINT `statusmalichangedorders_orders_fk` FOREIGN KEY (`id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
	CONSTRAINT `statusmalichangedorders__status_orders_fk` FOREIGN KEY (`status_order_id`) REFERENCES `status_orders` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `statusmalichangedorders_transaction_fk1` FOREIGN KEY (`returntocustom_tranaction_id`) REFERENCES `transactions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `statusmalichangedorders_transaction_fk2` FOREIGN KEY (`returntowallet_tranaction_id`) REFERENCES `transactions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `statusmalichangedorders_transaction_fk3` FOREIGN KEY (`jarime_tranaction_id`) REFERENCES `transactions` (`id`) ON UPDATE CASCADE
);


//===================================================================
-- alter table statusmalichangedorders add column usedin_newchildorder_transaction_id int null default null;
-- alter table statusmalichangedorders add index statusmalichangedorders_transaction_indx(usedin_newchildorder_transaction_id);
-- alter table statusmalichangedorders add index statusmalichangedorders_transaction_indx(usedin_newchildorder_transaction_id);
-- alter table statusmalichangedorders  add constraint statusmalichangedorders_transaction_fk foreign key (usedin_newchildorder_transaction_id) references transactions(id);
-- alter table statusmalichangedorders add column usedin_newchildorder_amount decimal(15,2) null default null;

-- alter table statusmalichangedorders change returned_type returned_type ENUM('naqd','wallet','naqd_wallet', 'usedin_childorder', 'usedin_childorder_wallet', 'usedin_childorder_naqd') DEFAULT NULL;


-- //================= statusmalis modification
-- alter table statusmalis add column total_from_parent_order_amount_paid decimal(15,2) null default null;

-- //================= statusmalistransactions modification
-- alter table statusmalistransactions add column from_parent_order_amount decimal(15,2) null default null;
