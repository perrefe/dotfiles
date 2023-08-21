vim.api.nvim_create_user_command(
  'ConvertContainerName',
  function()
    vim.cmd("normal ggIdocker service scale f.c$=0j0")
  end,
  {}
)
