CREATE OR REPLACE TABLE `retail-analytics-portfolio.retail_data.olist_master_translated` AS
SELECT
  order_id,
  customer_id,
  region,
  CASE
    WHEN order_status = 'entregue' THEN 'delivered'
    WHEN order_status = 'cancelado' THEN 'cancelled'
    WHEN order_status = 'nao_entregue' THEN 'not delivered'
    WHEN order_status = 'processando' THEN 'processing'
    ELSE order_status
  END AS order_status_translated,
  order_purchase_timestamp,
  order_approved_at,
  order_delivered_carrier_date,
  order_delivered_customer_date,
  order_estimated_delivery_date,
  product_id,
  freight_value,
  product_category,
  price,
  review,
  payment_method
FROM `retail-analytics-portfolio.retail_data.olist_master_clean`;

SELECT 
  order_id,
  customer_id,
  region AS region_code,
  CASE region
    WHEN 'SP' THEN 'São Paulo'
    WHEN 'RJ' THEN 'Rio de Janeiro'
    WHEN 'MG' THEN 'Minas Gerais'
    WHEN 'BA' THEN 'Bahia'
    WHEN 'RS' THEN 'Rio Grande do Sul'
    WHEN 'PR' THEN 'Paraná'
    WHEN 'SC' THEN 'Santa Catarina'
    WHEN 'DF' THEN 'Distrito Federal'
    WHEN 'GO' THEN 'Goiás'
    WHEN 'PE' THEN 'Pernambuco'
    WHEN 'CE' THEN 'Ceará'
    WHEN 'ES' THEN 'Espírito Santo'
    WHEN 'PA' THEN 'Pará'
    WHEN 'MA' THEN 'Maranhão'
    WHEN 'MT' THEN 'Mato Grosso'
    WHEN 'MS' THEN 'Mato Grosso do Sul'
    WHEN 'AM' THEN 'Amazonas'
    ELSE 'Other'
  END AS region_full
FROM `retail-analytics-portfolio.retail_data.olist_master_translated`
LIMIT 20;

SELECT DISTINCT product_category
FROM `retail-analytics-portfolio.retail_data.olist_master_translated`
ORDER BY product_category;

SELECT 
  *,
  CASE product_category
    WHEN 'agro_industria_e_comercio' THEN 'Agribusiness and Commerce'
    WHEN 'alimentos' THEN 'Food'
    WHEN 'alimentos_bebidas' THEN 'Food and Beverages'
    WHEN 'artes' THEN 'Arts'
    WHEN 'artes_e_artesanato' THEN 'Arts and Crafts'
    WHEN 'artigos_de_festas' THEN 'Party Supplies'
    WHEN 'artigos_de_natal' THEN 'Christmas Supplies'
    WHEN 'audio' THEN 'Audio'
    WHEN 'automotivo' THEN 'Automotive'
    WHEN 'bebes' THEN 'Babies'
    WHEN 'bebidas' THEN 'Drinks'
    WHEN 'beleza_saude' THEN 'Beauty and Health'
    WHEN 'brinquedos' THEN 'Toys'
    WHEN 'cama_mesa_banho' THEN 'Bed, Bath & Table'
    WHEN 'casa_conforto' THEN 'Home Comfort'
    WHEN 'casa_conforto_2' THEN 'Home Comfort 2'
    WHEN 'casa_construcao' THEN 'Home Construction'
    WHEN 'cds_dvds_musicais' THEN 'Music CDs and DVDs'
    WHEN 'cine_foto' THEN 'Cinema and Photography'
    WHEN 'climatizacao' THEN 'Air Conditioning'
    WHEN 'consoles_games' THEN 'Consoles and Games'
    WHEN 'construcao_ferramentas_construcao' THEN 'Construction Tools'
    WHEN 'construcao_ferramentas_iluminacao' THEN 'Lighting Tools'
    WHEN 'construcao_ferramentas_jardim' THEN 'Garden Tools'
    WHEN 'construcao_ferramentas_seguranca' THEN 'Security Tools'
    WHEN 'cool_stuff' THEN 'Cool Stuff'
    WHEN 'dvds_blu_ray' THEN 'DVDs and Blu-ray'
    WHEN 'eletrodomesticos' THEN 'Home Appliances'
    WHEN 'eletrodomesticos_2' THEN 'Home Appliances 2'
    WHEN 'eletronicos' THEN 'Electronics'
    WHEN 'esporte_lazer' THEN 'Sports and Leisure'
    WHEN 'fashion_bolsas_e_acessorios' THEN 'Fashion - Bags and Accessories'
    WHEN 'fashion_calcados' THEN 'Fashion - Shoes'
    WHEN 'fashion_esporte' THEN 'Fashion - Sportswear'
    WHEN 'fashion_roupa_feminina' THEN 'Fashion - Women’s Clothing'
    WHEN 'fashion_roupa_masculina' THEN 'Fashion - Men’s Clothing'
    WHEN 'fashion_roupa_infanto_juvenil' THEN 'Fashion - Kids’ Clothing'
    WHEN 'fashion_underwear_e_moda_praia' THEN 'Fashion - Underwear and Beachwear'
    WHEN 'ferramentas_jardim' THEN 'Garden Tools'
    WHEN 'flores' THEN 'Flowers'
    WHEN 'fraldas_higiene' THEN 'Diapers and Hygiene'
    WHEN 'industria_comercio_e_negocios' THEN 'Industry, Commerce and Business'
    WHEN 'informatica_acessorios' THEN 'IT Accessories'
    WHEN 'instrumentos_musicais' THEN 'Musical Instruments'
    WHEN 'la_cuisine' THEN 'Kitchen'
    WHEN 'livros_importados' THEN 'Imported Books'
    WHEN 'livros_interesse_geral' THEN 'General Interest Books'
    WHEN 'livros_tecnicos' THEN 'Technical Books'
    WHEN 'malas_acessorios' THEN 'Luggage and Accessories'
    WHEN 'market_place' THEN 'Marketplace'
    WHEN 'moveis_colchao_e_estofado' THEN 'Furniture - Mattress and Upholstery'
    WHEN 'moveis_cozinha_area_de_servico_jantar_e_jardim' THEN 'Kitchen, Dining & Garden Furniture'
    WHEN 'moveis_decoracao' THEN 'Furniture and Decor'
    WHEN 'moveis_escritorio' THEN 'Office Furniture'
    WHEN 'moveis_quarto' THEN 'Bedroom Furniture'
    WHEN 'moveis_sala' THEN 'Living Room Furniture'
    WHEN 'musica' THEN 'Music'
    WHEN 'papelaria' THEN 'Stationery'
    WHEN 'pc_gamer' THEN 'Gaming PC'
    WHEN 'pcs' THEN 'Computers'
    WHEN 'perfumaria' THEN 'Perfumery'
    WHEN 'pet_shop' THEN 'Pet Shop'
    WHEN 'portateis_casa_forno_e_cafe' THEN 'Portable Appliances - Oven and Coffee'
    WHEN 'portateis_cozinha_e_preparadores_de_alimentos' THEN 'Portable Kitchen Appliances'
    WHEN 'relogios_presentes' THEN 'Watches and Gifts'
    WHEN 'seguros_e_servicos' THEN 'Insurance and Services'
    WHEN 'sinalizacao_e_seguranca' THEN 'Signaling and Security'
    WHEN 'tablets_impressao_imagem' THEN 'Tablets, Printing and Imaging'
    WHEN 'telefonia' THEN 'Telephony'
    WHEN 'telefonia_fixa' THEN 'Landline Phones'
    ELSE 'Other'
  END AS product_category_english
FROM `retail-analytics-portfolio.retail_data.olist_master_translated`;

WITH translated_data AS (
  SELECT
    product_category,
    ROUND(SUM(price), 2) AS price,
    CASE product_category
      WHEN 'agro_industria_e_comercio' THEN 'Agro Industry & Commerce'
      WHEN 'alimentos' THEN 'Food'
      WHEN 'alimentos_bebidas' THEN 'Food & Beverages'
      WHEN 'artes' THEN 'Arts'
      WHEN 'artes_e_artesanato' THEN 'Arts & Crafts'
      WHEN 'artigos_de_festas' THEN 'Party Supplies'
      WHEN 'artigos_de_natal' THEN 'Christmas Items'
      WHEN 'audio' THEN 'Audio'
      WHEN 'automotivo' THEN 'Automotive'
      ELSE 'Other'
    END AS product_category_english
  FROM `retail-analytics-portfolio.retail_data.olist_master_translated`
  GROUP BY product_category
)

SELECT
  product_category_english,
  ROUND(SUM(price), 2) AS total_revenue
FROM translated_data
GROUP BY product_category_english
ORDER BY total_revenue DESC;

SELECT
  product_category,
  COUNT(order_id) AS total_orders
FROM `retail-analytics-portfolio.retail_data.olist_master_translated`
GROUP BY product_category
ORDER BY total_orders DESC
LIMIT 10;

SELECT
  region,
  COUNT(order_id) AS total_orders
FROM `retail-analytics-portfolio.retail_data.olist_master_translated`
GROUP BY region
ORDER BY total_orders DESC;

SELECT
  product_category,
  ROUND(AVG(review), 2) AS avg_review_score
FROM `retail-analytics-portfolio.retail_data.olist_master_translated`
GROUP BY product_category
ORDER BY avg_review_score DESC
LIMIT 10;

SELECT
  payment_method,
  COUNT(order_id) AS total_orders
FROM `retail-analytics-portfolio.retail_data.olist_master_translated`
GROUP BY payment_method
ORDER BY total_orders DESC;
