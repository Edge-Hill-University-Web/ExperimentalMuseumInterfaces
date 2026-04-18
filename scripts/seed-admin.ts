/**
 * seed-admin.ts — Sprint 3 stub
 *
 * Full implementation arrives in Sprint 3.
 * This script will create the Strapi admin user defined in
 * apps/cms/seed/.env.seed using the Strapi CLI's programmatic API.
 *
 * Usage (once implemented):
 *   cp apps/cms/seed/.env.seed.example apps/cms/seed/.env.seed
 *   # Fill in ADMIN_EMAIL, ADMIN_PASSWORD, ADMIN_FIRSTNAME, ADMIN_LASTNAME
 *   pnpm --filter @emi/cms seed:admin
 */
async function main(): Promise<void> {
  throw new Error(
    "seed-admin is not yet implemented — stub for Sprint 3.\n" +
      "Copy apps/cms/seed/.env.seed.example to apps/cms/seed/.env.seed, " +
      "fill in the credentials, then re-run after Sprint 3 is complete.",
  );
}

main().catch((err: unknown) => {
  console.error(err);
  process.exit(1);
});
