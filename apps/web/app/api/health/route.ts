import { NextResponse } from "next/server";

/**
 * GET /api/health
 *
 * Lightweight liveness probe used by Docker Compose healthcheck and CI.
 * Returns 200 { status: "ok" } as long as the Next.js process is running.
 */
export async function GET() {
  return NextResponse.json({ status: "ok" }, { status: 200 });
}
