import { describe, it, expect } from "vitest";

// Stub: CMS client will be implemented in apps/web/lib in Sprint 5.
// These tests should all FAIL until the implementation exists.

describe("CMS client", () => {
  it("fetches a list of published experiments", async () => {
    const experiments = await fetchPublishedExperiments();
    expect(Array.isArray(experiments)).toBe(true);
    expect(experiments.length).toBeGreaterThan(0);
  });

  it("returns only published experiments, not drafts", async () => {
    const experiments = await fetchPublishedExperiments();
    expect(experiments.every((e) => e.status === "published")).toBe(true);
  });

  it("fetches a single experiment by slug", async () => {
    const experiment = await fetchExperimentBySlug("voice-controlled-grid");
    expect(experiment).not.toBeNull();
    expect(experiment?.slug).toBe("voice-controlled-grid");
  });

  it("returns null for a non-existent slug", async () => {
    const experiment = await fetchExperimentBySlug("does-not-exist-xyz");
    expect(experiment).toBeNull();
  });

  it("fetches published publications in descending date order", async () => {
    const publications = await fetchPublications();
    expect(Array.isArray(publications)).toBe(true);
    for (let i = 1; i < publications.length; i++) {
      expect(publications[i - 1]!.year).toBeGreaterThanOrEqual(
        publications[i]!.year,
      );
    }
  });
});

async function fetchPublishedExperiments(): Promise<
  { status: string; slug: string }[]
> {
  throw new Error("Not implemented — stub for Sprint 5");
}

async function fetchExperimentBySlug(
  _slug: string,
): Promise<{ slug: string } | null> {
  throw new Error("Not implemented — stub for Sprint 5");
}

async function fetchPublications(): Promise<{ year: number }[]> {
  throw new Error("Not implemented — stub for Sprint 5");
}
