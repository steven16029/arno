CREATE TABLE IF NOT EXISTS regional_metrics (
    id SERIAL PRIMARY KEY,
    region_code VARCHAR(10) UNIQUE NOT NULL,
    region_name VARCHAR(100) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    revenue NUMERIC(18, 2) NOT NULL,
    orders_count INTEGER NOT NULL,
    tax_label VARCHAR(50) NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO regional_metrics (region_code, region_name, currency, revenue, orders_count, tax_label)
VALUES
    -- Registros Originales
    ('LATAM', 'Latinoamérica (Bogotá)', 'COP', 5850000000.00, 412, '19% IVA'),
    ('NA', 'Norteamérica (New York)', 'USD', 1450000.00, 342, '8.875% Sales Tax'),
    ('EU', 'Europa (Frankfurt)', 'EUR', 1320000.00, 289, '19% MwSt'),

    -- Latinoamérica y el Caribe
    ('LATAM-MX', 'México (Ciudad de México)', 'MXN', 24500000.00, 520, '16% IVA'),
    ('LATAM-BR', 'Brasil (São Paulo)', 'BRL', 7800000.00, 610, '17% ICMS'),
    ('LATAM-AR', 'Argentina (Buenos Aires)', 'ARS', 1420000000.00, 315, '21% IVA'),
    ('LATAM-CL', 'Chile (Santiago)', 'CLP', 1350000000.00, 290, '19% IVA'),
    ('LATAM-PE', 'Perú (Lima)', 'PEN', 5400000.00, 245, '18% IGV'),
    ('LATAM-EC', 'Ecuador (Quito)', 'USD', 890000.00, 175, '15% IVA'),
    ('LATAM-UY', 'Uruguay (Montevideo)', 'UYU', 32000000.00, 140, '22% IVA'),
    ('LATAM-CR', 'Costa Rica (San José)', 'CRC', 460000000.00, 165, '13% IVA'),
    ('LATAM-PA', 'Panamá (Ciudad de Panamá)', 'PAB', 950000.00, 190, '7% ITBMS'),
    ('LATAM-DO', 'República Dominicana (Santo Domingo)', 'DOP', 52000000.00, 155, '18% ITBIS'),

    -- Norteamérica (Estados Unidos y Canadá)
    ('NA-CA', 'Norteamérica Oeste (Los Ángeles)', 'USD', 1680000.00, 390, '9.5% Sales Tax'),
    ('NA-TX', 'Norteamérica Sur (Austin)', 'USD', 1120000.00, 275, '8.25% Sales Tax'),
    ('NA-FL', 'Norteamérica Sureste (Miami)', 'USD', 1290000.00, 310, '7% Sales Tax'),
    ('NA-IL', 'Norteamérica Medio Oeste (Chicago)', 'USD', 980000.00, 230, '10.25% Sales Tax'),
    ('NA-CAN-E', 'Canadá Este (Toronto)', 'CAD', 1850000.00, 360, '13% HST'),
    ('NA-CAN-W', 'Canadá Oeste (Vancouver)', 'CAD', 1150000.00, 215, '12% GST+PST'),

    -- Europa Occidental, Nórdica y del Este
    ('EU-UK', 'Reino Unido (Londres)', 'GBP', 1180000.00, 330, '20% VAT'),
    ('EU-FR', 'Francia (París)', 'EUR', 1250000.00, 275, '20% TVA'),
    ('EU-ES', 'España (Madrid)', 'EUR', 940000.00, 260, '21% IVA'),
    ('EU-IT', 'Italia (Milán)', 'EUR', 890000.00, 240, '22% IVA'),
    ('EU-NL', 'Países Bajos (Ámsterdam)', 'EUR', 1050000.00, 225, '21% BTW'),
    ('EU-CH', 'Suiza (Zúrich)', 'CHF', 1420000.00, 195, '8.1% MwSt'),
    ('EU-SE', 'Países Nórdicos (Estocolmo)', 'SEK', 11500000.00, 210, '25% Moms'),
    ('EU-NO', 'Noruega (Oslo)', 'NOK', 10800000.00, 180, '25% MVA'),
    ('EU-PL', 'Europa Central (Varsovia)', 'PLN', 4200000.00, 250, '23% PTU'),
    ('EU-IE', 'Irlanda (Dublín)', 'EUR', 820000.00, 170, '23% VAT'),
    ('EU-PT', 'Portugal (Lisboa)', 'EUR', 610000.00, 160, '23% IVA'),

    -- Asia-Pacífico (APAC)
    ('APAC-JP', 'Japón (Tokio)', 'JPY', 215000000.00, 480, '10% Consumption Tax'),
    ('APAC-KR', 'Corea del Sur (Seúl)', 'KRW', 1850000000.00, 410, '10% VAT'),
    ('APAC-SG', 'Sudeste Asiático (Singapur)', 'SGD', 1750000.00, 320, '9% GST'),
    ('APAC-IN', 'India (Bangalore)', 'INR', 115000000.00, 690, '18% GST'),
    ('APAC-CN', 'China Oriental (Shanghái)', 'CNY', 9800000.00, 580, '13% VAT'),
    ('APAC-HK', 'Hong Kong (Central)', 'HKD', 10200000.00, 270, '0% Tax-Free'),
    ('APAC-AU', 'Oceanía (Sídney)', 'AUD', 1950000.00, 305, '10% GST'),
    ('APAC-NZ', 'Nueva Zelanda (Auckland)', 'NZD', 1100000.00, 185, '15% GST'),
    ('APAC-ID', 'Indonesia (Yakarta)', 'IDR', 18500000000.00, 430, '11% PPN'),

    -- Medio Oriente y África (MEA)
    ('MEA-AE', 'Medio Oriente (Dubái)', 'AED', 5200000.00, 295, '5% VAT'),
    ('MEA-SA', 'Arabia Saudita (Riad)', 'SAR', 4900000.00, 265, '15% VAT'),
    ('MEA-IL', 'Israel (Tel Aviv)', 'ILS', 4100000.00, 200, '17% Maam'),
    ('MEA-ZA', 'África Austral (Johannesburgo)', 'ZAR', 19800000.00, 240, '15% VAT'),
    ('MEA-EG', 'Norte de África (El Cairo)', 'EGP', 45000000.00, 215, '14% VAT')

ON CONFLICT (region_code) DO UPDATE SET
    region_name = EXCLUDED.region_name,
    currency = EXCLUDED.currency,
    revenue = EXCLUDED.revenue,
    orders_count = EXCLUDED.orders_count,
    tax_label = EXCLUDED.tax_label,
    updated_at = CURRENT_TIMESTAMP;
