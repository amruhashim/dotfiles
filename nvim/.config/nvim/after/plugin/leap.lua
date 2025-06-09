-- Ensure leap is loaded
if not pcall(require, 'leap') then
    return
end

-- Set up leap mappings
require('leap').add_default_mappings()
