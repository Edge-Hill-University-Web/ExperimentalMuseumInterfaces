export interface CmsHealthResult {
  ok: boolean;
  url: string;
  error?: string;
}

/**
 * Pings the Strapi `/_health` endpoint and returns a structured result.
 * Called server-side only — never imported in client components.
 */
export async function checkCmsHealth(): Promise<CmsHealthResult> {
  const url = process.env.NEXT_PUBLIC_CMS_URL ?? "http://localhost:1337";
  try {
    const res = await fetch(`${url}/_health`, { cache: "no-store" });
    return { ok: res.ok, url };
  } catch (err) {
    return {
      ok: false,
      url,
      error: err instanceof Error ? err.message : String(err),
    };
  }
}
