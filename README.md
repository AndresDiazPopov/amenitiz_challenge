# README

# Amenitiz Challenge

### Description

This project implements a simple cash register that allows users to add products to a cart and calculate the total price, taking into account various offers and special conditions.

### **Main Features**

- User interface to add products and calculate the total price.
- Support for offers like "buy one get one free" and quantity discounts.

### Prerequisites

- Git
- RVM (configured as [single-user](https://rvm.io/rvm/install#installation-explained), not system, very important!)
    - **NOTE: To check if it is configured correctly, run "rvm info". The rvm > path section should display the .rvm folder inside the user's home, and not /usr/local/rvm**
- MySQL
    - **NOTE: Make sure you have MySQL installed on your system. If you haven't installed it, follow the specific instructions for your operating system.**

### **Installation**

- `git clone https://github.com/AndresDiazPopov/amenitiz_challenge.git`
    - NOTE: In the example, the following assumptions are made:
        - Ruby version: 3.0.1
- `cd amenitiz_challenge/`
    - When entering with **cd**, thanks to the **.ruby-version** and **.ruby-gemset** files, RVM checks if it already has the version and gemset created.
        - If RVM already has the Ruby version, it will display a message like this:
            - ruby-3.0.1 is not installed.
        - If RVM does not have the Ruby version, it will display a message like this:
            - ruby-3.0.1 is not installed.
            - To install, use: 'rvm install ruby-3.0.1'
        - In this case, you will need to execute the indicated command and wait for it to finish:
            - `rvm install ruby-3.0.1`
- Install bundler
    - If the Gemset is newly created, it will not have the **bundler** gem, so it will need to be installed: `gem install bundler`
- Install the gems: `bundle install`

### Create the database and user

- Connect to the MySQL console with the MySQL *root* user and the password entered during installation

  `mysql -u root -p`

- Create the database

  `CREATE DATABASE cash_register_development;`

- Create a user with access to the database
    - For versions prior to 5.7.6, do:

      `GRANT ALL PRIVILEGES ON cash_register_development.* TO 'cash_register_user'@'localhost' IDENTIFIED BY "cash_register_pwd";`

        - `*NOTE: The use of IDENTIFIED BY password with GRANT statement has been deprecated since MySQL version 5.7.6.**`
    - For versions equal to or later than 5.7.6, do:

      `CREATE USER 'cash_register_user'@'localhost' IDENTIFIED BY 'cash_register_pwd';`

      `GRANT ALL PRIVILEGES ON cash_register_development.* TO 'cash_register_user'@'localhost';`

- Update privileges and exit
    - `flush privileges;`
    - `exit;`
- Migrate the database
    - `rails db:migrate`
- Populate the database
    - `rails db:seed`
        - This command will create the initial data in the tables
            - products, offers, and offers_products
- Run the tests
    - To verify that everything went well, run the tests with:
    - `bundle exec rspec`
- Start the server
    - `bin/dev`
        - Since tailwindcss is installed, we start the project with `bin/dev`. This command runs `rails s` + `a compiler that transforms tailwind classes into regular CSS.` If we want to see how the changes are updated, we need to run the server with this command.