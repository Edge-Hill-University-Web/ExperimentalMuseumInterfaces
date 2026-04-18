module.exports = {
  default: {
    paths: ["bdd/features/**/*.feature"],
    require: ["bdd/support/**/*.ts", "bdd/step_definitions/**/*.ts"],
    requireModule: ["ts-node/register"],
    format: [
      "progress-bar",
      "html:../playwright-report/cucumber-report.html",
      "json:../test-results/cucumber-report.json",
    ],
    formatOptions: { snippetInterface: "async-await" },
    worldParameters: {
      baseUrl: process.env.PLAYWRIGHT_BASE_URL ?? "http://localhost:3000",
    },
    publishQuiet: true,
  },
};
