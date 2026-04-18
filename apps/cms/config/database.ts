export default ({
  env,
}: {
  env: (key: string, fallback?: unknown) => unknown;
}) => ({
  connection: {
    client: "postgres",
    connection: {
      host: env("DATABASE_HOST", "127.0.0.1"),
      port: (env as (k: string, fb: number) => number)("DATABASE_PORT", 5432),
      database: env("DATABASE_NAME", "emi"),
      user: env("DATABASE_USERNAME", "emi"),
      password: env("DATABASE_PASSWORD", ""),
      ssl:
        env("DATABASE_SSL", false) === true
          ? {
              rejectUnauthorized:
                env("DATABASE_SSL_REJECT_UNAUTHORIZED", true) !== false,
            }
          : false,
    },
    debug: false,
  },
});
