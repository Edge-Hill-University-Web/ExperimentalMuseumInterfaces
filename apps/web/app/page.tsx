import { checkCmsHealth } from "../lib/cms-health";

// Never cache this page — it reflects live CMS status.
export const dynamic = "force-dynamic";

export default async function HomePage() {
  const health = await checkCmsHealth();

  return (
    <main style={{ padding: "2rem", maxWidth: "48rem", margin: "0 auto" }}>
      <h1>Experimental Museum Interfaces</h1>
      <p>Research into digital interfaces for cultural collections.</p>

      <section aria-label="CMS status" style={{ marginTop: "2rem" }}>
        <h2>CMS status</h2>
        {health.ok ? (
          <p data-testid="cms-status-ok">
            ✅ CMS is reachable at <code>{health.url}</code>
          </p>
        ) : (
          <p data-testid="cms-status-error">
            ⚠️ CMS is not reachable at <code>{health.url}</code>
            {health.error != null && ` — ${health.error}`}
          </p>
        )}
      </section>
    </main>
  );
}
