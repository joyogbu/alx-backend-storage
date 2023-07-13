/* SQL script that lists all bands with Glam rock as their main style, ranked by their longevity */

-- select all bands based on lifespan
SELECT band_name, COALESCE(CAST(split AS unsigned), 2022) - CAST(formed AS unsigned) AS 'lifespan' FROM metal_bands WHERE style LIKE '%Glam rock%';
