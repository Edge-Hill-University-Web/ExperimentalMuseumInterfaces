import { setWorldConstructor, World, IWorldOptions } from "@cucumber/cucumber";
import { Browser, BrowserContext, Page, chromium } from "@playwright/test";

export interface EMIWorld extends World {
  browser: Browser;
  context: BrowserContext;
  page: Page;
  baseUrl: string;
}

class EMIWorldImpl extends World implements EMIWorld {
  browser!: Browser;
  context!: BrowserContext;
  page!: Page;
  baseUrl: string;

  constructor(options: IWorldOptions) {
    super(options);
    this.baseUrl =
      (options.parameters as { baseUrl?: string }).baseUrl ??
      "http://localhost:3000";
  }
}

setWorldConstructor(EMIWorldImpl);
