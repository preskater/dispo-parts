# Database Schema for Dispo-Parts Application

> A comprehensive database schema for managing automotive parts marketplace, connecting buyers and sellers of car parts with detailed compatibility tracking.

## Table of Contents

- [User Management](#user-management)
- [Vehicle Information](#vehicle-information)
- [Part Classification](#part-classification)
- [Marketplace Listings](#marketplace-listings)

---

## User Management

### `auth.users`

Utilizes Supabase's built-in authentication system for user management. The `auth.users` table is automatically managed by Supabase and includes secure authentication, email verification, and user profile information.

> **Note:** This table is part of the `auth` schema and is managed by Supabase. No manual creation needed.

---

## Vehicle Information

### `car_brands`

Catalog of automotive manufacturers (e.g., Toyota, Hyundai, Ford).

```sql
CREATE TABLE car_brands (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(64) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### `car_models`

Specific vehicle models with production year ranges (e.g., 2015-2023 Toyota Camry).

```sql
CREATE TABLE car_models (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    brand_id UUID REFERENCES car_brands(id),
    name VARCHAR(64) NOT NULL,
    production_start_year DATE NOT NULL,
    production_end_year DATE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(brand_id, name, production_start_year, production_end_year)
);
```

---

## Part Classification

### `system_categories`

Top-level categorization of automotive systems (e.g., Engine, Transmission, Brakes, Electrical).

```sql
CREATE TABLE system_categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(64) NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### `system_subcategories`

Detailed subcategories within each system (e.g., Brake Pads, Rotors, Calipers under Brakes).

```sql
CREATE TABLE system_subcategories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_id UUID REFERENCES system_categories(id),
    name VARCHAR(64) NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### `part_definitions`

Generic catalog of parts with OEM numbers and reference information.

```sql
CREATE TABLE part_definitions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    subcategory_id UUID REFERENCES system_subcategories(id),
    name VARCHAR(64) NOT NULL,
    oem_number VARCHAR(32),
    part_description TEXT,
    image_uuid UUID NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### `part_conditions`

Standardized condition ratings for used parts (New, Like New, Good, Fair, Salvage).

```sql
CREATE TABLE part_conditions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(32) NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

---

## Marketplace Listings

### `part_listings`

Active and historical listings of parts offered for sale by users.

```sql
CREATE TABLE part_listings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    part_id UUID REFERENCES part_definitions(id),
    seller_id UUID REFERENCES auth.users(id),
    condition_id UUID REFERENCES part_conditions(id),
    listed_price DECIMAL(10, 2) NOT NULL,
    listing_description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    last_updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

### `listing_compatibility`

Defines which vehicles (make, model, year) each listed part is compatible with.

```sql
CREATE TABLE listing_compatibility (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    listing_id UUID REFERENCES part_listings(id),
    model_id UUID REFERENCES car_models(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(listing_id, model_id)
);
```

### `listing_images`

Photo gallery for each listing, with primary image designation.

```sql
CREATE TABLE listing_images (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    listing_id UUID REFERENCES part_listings(id),
    image_uuid UUID NOT NULL,
    is_primary_image BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

---

## Database Relationships

- **Users → Listings**: One user can create multiple listings (one-to-many)
- **Parts → Listings**: Each listing references a specific part definition (many-to-one)
- **Brands → Models**: Each brand has multiple models (one-to-many)
- **Listings → Compatibility**: Each listing can be compatible with multiple vehicle models/years (one-to-many)
- **Categories → Subcategories → Parts**: Hierarchical classification system (one-to-many at each level)
- **Listings → Images**: Each listing can have multiple images (one-to-many)
