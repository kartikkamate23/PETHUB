CREATE DATABASE IF NOT EXISTS pethub;
USE pethub;

CREATE TABLE IF NOT EXISTS `user` (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL UNIQUE,
  email VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS admin (
  adminid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  admin_email VARCHAR(150) NOT NULL UNIQUE,
  admin_pw VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
  p_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  p_name VARCHAR(150) NOT NULL,
  p_image VARCHAR(255) NOT NULL,
  p_cost INT NOT NULL,
  p_details VARCHAR(500) NOT NULL,
  p_category VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS productdetails (
  p_id INT NOT NULL PRIMARY KEY,
  p_image VARCHAR(255) NOT NULL,
  p_image1 VARCHAR(255) NOT NULL,
  p_image2 VARCHAR(255) NOT NULL,
  p_name VARCHAR(150) NOT NULL,
  p_cost INT NOT NULL,
  p_details VARCHAR(500) NOT NULL,
  p_category VARCHAR(80) NOT NULL,
  p_info TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS cart (
  c_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  c_name VARCHAR(150) NOT NULL,
  c_image VARCHAR(255) NOT NULL,
  c_cost INT NOT NULL,
  uname VARCHAR(100) NOT NULL,
  uid INT NOT NULL,
  order_id INT NOT NULL DEFAULT 0,
  status VARCHAR(30) NOT NULL DEFAULT 'pending',
  quantity INT NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS wishlist (
  w_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  w_name VARCHAR(150) NOT NULL,
  w_image VARCHAR(255) NOT NULL,
  w_cost INT NOT NULL,
  uname VARCHAR(100) NOT NULL,
  uid INT NOT NULL,
  p_id INT NOT NULL DEFAULT 0,
  status VARCHAR(30) NOT NULL DEFAULT 'pending'
);

CREATE TABLE IF NOT EXISTS orders (
  order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  order_address VARCHAR(255) NOT NULL,
  order_city VARCHAR(100) NOT NULL,
  order_state VARCHAR(100) NOT NULL,
  c_id VARCHAR(255) NOT NULL,
  c_cost INT NOT NULL,
  usname VARCHAR(100) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ordered',
  order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  uid INT NOT NULL
);

CREATE TABLE IF NOT EXISTS contact (
  contact_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  subject VARCHAR(150) NOT NULL,
  message TEXT NOT NULL,
  phone VARCHAR(20),
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS patient (
  p_name VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  appointment_date DATE NOT NULL,
  disease VARCHAR(100) NOT NULL,
  doctor_id INT NULL,
  pet_type VARCHAR(60) NULL,
  appointment_time VARCHAR(20) NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'Booked'
);

CREATE TABLE IF NOT EXISTS pethub_doctors (
  doctor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  doctor_name VARCHAR(120) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  phone VARCHAR(20) NOT NULL,
  specialization VARCHAR(120) NOT NULL,
  experience VARCHAR(80) NOT NULL,
  availability VARCHAR(150) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'Active',
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS review (
  review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  p_id INT NOT NULL,
  uname VARCHAR(100) NOT NULL,
  review TEXT NOT NULL,
  rating INT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS animal (
  a_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  a_name VARCHAR(100) NOT NULL,
  a_age INT NOT NULL,
  a_gender VARCHAR(20) NOT NULL,
  a_cost DECIMAL(10,2) NOT NULL,
  a_lifespan VARCHAR(80) NOT NULL,
  a_image VARCHAR(255) NOT NULL
);

INSERT INTO admin (admin_email, admin_pw)
VALUES ('admin@pethub.com', 'admin123')
ON DUPLICATE KEY UPDATE admin_pw = VALUES(admin_pw);

INSERT INTO pethub_doctors (doctor_name, email, phone, specialization, experience, availability, status) VALUES
('Dr. Ananya Sharma', 'ananya.vet@pethub.local', '9000011111', 'Dog and Cat Physician', '8 years', 'Mon-Sat, 10 AM - 5 PM', 'Active'),
('Dr. Rohan Mehta', 'rohan.exotics@pethub.local', '9000022222', 'Birds and Small Pets', '6 years', 'Tue-Sun, 11 AM - 4 PM', 'Active'),
('Dr. Priya Nair', 'priya.derma@pethub.local', '9000033333', 'Skin, Dental and Grooming Care', '7 years', 'Mon-Fri, 12 PM - 7 PM', 'Active')
ON DUPLICATE KEY UPDATE status = VALUES(status), availability = VALUES(availability);

INSERT INTO products (p_id, p_name, p_image, p_cost, p_details, p_category) VALUES
(1, 'Pedigree Adult Dog Food', 'Dogfood1.webp', 799, 'Balanced nutrition for adult dogs.', 'dogfood'),
(2, 'Grain Zero Dog Food', 'GrainZo.webp', 999, 'Grain-free daily meal for active dogs.', 'dogfood'),
(3, 'Dog Chew Toy Set', 'Dogaccessories1.webp', 349, 'Durable toys for play and training.', 'dogaccessories'),
(4, 'Dog Grooming Brush', 'Doggrooming1.webp', 299, 'Gentle coat grooming brush.', 'doggrooming'),
(5, 'Dog Treat Biscuits', 'Dogtreats1.webp', 249, 'Crunchy reward treats for dogs.', 'dogtreats'),
(6, 'Whiskas Cat Food', 'catfood1.webp', 699, 'Complete food for cats.', 'catfood'),
(7, 'Cat Litter Tray', 'cataccessories1.webp', 499, 'Easy-clean litter tray.', 'cataccessories'),
(8, 'Cat Grooming Kit', 'catgrooming1.webp', 399, 'Grooming essentials for cats.', 'catgrooming'),
(9, 'Cat Treat Bites', 'cattreats1.webp', 199, 'Tasty treats for cats.', 'cattreats'),
(10, 'Bird Seed Mix', 'Bird.webp', 299, 'Nutritious seed mix for birds.', 'Birds'),
(11, 'Premium Bird Food', 'Bird11.jpg', 399, 'Daily food for small birds.', 'Birds'),
(12, 'Fish Food Flakes', 'Fish.webp', 249, 'Floating flakes for aquarium fish.', 'fish'),
(13, 'Betta Fish Feed', 'fish1.jpg', 199, 'Protein-rich feed for betta fish.', 'fish')
ON DUPLICATE KEY UPDATE
p_name = VALUES(p_name), p_image = VALUES(p_image), p_cost = VALUES(p_cost),
p_details = VALUES(p_details), p_category = VALUES(p_category);

INSERT INTO products (p_id, p_name, p_image, p_cost, p_details, p_category) VALUES
(14, 'Pedigree Puppy Starter', 'Dogfood2.webp', 849, 'Starter nutrition for puppies.', 'dogfood'),
(15, 'Drools Chicken Dog Food', 'Dogfood3.webp', 899, 'Chicken recipe dry food for dogs.', 'dogfood'),
(16, 'Active Dog Protein Meal', 'Dogfood41.webp', 1199, 'High-protein food for active dogs.', 'dogfood'),
(17, 'Senior Dog Care Food', 'Dogfood51.webp', 1099, 'Digestive support for senior dogs.', 'dogfood'),
(18, 'Dog Collar and Leash', 'Dogaccessories2.webp', 449, 'Adjustable collar with matching leash.', 'dogaccessories'),
(19, 'Dog Harness', 'Dogaccessories3.webp', 699, 'Comfort harness for daily walks.', 'dogaccessories'),
(20, 'Dog Bed', 'Dogaccessories4.jpg', 1299, 'Soft washable bed for dogs.', 'dogaccessories'),
(21, 'Dog Travel Bowl', 'Dogaccessories5.webp', 299, 'Foldable bowl for travel.', 'dogaccessories'),
(22, 'Dog Shampoo', 'Doggrooming2.webp', 349, 'Gentle shampoo for shiny coat.', 'doggrooming'),
(23, 'Dog Nail Clipper', 'Doggrooming3.webp', 249, 'Safe clipper for routine grooming.', 'doggrooming'),
(24, 'Dog Grooming Gloves', 'Doggrooming4.webp', 299, 'Massage and remove loose fur.', 'doggrooming'),
(25, 'Dog Ear Cleaner', 'Doggrooming5.webp', 199, 'Routine ear cleaning solution.', 'doggrooming'),
(26, 'Chicken Dog Treats', 'Dogtreats2.webp', 299, 'Soft chicken treats for training.', 'dogtreats'),
(27, 'Dental Chew Sticks', 'Dogtreats3.webp', 349, 'Chew sticks for dental hygiene.', 'dogtreats'),
(28, 'Cat Kitten Food', 'catfood2.webp', 599, 'Nutrient rich kitten food.', 'catfood'),
(29, 'Tuna Cat Food', 'catfood3.webp', 749, 'Tuna flavor cat meal.', 'catfood'),
(30, 'Adult Cat Dry Food', 'catfood4.webp', 799, 'Daily dry food for adult cats.', 'catfood'),
(31, 'Hairball Control Cat Food', 'catfood5.webp', 899, 'Formula for hairball support.', 'catfood'),
(32, 'Cat Scratcher', 'cataccessories2.webp', 699, 'Scratch board for healthy claws.', 'cataccessories'),
(33, 'Cat Toy Mouse', 'cataccessories3.webp', 199, 'Interactive toy for cats.', 'cataccessories'),
(34, 'Cat Carrier', 'cataccessories4.webp', 1599, 'Ventilated carrier for travel.', 'cataccessories'),
(35, 'Cat Food Bowl', 'cataccessories5.webp', 249, 'Non-slip bowl for cats.', 'cataccessories'),
(36, 'Cat Nail Trimmer', 'catgrooming2.webp', 249, 'Compact trimmer for cat nails.', 'catgrooming'),
(37, 'Cat Deshedding Comb', 'catgrooming3.webp', 349, 'Comb for shedding control.', 'catgrooming'),
(38, 'Cat Shampoo', 'catgrooming4.webp', 299, 'Mild shampoo for cats.', 'catgrooming'),
(39, 'Cat Wipes', 'catgrooming5.webp', 199, 'Quick clean wipes for cats.', 'catgrooming'),
(40, 'Salmon Cat Treats', 'cattreats2.webp', 249, 'Crunchy salmon treats.', 'cattreats'),
(41, 'Creamy Cat Treats', 'cattreats3.webp', 299, 'Creamy lickable cat treat.', 'cattreats'),
(42, 'Cockatiel Seed Mix', 'Bird12.jpg', 349, 'Seed mix for cockatiels.', 'Birds'),
(43, 'Parakeet Food', 'Bird13.jpg', 299, 'Daily parakeet food.', 'Birds'),
(44, 'Bird Mineral Block', 'Bird14.jpg', 149, 'Mineral block for beak care.', 'Birds'),
(45, 'Bird Cage Treat', 'Bird15.jpg', 199, 'Hanging treat for cage birds.', 'Birds'),
(46, 'Goldfish Food', 'fish2.jpg', 199, 'Floating food for goldfish.', 'fish'),
(47, 'Tropical Fish Pellets', 'fish3.jpg', 249, 'Pellets for tropical fish.', 'fish'),
(48, 'Aquarium Nutrition Mix', 'fish4.jpg', 299, 'Balanced nutrition for aquarium fish.', 'fish'),
(49, 'Color Boost Fish Food', 'fish5.jpg', 349, 'Food blend for brighter fish color.', 'fish'),
(50, 'Puppy Training Treats', 'Dogtreats1.webp', 199, 'Small treats for puppy training.', 'dogtreats')
ON DUPLICATE KEY UPDATE
p_name = VALUES(p_name), p_image = VALUES(p_image), p_cost = VALUES(p_cost),
p_details = VALUES(p_details), p_category = VALUES(p_category);

INSERT INTO products (p_id, p_name, p_image, p_cost, p_details, p_category) VALUES
(51, 'Chicken Puppy Kibble', 'Dogfood6.webp', 649, 'Small kibble for puppies.', 'dogfood'),
(52, 'Lamb and Rice Dog Food', 'Dogfood4_1.webp', 1099, 'Gentle lamb meal for sensitive stomachs.', 'dogfood'),
(53, 'Veg Dog Food', 'Dogfood5_1.webp', 799, 'Vegetarian balanced dog meal.', 'dogfood'),
(54, 'Large Breed Dog Food', 'Dogfood6_1.webp', 1399, 'Large breed joint support formula.', 'dogfood'),
(55, 'Small Breed Dog Food', 'Dogfood2_1.webp', 699, 'Small breed daily nutrition.', 'dogfood'),
(56, 'Weight Control Dog Food', 'Dogfood3_1.webp', 999, 'Lower calorie food for weight care.', 'dogfood'),
(57, 'Sensitive Skin Dog Food', 'Dogfood4_2.webp', 1199, 'Skin and coat support formula.', 'dogfood'),
(58, 'High Energy Dog Food', 'Dogfood5_2.webp', 1299, 'Energy-rich food for active pets.', 'dogfood'),
(59, 'Fish Oil Dog Food', 'Dogfood6_2.webp', 1099, 'Omega support for coat shine.', 'dogfood'),
(60, 'Dog Food Combo Pack', 'pedigree.webp', 1499, 'Value combo pack for monthly feeding.', 'dogfood'),
(61, 'Reflective Dog Collar', 'Dogaccessories1_2.webp', 299, 'Reflective collar for evening walks.', 'dogaccessories'),
(62, 'Rope Tug Toy', 'Dogaccessories1_3.webp', 199, 'Strong rope toy for tug games.', 'dogaccessories'),
(63, 'Dog Raincoat', 'Dogaccessories2_1.webp', 799, 'Water-resistant raincoat.', 'dogaccessories'),
(64, 'Dog Winter Jacket', 'Dogaccessories2_2.webp', 999, 'Warm jacket for winter walks.', 'dogaccessories'),
(65, 'Dog Training Clicker', 'Dogaccessorie3_1.webp', 149, 'Clicker for reward training.', 'dogaccessories'),
(66, 'Dog Poop Bag Holder', 'Dogaccessorie3_2.webp', 149, 'Portable cleanup bag holder.', 'dogaccessories'),
(67, 'Dog Carrier Bag', 'Dogaccessories4_1.jpg', 1799, 'Travel carrier for small dogs.', 'dogaccessories'),
(68, 'Dog Feeding Mat', 'Dogaccessories4_2.webp', 249, 'Non-slip mat for bowls.', 'dogaccessories'),
(69, 'Dog Ball Toy', 'Dogaccessories5_1.webp', 199, 'Bouncy ball for fetch.', 'dogaccessories'),
(70, 'Dog Puzzle Feeder', 'Dogaccessories5_2.webp', 699, 'Slow feeder puzzle toy.', 'dogaccessories'),
(71, 'Dog Conditioner', 'Doggrooming1_2.webp', 299, 'Soft coat conditioner.', 'doggrooming'),
(72, 'Dog Flea Comb', 'Doggrooming1_3.webp', 199, 'Fine comb for flea checks.', 'doggrooming'),
(73, 'Dog Paw Balm', 'Doggrooming2_1.jpeg', 249, 'Paw protection balm.', 'doggrooming'),
(74, 'Dog Toothbrush Kit', 'Doggrooming2_2.jpeg', 299, 'Dental cleaning kit.', 'doggrooming'),
(75, 'Dog Deodorizing Spray', 'Doggrooming3_1.webp', 349, 'Fresh coat deodorizing spray.', 'doggrooming'),
(76, 'Dog Eye Wipes', 'Doggrooming3_2.webp', 199, 'Gentle eye cleaning wipes.', 'doggrooming'),
(77, 'Dog Slicker Brush', 'Doggrooming4_1.webp', 349, 'Brush for tangles and loose fur.', 'doggrooming'),
(78, 'Dog Grooming Scissors', 'Doggrooming4_2.webp', 399, 'Rounded grooming scissors.', 'doggrooming'),
(79, 'Dog Bath Towel', 'Doggrooming5_1.webp', 299, 'Absorbent pet towel.', 'doggrooming'),
(80, 'Dog Grooming Combo', 'Doggrooming5_2.webp', 899, 'Brush, comb, and nail care combo.', 'doggrooming'),
(81, 'Peanut Butter Dog Treats', 'Dogtreats1_2.webp', 249, 'Peanut butter flavored treats.', 'dogtreats'),
(82, 'Calcium Dog Bones', 'Dogtreats1_3.webp', 299, 'Chewy calcium bones.', 'dogtreats'),
(83, 'Soft Training Cubes', 'Dogtreats2_1.webp', 249, 'Soft bite-sized training cubes.', 'dogtreats'),
(84, 'Jerky Dog Treats', 'Dogtreats2_2.webp', 349, 'Jerky style protein treats.', 'dogtreats'),
(85, 'Vegetarian Dog Treats', 'Dogtreats3_1.webp', 199, 'Vegetarian crunchy treats.', 'dogtreats'),
(86, 'Dental Mint Treats', 'Dogtreats3_2.webp', 299, 'Mint dental treats.', 'dogtreats'),
(87, 'Puppy Milk Biscuits', 'Dogtreats1.webp', 199, 'Milk biscuits for puppies.', 'dogtreats'),
(88, 'Reward Treat Jar', 'Dogtreats2.webp', 499, 'Large jar of reward treats.', 'dogtreats'),
(89, 'Long Lasting Chew', 'Dogtreats3.webp', 399, 'Chew treat for longer engagement.', 'dogtreats'),
(90, 'Training Treat Combo', 'Dogtreats2_1.webp', 599, 'Combo pack for obedience training.', 'dogtreats'),
(91, 'Premium Cat Food Combo', 'catfood5_1.webp', 1099, 'Monthly cat food combo.', 'catfood'),
(92, 'Cat Tuna Wet Food', 'catfood2_1.webp', 99, 'Wet food pouch for cats.', 'catfood'),
(93, 'Cat Salmon Dry Food', 'catfood3_1.webp', 849, 'Salmon dry food for adult cats.', 'catfood'),
(94, 'Bird Fruit Treat Mix', 'bird6.jpg', 249, 'Fruit treat mix for birds.', 'Birds'),
(95, 'Bird Millet Spray', 'bird6_1.jpg', 149, 'Millet spray for birds.', 'Birds'),
(96, 'Fish Weekend Feeder', 'fish2_1.jpg', 199, 'Slow release weekend fish feeder.', 'fish'),
(97, 'Fish Growth Pellets', 'fish3_1.jpg', 279, 'Growth pellets for aquarium fish.', 'fish')
ON DUPLICATE KEY UPDATE
p_name = VALUES(p_name), p_image = VALUES(p_image), p_cost = VALUES(p_cost),
p_details = VALUES(p_details), p_category = VALUES(p_category);

INSERT INTO products (p_id, p_name, p_image, p_cost, p_details, p_category) VALUES
(98, 'Dog ID Tag', 'Dogaccessories1.webp', 149, 'Customizable ID tag for safety.', 'dogaccessories'),
(99, 'Dog Seat Belt', 'Dogaccessories2.webp', 399, 'Car safety belt for dogs.', 'dogaccessories'),
(100, 'Dog Cooling Bandana', 'Dogaccessories3.webp', 299, 'Cooling bandana for summer walks.', 'dogaccessories'),
(101, 'Dog Grooming Apron', 'Doggrooming1.webp', 249, 'Apron for mess-free grooming.', 'doggrooming'),
(102, 'Dog Tick Removal Tool', 'Doggrooming2.webp', 199, 'Simple tick remover for pet care.', 'doggrooming'),
(103, 'Dog Coat Shine Serum', 'Doggrooming3.webp', 349, 'Serum for a glossy coat.', 'doggrooming'),
(104, 'Apple Dog Treats', 'Dogtreats1_2.webp', 249, 'Apple flavored crunchy dog treats.', 'dogtreats'),
(105, 'Protein Dog Bites', 'Dogtreats2_2.webp', 349, 'Protein bites for active dogs.', 'dogtreats'),
(106, 'Joint Care Dog Chews', 'Dogtreats3_1.webp', 449, 'Chews with joint support nutrients.', 'dogtreats')
ON DUPLICATE KEY UPDATE
p_name = VALUES(p_name), p_image = VALUES(p_image), p_cost = VALUES(p_cost),
p_details = VALUES(p_details), p_category = VALUES(p_category);

INSERT INTO productdetails (p_id, p_image, p_image1, p_image2, p_name, p_cost, p_details, p_category, p_info)
SELECT p_id, p_image, p_image, p_image, p_name, p_cost, p_details, p_category,
       CONCAT(p_name, ' is selected by Hub4Pets for everyday pet care. Store in a cool dry place and follow package instructions.')
FROM products
ON DUPLICATE KEY UPDATE
p_image = VALUES(p_image), p_image1 = VALUES(p_image1), p_image2 = VALUES(p_image2),
p_name = VALUES(p_name), p_cost = VALUES(p_cost), p_details = VALUES(p_details),
p_category = VALUES(p_category), p_info = VALUES(p_info);

INSERT INTO productdetails (p_id, p_image, p_image1, p_image2, p_name, p_cost, p_details, p_category, p_info)
SELECT p_id, p_image, p_image, p_image, p_name, p_cost, p_details, p_category,
       CONCAT(p_name, ' is selected by Hub4Pets for everyday pet care. Store in a cool dry place and follow package instructions.')
FROM products
ON DUPLICATE KEY UPDATE
p_image = VALUES(p_image), p_image1 = VALUES(p_image1), p_image2 = VALUES(p_image2),
p_name = VALUES(p_name), p_cost = VALUES(p_cost), p_details = VALUES(p_details),
p_category = VALUES(p_category), p_info = VALUES(p_info);

INSERT INTO animal (a_id, a_name, a_age, a_gender, a_cost, a_lifespan, a_image) VALUES
(1, 'Golden Retriever', 1, 'Male', 25000, '10-12 years', 'Golden-Retrievers.avif'),
(2, 'Labrador', 1, 'Female', 22000, '10-12 years', 'Labrador.avif'),
(3, 'Maine Coon', 1, 'Female', 18000, '12-15 years', 'mainecoon.png'),
(4, 'Macaw', 2, 'Male', 35000, '30-50 years', 'Macaw.jpg'),
(5, 'Betta Fish', 1, 'Male', 500, '2-5 years', 'halfmoon-betta-fish.png')
ON DUPLICATE KEY UPDATE
a_name = VALUES(a_name), a_age = VALUES(a_age), a_gender = VALUES(a_gender),
a_cost = VALUES(a_cost), a_lifespan = VALUES(a_lifespan), a_image = VALUES(a_image);
