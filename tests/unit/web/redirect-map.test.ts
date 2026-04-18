import { describe, it, expect } from "vitest";

// Stub: redirect map will be implemented in apps/web/next.config.mjs in Sprint 5.
// These tests should all FAIL until the implementation exists.

describe("Legacy URL redirect map", () => {
  it("redirects /experiements to /experiments", () => {
    const result = resolveRedirect("/experiements");
    expect(result).toEqual({ destination: "/experiments", permanent: true });
  });

  it("redirects /about.html to /about", () => {
    const result = resolveRedirect("/about.html");
    expect(result).toEqual({ destination: "/about", permanent: true });
  });

  it("redirects /experiments.html to /experiments", () => {
    const result = resolveRedirect("/experiments.html");
    expect(result).toEqual({ destination: "/experiments", permanent: true });
  });

  it("redirects /literature.html to /research/generous-and-rich-prospect", () => {
    const result = resolveRedirect("/literature.html");
    expect(result).toEqual({
      destination: "/research/generous-and-rich-prospect",
      permanent: true,
    });
  });

  it("redirects /experiements/* to /experiments/*", () => {
    const result = resolveRedirect("/experiements/collectionexplorer.html");
    expect(result?.destination).toContain("/experiments/");
    expect(result?.permanent).toBe(true);
  });

  it("returns null for a path that does not need redirecting", () => {
    const result = resolveRedirect("/about");
    expect(result).toBeNull();
  });
});

function resolveRedirect(
  _path: string,
): { destination: string; permanent: boolean } | null {
  throw new Error("Not implemented — stub for Sprint 5");
}
