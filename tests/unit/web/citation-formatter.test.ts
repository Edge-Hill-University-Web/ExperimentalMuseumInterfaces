import { describe, it, expect } from "vitest";

// Stub: citation formatting will be implemented in apps/web in Sprint 7.
// These tests should all FAIL until the implementation exists.

const samplePublication = {
  title: "Generous Interfaces for Cultural Collections",
  authors: ["Mitchell Whitelaw"],
  venue: "Digital Humanities Quarterly",
  year: 2015,
  doi: "10.1000/example.doi",
  url: "https://doi.org/10.1000/example.doi",
};

describe("Citation formatter — BibTeX", () => {
  it("generates a valid BibTeX entry", () => {
    const result = formatBibTeX(samplePublication);
    expect(result).toContain("@article{");
    expect(result).toContain("author =");
    expect(result).toContain("title =");
    expect(result).toContain("year = {2015}");
    expect(result).toContain("doi =");
  });

  it("BibTeX entry key is derived from first author surname and year", () => {
    const result = formatBibTeX(samplePublication);
    expect(result).toContain("Whitelaw2015");
  });
});

describe("Citation formatter — Harvard", () => {
  it("generates a valid Harvard citation string", () => {
    const result = formatHarvard(samplePublication);
    expect(result).toContain("Whitelaw");
    expect(result).toContain("2015");
    expect(result).toContain("Generous Interfaces for Cultural Collections");
    expect(result).toContain("Digital Humanities Quarterly");
  });
});

describe("Citation formatter — APA", () => {
  it("generates a valid APA citation string", () => {
    const result = formatAPA(samplePublication);
    expect(result).toContain("Whitelaw");
    expect(result).toContain("(2015)");
  });
});

function formatBibTeX(_pub: typeof samplePublication): string {
  throw new Error("Not implemented — stub for Sprint 7");
}

function formatHarvard(_pub: typeof samplePublication): string {
  throw new Error("Not implemented — stub for Sprint 7");
}

function formatAPA(_pub: typeof samplePublication): string {
  throw new Error("Not implemented — stub for Sprint 7");
}
