return {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        --features = { "runtime-benchmarks" },
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}
