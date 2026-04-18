import { describe, it, expect } from "vitest";

// Stub: slug validation logic will be implemented in apps/cms in Sprint 3.
// These tests should all FAIL until the implementation exists.

describe("Slug validator", () => {
  it("accepts a valid lowercase hyphenated slug", () => {
    expect(isValidSlug("voice-controlled-grid")).toBe(true);
  });

  it("rejects a slug with uppercase letters", () => {
    expect(isValidSlug("Voice-Grid")).toBe(false);
  });

  it("rejects a slug with spaces", () => {
    expect(isValidSlug("voice grid")).toBe(false);
  });

  it("rejects an empty string", () => {
    expect(isValidSlug("")).toBe(false);
  });

  it("rejects a slug with special characters", () => {
    expect(isValidSlug("voice_grid!")).toBe(false);
  });

  it("accepts a slug with numbers", () => {
    expect(isValidSlug("experiment-2024")).toBe(true);
  });
});

// Placeholder — replace with the real import once apps/cms implements this.
function isValidSlug(_slug: string): boolean {
  throw new Error("Not implemented — stub for Sprint 3");
}
