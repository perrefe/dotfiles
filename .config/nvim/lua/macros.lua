-- [[ Macros ]]
--
-- Write console.log line from selected text
vim.fn.setreg("g", "yoconsole.log('^[pA:', ^[pA);^[")
