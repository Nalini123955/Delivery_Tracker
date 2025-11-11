PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS drivers (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	phone TEXT
);

CREATE TABLE IF NOT EXISTS deliveries (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	order_number TEXT NOT NULL UNIQUE,
	customer_name TEXT NOT NULL,
	address TEXT NOT NULL,
	status TEXT NOT NULL DEFAULT 'Pending',
	estimated_delivery TEXT,
	updated_at TEXT NOT NULL,
	driver_id INTEGER,
	FOREIGN KEY(driver_id) REFERENCES drivers(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS notifications (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	message TEXT NOT NULL,
	created_at TEXT NOT NULL,
	is_read INTEGER NOT NULL DEFAULT 0
);

-- Seed sample drivers
INSERT OR IGNORE INTO drivers(id, name, phone) VALUES
	(1, 'vignesh', '9876543225'),
	(2, 'Arun', '9087234578'),
	(3, 'Madhavan', '7654238976');

-- Seed sample deliveries
INSERT OR IGNORE INTO deliveries(id, order_number, customer_name, address, status, estimated_delivery, updated_at, driver_id) VALUES
	(1, '1', 'Nithish', 'Chennai', 'Pending', NULL, datetime('now'), 1),
	(2, '2', 'Nalini', 'Coimbatore', 'Out for Delivery', NULL, datetime('now'), 2),
	(3, '3', 'Kannan', 'Villupuram', 'Delivered', NULL, datetime('now'), 3);
