{{ config(materialized='table') }}
{% set numeric_patterns = ['_yoy', 'price', 'ppsf'] %}

{# Define your 'Portfolio-Ready' renames here #}
{% set column_renames = {
    'median_sale_ppsf': 'avg_price_per_sqft',
    'median_sale_price_yoy': 'price_growth_yoy_pct',
    'weeks_of_supply': 'inventory_supply_weeks',
    'off_market_in_two_weeks': 'fast_sale_count',
    'median_days_on_market': 'days_to_sell_median'
} %}

with raw_data as (
    select * from {{ source('raw_data', 'real_estate_mar2026') }}
)

select
    -- 1. Fixed Identifiers
    region_name,
    region_type,
    period_begin as report_date

    -- 2. Dynamic Loop for Renaming and Casting
    {% for col in adapter.get_columns_in_relation(source('raw_data', 'real_estate_mar2026')) -%}
        {%- set col_name = col.name | lower -%}
        
        {# Skip columns already handled in the 'Fixed' section #}
        {%- if col_name not in ['region_name', 'region_type', 'period_begin'] -%}
            
            {# Determine the New Name (Use rename dict if exists, else keep original) #}
            {%- set new_name = column_renames.get(col_name, col_name) -%}
            
            {# Check if it needs casting #}
            {%- set should_cast = false -%}
            {%- for pattern in numeric_patterns -%}
                {%- if pattern in col_name -%}
                    {%- set should_cast = true -%}
                {%- endif -%}
            {%- endfor -%}

            {%- if should_cast -%}
                , cast("{{ col.name }}" as float) as {{ new_name }}
            {%- else -%}
                , "{{ col.name }}" as {{ new_name }}
            {%- endif -%}

        {%- endif -%}
    {%- endfor %}

from raw_data
