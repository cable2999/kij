-- Initializes the carrion_items table from https://carrionfields.net/itemsearch/

-- 2026-01-01 version included in resources folder in case this functionality breaks in the future.

-- Backing up your current table.
carrion_items_backup = carrion_items or {}

fetchCarrionItems()
