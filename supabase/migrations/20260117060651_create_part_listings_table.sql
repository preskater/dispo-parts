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
