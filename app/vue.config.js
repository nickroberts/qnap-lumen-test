const { resolve } = require("path");

module.exports = {
  chainWebpack: (config) => {
    config.plugin("html").tap((args) => {
      args[0].title = "STORJ | Storage Node";
      return args;
    });
  },
  devServer: {
    proxy: {
      "/api": {
        target: "http://localhost:8000/",
        ws: true,
        changeOrigin: true,
        pathRewrite: { "^/api": "" },
      },
    },
  },
  outputDir: resolve(__dirname, "../shared/api/html"),
};
