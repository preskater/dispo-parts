CREATE TABLE part_definitions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    subcategory_id UUID REFERENCES system_subcategories(id),
    name VARCHAR(64) NOT NULL,
    oem_number VARCHAR(32),
    part_description TEXT,
    image_uuid UUID NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
