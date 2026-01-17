CREATE TABLE IF NOT EXISTS car_models (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    brand_id UUID REFERENCES car_brands(id),
    name VARCHAR(64) NOT NULL,
    production_start_year DATE NOT NULL,
    production_end_year DATE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(brand_id, name, production_start_year, production_end_year)
);
