if not os.getenv("Home") then
  require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
end
