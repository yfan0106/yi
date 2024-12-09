# CREATE schema - use YOUR last name #
#CREATE SCHEMA IF NOT EXISTS a4_pizza_lastname;

# CREATE tables #
CREATE TABLE IF NOT EXISTS `pizza_fan`.`customer` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(255) NULL,
  `phone` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zipcode` INT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizza_fan`.`employee` (
  `employee_id` INT NOT NULL,
  `employee_name` VARCHAR(255) NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizza_fan`.`size` (
  `size_id` INT NOT NULL,
  `size_description` VARCHAR(45) NULL,
  `size_price` DECIMAL(4,2) NULL,
  PRIMARY KEY (`size_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizza_fan`.`pizza` (
  `pizza_id` INT NOT NULL,
  `size_id` INT NULL,
  PRIMARY KEY (`pizza_id`),
  INDEX `size_id_idx` (`size_id` ASC),
  CONSTRAINT `size_id`
    FOREIGN KEY (`size_id`)
    REFERENCES `pizza_fan`.`size` (`size_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizza_fan`.`toppings` (
  `topping_id` INT NOT NULL,
  `topping_description` VARCHAR(45) NULL,
  `topping_price` DECIMAL(3,2) NULL,
  PRIMARY KEY (`topping_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizza_fan`.`pizza_toppings` (
  `pizza_id` INT NOT NULL,
  `topping_id` INT NOT NULL,
  PRIMARY KEY (`pizza_id`, `topping_id`),
  INDEX `topping_id_idx` (`topping_id` ASC),
  CONSTRAINT `pizza_id`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `pizza_fan`.`pizza` (`pizza_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `topping_id`
    FOREIGN KEY (`topping_id`)
    REFERENCES `pizza_fan`.`toppings` (`topping_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizza_fan`.`order` (
  `order_id` INT NOT NULL,
  `order_date` DATE NULL,
  `order_time` TIME NULL,
  `employee_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `employee_id_idx` (`employee_id` ASC),
  INDEX `customer_id_idx` (`customer_id` ASC),
  CONSTRAINT `employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `pizza_fan`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `pizza_fan`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizza_fan`.`pizza_order` (
  `p_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`p_id`, `order_id`),
  INDEX `order_id_idx` (`order_id` ASC),
  CONSTRAINT `p_id`
    FOREIGN KEY (`p_id`)
    REFERENCES `pizza_fan`.`pizza` (`pizza_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizza_fan`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;