import { test, expect } from "@playwright/test";
import AxeBuilder from "@axe-core/playwright";

const BASE_URL = process.env["PLAYWRIGHT_BASE_URL"] ?? "http://localhost:3000";

const PUBLIC_ROUTES = [
  "/",
  "/about",
  "/research",
  "/research/dch-users",
  "/research/dch-users/casual-users",
  "/research/generous-and-rich-prospect",
  "/research/ai-supported-exploration",
  "/research/evaluation-and-user-categories",
  "/research/limitations-of-browsing",
  "/experiments",
  "/experiments/voice",
  "/experiments/voice/overview",
  "/experiments/voice/grid",
  "/experiments/voice/driven-browsing",
  "/experiments/voice/interaction",
  "/experiments/voice/evaluation",
  "/experiments/voice/roadmap",
  "/experiments/legacy",
  "/writing",
  "/writing/publications",
  "/writing/blog",
  "/collaborate",
];

for (const route of PUBLIC_ROUTES) {
  test(`@accessibility ${route} has no critical axe violations`, async ({
    page,
  }) => {
    await page.goto(`${BASE_URL}${route}`);

    const results = await new AxeBuilder({ page })
      .withTags(["wcag2a", "wcag2aa", "wcag21aa", "wcag22aa"])
      .analyze();

    const serious = results.violations.filter(
      (v) => v.impact === "serious" || v.impact === "critical",
    );

    if (serious.length > 0) {
      const summary = serious
        .map((v) => `[${v.impact}] ${v.id}: ${v.description}`)
        .join("\n");
      expect
        .soft(serious, `Accessibility violations on ${route}:\n${summary}`)
        .toHaveLength(0);
    }

    expect(serious).toHaveLength(0);
  });
}
