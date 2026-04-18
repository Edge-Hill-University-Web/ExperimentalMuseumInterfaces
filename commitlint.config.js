/** @type {import('@commitlint/types').UserConfig} */
module.exports = {
  extends: ["@commitlint/config-conventional"],
  rules: {
    // Scopes map to packages and concern areas in this monorepo
    "scope-enum": [
      2,
      "always",
      [
        "cms",
        "web",
        "ui",
        "shared-types",
        "tests",
        "bdd",
        "e2e",
        "a11y",
        "perf",
        "security",
        "deps",
        "docker",
        "ci",
        "docs",
        "adr",
        "scripts",
        "release",
      ],
    ],
    "subject-case": [2, "never", ["start-case", "pascal-case", "upper-case"]],
    "header-max-length": [2, "always", 100],
  },
};
