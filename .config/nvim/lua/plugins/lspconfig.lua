return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--query-driver=/home/mattseq/.platformio/packages/**/bin/*",
          },
        },
      },
    },
  },
}
