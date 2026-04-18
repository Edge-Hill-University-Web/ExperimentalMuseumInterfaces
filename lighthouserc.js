/** @type {import('@lhci/cli').LighthouseRcConfig} */
module.exports = {
  ci: {
    collect: {
      url: [
        "http://localhost:3000/",
        "http://localhost:3000/about",
        "http://localhost:3000/research",
        "http://localhost:3000/experiments",
        "http://localhost:3000/writing/publications",
        "http://localhost:3000/collaborate",
      ],
      numberOfRuns: 3,
      settings: {
        throttlingMethod: "simulate",
        throttling: {
          // Fast 3G simulation
          rttMs: 40,
          throughputKbps: 1638.4,
          cpuSlowdownMultiplier: 4,
        },
      },
    },
    assert: {
      budgetFile: "./tests/performance/lighthouse-budgets.json",
      assertions: {
        "categories:performance": ["warn", { minScore: 0.8 }],
        "categories:accessibility": ["error", { minScore: 0.95 }],
        "categories:seo": ["warn", { minScore: 0.9 }],
        "categories:best-practices": ["warn", { minScore: 0.9 }],
      },
    },
    upload: {
      target: "temporary-public-storage",
    },
  },
};
