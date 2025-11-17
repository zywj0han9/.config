return {
    enabled = false,
	'goolord/alpha-nvim',
  	dependencies = { 'nvim-tree/nvim-web-devicons' }, -- 可选，用于图标显示
  	config = function()
    		require'alpha'.setup(require'alpha.themes.startify'.config)
  	end
}
