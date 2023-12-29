-- NOTE: This is where your plugins related to LSP can be installed.
-- The configuration is done below. Search for lspconfig to find it below.
-- LSP Configuration & Plugins
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
    'folke/neodev.nvim',
  },
  -- Use your language server to automatically format your code on save.
  -- Adds additional commands as well to manage the behavior
  config = function()
    -- Switch for controlling whether you want autoformatting.
    --  Use :KickstartFormatToggle to toggle autoformatting on or off
    -- local format_is_enabled = true
    -- ( I don't need to toggle file save as I want as default )
    -- vim.api.nvim_create_user_command('KickstartFormatToggle', function()
    --   format_is_enabled = not format_is_enabled
    --   print('Setting autoformatting to: ' .. tostring(format_is_enabled))
    -- end, {})

    -- Create an augroup that is used for managing our formatting autocmds.
    --      We need one augroup per client to make sure that multiple clients
    --      can attach to the same buffer without interfering with each other.
    local _augroups = {}
    local get_augroup = function(client)
      if not _augroups[client.id] then
        local group_name = 'kickstart-lsp-format-' .. client.name
        local id = vim.api.nvim_create_augroup(group_name, { clear = true })
        _augroups[client.id] = id
      end

      return _augroups[client.id]
    end

    -- Whenever an LSP attaches to a buffer, we will run this function.
    --
    -- See `:help LspAttach` for more information about this autocmd event.
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
      -- This is where we attach the autoformatting for reasonable clients
      callback = function(args)
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local bufnr = args.buf

        -- Only attach to clients that support document formatting
        if not client.server_capabilities.documentFormattingProvider then
          return
        end

        -- Tsserver usually works poorly. Sorry you work with bad languages
        -- You can remove this line if you know what you're doing :)
        -- ( I disabled it since I work in react ts projects)
        -- if client.name == 'tsserver' then
        --   return
        -- end

        local formatFunc = function()
          vim.lsp.buf.format {
            async = false,
            filter = function(c) return c.id == client.id end,
          }
        end

        -- Activate formatting
        vim.api.nvim_create_user_command('ActivateFormating', formatFunc, {})

        -- Create an autocmd that will run *before* we save the buffer.
        --  Run the formatting command for the LSP that has just attached.
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = get_augroup(client),
          buffer = bufnr,
          -- ( since format_is_enabled is true by default )
          -- if not format_is_enabled then
          --   return
          -- end
          callback = formatFunc,
        })
      end,
    })
  end,
}
