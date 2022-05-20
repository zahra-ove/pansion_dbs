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
