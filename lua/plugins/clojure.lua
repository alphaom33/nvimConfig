return {
	"clojure-vim/vim-jack-in",
	{
		"Olical/conjure",
		init = function()
			vim.cmd("call delete('.nrepl-port')")
		end,
	},
	"PaterJason/cmp-conjure",
}
