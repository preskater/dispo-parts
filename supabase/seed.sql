-- Seed baseline lookup data
INSERT INTO part_conditions (name, description)
VALUES (
        'New',
        'Brand new, never used'
    ),
    (
        'Like New',
        'Used briefly, minimal wear'
    ),
    (
        'Good',
        'Used, fully functional with light wear'
    ),
    (
        'Fair',
        'Visible wear, still functional'
    ),
    (
        'Salvage',
        'For parts or repair'
    );
INSERT INTO system_categories (name, description)
VALUES (
        'Engine',
        'Powertrain and combustion components'
    ),
    (
        'Transmission',
        'Gearbox and drivetrain components'
    ),
    (
        'Brakes',
        'Braking system components'
    ),
    (
        'Electrical',
        'Electrical and electronic systems'
    ),
    (
        'Suspension',
        'Ride and handling components'
    );
-- Seed car brands
INSERT INTO car_brands (name)
VALUES ('Toyota'),
    ('Honda'),
    ('Ford'),
    ('BMW'),
    ('Mercedes-Benz'),
    ('Volkswagen'),
    ('Audi'),
    ('Nissan'),
    ('Chevrolet'),
    ('Mazda');
-- Seed car models
INSERT INTO car_models (
        brand_id,
        name,
        production_start_year,
        production_end_year
    )
SELECT id,
    'Camry',
    DATE '2015-01-01',
    DATE '2020-12-31'
FROM car_brands
WHERE name = 'Toyota'
UNION ALL
SELECT id,
    'Camry',
    DATE '2021-01-01',
    NULL
FROM car_brands
WHERE name = 'Toyota'
UNION ALL
SELECT id,
    'Corolla',
    DATE '2014-01-01',
    DATE '2019-12-31'
FROM car_brands
WHERE name = 'Toyota'
UNION ALL
SELECT id,
    'Corolla',
    DATE '2020-01-01',
    NULL
FROM car_brands
WHERE name = 'Toyota'
UNION ALL
SELECT id,
    'RAV4',
    DATE '2013-01-01',
    DATE '2018-12-31'
FROM car_brands
WHERE name = 'Toyota'
UNION ALL
SELECT id,
    'RAV4',
    DATE '2019-01-01',
    NULL
FROM car_brands
WHERE name = 'Toyota'
UNION ALL
SELECT id,
    'Civic',
    DATE '2016-01-01',
    DATE '2021-12-31'
FROM car_brands
WHERE name = 'Honda'
UNION ALL
SELECT id,
    'Civic',
    DATE '2022-01-01',
    NULL
FROM car_brands
WHERE name = 'Honda'
UNION ALL
SELECT id,
    'Accord',
    DATE '2018-01-01',
    NULL
FROM car_brands
WHERE name = 'Honda'
UNION ALL
SELECT id,
    'CR-V',
    DATE '2017-01-01',
    NULL
FROM car_brands
WHERE name = 'Honda'
UNION ALL
SELECT id,
    'F-150',
    DATE '2015-01-01',
    DATE '2020-12-31'
FROM car_brands
WHERE name = 'Ford'
UNION ALL
SELECT id,
    'F-150',
    DATE '2021-01-01',
    NULL
FROM car_brands
WHERE name = 'Ford'
UNION ALL
SELECT id,
    'Mustang',
    DATE '2015-01-01',
    NULL
FROM car_brands
WHERE name = 'Ford'
UNION ALL
SELECT id,
    'Explorer',
    DATE '2016-01-01',
    NULL
FROM car_brands
WHERE name = 'Ford'
UNION ALL
SELECT id,
    '3 Series',
    DATE '2012-01-01',
    DATE '2018-12-31'
FROM car_brands
WHERE name = 'BMW'
UNION ALL
SELECT id,
    '3 Series',
    DATE '2019-01-01',
    NULL
FROM car_brands
WHERE name = 'BMW'
UNION ALL
SELECT id,
    'X5',
    DATE '2014-01-01',
    NULL
FROM car_brands
WHERE name = 'BMW'
UNION ALL
SELECT id,
    'C-Class',
    DATE '2015-01-01',
    NULL
FROM car_brands
WHERE name = 'Mercedes-Benz'
UNION ALL
SELECT id,
    'E-Class',
    DATE '2017-01-01',
    NULL
FROM car_brands
WHERE name = 'Mercedes-Benz'
UNION ALL
SELECT id,
    'GLE',
    DATE '2016-01-01',
    NULL
FROM car_brands
WHERE name = 'Mercedes-Benz';
-- Seed system subcategories
INSERT INTO system_subcategories (category_id, name, description)
SELECT id,
    'Cylinder Head',
    'Top portion of the engine block'
FROM system_categories
WHERE name = 'Engine'
UNION ALL
SELECT id,
    'Pistons',
    'Components that move up and down in cylinders'
FROM system_categories
WHERE name = 'Engine'
UNION ALL
SELECT id,
    'Oil Pump',
    'Circulates engine oil'
FROM system_categories
WHERE name = 'Engine'
UNION ALL
SELECT id,
    'Manual Gearbox',
    'Manual transmission assembly'
FROM system_categories
WHERE name = 'Transmission'
UNION ALL
SELECT id,
    'Automatic Gearbox',
    'Automatic transmission assembly'
FROM system_categories
WHERE name = 'Transmission'
UNION ALL
SELECT id,
    'Brake Discs',
    'Rotor discs for disc brakes'
FROM system_categories
WHERE name = 'Brakes'
UNION ALL
SELECT id,
    'Brake Pads',
    'Friction pads for disc brakes'
FROM system_categories
WHERE name = 'Brakes'
UNION ALL
SELECT id,
    'Alternator',
    'Generates electrical power'
FROM system_categories
WHERE name = 'Electrical'
UNION ALL
SELECT id,
    'Starter Motor',
    'Starts the engine'
FROM system_categories
WHERE name = 'Electrical'
UNION ALL
SELECT id,
    'Shock Absorbers',
    'Dampen suspension movement'
FROM system_categories
WHERE name = 'Suspension'
UNION ALL
SELECT id,
    'Control Arms',
    'Connect wheel hub to chassis'
FROM system_categories
WHERE name = 'Suspension';
-- Seed part definitions
INSERT INTO part_definitions (
        subcategory_id,
        name,
        oem_number,
        part_description,
        image_uuid
    )
SELECT id,
    'Aluminum Cylinder Head',
    '11101-75020',
    'Complete aluminum cylinder head assembly',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Cylinder Head'
UNION ALL
SELECT id,
    'Forged Piston Set',
    '13101-31020',
    'Set of 4 forged pistons with rings',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Pistons'
UNION ALL
SELECT id,
    'High-Pressure Oil Pump',
    '15100-31011',
    'High-pressure oil circulation pump',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Oil Pump'
UNION ALL
SELECT id,
    '6-Speed Manual Transmission',
    '33010-12050',
    'Complete 6-speed manual gearbox',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Manual Gearbox'
UNION ALL
SELECT id,
    '8-Speed Automatic Transmission',
    '35010-12080',
    'Complete 8-speed automatic gearbox',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Automatic Gearbox'
UNION ALL
SELECT id,
    'Front Brake Disc Set',
    '43512-06080',
    'Pair of front ventilated brake discs',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Brake Discs'
UNION ALL
SELECT id,
    'Ceramic Brake Pad Set',
    '04465-06080',
    'Front ceramic brake pad set',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Brake Pads'
UNION ALL
SELECT id,
    'High Output Alternator',
    '27060-31050',
    '150A alternator assembly',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Alternator'
UNION ALL
SELECT id,
    'Heavy Duty Starter Motor',
    '28100-31050',
    'High-torque starter motor',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Starter Motor'
UNION ALL
SELECT id,
    'Gas Shock Absorber Set',
    '48510-42110',
    'Set of 4 gas-charged shock absorbers',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Shock Absorbers'
UNION ALL
SELECT id,
    'Front Lower Control Arm',
    '48069-02120',
    'Left front lower control arm with bushings',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Control Arms'
UNION ALL
SELECT id,
    'Rear Brake Disc Set',
    '42431-06090',
    'Pair of rear solid brake discs',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Brake Discs'
UNION ALL
SELECT id,
    'Performance Brake Pad Set',
    '04466-06090',
    'Rear performance brake pad set',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Brake Pads'
UNION ALL
SELECT id,
    'Cast Iron Cylinder Head',
    '11101-28011',
    'Heavy-duty cast iron cylinder head',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Cylinder Head'
UNION ALL
SELECT id,
    'Standard Oil Pump',
    '15100-28020',
    'OEM standard oil pump',
    gen_random_uuid()
FROM system_subcategories
WHERE name = 'Oil Pump';
-- Note: part_listings requires seller_id from auth.users table which won't exist in seed data
-- For demonstration, we'll skip seeding part_listings, listing_compatibility, and listing_images
-- These tables should be populated through the application by actual users