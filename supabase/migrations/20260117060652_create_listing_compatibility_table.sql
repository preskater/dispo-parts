CREATE TABLE listing_compatibility (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    listing_id UUID REFERENCES part_listings(id),
    model_id UUID REFERENCES car_models(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(listing_id, model_id)
);
