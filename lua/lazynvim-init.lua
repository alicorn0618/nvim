-- set line num of current window
-- wo means window option
vim.wo.number = true

-- set the path of lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- use `vim.loop.fs_stat` to check whether `lazy.nvim` is installed or not
-- if not, use `git clone` to copy it to the target path
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- set lazy path as runtime path
	-- rtp (runtime path)
	-- nvim search
vim.opt.rtp:prepend(lazypath)

-- load lazy.nvim module
require("lazy").setup("plugins")

