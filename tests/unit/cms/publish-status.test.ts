import { describe, it, expect } from "vitest";

// Stub: PublishStatus validation will be implemented in apps/cms in Sprint 3.
// These tests should all FAIL until the implementation exists.

const VALID_STATUSES = ["draft", "in-review", "published", "archived"];

describe("PublishStatus validator", () => {
  it.each(VALID_STATUSES)('accepts valid status "%s"', (status) => {
    expect(isValidPublishStatus(status)).toBe(true);
  });

  it("rejects an unknown status", () => {
    expect(isValidPublishStatus("live")).toBe(false);
  });

  it("rejects an empty string", () => {
    expect(isValidPublishStatus("")).toBe(false);
  });

  it("rejects undefined", () => {
    expect(isValidPublishStatus(undefined)).toBe(false);
  });

  it("anonymous visitors cannot see draft content", () => {
    expect(isVisibleToAnonymous("draft")).toBe(false);
  });

  it("anonymous visitors cannot see in-review content", () => {
    expect(isVisibleToAnonymous("in-review")).toBe(false);
  });

  it("anonymous visitors cannot see archived content", () => {
    expect(isVisibleToAnonymous("archived")).toBe(false);
  });

  it("anonymous visitors can see published content", () => {
    expect(isVisibleToAnonymous("published")).toBe(true);
  });
});

function isValidPublishStatus(_status: unknown): boolean {
  throw new Error("Not implemented — stub for Sprint 3");
}

function isVisibleToAnonymous(_status: string): boolean {
  throw new Error("Not implemented — stub for Sprint 3");
}
