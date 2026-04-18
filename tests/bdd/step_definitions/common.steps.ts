import { Given, When, Then } from "@cucumber/cucumber";
import { expect } from "@playwright/test";
import type { EMIWorld } from "../support/world";

// ─── Navigation ──────────────────────────────────────────────────────────────

Given("I am on the home page", async function (this: EMIWorld) {
  await this.page.goto(this.baseUrl);
});

Given(
  "I am on the {string} page",
  async function (this: EMIWorld, path: string) {
    await this.page.goto(`${this.baseUrl}${path}`);
  },
);

When(
  "I click the {string} navigation link",
  async function (this: EMIWorld, label: string) {
    await this.page.getByRole("link", { name: label }).click();
  },
);

Then(
  "I should be on the {string} page",
  async function (this: EMIWorld, path: string) {
    await expect(this.page).toHaveURL(new RegExp(path));
  },
);

Then(
  "the page should have a heading {string}",
  async function (this: EMIWorld, heading: string) {
    await expect(
      this.page.getByRole("heading", { name: heading }),
    ).toBeVisible();
  },
);

Then(
  "the page title should contain {string}",
  async function (this: EMIWorld, text: string) {
    await expect(this.page).toHaveTitle(new RegExp(text, "i"));
  },
);

Then(
  "the response status should be {int}",
  async function (this: EMIWorld, status: number) {
    const response = await this.page.goto(this.page.url());
    expect(response?.status()).toBe(status);
  },
);
