import { Before, After, BeforeAll, AfterAll } from "@cucumber/cucumber";
import { chromium } from "@playwright/test";
import type { EMIWorld } from "./world";

let sharedBrowser: import("@playwright/test").Browser;

BeforeAll(async () => {
  sharedBrowser = await chromium.launch({ headless: !process.env["PWDEBUG"] });
});

AfterAll(async () => {
  await sharedBrowser?.close();
});

Before(async function (this: EMIWorld) {
  this.browser = sharedBrowser;
  this.context = await sharedBrowser.newContext();
  this.page = await this.context.newPage();
});

After(async function (this: EMIWorld) {
  await this.context?.close();
});
