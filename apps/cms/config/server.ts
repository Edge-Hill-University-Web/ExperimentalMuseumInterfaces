export default ({
  env,
}: {
  env: (key: string, fallback?: unknown) => unknown;
}) => ({
  host: env("HOST", "0.0.0.0"),
  port: (env as (k: string, fb: number) => number)("PORT", 1337),
  app: {
    keys: (env as (k: string) => string[])("APP_KEYS"),
  },
  webhooks: {
    populateRelations: env("WEBHOOKS_POPULATE_RELATIONS", false) === true,
  },
});
